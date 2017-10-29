<%@ Page Title="Тарифни числа" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TariffNumbers.aspx.cs" Inherits="Diplomna.Admin.TariffNumbers" UnobtrusiveValidationMode="None"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAllNumbers">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllNumbers" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT TypeInsurance.Name, TariffNumbers.Value FROM TariffNumbers INNER JOIN TypeInsurance ON TariffNumbers.TypeInsurance_ID = TypeInsurance.ID WHERE (TypeInsurance.Status = 1) AND (TariffNumbers.Companies_ID = @CompanyID)" DeleteCommand="DELETE FROM [TariffNumbers] WHERE [Companies_ID] = @Companies_ID AND [TypeInsurance_ID] = @TypeInsurance_ID" InsertCommand="INSERT INTO [TariffNumbers] ([Companies_ID], [TypeInsurance_ID], [Value]) VALUES (@Companies_ID, @TypeInsurance_ID, @Value)" UpdateCommand="UPDATE [TariffNumbers] SET [Value] = @Value WHERE [Companies_ID] = @Companies_ID AND [TypeInsurance_ID] = @TypeInsurance_ID">
        <DeleteParameters>
            <asp:Parameter Name="Companies_ID" Type="Int32" />
            <asp:Parameter Name="TypeInsurance_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Companies_ID" Type="Int32" />
            <asp:Parameter Name="TypeInsurance_ID" Type="Int32" />
            <asp:Parameter Name="Value" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CompanyID" SessionField="CompanyID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Value" Type="Double" />
            <asp:Parameter Name="Companies_ID" Type="Int32" />
            <asp:Parameter Name="TypeInsurance_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на тарифни числа</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Клауза</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListTypeInsurance" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourceTypeInsurance" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceTypeInsurance" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID, Name FROM TypeInsurance WHERE (Status = 1) AND (ID NOT IN (SELECT TypeInsurance_ID FROM TariffNumbers WHERE (Companies_ID = @CompanyID)))">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="CompanyID" Name="CompanyID"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, изберете клауза." Font-Bold="True" ValidationGroup="AddTariffNumber" Font-Size="Small" ForeColor="Red" ControlToValidate="DropDownListTypeInsurance"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Число</p></td>
                <td>
                    <asp:TextBox ID="TextBoxValue" runat="server" TextMode="Number" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Моля, попълнете число" Font-Bold="True" ValidationGroup="AddTariffNumber" Font-Size="Small" ForeColor="Red" ControlToValidate="TextBoxValue"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddTariffNumber" runat="server" Text="Запис" ValidationGroup="AddTariffNumber" CssClass="Button" OnClick="ButtonAddTariffNumber_Click"/></td>
                <td></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceTariffNumbers" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT MinNumber, MaxNumber FROM TypeInsurance WHERE (ID = @TypeInsurance)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListTypeInsurance" Name="TypeInsurance" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCheckTariff" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT TariffNumbers.Companies_ID FROM TariffNumbers INNER JOIN Companies ON TariffNumbers.Companies_ID = Companies.ID WHERE (TariffNumbers.Companies_ID = @CompanyID) AND (TariffNumbers.TypeInsurance_ID = @TypeInsurance) AND (Companies.Status = 1)">
        <SelectParameters>
            <asp:SessionParameter SessionField="CompanyID" Name="CompanyID"></asp:SessionParameter>
            <asp:ControlParameter ControlID="DropDownListTypeInsurance" PropertyName="SelectedValue" Name="TypeInsurance"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
