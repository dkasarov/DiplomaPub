<%@ Page Title="Рискове" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Risks.aspx.cs" Inherits="Diplomna.Admin.Risks" UnobtrusiveValidationMode="None"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAllRisks" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/images/cancel-24.png" EditImageUrl="~/images/edit-24.png" UpdateImageUrl="~/images/available-updates-24.png" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Наименование" SortExpression="Name">
            <HeaderStyle Font-Bold="True" Font-Size="Small" />
            <ItemStyle Font-Bold="False" Font-Size="Small" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="Status" HeaderText="Статус" SortExpression="Status" >
            <HeaderStyle Font-Bold="True" Font-Size="Small" />
            </asp:CheckBoxField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllRisks" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' DeleteCommand="DELETE FROM [Risk] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Risk] ([Name], [Status]) VALUES (@Name, @Status)" SelectCommand="SELECT * FROM [Risk]" UpdateCommand="UPDATE [Risk] SET [Name] = @Name, [Status] = @Status WHERE [ID] = @ID">
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
    <h3>Добавяне на риск</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Наименование</p></td>
                <td>
                    <asp:TextBox ID="TextBoxRiskName" runat="server" CssClass="DropDown" ValidationGroup="AddRisk"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Моля, въведете стойност." ControlToValidate="TextBoxRiskName" ValidationGroup="AddRisk" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddRisk" runat="server" Text="Запис" OnClick="ButtonAddRisk_Click1" ValidationGroup="AddRisk" CssClass="Button" /></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceRisks" runat="server" SelectCommand="SELECT ID FROM Risk WHERE (Name = @RiskName)" ProviderName="System.Data.SqlClient" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxRiskName" Name="RiskName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
