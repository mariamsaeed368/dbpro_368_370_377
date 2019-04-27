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
    public partial class StudentEnrolledCourses : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-4NQFIN1\FATIMAKHALIL;Initial Catalog=DB9;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
            hfPersonID.Value = StudentViewOfCourses.sendtext;
            SqlDataAdapter sqlDa = new SqlDataAdapter("StudentEnrolledView", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@PersonID", hfPersonID.Value);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }
}