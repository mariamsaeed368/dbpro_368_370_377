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
    public partial class InstructorCourse : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=SONY\SQLEXPRESS;Initial Catalog=DB9;Integrated Security=True");

        


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnAdd.CssClass = "btn btn-success";
                btnDelete.Enabled = false;
                btnDelete.CssClass = "btn btn-success";
                fillComboBox1();
                fillComboBox2();
                 FillGridView();

            }
        }
        void fillComboBox2()
        {
            Course_ID1.Items.Clear();
           if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

           

            SqlCommand sqlCmd0 = sqlCon.CreateCommand();
            sqlCmd0.CommandType = CommandType.Text;
            sqlCmd0.CommandText = "SELECT CourseName FROM Course";
            sqlCmd0.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sqlCmd0);
            da.Fill(dt);
            foreach(DataRow dr in dt.Rows)
            {
                Course_ID1.Items.Add(dr["CourseName"].ToString());
            }

            sqlCon.Close();
        }
        void fillComboBox1()
        {
            
            Instructor_ID1.Items.Clear();
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();



            SqlCommand sqlCmd0 = sqlCon.CreateCommand();
            sqlCmd0.CommandType = CommandType.Text;
            sqlCmd0.CommandText = "SELECT InstructorID FROM Instructor";
            sqlCmd0.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sqlCmd0);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Instructor_ID1.Items.Add(dr["InstructorID"].ToString());
            }

            sqlCon.Close();
        }
        

      
        public void Clear()
        {
            hfInstructorId.Value = "";
            Label1.Text = "";
            btnAdd.Text = "ADD";
            btnDelete.Enabled = false;

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                try
                {
                    sqlCon.Open();



                    
                    
                        SqlCommand sqlCmd31 = new SqlCommand("SELECT CourseID FROM InstructorCourse  WHERE  CourseName ='" + Course_ID1.Text.Trim() + "'", sqlCon);

                        int count1 = Convert.ToInt32(sqlCmd31.ExecuteScalar());
                        SqlCommand sqlCmd3 = new SqlCommand("SELECT COUNT(*) FROM InstructorCourse  WHERE  InstructorID ='" + Convert.ToInt32(Instructor_ID1.Text.Trim()) + "' AND  CourseID='" + count1 + "'", sqlCon);
                        int count = Convert.ToInt32(sqlCmd3.ExecuteScalar());
                        if (count == 0)
                        {
                            SqlCommand sqlCmd = new SqlCommand("AddCourseInstructor", sqlCon);
                            sqlCmd.CommandType = CommandType.StoredProcedure;
                            sqlCmd.Parameters.AddWithValue("@InstructorCourseID", (hfInstructorId.Value == "" ? 0 : Convert.ToInt32(hfInstructorId.Value)));
                            sqlCmd.Parameters.AddWithValue("@InstructorID", Convert.ToInt32(Instructor_ID1.Text.Trim()));
                            sqlCmd.Parameters.AddWithValue("@CourseName", Course_ID1.Text.Trim());

                            sqlCmd.ExecuteNonQuery();
                            string instructorID = hfInstructorId.Value;
                            



                            Label1.Text = "Added Successfully";
                        

                    }
                        else
                        {
                            Label1.Text = "Already Exist";
                        }

                    

                sqlCon.Close();
//Clear();
                    FillGridView();

                    



            }
                            
                           catch (Exception ex)
                            {
                                Label1.Text = ex.Message;
                            }
                           


                 }
                    void FillGridView()
                    {
                        if (sqlCon.State == ConnectionState.Closed)
                            try
                            {
                                sqlCon.Open();
                                SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllInstructorCourses", sqlCon);
                                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sqlDa.SelectCommand.Parameters.AddWithValue("@InstructorID", Convert.ToInt32(Instructor_ID1.SelectedValue));
                    DataTable dtbl = new DataTable();
                                sqlDa.Fill(dtbl);
                                sqlCon.Close();
                                GridView1.DataSource = dtbl;
                                GridView1.DataBind();

                            }
                            catch (Exception ex)
                            {

                                Label1.Text = ex.Message;
                            }

                    }
                    protected void lnk_OnClick(object sender, EventArgs e)
                    {
                        int instructorId = Convert.ToInt32((sender as LinkButton).CommandArgument);

                        if (sqlCon.State == ConnectionState.Closed)
                            try
                            {

                                sqlCon.Open();
                                SqlDataAdapter sqlDa = new SqlDataAdapter("ViewInstructorCourseByID", sqlCon);
                                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                                sqlDa.SelectCommand.Parameters.AddWithValue("@InstructorCourseID", instructorId);

                                DataTable dtbl = new DataTable();
                                sqlDa.Fill(dtbl);
                                sqlCon.Close();
                                hfInstructorId.Value = instructorId.ToString();

                                Instructor_ID1.Text = dtbl.Rows[0]["InstructorID"].ToString();
                                Course_ID1.Text = dtbl.Rows[0]["CourseName"].ToString();

                                   btnAdd.Enabled = false;
                    btnAdd.CssClass = "btn btn-success";

                    btnDelete.Enabled = true;

                            }
                            catch (Exception ex)
                            {
                                Label1.Text = ex.Message;
                            }


                    }


                    protected void btnDelete_Click(object sender, EventArgs e)
                    {
                        if (sqlCon.State == ConnectionState.Closed)
                 try
                  {
                sqlCon.Open();
                SqlCommand sqlCmd1= new SqlCommand("SELECT CourseID FROM Course WHERE CourseName='" + Course_ID1.SelectedItem + "'", sqlCon);
                              int countId = Convert.ToInt32(sqlCmd1.ExecuteScalar());
                   SqlCommand sqlCmd = new SqlCommand("DeleteInstructorCourseByID", sqlCon);
                                sqlCmd.CommandType = CommandType.StoredProcedure;
                                sqlCmd.Parameters.AddWithValue("@InstructorCourseID", Convert.ToInt32(hfInstructorId.Value));
                               sqlCmd.Parameters.AddWithValue("@InstructorID", Convert.ToInt32(Instructor_ID1.Text.Trim()));
                               sqlCmd.Parameters.AddWithValue("@CourseID", countId);
                    sqlCmd.ExecuteNonQuery();
                               
                                sqlCon.Close();

                                FillGridView();
                                Label1.Text = "Deleted Successfully";
                    btnAdd.CssClass = "btn btn-success";
                    btnAdd.Enabled = true;
                    btnDelete.Enabled = false;


                }
                catch (Exception ex)
                            {
                                Label1.Text = ex.Message;
                            }
                            

                    }
                    



        }

        
    }
