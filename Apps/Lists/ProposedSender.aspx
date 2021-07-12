<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Lists_ProposedSender, App_Web_exvb2sii" title="POLST, Manage Proposed Sender List" theme="Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
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
 <div style="width: 940px" class="fmHead">POLST Manage Form Senders</div>
 <table style="margin-top: 0px">
 
 <tr>
 <td colspan="2" align="center" style="padding-top: 15px">
 <div align="center"><asp:Label ID="lblMessage" runat="server" Visible="false" EnableViewState="false" CssClass="validation"></asp:Label></div> 
        
        
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Height="75px" Width="75px" Transparency="10">
            <img alt="Loading..." src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' style="border:0;" />
        </telerik:RadAjaxLoadingPanel>
      
        <telerik:RadGrid ID="RadGrid1" Skin="Vista" AllowAutomaticDeletes="False" AllowPaging="True" OnItemInserted="RadGrid1_ItemInserted" 
            AllowAutomaticInserts="False" AllowAutomaticUpdates="False" AllowSorting="true" EnableLinqExpressions="false" AllowFilteringByColumn="true" 
                runat="server" Width="900px" OnItemCommand="RadGrid1_ItemCommand" OnUpdateCommand="RadGrid1_UpdateCommand"
            GridLines="None" >
            <PagerStyle Mode="NextPrevAndNumeric" />
            <FilterItemStyle HorizontalAlign="Left" />
            <AlternatingItemStyle BackColor="#DCE2F3" />
                        <MasterTableView DataKeyNames="Id" Width="100%" CommandItemDisplay="Top"   OverrideDataSourceControlSorting="true"
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
                
                     <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" EditImageUrl="../../Images/Edit.gif" ButtonType="ImageButton">
                       
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn DataField="Id" ReadOnly="True" 
                        SortExpression="Id" UniqueName="Id" Visible="False">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="Name"  DataField="Name" 
                        SortExpression="Name" UniqueName="Name">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtName" runat="server"
                                Text='<%# Bind("Name")%>' Width="600px" MaxLength="255"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                ControlToValidate="txtName" Display="Dynamic" 
                                ErrorMessage="Name is required" ForeColor="Red" ></asp:RequiredFieldValidator>
                                    </td>
                      
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="Address1"  DataField="Address1" 
                        SortExpression="Address1" UniqueName="Address1" Visible="false">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblAddress1" runat="server" Text='<%# Eval("Address1")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtAddress1" runat="server"
                                Text='<%# Bind("Address1")%>' Width="600px" MaxLength="255"></asp:TextBox><br />
                           
                                    </td>
                                   
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    
                    <telerik:GridTemplateColumn HeaderText="Address2"  DataField="Address2" 
                        SortExpression="Address2" UniqueName="Address2" Visible="false">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblAddress2" runat="server" Text='<%# Eval("Address2")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtAddress2" runat="server"
                                Text='<%# Bind("Address2")%>' Width="600px" MaxLength="255"></asp:TextBox><br />
                           
                                    </td>
                                   
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="Phone"  DataField="Phone" 
                        SortExpression="Phone" UniqueName="Phone" Visible="false">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtPhone" runat="server"
                                Text='<%# Bind("Phone")%>' Width="150px" MaxLength="12"></asp:TextBox><br />
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                            Display="Dynamic" ErrorMessage="Phone number is invalid" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                    (I.E. 555-555-5555)
                                    </td>
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                     <telerik:GridTemplateColumn HeaderText="Ext."  DataField="Ext" 
                        SortExpression="Ext" UniqueName="Ext" Visible="false">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblExt" runat="server" Text='<%# Eval("Ext")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtExt" runat="server"
                                Text='<%# Bind("Ext")%>' Width="50px" MaxLength="10"></asp:TextBox><br />
                           
                                    </td>
                                   
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="Fax"  DataField="Fax" 
                        SortExpression="Fax" UniqueName="Fax" Visible="false">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblFax" runat="server" Text='<%# Eval("Fax")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtFax" runat="server"
                                Text='<%# Bind("Fax")%>' Width="150px" MaxLength="12"></asp:TextBox><br />
                                <asp:RegularExpressionValidator ID="revFax" runat="server" ControlToValidate="txtFax"
                            Display="Dynamic" ErrorMessage="Fax number is invalid" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                    (I.E. 555-555-5555)
                                    </td>
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    
                    <telerik:GridTemplateColumn HeaderText="City"  DataField="City" 
                        SortExpression="City" UniqueName="City" Visible="true">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtCity" runat="server"
                                Text='<%# Bind("City")%>' Width="200px" MaxLength="50"></asp:TextBox><br />
                           
                                    </td>
                                   
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    
               <telerik:GridTemplateColumn HeaderText="State" DataField="ID" SortExpression="Id"
                      UniqueName="State">
                        <HeaderStyle VerticalAlign="Top"  />
                    
                       
                         <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("StateID")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        <div align="left">
                           <asp:DropDownList ID="ddlState" runat="server" DataSourceID="odsState" DataTextField="Name" DataValueField="Id" SelectedValue='<%# GetAssignedState(Eval("StateID"))%>'  OnDataBound="DropDownList_DataBound" CssClass="gridText"></asp:DropDownList><br />
                           
                              </div>    
                        </EditItemTemplate>
                       
                    </telerik:GridTemplateColumn>
                          
                   
                     <telerik:GridTemplateColumn HeaderText="Zip"  DataField="Zip" 
                        SortExpression="Zip" UniqueName="Zip" Visible="false">
                        
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblZip" runat="server" Text='<%# Eval("Zip")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtZip" runat="server"
                                Text='<%# Bind("Zip")%>' Width="50px" MaxLength="5"></asp:TextBox><br />
                                <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="txtZip"
                            Display="Dynamic" ErrorMessage="The Zip is invalid" Text="*" ValidationExpression="\d{5}(-\d{4})?" ></asp:RegularExpressionValidator>
                                    </td>
                                   
                                </tr>
                            </table>
                            
                           
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

<asp:ObjectDataSource ID="odsState" runat="server" 
        DataObjectTypeName="Polst.Model.State" 
        SelectMethod="GetStates" TypeName="Polst.BusinessLogic.StateProvider"></asp:ObjectDataSource>


</asp:Content>

