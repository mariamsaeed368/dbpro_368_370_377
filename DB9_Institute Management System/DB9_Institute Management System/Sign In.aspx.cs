using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Drawing;

namespace DB9_Institute_Management_System
{
    public partial class Sign_In : System.Web.UI.Page
    {
        public static string sendtext = " ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["EMAIL"] != null && Request.Cookies["PWD"] != null)
                {
                    tbEmail.Text = Request.Cookies["EMAIL"].Value; // move the values from cookies to text box
                    tbPassword.Attributes["value"] = Request.Cookies["PWD"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string CS = @"Data Source=SONY\SQLEXPRESS;Initial Catalog=DB9;Integrated Security=True";
            if (dropRole.SelectedItem.Text == "Student")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand read = new SqlCommand("Select * from [DB9].[dbo].[Person] where Email='" + tbEmail.Text + "' and Password='" + tbPassword.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(read);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        if (CheckBox1.Checked)
                        {
                            Response.Cookies["EMAIL"].Value = tbEmail.Text;
                            Response.Cookies["PWD"].Value = tbPassword.Text;
                            //after that specific day the cookies will disable
                            Response.Cookies["EMAIL"].Expires = DateTime.Now.AddDays(15);
                            Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                        }
                        //if the user dont want to store the password  
                        else
                        {
                            Response.Cookies["EMAIL"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                        }
                        string Utype;
                        Utype = dt.Rows[0]["UserType"].ToString().Trim();
                        if (Utype == "U")
                        {
                            SqlCommand cmd3 = new SqlCommand("Select PersonID from [DB9].[dbo].[Person] where Email='" + tbEmail.Text + "' and Password='" + tbPassword.Text + "'", con);
                            int modified = Convert.ToInt32(cmd3.ExecuteScalar());
                            /*var userStore = new UserStore<IdentityUser>();
                            var manager = new UserManager<IdentityUser>(userStore);
                            var user = new IdentityUser() { UserName = tbEmail.Text };
                            IdentityResult result = manager.Create(user, tbPassword.Text);
                            if (result.Succeeded)
                            {
                                lblError.Text = string.Format("User {0} was created successfully!", user.UserName);
                            }*/
                            hfPersonID.Value = modified.ToString();
                            sendtext = modified.ToString();
                            lblError.Text = string.Format("User {0} was created successfully!", sendtext);
                            Session["EMAIL"] = tbEmail.Text;
                            Response.Redirect("~/StudentViewOfCourses.aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid Username or Password";
                        }
                    }
                }
            }
            if (dropRole.SelectedItem.Text == "Admin")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand read = new SqlCommand("Select * from [DB9].[dbo].[Person] where Email='" + tbEmail.Text + "' and Password='" + tbPassword.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(read);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        if (CheckBox1.Checked)
                        {
                            Response.Cookies["EMAIL"].Value = tbEmail.Text;
                            Response.Cookies["PWD"].Value = tbPassword.Text;
                            //after that specific day the cookies will disable
                            Response.Cookies["EMAIL"].Expires = DateTime.Now.AddDays(15);
                            Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                        }
                        //if the user dont want to store the password  
                        else
                        {
                            Response.Cookies["EMAIL"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                        }
                        string Utype;
                        Utype = dt.Rows[0]["UserType"].ToString().Trim();
                        if (Utype == "A")
                        {
                            SqlCommand cmd3 = new SqlCommand("Select PersonID from [DB9].[dbo].[Person] where Email='" + tbEmail.Text + "' and Password='" + tbPassword.Text + "'", con);
                            int modified = Convert.ToInt32(cmd3.ExecuteScalar());
                            /*var userStore = new UserStore<IdentityUser>();
                            var manager = new UserManager<IdentityUser>(userStore);
                            var user = new IdentityUser() { UserName = tbEmail.Text };
                            IdentityResult result = manager.Create(user, tbPassword.Text);
                            if (result.Succeeded)
                            {
                                lblError.Text = string.Format("User {0} was created successfully!", user.UserName);
                            }*/
                            hfPersonID.Value = modified.ToString();
                            sendtext = modified.ToString();
                            lblError.Text = string.Format("User {0} was created successfully!", sendtext);

                            Session["EMAIL"] = tbEmail.Text;
                            Response.Redirect("~/Courses.aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid Username or Password";
                        }
                    }
                }
            }

            else if (dropRole.SelectedItem.Text == "Instructor")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand read1 = new SqlCommand("Select * from [DB9].[dbo].[Instructor] where Email='" + tbEmail.Text + "' and Password='" + tbPassword.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda1 = new SqlDataAdapter(read1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    if (dt1.Rows.Count != 0)
                    {
                        string Utype1;
                        Utype1 = dt1.Rows[0]["UserType"].ToString().Trim();
                        if (Utype1 == "I")
                        {
                            Response.Redirect("~/AddQuestions.aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid Username or Password";

                        }
                    }
                }
            }
            else
            {
                lblError.Text = "Invalid Username or Password";

            }
        }
    }
}