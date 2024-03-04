using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MyPortfolio 
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection("Data Source=TA-SEEN\\SQLEXPRESS;Initial Catalog=portDB;Integrated Security=True");
                using (connection) 
                { 
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("SELECT Date, Degree, Institution, Description FROM Education", connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        rptEducation.DataSource = dt;
                        rptEducation.DataBind();
                    }
                      
                    connection.Close();
                }


                SqlConnection connection1 = new SqlConnection("Data Source=TA-SEEN\\SQLEXPRESS;Initial Catalog=portDB;Integrated Security=True");
                using (connection1)
                {
                    connection1.Open();

                    using (SqlCommand command = new SqlCommand("SELECT SkillName, SkillPercentage FROM Skills;", connection1))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        rptSkills.DataSource = dt;
                        rptSkills.DataBind();
                    }

                    connection1.Close();
                }
                SqlConnection connection2 = new SqlConnection("Data Source=TA-SEEN\\SQLEXPRESS;Initial Catalog=portDB;Integrated Security=True");
                using (connection2)
                {
                    connection2.Open();

                    using (SqlCommand command = new SqlCommand("Select Date,Title,Position,Description from Olympiad;", connection2))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        rptOlympiad.DataSource = dt;
                        rptOlympiad.DataBind();
                    }

                    connection2.Close();
                }


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}