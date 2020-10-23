using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vtys
{
    public partial class signUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(list_Univ.Items.Count>0))
                list_Univ.Items.Add("Önce Şehir Seçiniz..");
            list_Kampus.Items.Add("Önce Şehir Seçiniz..");
            DbOperation db = new DbOperation();
            string sehirSorgu = "select * from tbl_City";

            if (!(list_Sehir.Items.Count > 0))
            {
                list_Sehir.Items.Add("Lütfen Şehir Seçiniz..");
                DataTable SehirTablo = db.Listele(sehirSorgu);
                if (SehirTablo.Rows.Count > 0)

                {
                    for (int i = 0; i < SehirTablo.Rows.Count; i++)
                    {
                        list_Sehir.Items.Add(SehirTablo.Rows[i]["CityName"].ToString());

                    }
                }
            }
         
        }
       

      
        protected void kullanici_Ekle_Click(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();

            DataTable Sonuc =db.Listele("select dbo.userMatch('"+ txt_Kullanici_Adi.Text +
            "','"+ txt_Email.Text + "','"+ txt_Telefon.Text + "') as result");
            if (Convert.ToChar(Sonuc.Rows[0]["result"]) == 'N')
            {
                lbl_Uyari.Text = "Bu kullanıcı adı zaten alınmış. Farklı bir kullanıcı adı deneyiniz.";
            }
            if (Convert.ToChar(Sonuc.Rows[0]["result"]) == 'E')
            {
                lbl_Uyari.Text = "Bu eposta adresi zaten kullanılmaktadır. Farklı bir eposta adresi deneyiniz.";
            }
            if (Convert.ToChar(Sonuc.Rows[0]["result"]) == 'P')
            {
                lbl_Uyari.Text = "Bu telefon numarası zaten kullanılmaktadır. Farklı bir numara deneyiniz.";
            }
            if (Convert.ToChar(Sonuc.Rows[0]["result"]) == 'H')
            {
                db.baglantiYap();
                db.komut = new System.Data.SqlClient.SqlCommand("userAdd", db.baglanti);
                db.komut.CommandType = CommandType.StoredProcedure;
                db.komut.Parameters.AddWithValue("@Nickname", txt_Kullanici_Adi.Text);
                db.komut.Parameters.AddWithValue("@CampusName ", list_Kampus.SelectedValue);
                db.komut.Parameters.AddWithValue("@TelNo", txt_Telefon.Text);
                db.komut.Parameters.AddWithValue("@Email", txt_Email.Text);
                if (rbd_Erkek.Checked == true)
                    db.komut.Parameters.AddWithValue("@gender", 'E');
                if (rbd_Kadin.Checked == true)
                    db.komut.Parameters.AddWithValue("@gender", 'K');
                db.komut.Parameters.AddWithValue("@password", txt_Sifre.Text);
                db.komut.Parameters.AddWithValue("@personName", txt_Isim.Text);
                db.komut.Parameters.AddWithValue("@personLastName", txt_Soyisim.Text);
                db.komut.ExecuteNonQuery();
                db.baglanti.Close();
                db.baglanti.Dispose();
                Response.Redirect("signUp.aspx");
               
            }
 
        }

        protected void rbd_Erkek_CheckedChanged(object sender, EventArgs e)
        {
            rbd_Kadin.Checked = false;
        }

        protected void rbd_Kadin_CheckedChanged(object sender, EventArgs e)
        {
            rbd_Erkek.Checked = false;
        }

        protected void list_Sehir_SelectedIndexChanged(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();
            string univSorgu = "select distinct schoolName from tbl_School S,tbl_City C " +
                "where S.cityNo = C.cityNo and cityName = '" + list_Sehir.SelectedValue.ToString() + "'";

            // txt_Isim.Text=list_Sehir.SelectedValue.ToString();
            DataTable univTablo = db.Listele(univSorgu);
            list_Univ.Items.Clear();
            list_Kampus.Items.Clear();
            list_Kampus.Items.Add("Önce Üniversite Seçiniz..");

            if (univTablo.Rows.Count > 0)

            {
                list_Univ.Items.Add("Lütfen Üniversite Seçiniz..");
                for (int i = 0; i < univTablo.Rows.Count; i++)
                {
                    list_Univ.Items.Add(univTablo.Rows[i]["schoolName"].ToString());

                }
            }
            if (list_Sehir.SelectedValue == "Lütfen Şehir Seçiniz..")
            {
                list_Kampus.Items.Clear();
                list_Kampus.Items.Add("Önce Şehir Seçiniz..");
                list_Univ.Items.Add("Önce Şehir Seçiniz..");
            }
        }

        protected void list_Univ_SelectedIndexChanged(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();
            string kampusSorgu = "select campusName from tbl_City City, tbl_School S, tbl_Campus Campus" +
 " where City.cityNo = S.cityNo and Campus.campusNo = S.campusNo and schoolName = '" + list_Univ.SelectedValue.ToString() + "'";

            DataTable kampusTablo = db.Listele(kampusSorgu);
            list_Kampus.Items.Clear();
            if (kampusTablo.Rows.Count > 0)

            {
                list_Kampus.Items.Add("Lütfen Kampüs Seçiniz..");
                for (int i = 0; i < kampusTablo.Rows.Count; i++)
                {
                    list_Kampus.Items.Add(kampusTablo.Rows[i]["campusName"].ToString());

                }
            }
            if (list_Univ.SelectedValue == "Lütfen Üniversite Seçiniz..")
                list_Kampus.Items.Add("Önce Üniversite Seçiniz..");
            if (list_Kampus.Items.Count == 0)
                list_Kampus.Items.Add("Böyle bir üniversite bulunamadı");


        }
    }
}