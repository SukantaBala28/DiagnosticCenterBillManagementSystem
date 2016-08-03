<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestWiseReportUI.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.TestWiseReportUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label></td>
                <td><asp:TextBox ID="fromDateTextBox" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label></td>
                <td><asp:TextBox ID="toDateTextBox" runat="server"></asp:TextBox></td>
                <td><asp:Button ID="showButton" runat="server" Text="Show" /></td>
            </tr>
            <asp:GridView ID="searchGridView" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                       <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
             <Columns>
                <asp:TemplateField HeaderText="Test Name">
                    <ItemTemplate>
                         <%#Eval("TestName") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Total Test">
                    <ItemTemplate>
                         <%#Eval("Fee") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Total Name">
                    <ItemTemplate>
                         <%#Eval("Fee") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
        <tr>
            <td><asp:Button ID="pdfButton" runat="server" Text="PDF" /></td>
            <td><asp:Label ID="Label3" runat="server" Text="Total"></asp:Label></td>
            <td><asp:TextBox ID="totalTextBox" runat="server"></asp:TextBox></td>
        </tr>

        </table>
    </div>
    </form>
</body>
</html>
