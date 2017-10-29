<%@ Page Title="Калкулатор" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Diplomna.Calculator" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
	<h1><%: Title %></h1>
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
		<ajaxToolkit:Accordion ID="Accordion1" runat="server" AutoSize="Limit" SelectedIndex="0" Height="450" FadeTransitions="true" TransitionDuration="500" FramesPerSecond="50" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent">
			<Panes>
				<ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
					<Header>Автомобил</Header>
					<Content>
						<table border="0" style="width: 350px;">
						    <tr>
							    <td><p>Марка</p></td>
							    <td><asp:DropDownList ID="DropDownListBrand" CssClass="DropDown" runat="server"></asp:DropDownList>
                                    <ajaxToolkit:CascadingDropDown ID="CDD1" runat="server"
                                    TargetControlID="DropDownListBrand"
                                    Category="Brands"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetBrands"/>
							    </td>
						    </tr>
						    <tr>
							    <td><p>Модел</p></td>
							    <td><asp:DropDownList ID="DropDownListModel" CssClass="DropDown" runat="server"></asp:DropDownList>
                                    <ajaxToolkit:CascadingDropDown ID="CDD2" runat="server"
                                    TargetControlID="DropDownListModel"
                                    Category="Models"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetModels"
                                    ParentControlID="DropDownListBrand"/>
							    </td>
						    </tr>
						    <tr>
							    <td><p>Година на производство</p></td>
							    <td><asp:DropDownList ID="DropDownListYear" CssClass="DropDown" runat="server"></asp:DropDownList>
                                    <ajaxToolkit:CascadingDropDown ID="CDD3" runat="server"
                                    TargetControlID="DropDownListYear"
                                    Category="Years"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetYears"
                                    ParentControlID="DropDownListModel"/>
							    </td>
						    </tr>
                            <tr>
								<td><p>Гориво</p></td>
								<td><asp:DropDownList ID="DropDownListFuel" CssClass="DropDown" runat="server"></asp:DropDownList>
                                    <ajaxToolkit:CascadingDropDown ID="CDD4" runat="server"
                                    TargetControlID="DropDownListFuel"
                                    Category="Fuel"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetFuel"
                                    ParentControlID="DropDownListYear"/>
								</td>
							</tr>
                            <tr>
								<td><p>Обем на двигател</p></td>
								<td><asp:DropDownList ID="DropDownListVolume" CssClass="DropDown" runat="server"></asp:DropDownList> <p>куб. см.</p>
                                    <ajaxToolkit:CascadingDropDown ID="CDD5" runat="server"
                                    TargetControlID="DropDownListVolume"
                                    Category="Volume"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetVolume"
                                    ParentControlID="DropDownListFuel"/>
								</td>
							</tr>
							<tr>
								<td><p>Мощност</p></td>
								<td><asp:DropDownList ID="DropDownListPower" CssClass="DropDown" runat="server"></asp:DropDownList> <p>к.с.</p>
                                    <ajaxToolkit:CascadingDropDown ID="CDD6" runat="server"
                                    TargetControlID="DropDownListPower"
                                    Category="Power"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetPower"
                                    ParentControlID="DropDownListVolume"/>
								</td>
							</tr>	
                            <tr>
                                <td><p>Брой врати</p></td>
                                <td>
                                    <asp:DropDownList ID="DropDownListDoors" CssClass="DropDown" runat="server"></asp:DropDownList>
                                    <ajaxToolkit:CascadingDropDown ID="CDD7" runat="server"
                                    TargetControlID="DropDownListDoors"
                                    Category="Doors"
                                    LoadingText="[Зареждане...]"
                                    ServicePath="~/Services/Calculator.asmx"
                                    ServiceMethod="GetDoors"
                                    ParentControlID="DropDownListPower"/>
                                </td>
                            </tr>					
						</table>
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
                        <asp:CheckBoxList ID="CheckBoxListRisks" runat="server" Font-Size="Small" DataSourceID="SqlDataSourceRisk" DataTextField="Name" DataValueField="ID"></asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSourceRisk" runat="server" ConnectionString='<%$ ConnectionStrings:DiplomnaConnectionString %>' SelectCommand="SELECT [ID], [Name] FROM [Risk] WHERE ([Status] =1)"></asp:SqlDataSource>
					</Content>
				</ajaxToolkit:AccordionPane>
			</Panes>
            
		</ajaxToolkit:Accordion>
		<br />
		<asp:Button ID="Button1" runat="server" Text="Изчисли" CssClass="Button" OnClick="Button1_Click" />
		
		
		
		
		
    
    
	
	
		
		
    
</asp:Content>