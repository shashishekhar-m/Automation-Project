using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace Automation_Project
{
    public partial class Login_NEW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string username = txt_user_name.Text.Trim();
            string password = txt_pass.Text.Trim();

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["login"].ConnectionString;
            string sql = "SELECT ROLE FROM SYSTEM.T_USER_MASTER_RPT WHERE USER_NAME = :Username AND PASSWORD = :Password";

            using (OracleConnection conn = new OracleConnection(connString))
            {
                conn.Open();

                // SQL query to check if the user exists with the provided username and password

                using (OracleCommand cmd = new OracleCommand(sql, conn))
                {
                    // Use parameters to prevent SQL injection
                    cmd.Parameters.Add(new OracleParameter("Username", username));
                    cmd.Parameters.Add(new OracleParameter("Password", password));

                    string role = Convert.ToString(cmd.ExecuteScalar());

                        if (!string.IsNullOrEmpty(role))
                        {
                            // Store username and role in session
                            Session["Username"] = username;
                            Session["UserRole"] = role;

                            Response.Redirect("frmhomepage.aspx");
                        }
                        else
                        {
                            // Invalid credentials
                            lbl_error.Text = "Invalid username or password.";
                        }
                }
            }

        }

        protected void txt_password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}