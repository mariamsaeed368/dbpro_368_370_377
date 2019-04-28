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
    public partial class StudentCourseFee : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-KM5HNLG;Initial Catalog=DB9;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
           FillGridView();
        }
        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("StudentFeeView", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataSourceID = null;
            GridView1.DataBind();
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            tbtotalfee.Text = " ";
            lblErrormessage.Text = lblSuccessMessage.Text = "";
            btnsubmit.Text = "ADD";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            sqlCon.Open();
            string txt = Register_No.SelectedItem.Text;
            SqlCommand comd = new SqlCommand("Select PersonId from [DB9].[dbo].[Person] where RegistrationNo='" + txt + "'", sqlCon);
            int g = (int)comd.ExecuteScalar();
            string coursetxt = Course_ID.SelectedItem.Text;
            SqlCommand commd = new SqlCommand("Select Count(*) from (Select * from [DB9].[dbo].[StudentCourseFee] where PersonID='" + g + "' AND CourseID='"+coursetxt+"') as x", sqlCon);
            int check = (int)commd.ExecuteScalar();
            if(check < 1)
            {
                SqlCommand cmd1 = new SqlCommand("Select Count(*) from (Select Fee From Course where CourseID='" + coursetxt + "' AND Fee='" + tbtotalfee.Text + "') as x", sqlCon);
                int fee = (int)cmd1.ExecuteScalar();
                if (fee == 1)
                {
                    SqlCommand cmd = new SqlCommand("Insert into StudentCourseFee(PersonID,CourseID,TotalFee,Status) values('" + g + "', '" + coursetxt + "', '" + tbtotalfee.Text + "', '" + Status_fee.SelectedItem.Text + "')", sqlCon);
                    cmd.ExecuteNonQuery();
                    tbtotalfee.Text = " ";
                    lblSuccessMessage.Text = "Added Successfully";
                    FillGridView();
                }
                else
                {
                    lblErrormessage.Text = "You have not entered the correct fee of this course.";
                }

            }
            else
            {
                lblErrormessage.Text = "This Id is already in use.";
            }    
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label CourseID= GridView1.Rows[e.RowIndex].FindControl("lbl_CourseID") as Label;
            Label PersonID = GridView1.Rows[e.RowIndex].FindControl("lbl_PersonID") as Label;
            TextBox TotalFee = GridView1.Rows[e.RowIndex].FindControl("txt_total") as TextBox;
            TextBox status = GridView1.Rows[e.RowIndex].FindControl("txt_status") as TextBox;
            sqlCon.Open();
            //updating the record  
            SqlCommand cmd1 = new SqlCommand("Select Count(*) from (Select Fee From Course where CourseID='" + CourseID.Text + "' AND Fee='"+TotalFee.Text+"') as x", sqlCon);
            int fee = (int)cmd1.ExecuteScalar();
            if (fee == 1) 
            {
                 if(status.Text == "Paid" || status.Text == "Unpaid")
                 {
                    SqlCommand cmd = new SqlCommand("Update StudentCourseFee set TotalFee='" + TotalFee.Text + "',Status='" + status.Text + "' where CourseID='" + CourseID.Text + "' AND PersonID='" + PersonID.Text + "'", sqlCon);
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    //Call ShowData method for displaying updated data  
                    lblSuccessMessage.Text = "Selected Record Updated";
                    lblErrormessage.Text = " ";
                    GridView1.EditIndex = -1;
                    FillGridView();
                }
                else
                {
                   lblErrormessage.Text = "Status is Incorrect Please Type either Paid or Unpaid";
                }
               
            }
            else
            {
                lblErrormessage.Text = "You have not entered the correct fee of this course.";
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label CourseID = GridView1.Rows[e.RowIndex].FindControl("lbl_CourseID") as Label;
            Label PersonID = GridView1.Rows[e.RowIndex].FindControl("lbl_PersonID") as Label;
           sqlCon.Open();
            //deleting the record  
            SqlCommand cmd = new SqlCommand("Delete from StudentCourseFee where CourseID='" + CourseID.Text + "' AND PersonID='" + PersonID.Text + "'", sqlCon);
            cmd.ExecuteNonQuery();
            sqlCon.Close();
            //Call ShowData method for displaying updated data  
            lblSuccessMessage.Text = "Selected Record Deleted";
            lblErrormessage.Text = " ";
            FillGridView();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            FillGridView();
        }
    }
}
