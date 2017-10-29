<%@ Page Title="Администратори от ЗК" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admins.aspx.cs" Inherits="Diplomna.Admin.Admins" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <div style="height: auto; width: 100%; overflow: auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAllCompanies" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/images/cancel-24.png" EditImageUrl="~/images/edit-24.png" UpdateImageUrl="~/images/available-updates-24.png" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" ReadOnly="True">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
                </asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" ReadOnly="True" Visible="false"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Bold="True" Font-Size="Small" />
                </asp:BoundField>
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" ReadOnly="true" Visible="false"></asp:BoundField>
                <asp:CheckBoxField DataField="Status" HeaderText="Статус" SortExpression="Status">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
                </asp:CheckBoxField>
                <asp:BoundField DataField="FirstName" HeaderText="Име" SortExpression="FirstName" ReadOnly="True">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Bold="True" Font-Size="Small" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Фамилия" SortExpression="LastName" ReadOnly="True">
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Bold="True" Font-Size="Small" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Компания" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCompanies" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("Companies_ID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" Font-Size="Small" />
                    <ItemStyle Font-Size="Small" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllCompanies" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT Users.ID, Users.Username, Users.Password, Users.Email, Users.Type, Users.Status, Users.FirstName, Users.LastName, Users.Companies_ID, Companies.Name AS Name FROM Companies INNER JOIN Users ON Companies.ID = Users.Companies_ID" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users] ([Username], [Password], [Email], [Type], [Status], [FirstName], [LastName], [Companies_ID]) VALUES (@Username, @Password, @Email, @Type, @Status, @FirstName, @LastName, @Companies_ID)" UpdateCommand="UPDATE [Users] SET [Status] = @Status, [Companies_ID] = @Companies_ID WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Type" Type="Int32" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Companies_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Type" Type="Int32" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="Companies_ID" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на администратор</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Username</p></td>
                <td>
                    <asp:TextBox ID="TextBoxUsername" MaxLength="20" CssClass="DropDown" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете username." ValidationGroup="AddUser" ControlToValidate="TextBoxUsername" ForeColor="Red" Font-Size="Small" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Парола</p></td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Моля, въведете парола." ForeColor="Red" ValidationGroup="AddUser" Font-Size="Small" ControlToValidate="TextBoxPassword" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Повтори паролата</p></td>
                <td>
                    <asp:TextBox ID="TextBoxPasswordRepeat" CssClass="DropDown" TextMode="Password" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ErrorMessage="Моля, въведете парола." ForeColor="Red" ValidationGroup="AddUser" Font-Size="Small" ControlToValidate="TextBoxPasswordRepeat" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Email</p></td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" CssClass="DropDown" MaxLength="50" TextMode="Email" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="Моля, въведете email." ForeColor="Red" ValidationGroup="AddUser" Font-Size="Small" ControlToValidate="TextBoxEmail" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Име</p></td>
                <td>
                    <asp:TextBox ID="TextBoxFirstName" CssClass="DropDown" MaxLength="30" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ErrorMessage="Моля, въведете име." ForeColor="Red" ValidationGroup="AddUser" Font-Size="Small" ControlToValidate="TextBoxFirstName" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Фамилия</p></td>
                <td>
                    <asp:TextBox ID="TextBoxLastName" CssClass="DropDown" MaxLength="30" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ErrorMessage="Моля, въведете фамилия." ForeColor="Red" ValidationGroup="AddUser" Font-Size="Small" ControlToValidate="TextBoxLastName" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Компания</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListCompany" runat="server" CssClass="DropDown" DataSourceID="SqlDataSourceCompanies" DataTextField="Name" DataValueField="ID"></asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSourceCompanies" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID, Name FROM Companies"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="ButtonAdduser" ValidationGroup="AddUser" runat="server" Text="Запис" CssClass="Button" OnClick="ButtonAdduser_Click"/></td>
                <td></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID FROM Users WHERE (Username = @Username)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxUsername" PropertyName="Text" Name="Username"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
