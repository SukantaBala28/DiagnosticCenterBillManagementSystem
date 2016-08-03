<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRequestEntryUI.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.TestRequestEntryUI" %>

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
            <td>Name of the Patient</td>
            <td><asp:TextBox ID="patientNameTextBox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td><asp:TextBox ID="patientDOBTextBox" runat="server"></asp:TextBox></td>
            <td><asp:ImageButton ID="calenderImageButton" runat="server" Height="17px" ImageUrl="~/image/calender.jpg"  Width="21px" OnClick="calenderImageButton_Click" /></td>
            <%--<td><asp:Calendar ID="calenderDOB" runat="server"
            onselectionchanged="" Visible="False"></asp:Calendar></td>--%>
            <td><asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar></td>
        </tr>
        <tr>
            <td>Mobile No</td>
            <td><asp:TextBox ID="mobileNoTextBox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Select Test</td>
            <td><asp:DropDownList ID="testSelectDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="testSelectDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Fee</td>
            <td><asp:TextBox ID="feeTextBox" runat="server"></asp:TextBox></td>
        </tr>

    </table>
        <asp:Button ID="addButton" runat="server" Text="ADD" OnClick="addButton_Click"/>
        
        <asp:GridView ID="testRequestEntryGridview" AutoGenerateColumns="False" runat="server" >
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                       <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
           <asp:BoundField DataField="TestName" HeaderText="Test" ItemStyle-Width="120"></asp:BoundField>
            <asp:BoundField DataField="Fee" HeaderText="Fee" ItemStyle-Width="120"></asp:BoundField>
            
            </Columns>
            
        </asp:GridView>
        <table>
                <tr>
                    <td>Total</td>
                    <td><asp:TextBox ID="totalTextBox" runat="server"></asp:TextBox></td>
                </tr>
        </table>
        <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" />
        <asp:Button ID="pdfButton" runat="server" Text="Generate PDF" OnClick="pdfButton_Click" /><br/>
        <asp:Label ID="messageLabel" runat="server" Visible="False" Text=""></asp:Label>
    </div>
    </form>
    <span class="link"><a href="PaymentUI.aspx"  Target="_new">NEXT PAGE</a></span><br/>
    <span class="link"><a href="TestRequestEntryUI.aspx"  Target="_new">PREVIOUS PAGE</a></span>
</body>
</html>
