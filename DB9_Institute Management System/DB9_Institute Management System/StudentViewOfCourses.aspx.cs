using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DB9_Institute_Management_System
{
    public partial class StudentViewOfCourses : System.Web.UI.Page
    {
        public static string sendtext = " ";
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-4NQFIN1\FATIMAKHALIL;Initial Catalog=DB9;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void BindData()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("CourseViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataSourceID = null;
            GridView1.DataBind();
        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            string CS = @"Data Source=SONY\SQLEXPRESS;Initial Catalog=DB9;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                hfPersonID.Value = Sign_In.sendtext;
                int courseid = Convert.ToInt32((sender as LinkButton).CommandArgument);
                // GridViewRow dgvRow = GridView1.SelectedRow;
                // string id = dgvRow.Cells[Convert.ToInt32("CourseID")].Text;
                // lblshow.Text= string.Format("User {0} id and courseid {1}", hfPersonID.Value,courseid);
                SqlCommand cmd = new SqlCommand("Select Count(*) from (Select * from [DB9].[dbo].[StudentCourseFee] where [Status]='Paid' and PersonID='" + hfPersonID.Value + "' and CourseID='"+courseid+"') as x", con);
                int grows=(int)cmd.ExecuteScalar();
                if(grows != 0)
                {
                    sendtext = hfPersonID.Value;
                    Response.Redirect("~/StudentEnrolledCourses.aspx");
                }
                else
                {
                    lblshow.Text = "You have not submitted your dues";
                }
                //  con.Open();
                //  cmd.ExecuteNonQuery();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}