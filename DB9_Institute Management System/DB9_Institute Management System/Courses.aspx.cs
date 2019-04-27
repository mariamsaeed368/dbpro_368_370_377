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
    public partial class Courses : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-4NQFIN1\FATIMAKHALIL;Initial Catalog=DB9;Integrated Security=true;");

        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Enabled = false;
            Label4.Enabled = false;
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfCourseID.Value = "";
            txtCourseName.Text = txtDescription.Text =txtDuration.Text=Txtstarttime.Text=TxtFee.Text= "";
            lblErrormessage.Text = lblSuccessMessage.Text = "";
            btnAdd.Text = "ADD";
            btnDelete.Enabled = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DateTime dateValue = default(DateTime);
            if (DateTime.TryParse(Txtstarttime.Text, out dateValue))
            {
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("CourseCreateOrUpdate", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@CourseID", (hfCourseID.Value == "" ? 0 : Convert.ToInt32(hfCourseID.Value)));
                sqlCmd.Parameters.AddWithValue("@CourseName", txtCourseName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@CourseDescription", txtDescription.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Duration", txtDuration.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@StartTime", Txtstarttime.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Fee", TxtFee.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
                Clear();
                string courseNO = hfCourseID.Value;
                if (courseNO == "")
                {


                    Label3.Text = " ";
                    Label4.Text = " ";
                    lblSuccessMessage.Text = "Added Successfully";
                }
                else
                    lblSuccessMessage.Text = "Updated Succesfully";
                FillGridView();
            }
            else
            {
                lblErrormessage.Text = "Date is incorrect Please Try mm/dd/yyyy";
            }
        }
            
        protected void btnDelete_Click(object sender, EventArgs e)
        {
               if (sqlCon.State == ConnectionState.Closed)
               sqlCon.Open();
               SqlCommand sqlCmd = new SqlCommand("CourseDeleteById", sqlCon);
               sqlCmd.CommandType = CommandType.StoredProcedure;
               sqlCmd.Parameters.AddWithValue("@CourseID", Convert.ToInt32(hfCourseID.Value));
               sqlCmd.ExecuteNonQuery();
               sqlCon.Close();
               /*if (sqlCon.State == ConnectionState.Closed)
               sqlCon.Open();
               SqlCommand sqlCm = new SqlCommand("CourseDeleteByCourseId", sqlCon);
               sqlCm.CommandType = CommandType.StoredProcedure;
                    sqlCm.Parameters.AddWithValue("@CourseNo", Convert.ToInt32(hfCourseNo.Value));
                    sqlCm.ExecuteNonQuery();
                    sqlCon.Close();*/
                Clear();
                FillGridView();
                lblSuccessMessage.Text = "Deleted Successfully";
        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int courseid = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("CourseViewById", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@CourseID", courseid);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfCourseID.Value = courseid.ToString();
            txtCourseName.Text = dtbl.Rows[0]["CourseName"].ToString();
            txtDescription.Text = dtbl.Rows[0]["CourseDescription"].ToString();
            txtDuration.Text = dtbl.Rows[0]["Duration"].ToString();
            Txtstarttime.Text = dtbl.Rows[0]["StartTime"].ToString();
            TxtFee.Text = dtbl.Rows[0]["Fee"].ToString();
            btnAdd.Text = "Update";
            btnDelete.Enabled = true;
        }
        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("CourseViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }
}