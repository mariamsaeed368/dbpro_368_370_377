<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecificInstructorsReport.aspx.cs" Inherits="DB9_Institute_Management_System.SpecificInstructorsReport" %>

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
            FROM:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            To:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Show"  OnClick="btn"/>
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" style="margin-right: 358px" Width="1341px">
            </rsweb:ReportViewer>

        </div>
    </form>
</body>
</html>
