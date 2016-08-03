<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentUI.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.PaymentUI" %>

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
            <td><asp:Label ID="Label1" runat="server" Text="Bill No"></asp:Label></td>
            <td><asp:TextBox ID="billNOTextBox" runat="server"></asp:TextBox></td>
            <td><asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" /></td>

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
                <asp:TemplateField HeaderText="Test">
                    <ItemTemplate>
                         <%#Eval("TestName") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField HeaderText="Fee">
                    <ItemTemplate>
                         <%#Eval("FeeAmount") %> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
       </table>
           
       <table> 
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Bill Date"></asp:Label></td>
            <td><asp:Label ID="billDateLabel" runat="server" Text=""></asp:Label></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Total Fee"></asp:Label></td>
            <td><asp:Label ID="totalFeeLabel" runat="server" Text=""></asp:Label></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label6" runat="server" Text="Paid Amount"></asp:Label></td>
            <td><asp:Label ID="paidAmountLabel" runat="server" Text=""></asp:Label></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label8" runat="server" Text="Due Amount"></asp:Label></td>
            <td><asp:Label ID="dueAmountLabel" runat="server" Text=""></asp:Label></td>
        </tr>
        
        
        <tr>
            <td>Amount</td>
            <td><asp:TextBox ID="amountTextBox" runat="server"></asp:TextBox></td>
        </tr>
       </table>
        <asp:Button ID=payButton runat="server" Text="Pay" OnClick="payButton_Click" />  

       </div> 

    </form> 
    
    <span class="link"><a href="TestWiseReportUI.aspx"  Target="_new">NEXT PAGE</a></span><br/>
    <span class="lin"><a href="TestRequestEntryUI.aspx"  Target="_new">PREVIOUS PAGE</a></span>

</body> 

</html> 