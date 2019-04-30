using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace DB9_Institute_Management_System
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool validregistration(string registration)
        {
            if (registration.Length == 11)
            {
                string str = registration.Substring(0, 4);
                string last = registration.Substring(registration.Length - 3);
                if (str.All(Char.IsDigit))
                {
                    if (registration[4] == '-')
                    {
                        if (char.IsLetter(registration, 5) && char.IsLetter(registration, 6))
                        {
                            if (registration[7] == '-')
                            {
                                if (last.All(Char.IsDigit))
                                {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            return false;
        }

        protected void btSignup_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!validregistration(tbRegNo.Text))
                {
                    lblMsg.Text = "Please Enter Valid Registration number.";

                }
                else
                {
                    string CS = @"Data Source=SONY\SQLEXPRESS;Initial Catalog=DB9;Integrated Security=True";
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Select Count(*) from (Select * from [DB9].[dbo].[Person] where RegistrationNo='"+tbRegNo.Text+"') as x", con);
                        int row = (int)cmd.ExecuteScalar();
                        if(row < 1)
                        {
                            if(tbPass.Text==tbCPass.Text)
                            {
                                SqlCommand sqlCmd = new SqlCommand("spRegisterUser", con);
                                sqlCmd.CommandType = CommandType.StoredProcedure;
                                sqlCmd.Parameters.AddWithValue("@Name", tbname.Text);
                                sqlCmd.Parameters.AddWithValue("@Address", tbAddress.Text);
                                sqlCmd.Parameters.AddWithValue("@UserType", 'U');
                                sqlCmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                                sqlCmd.Parameters.AddWithValue("@Password", tbPass.Text);
                                sqlCmd.Parameters.AddWithValue("@RegistrationNo", tbRegNo.Text);
                                sqlCmd.Parameters.AddWithValue("@ConfirmPassword", tbCPass.Text);
                                int ReturnCode = (int)sqlCmd.ExecuteScalar();
                                if (ReturnCode == -1)
                                {
                                    lblMsg.ForeColor = Color.Red;
                                    lblMsg.Text = "Email have been already used ";
                                    tbname.Text = " ";
                                    tbEmail.Text = " ";
                                    tbPass.Text = " ";
                                    tbCPass.Text = " ";
                                    tbAddress.Text = " ";
                                    tbRegNo.Text = " ";
                                }
                                else
                                {
                                    Response.Redirect("~/Sign In.aspx");
                                }
                            }
                            else
                            {
                                lblMsg.Text = "Confirm Password Doesn't match with Password";
                            }
                           
                        }
                        else
                        {
                            lblMsg.Text = "This Registration No is already in use.";
                        }
                       
                    }
                }
            }
        }
    }
}