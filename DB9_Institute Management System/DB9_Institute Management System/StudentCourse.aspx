﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentCourse.aspx.cs" Inherits="DB9_Institute_Management_System.StudentCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Student Course</title>
   <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                            <li class="active"><a href="Sign In.aspx">Sign In</a></li>

                        </ul>
                            </div>
                    </div>
                </div>
             
        </div>
        <!-----SingIn Start--->
         <div class="container">
            <div class="form-horizontal">
                <h2>Enroll in Courses</h2>
                <hr/>
                 <div class="form-group">
                <asp:HiddenField ID="hfPersonID" runat="server" />
                 </div>
               
                 <div class="form-group">
                    <asp:Label ID="Course_Id" runat="server" CssClass="col-md-2 control-label" Text="Select CourseID"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="CourseID" CssClass="form-control" runat="server" Width="194px"></asp:DropDownList>
                </div>
                        </div>
                <div class="form-group">
                    <asp:Label ID="CourseName" runat="server" CssClass="col-md-2 control-label" Text="Course Title"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtCourseName" CssClass="form-control" runat="server" placeholder="Course Title" Width="194px"></asp:TextBox>
                    </div>
                </div>
                  <div class="form-group">
                    <asp:Label ID="CourseDescription" runat="server" CssClass="col-md-2 control-label" Text="Course Description"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtCourseDescription" CssClass="form-control" runat="server" placeholder="Course Description" Width="194px"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="BtnAdd" runat="server" Text="Enroll" Class="btn btn-success"/>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Class="btn btn-success" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear"   Class="btn btn-success" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                       
                    </div>
                </div>
                 <div class="col-xs-11">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  GridLines="None" AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="860px">
                <Columns>
                    <asp:BoundField DataField="PersonID" HeaderText="PersonID"/>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID"/>
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName"/>
                    <asp:BoundField DataField="CourseDescription" HeaderText="CourseDescription"/>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server">Edit</asp:LinkButton>
                        </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server">Delete</asp:LinkButton>
                        </ItemTemplate>
                         </asp:TemplateField>
                          <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkview" runat="server">View</asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
                 <style>
            .mGrid { 
                    width: 100%; 
                    background-color: #fff; 
                    margin: 5px 0 10px 0; 
                    border: solid 1px #525252; 
                    border-collapse:collapse; 
                    }
            .mGrid td { 
                     padding: 2px; 
                     border: solid 1px #c1c1c1; 
                     color: #717171; 
            }
            .mGrid th { 
                    padding: 4px 2px; 
                    color: #fff; 
                    background: #424242 url(grd_head.png) repeat-x top; 
                    border-left: solid 1px #525252; 
                    font-size: 0.9em; 
            }
.mGrid .alt { background: #D3D3D3 url(grd_alt.png) repeat-x top; }
.mGrid .pgr { background: #424242 url(grd_pgr.png) repeat-x top; }
.mGrid .pgr table { margin: 5px 0; }
.mGrid .pgr td { 
    border-width: 0; 
    padding: 0 6px; 
    border-left: solid 1px #666; 
    font-weight: bold; 
    color: #fff; 
    line-height: 12px; 
 }   
.mGrid .pgr a { color: #666; text-decoration: none; }
.mGrid .pgr a:hover { color: #000; text-decoration: none; }
        </style>
                 <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

