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
    public partial class register : System.Web.UI.Page
    {
        string connect = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        public void CleartextBoxes(Control parent)
        {

            foreach (Control x in parent.Controls)
            {
                if ((x.GetType() == typeof(TextBox)))
                {

                    ((TextBox)(x)).Text = "";
                }

                if (x.HasControls())
                {
                    CleartextBoxes(x);
                }
            }
        }  
        
        protected void RegisterUser(object sender, EventArgs e)
        {
            try
            {
                string cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cnstr))
                {
                    using (SqlCommand cmd = new SqlCommand("pataint_insert"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@pataintno", TextBox6.Text.Trim());
                            cmd.Parameters.AddWithValue("@Firstname", TextBox1.Text.Trim());
                            cmd.Parameters.AddWithValue("@Lastname", TextBox2.Text.Trim());
                            cmd.Parameters.AddWithValue("@Age", TextBox3.Text.Trim());
                            cmd.Parameters.AddWithValue("@Address", TextBox4.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", TextBox5.Text.Trim());
                            cmd.Parameters.AddWithValue("@Phno", TextBox7.Text.Trim());

                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }

                    }
                }
                CleartextBoxes(this);
                Response.Redirect("show.aspx");
            }
            catch (SqlException ex)
            {
                Label3.Text = ex.Message;
            }
            finally { }

        }
    }
}