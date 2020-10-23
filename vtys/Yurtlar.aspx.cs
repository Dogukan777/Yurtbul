using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace vtys
{
    public partial class Yurtlar : System.Web.UI.Page
    {
        public string kAdi = null;
        public static string _Obj = "";
        public static string Alan = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsLogin.Login == true)
            {
                DbOperation db = new DbOperation();
                temizle.Style.Add("display", "none;");
                getir.Style.Add("display", "inline");
                DataTable isimGetir = db.Listele("select personName,personLastName from tbl_User where nickName='" + IsLogin.KAdi + "'");
                lbl_loginGiris.Text = isimGetir.Rows[0]["personName"].ToString() + " " + isimGetir.Rows[0]["personLastName"].ToString();
            }

            DbOperation listdb = new DbOperation();

            DataTable yurtListele = listdb.Listele("select Dr.dormNo,Dr.dormName, "
               + "case gender when 'E' then 'Erkek' when 'K' then 'Kız' end as gender, "
               + "cityName, roomCount "
               + "from tbl_Dormitory Dr, tbl_DormitoryCharge DrCh, tbl_DormitoryContact DrCo, "
               + "tbl_DormitoryPublicPlaces DrPu, tbl_DormitoryServices DrSe, tbl_City Ci "
               + " where Dr.dormNo = DrCh.dormNo "
               + "and   Dr.dormNo = DrCo.dormNo "
               + "and   Dr.dormNo = DrPu.dormNo "
               + "and   Dr.dormNo = DrSe.dormNo "
               + "and   Dr.cityNo = Ci.cityNo ");
            lbl_YurtAdi1.Text = yurtListele.Rows[0]["dormName"].ToString();
            lbl_YurtCinsiyet1.Text = yurtListele.Rows[0]["gender"].ToString() + " Yurdu";
            lbl_YurtSehir1.Text = yurtListele.Rows[0]["cityName"].ToString();
            lbl_YurtOdaSayisi1.Text = yurtListele.Rows[0]["roomCount"].ToString();

            lbl_YurtAdi2.Text = yurtListele.Rows[1]["dormName"].ToString();
            lbl_YurtCinsiyet2.Text = yurtListele.Rows[1]["gender"].ToString() + " Yurdu";
            lbl_YurtSehir2.Text = yurtListele.Rows[1]["cityName"].ToString();
            lbl_YurtOdaSayisi2.Text = yurtListele.Rows[1]["roomCount"].ToString();


            lbl_YurtAdi3.Text = yurtListele.Rows[2]["dormName"].ToString();
            lbl_YurtCinsiyet3.Text = yurtListele.Rows[2]["gender"].ToString() + " Yurdu";
            lbl_YurtSehir3.Text = yurtListele.Rows[2]["cityName"].ToString();
            lbl_YurtOdaSayisi3.Text = yurtListele.Rows[2]["roomCount"].ToString();


            lbl_YurtAdi4.Text = yurtListele.Rows[3]["dormName"].ToString();
            lbl_YurtCinsiyet4.Text = yurtListele.Rows[3]["gender"].ToString() + " Yurdu";
            lbl_YurtSehir4.Text = yurtListele.Rows[3]["cityName"].ToString();
            lbl_YurtOdaSayisi4.Text = yurtListele.Rows[3]["roomCount"].ToString();


            lbl_YurtAdi5.Text = yurtListele.Rows[4]["dormName"].ToString();
            lbl_YurtCinsiyet5.Text = yurtListele.Rows[4]["gender"].ToString() + " Yurdu";
            lbl_YurtSehir5.Text = yurtListele.Rows[4]["cityName"].ToString();
            lbl_YurtOdaSayisi5.Text = yurtListele.Rows[4]["roomCount"].ToString();


            lbl_YurtAdi6.Text = yurtListele.Rows[5]["dormName"].ToString();
            lbl_YurtCinsiyet6.Text = yurtListele.Rows[5]["gender"].ToString() + " Yurdu";
            lbl_YurtSehir6.Text = yurtListele.Rows[5]["cityName"].ToString();
            lbl_YurtOdaSayisi6.Text = yurtListele.Rows[5]["roomCount"].ToString();
            lbl_YurtOdaSayisi6.Text = yurtListele.Rows[5]["roomCount"].ToString();

        }
      
        protected void btn_GirisYap_Click(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();

            DataTable girisYap = db.Listele("select dbo.fn_login('" + txt_KAdi.Text + "','" + txt_Parola.Text + "') as result");

            if (Convert.ToChar(girisYap.Rows[0]["result"]) == 'E')
            {
                temizle.Style.Add("display", "none;");
                getir.Style.Add("display", "inline");
                DataTable isimGetir = db.Listele("select personName,personLastName from tbl_User where nickName='" + txt_KAdi.Text + "'");

                lbl_loginGiris.Text = isimGetir.Rows[0]["personName"].ToString() + " " + isimGetir.Rows[0]["personLastName"].ToString();
                IsLogin.KAdi = txt_KAdi.Text;
                IsLogin.Login = true;
         

            }
        }

        protected void btn_CikisYap_Click(object sender, EventArgs e)
        {
            temizle.Style.Add("display", "inline;");
            getir.Style.Add("display", "none");

            uyeOL.Style.Add("float", "right");
            IsLogin.Login = false;
        }
        public void DivTemizle()
        {
            ListeleAlan.Style.Add("display", "none;");
           
            YurtListeleAlan.Style.Add("display", "inline;");
        }
        public void yurtListele(string yurtName)
        {
            DbOperation yurtdb = new DbOperation();
            DataTable yurtList = yurtdb.Listele("select * from dbo.fn_yurtGetir('" + yurtName + "')");
            lbl_dormName.Text = yurtList.Rows[0]["dormName"].ToString();
            lbl_dormGender.Text = yurtList.Rows[0]["gender"].ToString();
            lbl_cityName.Text = yurtList.Rows[0]["cityName"].ToString();
            lbl_dormAddress.Text = yurtList.Rows[0]["dormAddress"].ToString();
            lbl_dormPhone.Text = yurtList.Rows[0]["dormPhone"].ToString();
            lbl_dormEmailAddress.Text = yurtList.Rows[0]["dormEmailAddress"].ToString();
            lbl_roomCount.Text = yurtList.Rows[0]["roomCount"].ToString();
            lbl_sportsArea.Text = yurtList.Rows[0]["sportsArea"].ToString();
            lbl_gym.Text = yurtList.Rows[0]["gym"].ToString();
            lbl_pool.Text = yurtList.Rows[0]["pool"].ToString();
            lbl_musicRoom.Text = yurtList.Rows[0]["musicRoom"].ToString();
            lbl_roomCleaningdayWeekly.Text = yurtList.Rows[0]["roomCleaningdayWeekly"].ToString() + " kez";
            lbl_laundryRoom.Text = yurtList.Rows[0]["laundryRom"].ToString();
            lbl_eveningDinner.Text = yurtList.Rows[0]["eveningDinner"].ToString();
            lbl_breakfast.Text = yurtList.Rows[0]["breakfast"].ToString();
            lbl_onePersonRoomCharge.Text= yurtList.Rows[0]["onePersonRoomCharge"].ToString()+" TL";
            lbl_twoPersonRoomCharge.Text = yurtList.Rows[0]["twoPersonRoomCharge"].ToString() + " TL";
            lbl_threePersonRoomCharge.Text = yurtList.Rows[0]["threePersonRoomCharge"].ToString() + " TL";
            lbl_fourPersonRoomCharge.Text = yurtList.Rows[0]["fourPersonRoomCharge"].ToString() + " TL";
        }
        protected void yurt1_Click(object sender, EventArgs e)
        {
            DivTemizle();
            yurtListele(lbl_YurtAdi1.Text);
            
        }

        protected void yurt2_Click(object sender, EventArgs e)
        {
            DivTemizle();
            yurtListele(lbl_YurtAdi2.Text);
        }

        protected void yurt3_Click(object sender, EventArgs e)
        {
            DivTemizle();
            yurtListele(lbl_YurtAdi3.Text);
        }

        protected void yurt4_Click(object sender, EventArgs e)
        {
            DivTemizle();
            yurtListele(lbl_YurtAdi4.Text);
        }

        protected void yurt5_Click(object sender, EventArgs e)
        {
            DivTemizle();
            yurtListele(lbl_YurtAdi5.Text);
        }

        protected void yurt6_Click(object sender, EventArgs e)
        {
            DivTemizle();
            yurtListele(lbl_YurtAdi6.Text);
        }
        
    }
}