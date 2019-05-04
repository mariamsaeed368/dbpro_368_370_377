using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace DB9_Institute_Management_System
{
    public partial class SpecificYearInstructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private DataTable GetData(int SpecificYear)
        {
            DataTable dt = new DataTable();
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["DB9"].ConnectionString;
            using (SqlConnection sql = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SpecificYearsInstructorsReport", sql);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SpecificYear", SqlDbType.Int).Value = SpecificYear;

                SqlDataAdapter sd = new SqlDataAdapter(cmd);
                sd.Fill(dt);


            }
            return dt;
        }
        private void showReport()
        {
            ReportViewer1.Reset();
            DataTable dt = GetData(int.Parse(TextBox1.Text));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.ReportPath = "SpecificYearInstructor.rdlc";


            ReportParameter[] rptPr = new ReportParameter[]
            {
                new ReportParameter("SpecificYear",TextBox1.Text)
            
            };
            ReportViewer1.LocalReport.SetParameters(rptPr);
            ReportViewer1.LocalReport.Refresh();

        }
        protected void btn(object sender, EventArgs e)
        {
            showReport();
        }

    }
}