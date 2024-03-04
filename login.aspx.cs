using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MyPortfolio
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
            if (!IsPostBack)
            {
                HttpCookie usercookie = Request.Cookies["cookies"];
                if (usercookie != null)
                {
                    txtUserName.Text = usercookie["username"].ToString();
                    txtPassword.Text = usercookie["password"].ToString();
                    chkRememberMe.Checked = true;
                }
                else
                {
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    chkRememberMe.Checked = false;
                }
            }
        }

        protected void chkRememberMe_CheckedChanged(object sender, EventArgs e)
        {
            HttpCookie userdata = new HttpCookie("cookies");
            userdata["username"] = txtUserName.Text.Trim();
            userdata["password"] = txtPassword.Text.Trim();
            userdata.Expires = System.DateTime.Now.AddMinutes(5);
            Response.Cookies.Add(userdata);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source=TA-SEEN\SQLEXPRESS;initial Catalog=portDB;Integrated Security=True;"))
            {
                sqlCon.Open();
                string query = "SELECT COUNT(1) FROM admin WHERE username=@username AND password=@password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("admin.aspx");
                }
                else { lblErrorMessage.Visible = true; }
            }
        }
    }
}