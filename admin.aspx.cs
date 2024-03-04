using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPortfolio
{
    public partial class admin : System.Web.UI.Page
    {
        string connectionString = @"Data Source=TA-SEEN\SQLEXPRESS;Initial Catalog=portDB;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
                PopulateSkillsview();
                PopulateOlympiadview();

            }

            if (Session["username"] == null)
             Response.Redirect("login.aspx");
            lblUserDetails.Text = "Admin : " + Session["username"];
        }

       void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {
                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Education", sqlcon);
                sqlDa.Fill(dtbl);
            }

            if (dtbl.Rows.Count > 0)
            {
                GvEducation.DataSource = dtbl;
                GvEducation.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvEducation.DataSource = dtbl;
                GvEducation.DataBind();
                GvEducation.Rows[0].Cells.Clear();
                GvEducation.Rows[0].Cells.Add(new TableCell());
                GvEducation.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvEducation.Rows[0].Cells[0].Text = "No Data Found...";
                GvEducation.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        void PopulateSkillsview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {
                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Skills", sqlcon);
                sqlDa.Fill(dtbl);
            }

            if (dtbl.Rows.Count > 0)
            {
                GvSkills.DataSource = dtbl;
                GvSkills.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvSkills.DataSource = dtbl;
                GvSkills.DataBind();
                GvSkills.Rows[0].Cells.Clear();
                GvSkills.Rows[0].Cells.Add(new TableCell());
                GvSkills.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvSkills.Rows[0].Cells[0].Text = "No Data Found...";
                GvSkills.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        void PopulateOlympiadview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {
                sqlcon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Olympiad", sqlcon);
                sqlDa.Fill(dtbl);
            }

            if (dtbl.Rows.Count > 0)
            {
                GvOlympiad.DataSource = dtbl;
                GvOlympiad.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GvOlympiad.DataSource = dtbl;
                GvOlympiad.DataBind();
                GvOlympiad.Rows[0].Cells.Clear();
                GvOlympiad.Rows[0].Cells.Add(new TableCell());
                GvOlympiad.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GvOlympiad.Rows[0].Cells[0].Text = "No Data Found...";
                GvOlympiad.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GvEducation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "INSERT INTO Education (Date, Degree, Institution, Description) VALUES (@Date, @Degree, @Institution, @Description)";
                        var sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.AddWithValue("@Date", ((TextBox)GvEducation.FooterRow.FindControl("txtDateFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Degree", ((TextBox)GvEducation.FooterRow.FindControl("txtDegreeFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Institution", ((TextBox)GvEducation.FooterRow.FindControl("txtInstitutionFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Description", ((TextBox)GvEducation.FooterRow.FindControl("txtDescriptionFooter")).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview(); 
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }

        }

        protected void GvEducation_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvEducation.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void GvEducation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEducation.EditIndex = -1;
            PopulateGridview();
        }

        protected void GvEducation_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Check if the row index is within the valid range
                if (e.RowIndex >= 0 && e.RowIndex < GvEducation.Rows.Count)
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "UPDATE Education SET Date=@Date, Degree=@Degree, Institution=@Institution, Description=@Description WHERE ID=@id";
                        var sqlCmd = new SqlCommand(query, sqlCon);

                        // Get the new values from the GridView row
                        var newDate = ((TextBox)GvEducation.Rows[e.RowIndex].FindControl("txtDate")).Text.Trim();
                        var newDegree = ((TextBox)GvEducation.Rows[e.RowIndex].FindControl("txtDegree")).Text.Trim();
                        var newInstitution = ((TextBox)GvEducation.Rows[e.RowIndex].FindControl("txtInstitution")).Text.Trim();
                        var newDescription = ((TextBox)GvEducation.Rows[e.RowIndex].FindControl("txtDescription")).Text.Trim();
                        var id = Convert.ToInt32(GvEducation.DataKeys[e.RowIndex].Value.ToString());

                        // Add parameters to the SQL command
                        sqlCmd.Parameters.AddWithValue("@Date", newDate);
                        sqlCmd.Parameters.AddWithValue("@Degree", newDegree);
                        sqlCmd.Parameters.AddWithValue("@Institution", newInstitution);
                        sqlCmd.Parameters.AddWithValue("@Description", newDescription);
                        sqlCmd.Parameters.AddWithValue("@id", id);

                        sqlCmd.ExecuteNonQuery();
                        GvEducation.EditIndex = -1; // Exit edit mode
                        PopulateGridview(); 
                        lblSuccessMessage.Text = "Record Updated";
                        lblErrorMessage.Text = "";
                    }
                }
                else
                {
                    lblSuccessMessage.Text = "";
                    lblErrorMessage.Text = "Row index is out of range.";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }

        }

        protected void GvEducation_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Check if the row index is within the valid range
                if (e.RowIndex >= 0 && e.RowIndex < GvEducation.Rows.Count)
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "DELETE FROM Education WHERE ID=@Id";
                        var sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Id", Convert.ToInt32(GvEducation.DataKeys[e.RowIndex].Value.ToString()));

                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview(); // You need to implement this method to refresh the GridView
                        lblSuccessMessage.Text = "Selected Record Deleted";
                        lblErrorMessage.Text = "";
                    }
                }
                else
                {
                    lblSuccessMessage.Text = "";
                    lblErrorMessage.Text = "Row index is out of range.";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }

        }

        protected void GvSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "INSERT INTO Skills (SkillName, SkillPercentage) VALUES (@SkillName, @SkillPercentage)";
                        var sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.AddWithValue("@SkillName", ((TextBox)GvSkills.FooterRow.FindControl("txtSkillNameFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@SkillPercentage", Convert.ToInt32(((TextBox)GvSkills.FooterRow.FindControl("txtSkillPercentageFooter")).Text.Trim()));

                        sqlCmd.ExecuteNonQuery();
                        PopulateSkillsview();
                        lblSuccessMessage1.Text = "New Record Added";
                        lblErrorMessage1.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage1.Text = "";
                lblErrorMessage1.Text = ex.Message;
            }


        }

        protected void GvSkills_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvSkills.EditIndex = e.NewEditIndex;
            PopulateSkillsview();
        }

        protected void GvSkills_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvSkills.EditIndex = -1;
            PopulateSkillsview();

        }

        protected void GvSkills_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Check if the row index is within the valid range
                if (e.RowIndex >= 0 && e.RowIndex < GvSkills.Rows.Count)
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "UPDATE Skills SET SkillName=@SkillName, SkillPercentage=@SkillPercentage WHERE SkillId=@SkillId";
                        var sqlCmd = new SqlCommand(query, sqlCon);

                        // Get the new values from the GridView row
                        var newSkillName = ((TextBox)GvSkills.Rows[e.RowIndex].FindControl("txtSkillName")).Text.Trim();
                        var newSkillPercentage = Convert.ToInt32(((TextBox)GvSkills.Rows[e.RowIndex].FindControl("txtSkillPercentage")).Text.Trim());
                        var skillId = Convert.ToInt32(GvSkills.DataKeys[e.RowIndex].Value.ToString());

                        // Add parameters to the SQL command
                        sqlCmd.Parameters.AddWithValue("@SkillName", newSkillName);
                        sqlCmd.Parameters.AddWithValue("@SkillPercentage", newSkillPercentage);
                        sqlCmd.Parameters.AddWithValue("@SkillId", skillId);

                        sqlCmd.ExecuteNonQuery();
                        GvSkills.EditIndex = -1; // Exit edit mode
                        PopulateSkillsview();
                        lblSuccessMessage.Text = "Skill Updated";
                        lblErrorMessage.Text = "";
                    }
                }
                else
                {
                    lblSuccessMessage1.Text = "";
                    lblErrorMessage1.Text = "Row index is out of range.";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage1.Text = "";
                lblErrorMessage1.Text = ex.Message;
            }

        }

        protected void GvSkills_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Check if the row index is within the valid range
                if (e.RowIndex >= 0 && e.RowIndex < GvSkills.Rows.Count)
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "DELETE FROM Skills WHERE SkillId=@SkillId";
                        var sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@SkillId", Convert.ToInt32(GvSkills.DataKeys[e.RowIndex].Value.ToString()));

                        sqlCmd.ExecuteNonQuery();
                        // You need to implement this method to refresh the GridView
                        PopulateSkillsview();
                        lblSuccessMessage1.Text = "Selected Record Deleted";
                        lblErrorMessage1.Text = "";
                    }
                }
                else
                {
                    lblSuccessMessage1.Text = "";
                    lblErrorMessage1.Text = "Row index is out of range.";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage1.Text = "";
                lblErrorMessage1.Text = ex.Message;
            }

        }

        protected void GvOlympiad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "INSERT INTO Olympiad (Date, Title, Position, Description) VALUES (@Date, @Title, @Position, @Description)";
                        var sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.AddWithValue("@Date", ((TextBox)GvOlympiad.FooterRow.FindControl("txtDateFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Title", ((TextBox)GvOlympiad.FooterRow.FindControl("txtTitleFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Position", ((TextBox)GvOlympiad.FooterRow.FindControl("txtPositionFooter")).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Description", ((TextBox)GvOlympiad.FooterRow.FindControl("txtDescriptionFooter")).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                        PopulateOlympiadview();
                        lblSuccessMessage2.Text = "New Record Added";
                        lblErrorMessage2.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage2.Text = "";
                lblErrorMessage2.Text = ex.Message;
            }


        }

        protected void GvOlympiad_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvOlympiad.EditIndex = e.NewEditIndex;
            PopulateOlympiadview();
        }

        protected void GvOlympiad_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvOlympiad.EditIndex = -1;
            PopulateOlympiadview();
        }

        protected void GvOlympiad_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Check if the row index is within the valid range
                if (e.RowIndex >= 0 && e.RowIndex < GvOlympiad.Rows.Count)
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "UPDATE Olympiad SET Title=@Title, Position=@Position, Description=@Description WHERE Id=@Id";
                        var sqlCmd = new SqlCommand(query, sqlCon);

                        // Get the new values from the GridView row
                        var newTitle = ((TextBox)GvOlympiad.Rows[e.RowIndex].FindControl("txtTitle")).Text.Trim();
                        var newPosition = ((TextBox)GvOlympiad.Rows[e.RowIndex].FindControl("txtPosition")).Text.Trim();
                        var newDescription = ((TextBox)GvOlympiad.Rows[e.RowIndex].FindControl("txtDescription")).Text.Trim();
                        var olympiadId = Convert.ToInt32(GvOlympiad.DataKeys[e.RowIndex].Value.ToString());

                        // Add parameters to the SQL command
                        sqlCmd.Parameters.AddWithValue("@Title", newTitle);
                        sqlCmd.Parameters.AddWithValue("@Position", newPosition);
                        sqlCmd.Parameters.AddWithValue("@Description", newDescription);
                        sqlCmd.Parameters.AddWithValue("@Id", olympiadId);

                        sqlCmd.ExecuteNonQuery();
                        GvOlympiad.EditIndex = -1; // Exit edit mode
                        PopulateOlympiadview();
                        lblSuccessMessage2.Text = "Record Updated";
                        lblErrorMessage2.Text = "";
                    }
                }
                else
                {
                    lblSuccessMessage2.Text = "";
                    lblErrorMessage2.Text = "Row index is out of range.";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage2.Text = "";
                lblErrorMessage2.Text = ex.Message;
            }

        }

        protected void GvOlympiad_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Check if the row index is within the valid range
                if (e.RowIndex >= 0 && e.RowIndex < GvOlympiad.Rows.Count)
                {
                    using (var sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        const string query = "DELETE FROM Olympiad WHERE Id=@Id";
                        var sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Id", Convert.ToInt32(GvOlympiad.DataKeys[e.RowIndex].Value.ToString()));

                        sqlCmd.ExecuteNonQuery();
                        // You need to implement this method to refresh the GridView
                        PopulateOlympiadview();
                        lblSuccessMessage2.Text = "Selected Record Deleted";
                        lblErrorMessage2.Text = "";
                    }
                }
                else
                {
                    lblSuccessMessage2.Text = "";
                    lblErrorMessage2.Text = "Row index is out of range.";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage2.Text = "";
                lblErrorMessage2.Text = ex.Message;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

        protected void MainpageB_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}