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
    public partial class FinalTest : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(@"Data Source=SONY\SQLEXPRESS;Initial Catalog=DB9;Integrated Security=True");
        int g = 0;
        int g1 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comd = new SqlCommand("Select InstructorID from [DB9].[dbo].[InstructorCourse] where CourseID='" + Session["courseID"].ToString() + "'",con);
            g = (int)comd.ExecuteScalar();
            con.Close();
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('"+g+"')", true);
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        public void BindGrid()
        {
            
            SqlDataAdapter adp = new SqlDataAdapter("select * from InstructorTest WHERE CourseID='" + Session["courseID"].ToString() + "' AND InstructorID='" + g+"'", con);
            adp.Fill(dt);
            grdquestions.DataSource = dt;
            grdquestions.DataBind();
        }
        protected void grdquestions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rdlstOptions = (RadioButtonList)e.Row.FindControl("rdlstOptions");
                HiddenField hdnquestionId = (HiddenField)e.Row.FindControl("hdnquestionId");
                if (rdlstOptions != null && hdnquestionId != null)
                {
                    DataRow[] result = dt.Select("questionid=" + (Convert.ToInt32(hdnquestionId.Value)));
                    DataView view = new DataView();
                    view.Table = dt;
                    view.RowFilter = "questionid=" + (Convert.ToInt32(hdnquestionId.Value));
                    if (view.Table.Rows.Count > 0)
                    {
                        DataTable dt1 = new DataTable();
                        dt1 = view.ToTable();
                    }
                }
            }
           

        }

        protected void grdquestions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}