<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructorViewCourses.aspx.cs" Inherits="DB9_Institute_Management_System.InstructorViewCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>AddInstructorDetail</title>
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
                <h2>InstructorCourses</h2>
                <hr/>
                   <div class="form-group">
                <asp:HiddenField ID="hfInstructorCourseId" runat="server" />
                 </div>
                 <div class="form-group">
                <asp:HiddenField ID="hfInstructorId" runat="server" />
                 </div>
                <div class="form-group">
                <asp:HiddenField ID="hfCourses" runat="server" />
                 </div>
               </div>       
          </div>
               
             
                    
                
                <div class="col-xs-11">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  GridLines="None" AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="860px">
                <Columns>
                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID"/>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID"/>
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName"/>
                    <asp:BoundField DataField="CourseDescription" HeaderText="CourseDescription"/>
                     
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkAddQuestions" runat="server" CommandArgument='<%# Eval("InstructorCourseID")%>' OnClick="lnk_OnClick">Add Questions</asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
                 <style>
                     .mGrid { 
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
                 
    </form>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>


