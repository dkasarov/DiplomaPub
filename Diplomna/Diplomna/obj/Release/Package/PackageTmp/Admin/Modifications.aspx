<%@ Page Title="Модификации" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modifications.aspx.cs" Inherits="Diplomna.Admin.Models" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" NavigateUrl="~/Admin/Default.aspx">Админ панел</asp:HyperLink> 
        <p>&rarr; <%: Title %></p><br /><br />
    <div style="overflow: scroll; width: 100%; height: auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAllModif" AllowPaging="True" AllowSorting="True" DataKeyNames="ID">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:TemplateField HeaderText="Models_ID" SortExpression="Models_ID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceEditModel" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("Models_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceEditModel" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT Models.ID, Models.Name FROM Models INNER JOIN Brands ON Models.Brands_ID = Brands.ID WHERE (Models.Status = 1) ORDER BY Brands.ID"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ModelName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                <asp:BoundField DataField="EngineVolume" HeaderText="EngineVolume" SortExpression="EngineVolume"></asp:BoundField>
                <asp:BoundField DataField="EnginePower" HeaderText="EnginePower" SortExpression="EnginePower"></asp:BoundField>
                <asp:TemplateField HeaderText="EngineFuel" SortExpression="EngineFuel">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceFuel" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("EngineFuel") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fuel") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Doors" HeaderText="Doors" SortExpression="Doors"></asp:BoundField>
                <asp:BoundField DataField="ProduceFrom" HeaderText="ProduceFrom" SortExpression="ProduceFrom"></asp:BoundField>
                <asp:BoundField DataField="ProduceTo" HeaderText="ProduceTo" SortExpression="ProduceTo"></asp:BoundField>
                <asp:BoundField DataField="InsuranceValue" HeaderText="InsuranceValue" SortExpression="InsuranceValue"></asp:BoundField>
                <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:CheckBoxField>
                <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName" Visible="False" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceAllModif" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT Modifications.ID, Modifications.Models_ID, Modifications.Name, Modifications.EngineVolume, Modifications.EnginePower, Modifications.EngineFuel, Modifications.Doors, Modifications.ProduceFrom, Modifications.ProduceTo, Modifications.InsuranceValue, Modifications.Status, Models.Name AS ModelName, Fuel.Name AS Fuel FROM Modifications INNER JOIN Models ON Modifications.Models_ID = Models.ID INNER JOIN Fuel ON Modifications.EngineFuel = Fuel.ID WHERE Models.Status = 1" DeleteCommand="DELETE FROM [Modifications] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Modifications] ([Models_ID], [Name], [EngineVolume], [EnginePower], [EngineFuel], [Doors], [ProduceFrom], [ProduceTo], [InsuranceValue], [Status]) VALUES (@Models_ID, @Name, @EngineVolume, @EnginePower, @EngineFuel, @Doors, @ProduceFrom, @ProduceTo, @InsuranceValue, @Status)" UpdateCommand="UPDATE [Modifications] SET [Models_ID] = @Models_ID, [Name] = @Name, [EngineVolume] = @EngineVolume, [EnginePower] = @EnginePower, [EngineFuel] = @EngineFuel, [Doors] = @Doors, [ProduceFrom] = @ProduceFrom, [ProduceTo] = @ProduceTo, [InsuranceValue] = @InsuranceValue, [Status] = @Status WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Models_ID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="EngineVolume" Type="Int32" />
            <asp:Parameter Name="EnginePower" Type="Int32" />
            <asp:Parameter Name="EngineFuel" Type="Int32" />
            <asp:Parameter Name="Doors" Type="Byte" />
            <asp:Parameter Name="ProduceFrom" Type="Int32" />
            <asp:Parameter Name="ProduceTo" Type="Int32" />
            <asp:Parameter Name="InsuranceValue" Type="Decimal" />
            <asp:Parameter Name="Status" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Models_ID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="EngineVolume" Type="Int32" />
            <asp:Parameter Name="EnginePower" Type="Int32" />
            <asp:Parameter Name="EngineFuel" Type="Int32" />
            <asp:Parameter Name="Doors" Type="Byte" />
            <asp:Parameter Name="ProduceFrom" Type="Int32" />
            <asp:Parameter Name="ProduceTo" Type="Int32" />
            <asp:Parameter Name="InsuranceValue" Type="Decimal" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Добавяне на модификация</h3>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="White" CssClass="errorBox"></asp:Label>
        </div>
        <table border="0">
            <tr>
                <td><p>Производител</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListBrand" AutoPostBack="true" DataSourceID="SqlDataSourceBrand" runat="server" CssClass="DropDown" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceBrand" runat="server" SelectCommand="SELECT ID, Name FROM Brands WHERE (Status = 1) ORDER BY Name" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Моля, изберете производител." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" ControlToValidate="DropDownListBrand" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Модел</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListModel" AutoPostBack="true" runat="server" DataSourceID="SqlDataSourceModel" DataTextField="Name" DataValueField="ID" CssClass="DropDown"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceModel" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID, Name FROM Models WHERE (Brands_ID = @brandID) AND Status=1">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="brandID"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Моля, изберете модел." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" ControlToValidate="DropDownListModel" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Модификация</p></td>
                <td>
                    <asp:TextBox ID="TextBoxName" runat="server" CssClass="DropDown"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Моля, въведете модификация." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" ControlToValidate="TextBoxName" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Кубатура</p></td>
                <td>
                    <asp:TextBox ID="TextBoxVolume" runat="server" CssClass="DropDown" TextMode="Number"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Моля, въведете кубатура." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" Font-Bold="True" ControlToValidate="TextBoxVolume"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Мощност</p></td>
                <td>
                    <asp:TextBox ID="TextBoxPower" runat="server" CssClass="DropDown" TextMode="Number"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Моля, въведете мощност." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" Font-Bold="True" ControlToValidate="TextBoxPower"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Гориво</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListFuel" runat="server" CssClass="DropDown" DataSourceID="SqlDataSourceFuel" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceFuel" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT * FROM [Fuel]"></asp:SqlDataSource></td>
            </tr>
            <tr>
                <td><p>Брой врати</p></td>
                <td>
                    <asp:DropDownList ID="DropDownListDoors" runat="server" CssClass="DropDown">
                        <asp:ListItem Selected="True" Value="3" Text="Три"></asp:ListItem>
                        <asp:ListItem Value="5" Text="Пет"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><p>Произвеждан от (г.)</p></td>
                <td>
                    <asp:TextBox ID="TextBoxProduceFrom" runat="server" CssClass="DropDown" TextMode="Number" MaxLength="4"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Моля, въведете дата." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" Font-Bold="True" ControlToValidate="TextBoxProduceFrom"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Произвеждан до (г.)</p></td>
                <td>
                    <asp:TextBox ID="TextBoxProduceTo" runat="server" CssClass="DropDown" TextMode="Number" MaxLength="4"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Моля, въведете дата."  ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" Font-Bold="True" ControlToValidate="TextBoxProduceTo"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><p>Застрахователна стойност</p></td>
                <td>
                    <asp:TextBox ID="TextBoxInsuranceValue" runat="server" CssClass="DropDown" ></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Моля, въведете сума." ForeColor="Red" ValidationGroup="AddModif" Font-Size="Small" Font-Bold="True" ControlToValidate="TextBoxInsuranceValue"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonAddModel" OnClick="ButtonAddModel_Click1" runat="server" Text="Запис" CssClass="Button" ValidationGroup="AddModif" /></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceModification" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT ID FROM Modifications WHERE (Models_ID = @ModelID) AND (Name = @Name) AND (EngineVolume = @EngineVolume) AND (EnginePower = @EnginePower) AND (EngineFuel = @EngineFuel) AND (Doors = @Doors) AND (ProduceFrom = @ProduceFrom) AND (ProduceTo = @ProduceTo) AND (InsuranceValue = @InsuranceValue)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListModel" PropertyName="SelectedValue" Name="ModelID"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxName" PropertyName="Text" Name="Name"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxVolume" PropertyName="Text" Name="EngineVolume"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxPower" PropertyName="Text" Name="EnginePower"></asp:ControlParameter>
            <asp:ControlParameter ControlID="DropDownListFuel" PropertyName="SelectedValue" Name="EngineFuel"></asp:ControlParameter>
            <asp:ControlParameter ControlID="DropDownListDoors" PropertyName="SelectedValue" Name="Doors"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxProduceFrom" PropertyName="Text" Name="ProduceFrom"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxProduceTo" PropertyName="Text" Name="ProduceTo"></asp:ControlParameter>
            <asp:ControlParameter ControlID="TextBoxInsuranceValue" PropertyName="Text" Name="InsuranceValue"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
