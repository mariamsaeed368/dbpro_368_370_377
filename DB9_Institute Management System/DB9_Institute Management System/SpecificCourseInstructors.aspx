<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecificCourseInstructors.aspx.cs" Inherits="DB9_Institute_Management_System.SpecificCourseInstructors" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <br />
            Course:&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Show"  OnClick="btn"/>
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="958px">
            </rsweb:ReportViewer>

        </div>
    </form>
</body>
</html>
