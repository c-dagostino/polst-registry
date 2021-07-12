<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" validaterequest="false" inherits="Apps_Lists_MedicUnit, App_Web_exvb2sii" title="POLST, Manage Medic Unit List" theme="Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="../Scripts/jquery-1.4.4.min.js"></script>
<script language="javascript" type="text/javascript">

    function refreshGrid(arg) {
        if (!arg) {
            $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
             }
             else {
                 $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
             }
         }

 </script> 
 
 
 <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" EnableEmbeddedScripts="true">
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
 <div style="width: 940px" class="fmHead">POLST Manage Medic Units</div>
 <table style="margin-top: 0px">
 
 <tr>
 <td colspan="2" align="center">
<div style="padding-top:5px; padding-bottom: 5px;" align="center"><asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false" Visible="false"></asp:Label></div>

      <telerik:RadGrid ID="RadGrid1" Skin="Vista" AllowAutomaticDeletes="False" AllowPaging="True" OnItemInserted="RadGrid1_ItemInserted" 
            AllowAutomaticInserts="False" AllowAutomaticUpdates="False" AllowSorting="true" EnableLinqExpressions="false" AllowFilteringByColumn="true" 
                runat="server" Width="900px" OnItemCommand="RadGrid1_ItemCommand" OnUpdateCommand="RadGrid1_UpdateCommand"
            GridLines="None" >
            <PagerStyle Mode="NextPrevAndNumeric" />
            <FilterItemStyle HorizontalAlign="Left" />
            <AlternatingItemStyle BackColor="#DCE2F3" />
                        <MasterTableView DataKeyNames="Id" Width="100%" CommandItemDisplay="Top" OverrideDataSourceControlSorting="true"
                AutoGenerateColumns="false">
                <EditFormSettings EditColumn-HeaderStyle-HorizontalAlign="Right" FormMainTableStyle-HorizontalAlign="Left" EditColumn-ButtonType="PushButton">
                <EditColumn UniqueName="EditCommandColumn1">
                <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                </EditColumn>

                <PopUpSettings ScrollBars="None"></PopUpSettings>
                                </EditFormSettings>
                <RowIndicatorColumn Visible="False">
                <HeaderStyle Width="20px"></HeaderStyle>
                </RowIndicatorColumn>

                <ExpandCollapseColumn Visible="False" Resizable="False">
                <HeaderStyle Width="20px"></HeaderStyle>
                </ExpandCollapseColumn>
                <Columns>
                    
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" 
                        EditImageUrl="../../Images/edit.gif" InsertImageUrl="../../Images/insert.gif" 
                        UniqueName="EditCommandColumn">
                        <ItemStyle CssClass="MyImageButton" Width="30px" />
                    </telerik:GridEditCommandColumn>
                   
                    <telerik:GridTemplateColumn HeaderText="Medic Unit" SortExpression="Name" DataField="Name"
                        UniqueName="Name">
                       <HeaderStyle Width="700px" />
                       <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Width="600px" MaxLength="150" Text='<%# Bind("Name")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" Display="Dynamic" ControlToValidate="txtName" runat="server" ForeColor="Red" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn HeaderText="Phone" SortExpression="Phone" DataField="Phone"
                        UniqueName="Phone">
                        <ItemStyle HorizontalAlign="Center" />
                         
                        <ItemTemplate>
                             <telerik:RadMaskedTextBox ID="txtPhoneNumber" Runat="server" style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
                            Mask="(###)-###-####" Text='<%# Bind("Phone")%>' Enabled="false" ></telerik:RadMaskedTextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                          <div align="left">
                            <telerik:RadMaskedTextBox ID="txtPhoneNumber" Runat="server" style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
                            Mask="(###)-###-####" Text='<%# Bind("Phone")%>' ></telerik:RadMaskedTextBox>
                         </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                     
                    <telerik:GridTemplateColumn HeaderText="Address" 
                        SortExpression="Address" UniqueName="Address" Visible="false" AllowFiltering="false">
                        <HeaderStyle Width="700px" />
                        <ItemStyle HorizontalAlign="Left" />
                       
                        <EditItemTemplate>
                        <div align="left">
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" 
                                Text='<%# Bind("Address")%>' Width="600px"></asp:TextBox>
                             <%--<asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ControlToValidate="txtAddress" Display="Dynamic" 
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                       </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                                      
                    <telerik:GridTemplateColumn HeaderText="City" DataField="City"
                        SortExpression="City" UniqueName="City">
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                         <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City")%>'></asp:Label>
                        </ItemTemplate>     
                        <EditItemTemplate>
                        <div align="left">
                            <asp:TextBox ID="txtCity" runat="server" MaxLength="150" 
                                Text='<%# Bind("City")%>' Width="300px"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                ControlToValidate="txtCity" Display="Dynamic" 
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                     <telerik:GridTemplateColumn HeaderText="State" DataField="StateId" SortExpression="StateId" AllowFiltering="true"
                      UniqueName="State">
                        <HeaderStyle VerticalAlign="Top"  />
                    
                       
                         <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("StateID")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        <div align="left">
                           <asp:DropDownList ID="ddlState" runat="server" DataSourceID="odsState" DataTextField="Name" DataValueField="Id" SelectedValue='<%# GetDDLStateSelectedItem(Eval("StateID"))%>'  OnDataBound="DropDownList_DataBound" CssClass="gridText"></asp:DropDownList><br />
                          <%-- <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                                ControlToValidate="ddlState" Display="Dynamic" 
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                              </div>    
                        </EditItemTemplate>
                       
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="Zip"  Visible="false" DataField="Zip"
                        SortExpression="Zip" UniqueName="Zip" AllowFiltering="false">
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />    
                        <EditItemTemplate>
                        <div align="left">
                            <asp:TextBox ID="txtZip" runat="server" MaxLength="5" 
                                Text='<%# Bind("Zip")%>' Width="75px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExVal" runat="server" 
                    ControlToValidate="txtZip" ErrorMessage="This is not a valid Zip Code" 
                    ValidationExpression="\d{5}(-\d{4})?" >*</asp:RegularExpressionValidator>
                           <%-- <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                                ControlToValidate="txtZip" Display="Dynamic" 
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    </div>
                        </EditItemTemplate>
                        
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="County"  Visible="false" DataField="CountyId"
                      UniqueName="County" AllowFiltering="false" >
                        <HeaderStyle VerticalAlign="Top"  />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                       
                        <EditItemTemplate>
                        <div align="left">
                           <asp:DropDownList ID="ddlCounty" runat="server" DataSourceID="odsCounty" DataTextField="Name" DataValueField="Id" SelectedValue='<%# GetDDLCountySelectedItem(Eval("CountyID"))%>'  OnDataBound="DropDownList_DataBound" CssClass="gridText"></asp:DropDownList><br />
                            
                              </div>    
                        </EditItemTemplate>
                       
                    </telerik:GridTemplateColumn>

                   <telerik:GridTemplateColumn HeaderText="Active"  Visible="true" DataField="Active" DefaultInsertValue="True" 
                        SortExpression="Active" UniqueName="Active">
                        <ItemTemplate>
                            <asp:checkbox ID="chkActive2" runat="server" checked='<%# Bind("Active")%>' Enabled="false" />
                        </ItemTemplate>
                        <EditItemTemplate>
                        <div align="left">
                          <asp:checkbox ID="chkActive" runat="server" checked='<%# Bind("Active")%>' />  
                        </div>
                        </EditItemTemplate>
                        
                    </telerik:GridTemplateColumn>
                    
                </Columns>
               
            </MasterTableView>
        </telerik:RadGrid>
 
 </td>
 </tr>
</table>
</asp:Panel>

 
    <asp:ObjectDataSource ID="ods1" runat="server" 
        DataObjectTypeName="Polst.Model.MedicUnit" InsertMethod="UpsertMedicUnit" 
        SelectMethod="GetMedicUnits" TypeName="Polst.BusinessLogic.MedicUnitProvider" 
        UpdateMethod="UpsertMedicUnit"></asp:ObjectDataSource> 
        <asp:ObjectDataSource ID="odsCounty" runat="server" 
        DataObjectTypeName="Polst.Model.County" 
        SelectMethod="GetCounties" TypeName="Polst.BusinessLogic.CountyProvider"></asp:ObjectDataSource>
     <asp:ObjectDataSource ID="odsState" runat="server" 
        DataObjectTypeName="Polst.Model.State" 
        SelectMethod="GetStates" TypeName="Polst.BusinessLogic.StateProvider"></asp:ObjectDataSource>

   </asp:Content>


