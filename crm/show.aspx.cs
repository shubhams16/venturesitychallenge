using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.Drawing;
using System.Data.Common;
using System.Text;

namespace crm
{
    public partial class show : System.Web.UI.Page
    {
        string connect = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();

            }
        }

        private void Bind()
        {
            SqlConnection con = new SqlConnection(connect);
            SqlDataAdapter sda = new SqlDataAdapter("select * from Pataint", con);
            DataSet ds = new DataSet();
            con.Open();
            string colm = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Pataint' ORDER BY ORDINAL_POSITION";
            SqlCommand com = new SqlCommand(colm, con);
            sda.Fill(ds);
            con.Close();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }


        protected void upload_click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload2.HasFile)
                {
                    string path = string.Concat((Server.MapPath("~/App_Data/" + FileUpload2.FileName)));
                    FileUpload2.PostedFile.SaveAs(path);
                    OleDbConnection oldebcon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + "; Extended Properties=Excel 12.0;");
                    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", oldebcon);
                    OleDbDataAdapter oleda = new OleDbDataAdapter(cmd);

                    oldebcon.Open();

                    DbDataReader dr = cmd.ExecuteReader();
                    string cnstr = @"Data Source=SHUBHAM-PC;Integrated Security=True";
                    SqlBulkCopy bulkinsert = new SqlBulkCopy(cnstr);
                    {
                        bulkinsert.ColumnMappings.Add("[pataintno]", "pataintno");
                        bulkinsert.ColumnMappings.Add("[Firstname]", "Firstname");
                        bulkinsert.ColumnMappings.Add("[Lastname]", "Lastname");
                        bulkinsert.ColumnMappings.Add("[Age]", "Age");
                        bulkinsert.ColumnMappings.Add("[Address]", "Address");
                        bulkinsert.ColumnMappings.Add("[Email]", "Email");
                        bulkinsert.ColumnMappings.Add("[Phno]", "Phno");
                        bulkinsert.DestinationTableName = "Pataint";
                        bulkinsert.WriteToServer(dr);
                    }

                    oldebcon.Close();
                    Array.ForEach(Directory.GetFiles((Server.MapPath("~/App_Data/"))), File.Delete);
                    Label1.Text = "Successfully Update";
                    GridView1.Visible = true;
                }
                else
                {
                    Label1.Text = "PlZ TRY AGAIN";
                }
            }
            catch (SqlException ex)
            {
                Label3.Text = ex.Message;
            }
            finally { }


        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblid");
            SqlConnection con = new SqlConnection(connect);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from Pataint where pataintno=@1";
            cmd.Parameters.Add("@1", SqlDbType.Int, 12).Value = lblid.Text;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Bind();

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("insertfooter"))
                {
                    TextBox testpid = (TextBox)GridView1.Controls[0].Controls[0].FindControl("testpid");
                    TextBox tstfname = (TextBox)GridView1.Controls[0].Controls[0].FindControl("tstfname");
                    TextBox tstlname = (TextBox)GridView1.Controls[0].Controls[0].FindControl("tstlname");
                    TextBox testage = (TextBox)GridView1.Controls[0].Controls[0].FindControl("testage");
                    TextBox tstadres = (TextBox)GridView1.Controls[0].Controls[0].FindControl("tstadres");
                    TextBox tstemail = (TextBox)GridView1.Controls[0].Controls[0].FindControl("tstemail");
                    TextBox tstphonno = (TextBox)GridView1.Controls[0].Controls[0].FindControl("tstphonno");

                    SqlConnection con = new SqlConnection(connect);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    cmd.CommandText = "Insert into Pataint(pataintno,Firstname,Lastname,Age,Address,Email,Phno) values(@1,@2,@3,@4,@5,@6,@7)";
                    cmd.Parameters.Add("@1", SqlDbType.Int, 12).Value = testpid.Text;
                    cmd.Parameters.Add("@2", SqlDbType.NVarChar, 23).Value = tstfname.Text;
                    cmd.Parameters.Add("@3", SqlDbType.NVarChar, 23).Value = tstlname.Text;
                    cmd.Parameters.Add("@4", SqlDbType.Int, 12).Value = testage.Text;
                    cmd.Parameters.Add("@5", SqlDbType.NVarChar, 23).Value = tstadres.Text;
                    cmd.Parameters.Add("@6", SqlDbType.NVarChar, 23).Value = tstemail.Text;
                    cmd.Parameters.Add("@7", SqlDbType.Int, 12).Value = tstphonno.Text;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Bind();
                }
                if (e.CommandName == "Insertfooter1")
                {
                    TextBox testpid = (TextBox)GridView1.FooterRow.FindControl("tstfooterid");
                    TextBox tstfname = (TextBox)GridView1.FooterRow.FindControl("tstfooterfname");
                    TextBox tstlname = (TextBox)GridView1.FooterRow.FindControl("testfootrlname");
                    TextBox testage = (TextBox)GridView1.FooterRow.FindControl("testfooterage");
                    TextBox tstadres = (TextBox)GridView1.FooterRow.FindControl("testfooteradres");
                    TextBox tstemail = (TextBox)GridView1.FooterRow.FindControl("testmail");
                    TextBox tstphonno = (TextBox)GridView1.FooterRow.FindControl("tstfooterphno");

                    SqlConnection con = new SqlConnection(connect);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;


                    cmd.CommandText = "Insert into Pataint(pataintno,Firstname,Lastname,Age,Address,Email,Phno) values(@1,@2,@3,@4,@5,@6,@7)";
                    cmd.Parameters.Add("@1", SqlDbType.Int, 12).Value = testpid.Text;
                    cmd.Parameters.Add("@2", SqlDbType.NVarChar, 23).Value = tstfname.Text;
                    cmd.Parameters.Add("@3", SqlDbType.NVarChar, 23).Value = tstlname.Text;
                    cmd.Parameters.Add("@4", SqlDbType.Int, 12).Value = testage.Text;
                    cmd.Parameters.Add("@5", SqlDbType.NVarChar, 23).Value = tstadres.Text;
                    cmd.Parameters.Add("@6", SqlDbType.NVarChar, 23).Value = tstemail.Text;
                    cmd.Parameters.Add("@7", SqlDbType.Int, 12).Value = tstphonno.Text;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Bind();
                }
            }
            catch (SqlException ex)
            {
                Label3.Text = ex.Message;
            }
            finally { }


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label lblid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbleid");
                TextBox tstfname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tstefname");
                TextBox tstlname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tstelname");
                TextBox testage = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tsteage");
                TextBox tstadres = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tsteaddress");
                TextBox tstemail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tsteemail");
                TextBox tstphonno = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tstephno");

                SqlConnection con = new SqlConnection(connect);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Update Pataint set Firstname=@1,Lastname=@2,Age=@3,Address=@4,Email=@5,Phno=@6 where pataintno=@7";
                cmd.Parameters.Add("@1", SqlDbType.NVarChar, 23).Value = tstfname.Text;
                cmd.Parameters.Add("@2", SqlDbType.NVarChar, 23).Value = tstlname.Text;
                cmd.Parameters.Add("@3", SqlDbType.Int, 12).Value = testage.Text;
                cmd.Parameters.Add("@4", SqlDbType.NVarChar, 23).Value = tstadres.Text;
                cmd.Parameters.Add("@5", SqlDbType.NVarChar, 23).Value = tstemail.Text;
                cmd.Parameters.Add("@6", SqlDbType.Int, 12).Value = tstphonno.Text;
                cmd.Parameters.Add("@7", SqlDbType.Int, 12).Value = lblid.Text;


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                Bind();
            }
            catch (SqlException ex)
            {
                Label3.Text = ex.Message;
            }
            finally { }

        }
        protected void Upload(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    //Upload and save the file
                    string csvPath = Server.MapPath("~/App_Data/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(csvPath);


                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[7] 
            {
            new DataColumn("pataintno", typeof(int)),
            new DataColumn("Firstname", typeof(string)),
            new DataColumn("Lastname",typeof(string)),
            new DataColumn("Age", typeof(int)),
            new DataColumn("Address", typeof(string)),
            new DataColumn("Email", typeof(string)),
            new DataColumn("Phno", typeof(string)),});


                    string csvData = File.ReadAllText(csvPath);
                    foreach (string row in csvData.Split('\n'))
                    {
                        if (!string.IsNullOrEmpty(row))
                        {
                            dt.Rows.Add();
                            int i = 0;
                            foreach (string cell in row.Split(','))
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = cell;
                                i++;
                            }
                        }
                    }

                    string consString = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(consString))
                    {
                        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                        {
                            //Set the database table name
                            sqlBulkCopy.DestinationTableName = "Pataint";
                            con.Open();
                            sqlBulkCopy.WriteToServer(dt);
                            con.Close();
                            Array.ForEach(Directory.GetFiles((Server.MapPath("~/App_Data/"))), File.Delete);
                        }
                    }
                }
                else
                {
                    Label2.Text = "PlZ TRY AGAIN";
                }
            }
            catch (SqlException ex)
            {
                Label3.Text = ex.Message;
            }
            finally { }

        }

        private void rep_bind()
        {
            SqlConnection con = new SqlConnection(connect);

            string query = "Select * from [Pataint] where [Firstname] like'" + tstserch.Text + "%'";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            con.Open();
            sda.Fill(ds);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        protected void btnserch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connect);
            con.Open();
            string query = "Select * from [Pataint] where [Firstname] like'" + tstserch.Text + "%'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = com.ExecuteReader();


            if (dr.HasRows)
            {
                dr.Read();

                rep_bind();
                GridView1.Visible = true;
                GridView1.Visible = true;
                tstserch.Text = "";
                lblshow.Text = "";
            }
            else
            {
                GridView1.Visible = false;
                lblshow.Visible = true;
                lblshow.Text = "the serch item" + tstserch.Text + "not in records";
            }
        }



        
    }
}

    