<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="DB9_Institute_Management_System.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Reports</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .auto-style1 {
            font-family: Arial;
        }
.btn-group button {
  background-color: #4CAF50; /* Green background */
  border: 1px solid green; /* Green border */
  color: white; /* White text */
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  width: 100%; /* Set a width if needed */
  display: block; /* Make the buttons appear below each other */
}

.btn-group button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: #3e8e41;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
       <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx">Institute Management System</a>
                    </div>
                        <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="Sign In.aspx">Signout</a></li>
                            <li ><a href="Courses.aspx">Courses</a></li>
                            <li><a href="StudentCourseFee.aspx">Student Deposit</a></li>
                            <li><a href="AddInstructor.aspx">Instructor</a></li>
                            <li><a href="InstructorCourse.aspx">Instructor Course</a></li>
                            <li class="active"><a href="Reports.aspx">Reports</a></li>


                        </ul>
                            </div>
                    </div>
                </div>
        </div>
        <div class="container">
            <div class="form-horizontal">
                <h2>Reports</h2>
                <hr/>
                <div class="btn-group">
                  <asp:Button ID="btnRegisteredStudent" runat="server" Text="Registered Students" CssClass="btn btn-success" style="font-family: Arial" OnClick="btnRegisteredStudent_Click" />
                  <asp:Button ID="btnAvailableCourses" runat="server" Text="Courses" CssClass="btn btn-default" style="font-family: Arial" OnClick="btnAvailableCourses_Click"/>
                 <asp:Button ID="btnSubittedDues" runat="server" Text="Dues History" CssClass="btn btn-success" style="font-family: Arial" OnClick="btnSubittedDues_Click"/>                          
                 <asp:Button ID="btnStudentsEnrolled" runat="server" Text="Enrolled Students" CssClass="btn btn-default" style="font-family: Arial" OnClick="btnStudentsEnrolled_Click"/>                          
                 <asp:Button ID="btnInstructorTest" runat="server" Text="Instructor's Test" CssClass="btn btn-success" style="font-family: Arial" OnClick="btnInstructorTest_Click"/>                          
                <asp:Button ID="BtnInstructor" runat="server" Text="Instructors" CssClass="btn btn-default" style="font-family: Arial" OnClick="BtnInstructor_Click" />                          
                <asp:Button ID="BtnInstructorCourse" runat="server" Text="Instructor's Course" CssClass="btn btn-success" style="font-family: Arial" OnClick="BtnInstructorCourse_Click"/>                          
             
        </div>

            </div>
            </div>
    </form>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
