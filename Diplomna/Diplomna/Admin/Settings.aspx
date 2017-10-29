<%@ Page Title="Настройки" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Diplomna.Admin.Settings" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <h3>Редактиране на парола</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
            <asp:Label ID="successLabel" runat="server" Visible="False" ForeColor="White" CssClass="successBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Стара парола</p></td>
                <td>
                    <asp:TextBox ID="TextBoxOldPass" runat="server" CssClass="DropDown" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="NewPass" ErrorMessage="Моля, въведете парола." ControlToValidate="TextBoxOldPass" ForeColor="Red" Font-Size="Small" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Нова парола</p></td>
                <td>
                    <asp:TextBox ID="TextBoxNewPass" runat="server" CssClass="DropDown" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="NewPass" ErrorMessage="Моля, въведете парола." ControlToValidate="TextBoxNewPass" ForeColor="Red" Font-Size="Small" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Повтори новата парола</p></td>
                <td>
                    <asp:TextBox ID="TextBoxRepeatNewPass" runat="server" CssClass="DropDown" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="NewPass" ErrorMessage="Моля, въведете парола." ControlToValidate="TextBoxRepeatNewPass" ForeColor="Red" Font-Size="Small" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonNewPassword" runat="server" Text="Запази" CssClass="Button" ValidationGroup="NewPass" OnClick="ButtonNewPassword_Click"/></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCheckOldPass" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT [ID] FROM [Users] WHERE (([Password] = @Password) AND ([ID] = @ID))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxOldPass" Name="Password" PropertyName="Text" Type="String" />
            <asp:SessionParameter Name="ID" SessionField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
