<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSetup.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.TestSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet"href="../CSS/style.css"/>
</head>
<body>
    <div class="header">
        <h1>Diagnostic Center Bill Management System</h1>
    </div>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>Test Name</td>
            <td><asp:TextBox ID="testnameTextBox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Fee</td>
            <td><asp:TextBox ID="feeTextBox" runat="server"></asp:TextBox> BDT</td>
        </tr>
        <tr>
            <td>Test Type</td>
            <td><asp:DropDownList ID="testTypeDropDownlist" runat="server"></asp:DropDownList></td>
        </tr>
         
    </table>
        <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click"/>
        <asp:GridView ID="testInputTypeGridview" AutoGenerateColumns="False" runat="server">
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
                <asp:TemplateField HeaderText="Fee">
                    <ItemTemplate>
                         <%#Eval("Fee") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate>
                         <%#Eval("TestType") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </div>
        <asp:Label ID="messageLabel" runat="server"></asp:Label>
    </form>
    <span class="link"><a href="TestRequestEntryUI.aspx"  Target="_new">NEXT PAGE</a></span><br/>
    <span class="link"><a href="TestTypeSetup.aspx"  Target="_new">PREVIOUS PAGE</a></span>
</body>
</html>
