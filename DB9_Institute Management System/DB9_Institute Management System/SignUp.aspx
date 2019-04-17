<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="DB9_Institute_Management_System.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sign Up</title>
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
                        <a class="navbar-brand" href="Default.aspx">Institute Mangement System</a>
                    </div>
                        <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                             <li class="active"><a href="SignUp.aspx">Sign Up</a></li>

                        </ul>
                            </div>
                    </div>
                </div>
             
        </div>
           <div class="container">
           <!---- <div class="form-horizontal">--->
                <h2>Registration</h2>
                <hr />           
        <div class="center-page">
            <label class="col-xs-11">Name</label>
             <div class="col-xs-11">
                <asp:TextBox ID="tbname" runat="server" Class="form-control" placeholder="Name"></asp:TextBox>
            </div>
            <label class="col-xs-11">Address</label>
             <div class="col-xs-11">
                <asp:TextBox ID="tbAddress" runat="server" Class="form-control" placeholder="Address"></asp:TextBox>
             </div>
             <label class="col-xs-11">Password</label>
             <div class="col-xs-11">
                <asp:TextBox pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" ID="tbPass" runat="server" Class="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
            </div>
             <label class="col-xs-11">Confirm Password</label>
             <div class="col-xs-11">
                <asp:TextBox pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" ID="tbCPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>
             <label class="col-xs-11">Registration No.</label>
             <div class="col-xs-11">
                <asp:TextBox ID="tbRegNo" runat="server" Class="form-control" placeholder="Registration No."></asp:TextBox>
            </div>
             <label class="col-xs-11">Email</label>
             <div class="col-xs-11">
               <asp:TextBox ID="tbEmail" runat="server" Class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
             </div>
             <div class="col-xs-11">
                <asp:Button ID="btSignup" runat="server" Class="btn btn-success" Text="Sign Up"/>
            </div>
             <div class="col-xs-11">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>


        </div>
               </div>
    </form>
     <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
