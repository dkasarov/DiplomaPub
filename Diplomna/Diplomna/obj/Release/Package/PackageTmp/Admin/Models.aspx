<%@ Page Title="Модели" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Models.aspx.cs" Inherits="Diplomna.Admin.Models1" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAllModels" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:TemplateField HeaderText="Brands_ID" SortExpression="Brands_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropDown" DataSourceID="SqlDataSourceEditBrand" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("Brands_ID") %>'>
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceEditBrand" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT ID, Name FROM Brands WHERE (Status = 1) ORDER BY [Name]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:CheckBoxField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllModels" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' DeleteCommand="DELETE FROM [Models] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Models] ([Brands_ID], [Name], [Status]) VALUES (@Brands_ID, @Name, @Status)" SelectCommand="SELECT Models.ID, Models.Brands_ID, Models.Name, Models.Status, Brands.Name AS BrandName FROM Models INNER JOIN Brands ON Models.Brands_ID = Brands.ID WHERE Brands.Status=1" UpdateCommand="UPDATE [Models] SET [Brands_ID] = @Brands_ID, [Name] = @Name, [Status] = @Status WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Brands_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Brands_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на модел</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Производител</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListBrand" runat="server" CssClass="DropDown" DataSourceID="SqlDataSourceAllBrands" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
                    <asp:SqlDataSource ID="SqlDataSourceAllBrands" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID, Name FROM Brands WHERE (Status = 1) ORDER BY [Name]"></asp:SqlDataSource>
            </tr>
            <tr>
                <td><p>Наименование</p></td>
                <td>
                    <asp:TextBox ID="TextBoxName" runat="server" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете наименование." ForeColor="Red" ValidationGroup="AddModel" Font-Size="Small" ControlToValidate="TextBoxName" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddModel" runat="server" Text="Запис" ValidationGroup="AddModel" CssClass="Button" OnClick="ButtonAddModel_Click"/></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceModels" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID FROM Models WHERE (Brands_ID = @BrandID) AND (Name = @Name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="BrandID"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxName" PropertyName="Text" Name="Name"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
