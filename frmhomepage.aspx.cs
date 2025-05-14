using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace Automation_Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                // Redirect to login page if session variable is missing
                Response.Redirect("login_NEW.aspx");
            }
            else
            {
                // Get the username from the session
                string username = Session["Username"].ToString();

                // Retrieve the employee name from the database
                string empName = GetEmployeeName(username);

                // *Display the employee name in the welcome label*
                lbl_welcome.Text = empName;
            }
        }

        private string GetEmployeeName(string username)
        {
            string empName = "Unknown"; // Default value if employee name is not found
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["login"].ConnectionString;

            using (OracleConnection conn = new OracleConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT EMP_NAME FROM SYSTEM.T_USER_MASTER_RPT WHERE USER_NAME = :username";
                    OracleCommand cmd = new OracleCommand(query, conn);
                    cmd.Parameters.Add(new OracleParameter("username", OracleDbType.Varchar2)).Value = username;

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        empName = result.ToString();
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception
                    Response.Write("Error: " + ex.Message);
                }
            }

            return empName;
        }





        protected void btn_signout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login_NEW.aspx");
        }
    }
}
