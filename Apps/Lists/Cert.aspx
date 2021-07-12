<%@ Page Language="C#" MasterPageFile="~/Apps/PolstMaster.master" AutoEventWireup="true" CodeBehind="Cert.aspx.cs" Inherits="PolstWebApp.Apps.Lists.Cert" title="POLST, Manage Cert List" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
            
		   function refreshGrid(arg)
            {
             if(!arg)
             {
             $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");             
                }
                else
                {
             $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");             
                }
            }
            
			
 </script> 
 
 
 <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting> 
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblMessage" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    </AjaxSettings>
            </telerik:RadAjaxManager>



 

      
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">POLST Manage Cert List</div>
 <table style="margin-top: 0px">
 
 <tr>
 <td colspan="2" align="center">
<div style="padding-top:5px; padding-bottom: 5px;" align="center"><asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false" Visible="false"></asp:Label></div>

      <telerik:RadGrid ID="RadGrid1" Skin="Vista" GridLines="None" runat="server" DataSourceID="ods1"
            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" Width="900px" AllowSorting="true"
            AllowAutomaticUpdates="True" AllowPaging="True" 
         AutoGenerateColumns="False">
            <PagerStyle Mode="NextPrevAndNumeric" />
            <AlternatingItemStyle BackColor="#DCE2F3" />
            <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="Id" DataSourceID="ods1" OverrideDataSourceControlSorting="true"
                HorizontalAlign="NotSet" AutoGenerateColumns="False" EditMode="InPlace" >
                <RowIndicatorColumn Visible="False">
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn Resizable="False" Visible="False">
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" 
                        EditImageUrl="../../Images/edit.gif" InsertImageUrl="../../Images/insert.gif" 
                        UniqueName="EditCommandColumn">
                        <ItemStyle CssClass="MyImageButton" Width="30px" />
                    </telerik:GridEditCommandColumn>
                  
                    <telerik:GridBoundColumn DataField="Id" HeaderText="CertID" ReadOnly="True" 
                        SortExpression="Id" UniqueName="CertID" Visible="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Name" 
                        SortExpression="Name" UniqueName="Name">
                        <HeaderStyle Width="700px" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTitle" runat="server" MaxLength="150" 
                                Text='<%# Bind("Name")%>' Width="600px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                                ControlToValidate="txtTitle" Display="Dynamic" 
                                ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridCheckBoxColumn DataField="Active" AllowSorting="true" AllowFiltering="false" HeaderText="Active"  HeaderStyle-HorizontalAlign="Center" DefaultInsertValue="true"></telerik:GridCheckBoxColumn>
                      <telerik:GridTemplateColumn HeaderText="Display Order" SortExpression="DisplayOrder"
                        UniqueName="DisplayOrderName">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" Text='<%# Eval("DisplayOrder")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDisplayOrder" runat="server" Width="50px" Text='<%# Bind("DisplayOrder")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDisplayOrder" Display="Dynamic" ControlToValidate="txtDisplayOrder" runat="server" ForeColor="Red" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvDisplayOrder" Display="Dynamic" ControlToValidate="txtDisplayOrder" runat="server" ForeColor="Red" ErrorMessage="Must be a number" MinimumValue="0" MaximumValue="1000" Type="Integer"></asp:RangeValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                      
                
                </Columns>
                <EditFormSettings>
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>
                   
                    <PopUpSettings ScrollBars="None" />
                </EditFormSettings>
               
            </MasterTableView>
        </telerik:RadGrid>
   
 </td>
 </tr>
</table>
</asp:Panel>
  <asp:ObjectDataSource ID="ods1" runat="server" 
        DataObjectTypeName="Polst.Model.Cert" InsertMethod="UpsertCert" 
        SelectMethod="GetCerts" TypeName="Polst.BusinessLogic.CertProvider" 
        UpdateMethod="UpsertCert"></asp:ObjectDataSource> 
</asp:Content>



