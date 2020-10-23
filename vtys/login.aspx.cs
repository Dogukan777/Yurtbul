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
    public partial class isLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       /* protected void btn_login_Click(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();
            string kullaniciSorgu = "select nickName, password from tbl_User " +
                "where nickName='"+txt_Kullanici_Adi.Text+"' and password='"+txt_Sifre.Text+"'";
            DataTable kullaniciTable = db.Listele(kullaniciSorgu);

            if(kullaniciTable.Rows.Count > 0)
            {
                MessageBox.Show("Login Succesful");
            }
            else
            {
                MessageBox.Show("Kullanici adi veya şifre yanlış");
            }
        }*/
    }
}