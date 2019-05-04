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
    public partial class InstructorViewCourses : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-4NQFIN1\FATIMAKHALIL;Initial Catalog=DB9;Integrated Security=true");
        public static string sendtext1 = "";
        public static string sendtext2 = "";

        public static string sendtext3 = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                

                FillGridView();

            }
        }
        void FillGridView()
        {
            hfInstructorCourseId.Value = Sign_In.sendtext0;

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllCourseOfAInstructor", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@InstructorId", (Convert.ToInt32(hfInstructorCourseId.Value)));
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();


        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int instructorCourseId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewInstructorCourseByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@InstructorCourseID", instructorCourseId);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfInstructorCourseId.Value = instructorCourseId.ToString();

            hfInstructorId.Value= dtbl.Rows[0]["InstructorID"].ToString();
            hfCourses.Value = dtbl.Rows[0]["CourseID"].ToString();
            
            sendtext1 = instructorCourseId.ToString();
            

            Server.Transfer(path: ("~/AddQuestions.aspx"));


        }
    }
}