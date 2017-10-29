<%@ Page Title="Тестове" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Diplomna.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
    <asp:Button ID="button" runat="server" Text="generate" OnClick="button_Click" />
    <br /><br />
    <asp:Label ID="label" runat="server" Text="Парола"></asp:Label>
</asp:Content>
