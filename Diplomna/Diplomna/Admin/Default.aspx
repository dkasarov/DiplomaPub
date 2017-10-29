<%@ Page Title="Админ панел" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Diplomna.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h3 style="text-align: center;">Админ панел</h3>
    <div class="vertical-menu">
        <asp:Panel ID="MenuTypeOne" runat="server" Visible="False">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Clauses.aspx">Клаузи</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/Risks.aspx">Рискове</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/Brands.aspx">Производители</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/Models.aspx">Модели</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/Modifications.aspx">Модификации</asp:HyperLink>
            <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Admin/Companies.aspx">Застрахователни компании</asp:HyperLink>
            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Admin/Admins.aspx">Администратори от ЗК</asp:HyperLink>
        </asp:Panel>
        <asp:Panel ID="MenuTypeTwo" runat="server" Visible="False">
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/TariffNumbers.aspx">Тарифни числа</asp:HyperLink>
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Admin/Increases.aspx">Рискове</asp:HyperLink>
        </asp:Panel>
    </div>
</asp:Content>
