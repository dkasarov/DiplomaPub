<%@ Page Title="Рискове" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Increases.aspx.cs" Inherits="Diplomna.Admin.Increases" UnobtrusiveValidationMode="None"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Companies_ID,Risk_ID" DataSourceID="SqlDataSourceIncreases" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/images/cancel-24.png" EditImageUrl="~/images/edit-24.png" UpdateImageUrl="~/images/available-updates-24.png" />
            <asp:BoundField DataField="Companies_ID" HeaderText="Companies_ID" ReadOnly="True" SortExpression="Companies_ID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="Risk_ID" HeaderText="Risk_ID" ReadOnly="True" SortExpression="Risk_ID" Visible="False"></asp:BoundField>

            <asp:BoundField DataField="Name" HeaderText="Риск" SortExpression="Name" ReadOnly="True">
            <HeaderStyle Font-Bold="True" Font-Size="Small" />
            <ItemStyle Font-Size="Small" />
            </asp:BoundField>

            <asp:BoundField DataField="Value" HeaderText="Стойност" SortExpression="Value">
            <HeaderStyle Font-Bold="True" Font-Size="Small" />
            <ItemStyle Font-Size="Small" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Вид риск" SortExpression="PosNeg">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListPosNeg" runat="server" SelectedValue='<%# Bind("PosNeg") %>'>
                        <asp:ListItem Value="+">Завишение</asp:ListItem>
                        <asp:ListItem Value="-">Отстъпка</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PosNeg") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Тип стойност" SortExpression="TypeValue">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListTypeValue" runat="server" SelectedValue='<%# Bind("TypeValue") %>'>
                        <asp:ListItem Value="P">Процент</asp:ListItem>
                        <asp:ListItem Value="N">Число</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TypeValue") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" Font-Size="Small" />
                <ItemStyle Font-Size="Small" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceIncreases" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' DeleteCommand="DELETE FROM [Increases] WHERE [Companies_ID] = @Companies_ID AND [Risk_ID] = @Risk_ID" InsertCommand="INSERT INTO [Increases] ([Companies_ID], [Risk_ID], [Value], [PosNeg], [TypeValue]) VALUES (@Companies_ID, @Risk_ID, @Value, @PosNeg, @TypeValue)" SelectCommand="SELECT Increases.Companies_ID, Increases.Risk_ID, Increases.Value, Increases.PosNeg, Increases.TypeValue, Risk.Name FROM Increases INNER JOIN Risk ON Increases.Risk_ID = Risk.ID WHERE (Risk.Status = 1) AND (Increases.Companies_ID = @CompanyID)" UpdateCommand="UPDATE [Increases] SET [Value] = @Value, [PosNeg] = @PosNeg, [TypeValue] = @TypeValue WHERE [Companies_ID] = @Companies_ID AND [Risk_ID] = @Risk_ID">
        <DeleteParameters>
            <asp:Parameter Name="Companies_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Risk_ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Companies_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Risk_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Value" Type="Double"></asp:Parameter>
            <asp:Parameter Name="PosNeg" Type="String"></asp:Parameter>
            <asp:Parameter Name="TypeValue" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter SessionField="CompanyID" Name="CompanyID"></asp:SessionParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Value" Type="Double"></asp:Parameter>
            <asp:Parameter Name="PosNeg" Type="String"></asp:Parameter>
            <asp:Parameter Name="TypeValue" Type="String"></asp:Parameter>
            <asp:Parameter Name="Companies_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Risk_ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3><%: Title %></h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Риск</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListRisk" runat="server" DataSourceID="SqlDataSourceRisks" DataTextField="Name" DataValueField="ID" CssClass="DropDown"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceRisks" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID, Name FROM Risk WHERE (Status = 1) AND (ID NOT IN (SELECT Risk_ID FROM Increases AS Increases_1 WHERE (Companies_ID = @CompanyID))) ORDER BY Name">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyID" Name="CompanyID"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Моля, изберете риск." Font-Bold="True" ValidationGroup="AddIncrease" Font-Size="Small" ForeColor="Red" ControlToValidate="DropDownListRisk"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Стойност</p></td>
                <td>
                    <asp:TextBox ID="TextBoxValue" runat="server" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете стойност." Font-Bold="True" ValidationGroup="AddIncrease" Font-Size="Small" ForeColor="Red" ControlToValidate="TextBoxValue"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Вид риск</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListPosNeg" runat="server" CssClass="DropDown">
                        <asp:ListItem Value="+">Завишение</asp:ListItem>
                        <asp:ListItem Value="-">Отстъпка</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td><p>Тип стойност</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListTypeValue" runat="server" CssClass="DropDown">
                        <asp:ListItem Value="P">Процент</asp:ListItem>
                        <asp:ListItem Value="N">Число</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddIncrease" ValidationGroup="AddIncrease" runat="server" Text="Запис" CssClass="Button" OnClick="ButtonAddIncrease_Click"/></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCheckIncrease" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT Increases.Companies_ID FROM Increases INNER JOIN Companies ON Increases.Companies_ID = Companies.ID WHERE (Increases.Risk_ID = @RiskID) AND (Increases.Companies_ID = @CompanyID) AND (Companies.Status = 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListRisk" PropertyName="SelectedValue" Name="RiskID"></asp:ControlParameter>
            <asp:SessionParameter SessionField="CompanyID" Name="CompanyID"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
