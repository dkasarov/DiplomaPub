<%@ Page Title="Производители" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="Diplomna.Admin.Brands" UnobtrusiveValidationMode="None"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAllBrands" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="True" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" CancelImageUrl="~/images/cancel-24.png" DeleteImageUrl="~/images/delete-24.png" EditImageUrl="~/images/edit-24.png" UpdateImageUrl="~/images/available-updates-24.png" ButtonType="Image"></asp:CommandField>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Наименование" SortExpression="Name">
                <HeaderStyle Font-Size="Small"></HeaderStyle>

                <ItemStyle Font-Size="Small"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Статус" SortExpression="Status">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>'/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' Enabled="false" />
                </ItemTemplate>
                <HeaderStyle Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

        <RowStyle ForeColor="#000066"></RowStyle>

        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllBrands" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' DeleteCommand="DELETE FROM [Brands] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Brands] ([Name], [Status]) VALUES (@Name, @Status)" SelectCommand="SELECT * FROM [Brands]" UpdateCommand="UPDATE [Brands] SET [Name] = @Name, [Status] = @Status WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на производител</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel3" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Наименование</p></td>
                <td>
                    <asp:TextBox ID="TextBoxBrandName" runat="server" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Моля, въведете стойност." Font-Bold="True" ValidationGroup="AddBrand" Font-Size="Small" ForeColor="Red" ControlToValidate="TextBoxBrandName"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddBrand" runat="server" Text="Запис" CssClass="Button" ValidationGroup="AddBrand" OnClick="ButtonAddBrand_Click1" /></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceBrands" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT ID FROM Brands WHERE Name = @BrandName" ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxBrandName" Name="BrandName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
