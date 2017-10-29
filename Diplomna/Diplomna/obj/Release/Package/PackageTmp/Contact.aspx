<%@ Page Title="Контакти" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Diplomna.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h3>Свържете се с нас</h3>
    <table border="0" >
        <tr>
            <td><p>Имейл адрес</p></td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" CssClass="DropDown"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><p>Тема</p></td>
            <td>
                <asp:TextBox ID="TextBoxSubject"  runat="server" CssClass="DropDown"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="vertical-align: top;"><p>Съобщение</p></td>
            <td>
                <asp:TextBox ID="TextBoxMessage" Height="100" Width="250" runat="server" CssClass="DropDown" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonSend" runat="server" Text="Изпрати" CssClass="Button"/></td>
        </tr>
    </table>

</asp:Content>
