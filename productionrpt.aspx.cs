using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace Automation_Project
{
    public partial class productionrpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserRole"] == null)
            {
                // Redirect to login page if session variables are missing
                Response.Redirect("login_pageNEW.aspx");
            }
            else
            {
                // *Display the employee name in the welcome label*
                string username = Session["Username"].ToString();
                string empName = GetEmployeeName(username);
                lbl_welcome.Text = empName;

                if (Session["UserRole"].ToString() != "ADM")
                {
                    // If the user is not an ADM, hide the GridView and display an access denied message
                    gvData.Visible = false;
                    lblAccessDenied.Text = "You do not have permission to view this data.";
                    lblAccessDenied.Visible = true;
                }
                else
                {
                    // If the user is ADM, hide the access denied message
                    lblAccessDenied.Visible = false;

                    if (!IsPostBack)
                    {
                        // Load dates into DropDownLists
                        PopulateDateDropDowns();

                        // Ensure no initial data load
                        //LoadData();
                    }
                }
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


        private void LoadData(string query)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["login"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(connString))
            {
                try
                {
                    conn.Open();
                    OracleDataAdapter da = new OracleDataAdapter(query, conn);
                    da.SelectCommand.Parameters.Add(new OracleParameter("startDate", OracleDbType.Varchar2)).Value = ddl_StartDate.SelectedValue;
                    da.SelectCommand.Parameters.Add(new OracleParameter("endDate", OracleDbType.Varchar2)).Value = ddl_EndDate.SelectedValue;

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvData.DataSource = dt;
                    gvData.DataBind();

                    gvData.Visible = true;
                }
                catch (Exception ex)
                {
                    // Handle exception
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "ADM")
            {
                string startDate = ddl_StartDate.SelectedValue;
                string endDate = ddl_EndDate.SelectedValue;

                string query = "SELECT * FROM SYSTEM.CCLDATA WHERE PROD_DAY BETWEEN TO_DATE(:startDate, 'dd-MON-yy') AND TO_DATE(:endDate, 'dd-MON-yy')";

                LoadData(query);
            }
            else
            {
                gvData.Visible = false;
                lblAccessDenied.Text = "You do not have permission to perform this search.";
                lblAccessDenied.Visible = true;
            }
        }


        protected void chk_bx_1_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_bx_1.Checked)
            {
                chk_bx_2.Checked = false;
                // Show the DropDownLists and Labels
                lbl_StartDate.Visible = true;
                ddl_StartDate.Visible = true;
                lbl_EndDate.Visible = true;
                ddl_EndDate.Visible = true;

                // Populate the DropDownLists with dates starting from January 1, 2024
                PopulateDateDropDowns();
            }
            else
            {
                chk_bx_2.Enabled = true;
                // Hide the DropDownLists and Labels when the checkbox is unchecked
                lbl_StartDate.Visible = false;
                ddl_StartDate.Visible = false;
                lbl_EndDate.Visible = false;
                ddl_EndDate.Visible = false;
            }
        }

        protected void chk_bx_2_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_bx_2.Checked)
            {
                chk_bx_1.Checked = false;
                lbl_StartDate.Visible = false;
                ddl_StartDate.Visible = false;
                lbl_EndDate.Visible = false;
                ddl_EndDate.Visible = false;
            }
            else
            {
                chk_bx_1.Enabled = true;
            }
        }

        private void PopulateDateDropDowns()
        {
            DateTime startDate = new DateTime(2024, 1, 1);
            DateTime endDate = DateTime.Now;

            ddl_StartDate.Items.Clear();
            ddl_EndDate.Items.Clear();

            while (startDate <= endDate)
            {
                ListItem listItem = new ListItem(startDate.ToString("dd-MMM-yy"), startDate.ToString("dd-MMM-yy"));
                ddl_StartDate.Items.Add(listItem);
                ddl_EndDate.Items.Add(listItem);
                startDate = startDate.AddDays(1);
            }
        }

        protected void btn_signout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login_NEW.aspx");
        }
    }
}
