<%@ Page Title="Калкулатор" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Diplomna.Calculator" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
	<h1><%: Title %></h1>
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	
		<ajaxToolkit:Accordion ID="Accordion1" runat="server" AutoSize="Limit" SelectedIndex="0" Height="450" FadeTransitions="true" TransitionDuration="500" FramesPerSecond="50" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent">
			<Panes>
				<ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
					<Header>Автомобил</Header>
					<Content>
						<table border="0" style="width: 400px;">
						    <tr>
							    <td><p>Марка</p></td>
							    <td><asp:DropDownList ID="DropDownListBrand" AutoPostBack="true" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourceBrand" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
						    </tr>
						    <tr>
							    <td><p>Модел</p></td>
							    <td><asp:DropDownList ID="DropDownListModel" AutoPostBack="true" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourceModel" DataTextField="Name" DataValueField="Name"></asp:DropDownList></td>
						    </tr>
						    <tr>
							    <td><p>Година на производство</p></td>
							    <td><asp:DropDownList ID="DropDownListYear" AutoPostBack="true" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourceYear" DataValueField="ProduceFrom" DataTextField="BothColumns"></asp:DropDownList></td>
						    </tr>
                            <tr>
								<td><p>Гориво</p></td>
								<td><asp:DropDownList ID="DropDownListFuel" AutoPostBack="true" DataSourceID="SqlDataSourceFuel" CssClass="DropDown" runat="server" DataTextField="EngineFuel" DataValueField="EngineFuel"></asp:DropDownList></td>
							</tr>
                            <tr>
								<td><p>Обем на двигател</p></td>
								<td><asp:DropDownList ID="DropDownListVolume" AutoPostBack="true" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourceVolume" DataTextField="EngineVolume" DataValueField="EngineVolume"></asp:DropDownList> <p>куб. см.</p></td>
							</tr>
							<tr>
								<td><p>Мощност</p></td>
								<td><asp:DropDownList ID="DropDownListPower" AutoPostBack="true" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourcePower" DataTextField="EnginePower" DataValueField="EnginePower"></asp:DropDownList> <p>к.с.</p></td>
							</tr>	
                            <tr>
                                <td><p>Брой врати</p></td>
                                <td>
                                    <asp:DropDownList ID="DropDownListDoors" AutoPostBack="true" CssClass="DropDown" runat="server" DataSourceID="SqlDataSourceDoors" DataTextField="Doors" DataValueField="ID"></asp:DropDownList></td>
                            </tr>					
						</table>

                        <asp:SqlDataSource ID="SqlDataSourceBrand" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT DISTINCT Brands.ID, Brands.Name FROM Brands INNER JOIN Models ON Models.Brands_ID = Brands.ID WHERE (Models.InsuranceValue IS NOT NULL)"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceModel" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT DISTINCT Name FROM Models WHERE (Brands_ID = @Brand_ID) AND (InsuranceValue IS NOT NULL)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListBrand" Name="Brand_ID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceYear" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT DISTINCT CONVERT (varchar(MAX), ProduceFrom, 120) AS ProduceFrom, CONCAT(ProduceFrom, ' - ', ProduceTo) AS BothColumns FROM Models WHERE (Name = @ModelName) AND (Brands_ID = @Brand_ID2) AND (InsuranceValue IS NOT NULL)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListModel" Name="ModelName" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="Brand_ID2"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceFuel" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT DISTINCT EngineFuel FROM Models WHERE (Name = @ModelNamethree) AND (ProduceFrom = @ProduceFromthree) AND (Brands_ID = @Brand_IDthree) AND (InsuranceValue IS NOT NULL)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListModel" PropertyName="SelectedValue" Name="ModelNamethree"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListYear" PropertyName="SelectedValue" Name="ProduceFromthree"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="Brand_IDthree"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceVolume" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT DISTINCT EngineVolume FROM Models WHERE (Brands_ID = @BrandID) AND (Name = @ModelName) AND (ProduceFrom = @ProduceFrom) AND (EngineFuel = @EngineFuel) AND (InsuranceValue IS NOT NULL)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="BrandID"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListModel" PropertyName="SelectedValue" Name="ModelName"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListYear" PropertyName="SelectedValue" Name="ProduceFrom"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListFuel" PropertyName="SelectedValue" Name="EngineFuel"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourcePower" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT DISTINCT ID, EnginePower FROM Models WHERE (Brands_ID = @BrandID) AND (Name = @ModelName) AND (ProduceFrom = @ProduceFrom) AND (EngineFuel = @EngineFuel) AND (EngineVolume = @EngineVolume) AND (InsuranceValue IS NOT NULL)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="BrandID"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListModel" PropertyName="SelectedValue" Name="ModelName"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListYear" PropertyName="SelectedValue" Name="ProduceFrom"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListFuel" PropertyName="SelectedValue" Name="EngineFuel"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListVolume" PropertyName="SelectedValue" Name="EngineVolume"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceDoors" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT DISTINCT ID, Doors FROM Models WHERE (Brands_ID = @BrandID) AND (Name = @ModelName) AND (ProduceFrom = @ProduceFrom) AND (EngineFuel = @EngineFuel) AND (EngineVolume = @EngineVolume) AND (InsuranceValue IS NOT NULL)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListBrand" PropertyName="SelectedValue" Name="BrandID"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListModel" PropertyName="SelectedValue" Name="ModelName"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListYear" PropertyName="SelectedValue" Name="ProduceFrom"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListFuel" PropertyName="SelectedValue" Name="EngineFuel"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownListVolume" PropertyName="SelectedValue" Name="EngineVolume"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
					</Content>
				</ajaxToolkit:AccordionPane>
				<ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
					<Header>Клауза</Header>
					<Content>                        
						<asp:RadioButtonList ID="RadioButtonListClause" runat="server" Font-Size="Small" DataSourceID="SqlDataSourceClause" DataValueField="ID" DataTextField="Name">
						</asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSourceClause" runat="server" ConnectionString="<%$ ConnectionStrings:DiplomnaConnectionString %>" SelectCommand="SELECT ID, Name FROM TypeInsurance WHERE (Status = 1)"></asp:SqlDataSource>
					</Content>
				</ajaxToolkit:AccordionPane>
				<ajaxToolkit:AccordionPane ID="AccordionPane4" runat="server">
					<Header>Допълнителни покрития</Header>
					<Content>
						<asp:CheckBox ID="CheckBox1" runat="server" Text="Аудио" Font-Size="Small" /><br />
						<asp:CheckBox ID="CheckBox2" runat="server" Text="Механична повреда" Font-Size="Small" /><br />
						<asp:CheckBox ID="CheckBox3" runat="server" Text="Застраховка в чужбина" Font-Size="Small" />
					</Content>
				</ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane5" runat="server">
                    <Header>Отстъпки</Header>
                    <Content>

                    </Content>
                </ajaxToolkit:AccordionPane>
			</Panes>
            
		</ajaxToolkit:Accordion>
		<br />
		<asp:Button ID="Button1" runat="server" Text="Изчисли" CssClass="Button" OnClick="Button1_Click" />
		
		
		
		
		
    
    
	
	
		
		
    
</asp:Content>