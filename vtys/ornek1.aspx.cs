using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vtys
{
    public partial class ornek1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button button1 = new Button();
            button1.ID = "btn1";
            button1.Click += button1_Click;        // Hızlıca iki kere tab tuşuna bas. Sana click metodunu oluşturacak.
            button1.Style["margin-left"] = "100px";
            button1.CssClass = "CssClassınınİsmi";
            button1.Width = 120;
            button1.Height = 75;
            button1.Text = "dsadsad";

            ListeleAlan.Controls.Add(button1);
            //Form.Controls.Add(button1);
            button1.Click += button1_Click;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}