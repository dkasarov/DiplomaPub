<%@ Page Title="Клаузи" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clauses.aspx.cs" Inherits="Diplomna.Admin.Clauses" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAllClauses" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>

            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
            </asp:BoundField>

            <asp:BoundField DataField="MinNumber" HeaderText="MinNumber" SortExpression="MinNumber">
            </asp:BoundField>
            <asp:BoundField DataField="MaxNumber" HeaderText="MaxNumber" SortExpression="MaxNumber">
            </asp:BoundField>
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
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

    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllClauses" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' DeleteCommand="DELETE FROM [TypeInsurance] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TypeInsurance] ([Name], [MinNumber], [MaxNumber], [Status]) VALUES (@Name, @MinNumber, @MaxNumber, @Status)" SelectCommand="SELECT * FROM [TypeInsurance]" UpdateCommand="UPDATE [TypeInsurance] SET [Name] = @Name, [MinNumber] = @MinNumber, [MaxNumber] = @MaxNumber, [Status] = @Status WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="MinNumber" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="MaxNumber" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="MinNumber" Type="Int32" />
            <asp:Parameter Name="MaxNumber" Type="Int32" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на клауза</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Наименование</p></td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxClauseName" runat="server" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете наименование." ControlToValidate="TextBoxClauseName" ForeColor="Red" SetFocusOnError="True" ValidationGroup="AddClause" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Минимално допустимо число</p></td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxMimNum" runat="server" CssClass="DropDown" TextMode="Number"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Моля, въведете стойност." ControlToValidate="TextBoxMimNum" ForeColor="Red" ValidationGroup="AddClause" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Максимално допустимо число</p></td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxMaxNum" runat="server" CssClass="DropDown" TextMode="Number"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Моля, въведете стойност." ControlToValidate="TextBoxMaxNum" ForeColor="Red" ValidationGroup="AddClause" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style1">
                    <asp:Button ID="ButtonWriteClause" runat="server" Text="Запис" CssClass="Button" OnClick="ButtonWriteClause_Click" ValidationGroup="AddClause"/>
                                    
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceClause" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT ID FROM TypeInsurance WHERE (Name = @ClauseName)" ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxClauseName" Name="ClauseName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
