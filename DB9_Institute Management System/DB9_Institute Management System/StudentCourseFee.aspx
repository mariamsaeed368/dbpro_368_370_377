
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentCourseFee.aspx.cs" Inherits="DB9_Institute_Management_System.StudentCourseFee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Student Course Fee</title>
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
                            <li><a href="Sign In.aspx">Signout</a></li>
                            <li><a href="Courses.aspx">Courses</a></li>
                            <li class="active"><a href="StudentCourseFee.aspx">Student Deposit</a></li>
                            <li><a href="AddInstructor.aspx">Instructor</a></li>
                        </ul>
                            </div>
                    </div>
                </div>
             
        </div>
        <!-----SingIn Start--->
         <div class="container">
            <div class="form-horizontal">
                <h2>Student Deposit Proof</h2>
                <hr/>
                <div class="form-group">
                    <asp:Label ID="RegistrationNo" runat="server" CssClass="col-md-2 control-label" Text="RegistrationNo"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="Register_No" CssClass="form-control" runat="server" DataSourceID="RegistrationNoDataSet" DataTextField="RegistrationNo" DataValueField="RegistrationNo" Width="142px"></asp:DropDownList>
                        <asp:SqlDataSource ID="RegistrationNoDataSet" runat="server" ConnectionString="<%$ ConnectionStrings:DB9ConnectionString %>" SelectCommand="SELECT [RegistrationNo] FROM [Person] WHERE ([RegistrationNo] IS NOT NULL)"></asp:SqlDataSource>
                </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="CourseID" runat="server" CssClass="col-md-2 control-label" Text="Course ID"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="Course_ID" CssClass="form-control" runat="server" DataSourceID="CourseIDDataSet" DataTextField="CourseID" DataValueField="CourseID" Width="145px"></asp:DropDownList>
                        <asp:SqlDataSource ID="CourseIDDataSet" runat="server" ConnectionString="<%$ ConnectionStrings:DB9ConnectionString %>" SelectCommand="SELECT [CourseID] FROM [Course]"></asp:SqlDataSource>
                </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="TotalFee" runat="server" CssClass="col-md-2 control-label" Text="Total Fee"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbtotalfee" CssClass="form-control" runat="server" placeholder="Total Fee" Width="145px"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Status" runat="server" CssClass="col-md-2 control-label" Text="Status"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="Status_fee" CssClass="form-control" runat="server" Width="143px">
                            <asp:ListItem>Paid</asp:ListItem>
                            <asp:ListItem>Unpaid</asp:ListItem>
                        </asp:DropDownList>
                </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Class="btn btn-success" OnClick="btnsubmit_Click"/>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default" style="font-family: Arial"/>  
                    </div>
                </div>
                </div>
                 <table>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                      
                    </td>
                     
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblErrormessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td> 
                </tr>
            </table>
                <hr />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Enableviewstate="False"  GridLines="None" AllowPaging="True" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="PersonID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_PersonID" runat="server" Text='<%#Eval("PersonID") %>'></asp:Label>  
                    </ItemTemplate>  
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="CourseID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_CourseID" runat="server" Text='<%#Eval("CourseID") %>'></asp:Label>  
                    </ItemTemplate>  
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="TotalFee">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_total" runat="server" Text='<%#Eval("TotalFee")%>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_total" Text='<%#Eval("TotalFee")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>  
                </asp:TemplateField> 
               <asp:TemplateField HeaderText="Status">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_status" runat="server" Text='<%#Eval("Status")%>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_status" Text='<%#Eval("Status")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>  
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="RegistratioNo">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_RegistrationNo" runat="server" Text='<%#Eval("RegistrationNo") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="CourseName">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_CourseName" runat="server" Text='<%#Eval("CourseName") %>'></asp:Label>  
                    </ItemTemplate>   
                </asp:TemplateField>  
                    <asp:CommandField HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
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
