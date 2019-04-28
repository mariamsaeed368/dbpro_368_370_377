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
    public partial class Test : System.Web.UI.Page
    {
        
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-KM5HNLG;Initial Catalog=DB9;Integrated Security=True");


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                btnDelete.CssClass = "btn btn-success";

                FillGridView();

            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfInstructorId.Value = "";
            hfCourse.Value = "";
           // hfQuestion.Value = "";
            txtQuestion.Text = txtOption1.Text = txtOption2.Text = txtOption3.Text = txtoption4.Text =txtCorrectAnswer.Text= "";
            lblError.Text = "";
            btnAdd.Text = "ADD";
            btnDelete.Enabled = false;

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                try
                {
                    sqlCon.Open();





                    hfInstructorId.Value = InstructorViewCourses.sendtext1;
                    SqlCommand sqlCmd = new SqlCommand("AddORUpdateCourseQuestion", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@QuestionID", (hfQuestion.Value == "" ? 0 : Convert.ToInt32(hfQuestion.Value)));
                    sqlCmd.Parameters.AddWithValue("@InstructorCourseId", Convert.ToInt32(hfInstructorId.Value));

                    sqlCmd.Parameters.AddWithValue("@Question", txtQuestion.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Option1", txtOption1.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Option2", txtOption2.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Option3", txtOption3.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Option4", txtoption4.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@CorrectAnswer", txtCorrectAnswer.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    string QuestionID = hfQuestion.Value;
                    Clear();
                    if (QuestionID == "")
                    {
                        lblError.Text = "Added Successfully";
                    }
                    else
                    {
                        lblError.Text = "Updated Succesfully";

                    }
                    sqlCon.Close();
                    FillGridView();
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }



        }
        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                 try
                 {

                    sqlCon.Open();
                    hfInstructorId.Value = InstructorViewCourses.sendtext1;
            
                    SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllQuestion", sqlCon);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDa.SelectCommand.Parameters.AddWithValue("@InstructorCourseId",Convert.ToInt32(hfInstructorId.Value));
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    sqlCon.Close();
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();
              }
                catch (Exception ex)
                {

                   // lblError.Text = ex.Message;
                }

        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int QuestionId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            hfCourse.Value = InstructorViewCourses.sendtext3;
            hfInstructorId.Value = InstructorViewCourses.sendtext2;
            if (sqlCon.State == ConnectionState.Closed)
               // try
               // {

                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("ViewQuestionByID", sqlCon);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDa.SelectCommand.Parameters.AddWithValue("@QuestionID",QuestionId);

                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    sqlCon.Close();
                    hfQuestion.Value = QuestionId.ToString();
                    hfInstructorId.Value = InstructorViewCourses.sendtext2;
                    hfCourse.Value = InstructorViewCourses.sendtext3;

                    txtQuestion.Text = dtbl.Rows[0]["Question"].ToString();
                    txtOption1.Text = dtbl.Rows[0]["Option1"].ToString();
                    txtOption2.Text = dtbl.Rows[0]["Option2"].ToString();
                    txtOption3.Text = dtbl.Rows[0]["Option3"].ToString();
                    txtoption4.Text = dtbl.Rows[0]["Option4"].ToString();
                    txtCorrectAnswer.Text = dtbl.Rows[0]["CorrectAnswer"].ToString();

                    btnAdd.Text = "Update";
                    btnDelete.Enabled = true;

               /* }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }*/


        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                //  try
                //  {
                hfInstructorId.Value = InstructorViewCourses.sendtext1;
            sqlCon.Open();
                    SqlCommand sqlCmd1 = new SqlCommand("DeleteQuestionByID", sqlCon);
                    sqlCmd1.CommandType = CommandType.StoredProcedure;
                    sqlCmd1.Parameters.AddWithValue("@QuestionID", Convert.ToInt32(hfQuestion.Value));
            sqlCmd1.Parameters.AddWithValue("@InstructorCourseID", Convert.ToInt32(hfInstructorId.Value));


            sqlCmd1.ExecuteNonQuery();
                    
                 
                    sqlCon.Close();

                    FillGridView();
                    lblError.Text = "Deleted Successfully";
                    Clear();

              /*  }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
                */

        }




    }
}
