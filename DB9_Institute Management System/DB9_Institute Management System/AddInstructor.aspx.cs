using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace DB9_Institute_Management_System
{
    public partial class AddInstructor : System.Web.UI.Page
    {
        
        SqlConnection sqlCon = new SqlConnection(@"Data Source=SONY\SQLEXPRESS;Initial Catalog=DB9;Integrated Security=True");


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

            txtName.Text = txtEmail.Text = txtDesignation.Text = txtSalary.Text = txtPassword.Text = "";
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
                   

             if( btnAdd.Text=="ADD")
            {
                SqlCommand sqlCmd3 = new SqlCommand("SELECT COUNT(*) FROM Instructor  WHERE Email='" + txtEmail.Text.Trim() + "'", sqlCon);

                 int count = Convert.ToInt32(sqlCmd3.ExecuteScalar());
                if(count==0)
                {
                    SqlCommand sqlCmd = new SqlCommand("AddInstructor", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@InstructorID", (hfInstructorId.Value == "" ? 0 : Convert.ToInt32(hfInstructorId.Value)));
                    sqlCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Designation", txtDesignation.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Salary", Convert.ToDouble(txtSalary.Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    string instructorID = hfInstructorId.Value;
                    Clear();

                    //   sqlCon.Close();

                    lblError.Text = "Added Successfully";
                }
                else
                {
                    lblError.Text = "Email Already Exist";
                }

            }

            else
            {
                SqlCommand sqlCmd7 = new SqlCommand("SELECT COUNT(*) FROM Instructor  WHERE Email='" + txtEmail.Text.Trim() + "' AND InstructorID!='"+ Convert.ToInt32(hfInstructorId.Value) + "'", sqlCon);

                int countEdit = Convert.ToInt32(sqlCmd7.ExecuteScalar());
                if(countEdit==0)
                {
                    SqlCommand sqlCmd1 = new SqlCommand("EditInstructor", sqlCon);
                    sqlCmd1.CommandType = CommandType.StoredProcedure;
                    sqlCmd1.Parameters.AddWithValue("@InstructorID", (hfInstructorId.Value == "" ? 0 : Convert.ToInt32(hfInstructorId.Value)));
                    sqlCmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    sqlCmd1.Parameters.AddWithValue("@Designation", txtDesignation.Text.Trim());
                    sqlCmd1.Parameters.AddWithValue("@Salary", Convert.ToDouble(txtSalary.Text.Trim()));
                    sqlCmd1.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    sqlCmd1.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    sqlCmd1.ExecuteNonQuery();
                    string instructorID = hfInstructorId.Value;
                  



                    if (instructorID != "")
                        lblError.Text = "Updated Succesfully";
                }
                else
                {
                    lblError.Text = "Email Already Exist";
                }

            }

                    sqlCon.Close();
                    Clear();
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
                    SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllInstructor", sqlCon);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    sqlCon.Close();
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {

                    lblError.Text = ex.Message;
                }

        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int instructorId = Convert.ToInt32((sender as LinkButton).CommandArgument);

            if (sqlCon.State == ConnectionState.Closed)
                try
                {

                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("ViewInstructorByID", sqlCon);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDa.SelectCommand.Parameters.AddWithValue("@InstructorID", instructorId);

                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    sqlCon.Close();
                    hfInstructorId.Value = instructorId.ToString();

                    txtName.Text = dtbl.Rows[0]["Name"].ToString();
                    txtDesignation.Text = dtbl.Rows[0]["Designation"].ToString();
                    txtSalary.Text = dtbl.Rows[0]["Salary"].ToString();
                    txtEmail.Text = dtbl.Rows[0]["Email"].ToString();
                    txtPassword.Text = dtbl.Rows[0]["Password"].ToString();
                    btnAdd.Text = "Update";
                    btnDelete.Enabled = true;
                    
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }


        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                try
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd1 = new SqlCommand("DeleteInstructorCByID", sqlCon);
                    sqlCmd1.CommandType = CommandType.StoredProcedure;
                    sqlCmd1.Parameters.AddWithValue("@InstructorID", Convert.ToInt32(hfInstructorId.Value));
                    sqlCmd1.ExecuteNonQuery();
                    SqlCommand sqlCmd = new SqlCommand("DeleteInstructorByID", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@InstructorID", Convert.ToInt32(hfInstructorId.Value));
                    sqlCmd.ExecuteNonQuery();
                  
                    sqlCon.Close();
                    
                    FillGridView();
                    lblError.Text = "Deleted Successfully";
                    Clear();
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }


        }




    }
}
