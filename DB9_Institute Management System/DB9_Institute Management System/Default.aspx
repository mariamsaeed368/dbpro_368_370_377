<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DB9_Institute_Management_System.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Home</title>
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
        <form id="form2" runat="server">
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
                            <li class="active"><a href="Default.aspx">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                             <li><a href="SignUp.aspx">Sign Up</a></li>
                             <li><a href="Sign In.aspx">Sign In</a></li>

                        </ul>
                            
                            </div>
                    </div>
                </div>
            <!--- <img src="Images/1.jpg" alt="Not found" width= "1350"  height="260" />
             </div>
        <h2>Welcome to Online Examination System</h2>
        <h4>In this website you can challenge your skills by giving the online test.So buckle up fellas its time to test your water.Happy learning :)</h4>-->
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active" style="background-image: url(Images/bg1.jpg)">
                        <img src="Images/C.png" alt="...">
                        <div class="carousel-caption">
                            <h3>C Programming Language</h3>
                            <p><a class="btn btn-lg btn-primary" href="SignUp.aspx" role="button">Join Us Today</a></p>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(Images/bg2.jpg)">
                        <img src="Images/Cpp.png" alt="...">
                        <div class="carousel-caption">
                            <h3>C++ Programming Language</h3>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(Images/bg3.jpg)">
                        <img src="Images/CSharp.png" alt="...">
                        <div class="carousel-caption">
                            <h3>C# Programming Language</h3>
                            
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <!--- Carousel -->
              </div>
        <br />
        <br />
        <!--- Middle Contents -->
        <div class="container center">
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-circle" src="Images/C.png" alt="C.png" width="140" height="140" />
                    <h2>C language</h2>
                    <p>C was originally developed by Dennis Ritchie between 1969 and 1973 at Bell Labs,[6] and used to re-implement the Unix operating system.[7] It has since become one of the most widely used programming languages of all time,[8][9] with C compilers from various vendors available for the majority of existing computer architectures and operating systems. C has been standardized by the American National Standards Institute (ANSI) since 1989 (see ANSI C) and subsequently by the International Organization for Standardization (ISO).</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle" src="Images/Cpp.png" alt="Cpp.png" width="140" height="140" />
                    <h2>C++</h2>
                    <p>It was designed with a bias toward system programming and embedded, resource-constrained and large systems, with performance, efficiency and flexibility of use as its design highlights.[7] C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications,[7] including desktop applications, servers (e.g. e-commerce, Web search or SQL servers), and performance-critical applications (e.g. telephone switches or space probes).[8] C++ is a compiled language, with implementations of it available on many platforms. Many vendors provide C++ compilers, including the Free Software Foundation, Microsoft, Intel, and IBM.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle" src="Images/CSharp.png" alt="CSharp.png" width="140" height="140" />
                    <h2>C#</h2>
                    <p>C#(pronounced C sharp) is a general-purpose, multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.[16] It was developed around 2000 by Microsoft within its .NET initiative and later approved as a standard by Ecma (ECMA-334) and ISO (ISO/IEC 23270:2006). C# is one of the programming languages designed for the Common Language Infrastructure.</p>
                   <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
            </div>
        </div>
        <!--- Middle Contents -->

         <!--- Footer  -->

        <hr />

        <footer>
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;Department of Computer Science and Engineering &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; </p>
            </div>
        </footer>
        </form>
       <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
