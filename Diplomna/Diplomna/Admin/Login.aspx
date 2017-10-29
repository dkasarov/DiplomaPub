<%@ Page Title="Вход за администратори" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Diplomna.Admin.Login" UnobtrusiveValidationMode="None"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h1><%: Title %></h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT ID, Type, FirstName, LastName, Companies_ID FROM Users WHERE (Username = @username) AND (Password = @password) AND (Status = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxUsername" Name="username" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxPassword" Name="password" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="margin-bottom: 20px;">
        <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
    </div>    
    <table border="0" id="calcTable">
        <tr>
            <td>
                <p>Потребителско име</p>
            </td>
            <td>
                <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="DropDown"></asp:TextBox></td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете потребителско име." ControlToValidate="TextBoxUsername" ForeColor="Red" ValidationGroup="login" Font-Size="Small" Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <p>Парола</p>
            </td>
            <td>
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="DropDown"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Моля, въведете парола." ControlToValidate="TextBoxPassword" ForeColor="Red" ValidationGroup="login" Font-Size="Small" Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonLogIn" runat="server" Text="Вход" CssClass="Button" OnClick="ButtonLogIn_Click" ValidationGroup="login"/></td>
        </tr>
    </table>
        </asp:Content>
