using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB9_Institute_Management_System
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegisteredStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegisteredStudentReport.aspx");
        }

        protected void btnAvailableCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CourseReport.aspx");
        }

        protected void btnSubittedDues_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SubmittedDuesReport.aspx");
        }

        protected void btnStudentsEnrolled_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/StudentsEnrolledReport.aspx");
        }

        protected void btnInstructorTest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InstructorTestReport.aspx");
        }

        protected void BtnInstructor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InstructorsReport.aspx");
        }

        protected void BtnInstructorCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InstructorCourseReport.aspx");
        }
    }
}