<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTypeSetup.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.TestTypeSetup" %>

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
    <div class="formPage">
    <form ID="form" runat="server">
    
        <h1 class="formPage1">Test Type Setup</h1>
        <br/><br/>
        <div id="textButton">
            <asp:Label ID="Label1" runat="server" Text="Type Name"></asp:Label>
            <asp:TextBox ID="testTypeTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="saveButton" runat="server" Text="Save" Width="50px" OnClick="saveButton_Click" />
        </div> <br/><br/>
        <asp:GridView ID="testTypeGridview" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                       <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
             <Columns>
                <asp:TemplateField HeaderText="Type Name">
                    <ItemTemplate>
                         <%#Eval("TypeName") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="messageLabel" runat="server"></asp:Label>
    
    <br/><br/>
   </form> 
</div>
    <span class="link"><a href="TestSetup.aspx"  Target="_new">NEXT PAGE</a></span>
    <%--<asp:HyperLink ID="HyperLink1"
        NavigateUrl="TestSetup.aspx"
        Text="NEXT PAGE"
        Target="_new" 
        runat="server">
    </asp:HyperLink>--%>
</body>
</html>
