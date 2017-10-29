<%@ Page Title="Застрахователни компании" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="Diplomna.Admin.Companies" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <div style="width: 100%; height: auto; overflow: auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAllCompanies" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel-24.png" DeleteImageUrl="~/images/delete-24.png" EditImageUrl="~/images/edit-24.png" ShowEditButton="True" UpdateImageUrl="~/images/available-updates-24.png" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID" Visible="False"></asp:BoundField>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:Image ID="Logo" runat="server" Width="24px" ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Logo")) %>'/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Logo" runat="server" Width="24px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Logo")) %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Компания" SortExpression="Name">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
                </asp:BoundField>
                <asp:BoundField DataField="Phone" HeaderText="Телефон" SortExpression="Phone">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:BoundField DataField="WebAddress" HeaderText="Уеб адрес" SortExpression="WebAddress">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Статус" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%# Bind("Status") %>' />
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" Font-Size="Small" />
                    <ItemStyle Font-Size="Small" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllCompanies" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' DeleteCommand="DELETE FROM [Companies] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Companies] ([Name], [TypeOwnership], [Commercial], [IdentificationNumber], [Phone], [Email], [WebAddress], [Logo], [Status]) VALUES (@Name, @TypeOwnership, @Commercial, @IdentificationNumber, @Phone, @Email, @WebAddress, @Logo, @Status)" SelectCommand="SELECT * FROM [Companies]" UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [Phone] = @Phone, [Email] = @Email, [WebAddress] = @WebAddress, [Status] = @Status WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="TypeOwnership" Type="String"></asp:Parameter>
            <asp:Parameter Name="Commercial" Type="String"></asp:Parameter>
            <asp:Parameter Name="IdentificationNumber" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="WebAddress" Type="String"></asp:Parameter>
            <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Byte"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="WebAddress" Type="String"></asp:Parameter>
            <asp:Parameter Name="Logo" Type="String"></asp:Parameter>
            <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на компания</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td>Наименование</td>
                <td>
                    <asp:TextBox ID="TextBoxName" CssClass="DropDown" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете наименование." Font-Bold="True" Font-Size="Small" ForeColor="Red" ValidationGroup="AddCompany" ControlToValidate="TextBoxName" ></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Телефон за контакти</td>
                <td>
                    <asp:TextBox ID="TextBoxPhone" runat="server" MaxLength="10" CssClass="DropDown" TextMode="Phone"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Моля, въведете булстат телефон." ValidationGroup="AddCompany" Font-Size="Small" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxPhone"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Имейл за контакти</td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="DropDown" TextMode="Email"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Моля, въведете булстат имейл." ValidationGroup="AddCompany" Font-Size="Small" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Уеб адрес</td>
                <td>
                    <asp:TextBox ID="TextBoxWebAddress" runat="server" CssClass="DropDown" TextMode="Url"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Моля, въведете булстат уеб адрес." ValidationGroup="AddCompany" Font-Size="Small" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxWebAddress"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Лого</td>
                <td>
                    <asp:FileUpload ID="FileUploadLogo" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Моля, изберете лого." ValidationGroup="AddCompany" Font-Size="Small" Font-Bold="True" ForeColor="Red" ControlToValidate="FileUploadLogo"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddCompany" runat="server" Text="Запис"  CssClass="Button" OnClick="ButtonAddCompany_Click" ValidationGroup="AddCompany"/></td>
            </tr>
        </table>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceCompanies" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID FROM Companies WHERE (Name = @Name) AND (Phone = @Phone) AND (Email = @Email) AND (WebAddress = @WebAddress)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxName" PropertyName="Text" Name="Name"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxPhone" PropertyName="Text" Name="Phone"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxEmail" PropertyName="Text" Name="Email"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxWebAddress" PropertyName="Text" Name="WebAddress"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
