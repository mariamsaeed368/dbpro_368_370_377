<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinalTest.aspx.cs" Inherits="DB9_Institute_Management_System.FinalTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>Online Test </title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript"></script>  
         
        <script>
            function StartTest(popUpPage) {
                window.open(popUpPage, 'null', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,fullscreen=yes');
            }  
        </script>
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
                        <a class="auto-style4" href="Default.aspx">Institute Management System</a>
                    </div>
                        <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="Sign In.aspx">Signout</a></li>
                            <li><a href="StudentViewOfCourses.aspx">Available Courses</a></li>
                            <li><a href="Result.aspx">Results</a></li>
                        </ul>
                            </div>
                    </div>
                </div>
        </div>
        <!--Final Test Starts-->
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div style="background: #ffffff;margin:0 auto; " class="auto-style2">
            <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <table class="auto-style3">
                                    <tr>
                                        <td style="float: left;"><b><span id="timerText"></span><span id="spnthankyou"></span></b></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdquestions" runat="server" AutoGenerateColumns="false" OnRowDataBound="grdquestions_RowDataBound" DataKeyNames="QuestionID" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Final Test">
                                            <ItemTemplate>
                                                <table class="tableclass" id='<%#Eval("QuestionID") %>'>
                                                    <tr>
                                                        <td><b>Question <%#Eval("QuestionID") %> -: <%#Eval("Question") %></b>
                                                            <asp:HiddenField ID="hdnquestionId" runat="server"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="tblOptions">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption1" runat="server" Text='<%#Eval("Option1") %>' GroupName='<%#Eval("QuestionID") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption2" runat="server" Text='<%#Eval("Option2") %>' GroupName='<%#Eval("QuestionID") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption3" runat="server" Text='<%#Eval("Option3") %>' GroupName='<%#Eval("QuestionID") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdOption4" runat="server" Text='<%#Eval("Option4") %>' GroupName='<%#Eval("QuestionID") %>' /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="lbquestionstatus" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="correctAnswer">Correct Answer Is -:
                                                                                    <asp:Label ID="lbAnswer" runat="server" Text='<%#Eval("CorrectAnswer") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClientClick="return CheckIfAllQuestionAnswerHasBeenSubmitted()"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Result Report"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbresult" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <script>
                //Set the number of minutes you need
                var mins = 0.5;
                var secs = mins * 60;
                var currentSeconds = 0;
                var currentMinutes = 0;

                var ourtimer;
                function StartCountDown() {
                    ourtimer = setTimeout(Decrement, 1000);
                }

                function EndCountDown() {
                    clearTimeout(ourtimer);
                }

                $(document).ready(function () { StartCountDown(); }); //start the countdown

                function Decrement() {
                    currentMinutes = Math.floor(secs / 60);
                    currentSeconds = secs % 60;
                    if (currentSeconds <= 9) currentSeconds = "0" + currentSeconds;
                    secs--;
                    document.getElementById("timerText").innerHTML = "Time Remaining " + currentMinutes + ":" + currentSeconds;
                    if (secs !== -1) {
                        setTimeout('Decrement()', 1000);
                    }
                    else {
                        window.location.href = "Result.aspx?timeout=1"
                    }
                }

                function CheckIfAllQuestionAnswerHasBeenSubmitted() {
                    var numItems = $('.tblOptions').length;
                    var flagtocheckcount = 0;
                    $(".tblOptions").each(function () {
                        var groupname = $('input[type=radio]:first', this).attr('name');
                        if (!$("input[name='" + groupname + "']:checked").val()) {
                            $(this).parents(".tableclass").addClass("border");
                            var tableid = $(this).closest('table [class^="tableclass"]').attr("id");
                        }
                        else {
                            flagtocheckcount = flagtocheckcount + 1;
                        }
                    })

                    if (parseInt(flagtocheckcount) == parseInt(numItems)) {
                        var CountFinalResult = 0;
                        var Status = " ";
                        $(".tblOptions").each(function () {
                            var groupname = $('input[type=radio]:first', this).attr('name');
                            var radioId = $("input[name='" + groupname + "']:checked").attr("id")
                            var UserSelectedAnswer = $("label[for='" + radioId + "']").text();
                            var CorrectAnswer = $('span:last-child', this).text();
                            var CorrectAnswerSpanId = $('span:last-child', this).attr("id");
                            var QuestionStatus = $("span:nth-last-child(1)", this).attr("id");

                            if (CorrectAnswer == UserSelectedAnswer) {
                                $("#" + QuestionStatus).text("Correct Answer").css("color", "green");
                                $('td.correctAnswer').find("td.correctAnswer", this).css("display", "none");
                                CountFinalResult = CountFinalResult + 1;
                            }
                            else {
                                //$('table.tblOptions tbody tr td:last-child').addClass("incorrect");
                                $('span:last-child', this).css({ 'display': 'inline-flex' });
                                $("#" + QuestionStatus).text("InCorrect Answer").css({ 'color': 'Red' });
                                $('td.correctAnswer', this).css({ "display": "block", "background-color": "#D3D3D3", "color": "redss" });

                            }
                            if (CountFinalResult > 0) {
                                Status = "Passed";
                            }
                            else {
                                Status = "Fail";
                            }
                        });
                        $("#lbresult").text("Final Result-:" + CountFinalResult + "/" + TotalQuestions);
                        $("#lblStatus").text("Status-:" + Status);
                        $("#btnSubmit").attr("disabled", "disabled"); //disable button if all questions answer has been given
                        $("#btnSubmit").removeClass("btn");
                        $("#btnSubmit").addClass("btndiabled");
                        EndCountDown();
                        $("#timerText").css("display", "none");
                        $("#spnthankyou").append("Thank You for submitting your test.")
                        $("input[type=radio]").attr('disabled', true); //disable all radio button after test submitted by user
                        return false;
                    }
                    else {
                        return false;
                    }
                }

                var CountCheckCheckQuestion = 0; //following function will work on every radio button click
                var TotalQuestions = 0;
                $("input[type=radio]").click(function () {
                    var groupname = $(this).attr("name");
                    $(this).parents(".tableclass").removeClass("border");
                    CheckTheCountOfQuestionHasBeenAnswered();          //this function to check if all the answer given while selecting radio button you don't need.. 
                    // to click on submit button
                    if (parseInt(CountCheckCheckQuestion) == parseInt(TotalQuestions)) {
                        CheckIfAllQuestionAnswerHasBeenSubmitted();
                    }
                });


                function CheckTheCountOfQuestionHasBeenAnswered() {
                    TotalQuestions = $('.tblOptions').length;
                    var TotalGivenAnswerCount = 0;
                    var flagtocheckcount = 0;
                    $(".tblOptions").each(function () {
                        var groupname = $('input[type=radio]:first', this).attr('name');
                        if (!$("input[name='" + groupname + "']:checked").val()) {
                        }
                        else {
                            TotalGivenAnswerCount = TotalGivenAnswerCount + 1;
                        }
                    })
                    CountCheckCheckQuestion = TotalGivenAnswerCount;
                }

            </script>

            <style>
                .border {
                    border-color: red;
                    border-width: 2px;
                    border-style: solid;
                    width: 100%;
                }

                .correctAnswer {
                    display: none;
                    width: 950px!important;
                }

                .tblOptions {
                    width: 100%;
                }

                .btn {
                    background: #000000;
                    background-image: -webkit-linear-gradient(top, #000000, #2980b9);
                    background-image: -moz-linear-gradient(top, #000000, #2980b9);
                    background-image: -o-linear-gradient(top, #000000, #2980b9);
                    background-image: linear-gradient(to bottom, #000000, #2980b9);
                    -webkit-border-radius: 0;
                    -moz-border-radius: 0;
                    border-radius: 6px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 19px;
                    padding: 3px 20px;
                    text-decoration: none;
                }

                .btn:hover {
                    background: #261c61;
                    background-image: -webkit-linear-gradient(top, #261c61, #3498db);
                    background-image: -moz-linear-gradient(top, #261c61, #3498db);
                    background-image: -o-linear-gradient(top, #261c61, #3498db);
                    background-image: linear-gradient(to bottom, #261c61, #3498db);
                    text-decoration: none;
                    cursor: pointer;
                }

                .btndiabled {
                    background: #bdb3bd;
                    background-image: -webkit-linear-gradient(top, #bdb3bd, #757575);
                    background-image: -moz-linear-gradient(top, #bdb3bd, #757575);
                    background-image: -o-linear-gradient(top, #bdb3bd, #757575);
                    background-image: linear-gradient(to bottom, #bdb3bd, #757575);
                    -webkit-border-radius: 0;
                    -moz-border-radius: 0;
                    border-radius: 6px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 19px;
                    padding: 3px 20px;
                    text-decoration: none;
                    cursor: none;
                }
                .auto-style2 {
                    width: 1000px;
                }
                .auto-style3 {
                    width: 100%;
                    height: 35px;
                }
                .auto-style4 {
                    float: left;
                    height: 19px;
                    padding: 15px 15px;
                    font-size: 18px;
                    line-height: 20px;
                }
            </style>
        </div>
    </form>
     <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
