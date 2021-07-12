<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Lists_VerifiedSigners, App_Web_exvb2sii" title="POLST, Manage Verified Signers List" theme="Default" %>
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
 <div style="width: 940px" class="fmHead">POLST Manage Verified Signers</div>
 <table style="margin-top: 0px">
 
 <tr>
 <td colspan="2" align="center" style="padding-top: 15px">
 <div align="center"><asp:Label ID="lblMessage" runat="server" Visible="false" EnableViewState="false" CssClass="validation"></asp:Label></div> 
        
        
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Height="75px" Width="75px" Transparency="10">
            <img alt="Loading..." src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' style="border:0;" />
        </telerik:RadAjaxLoadingPanel>
      
        <telerik:RadGrid ID="RadGrid1" Skin="Vista" AllowAutomaticDeletes="False" AllowPaging="True" OnItemInserted="RadGrid1_ItemInserted"
            AllowAutomaticInserts="False" AllowAutomaticUpdates="False" AllowSorting="true" EnableLinqExpressions="false" AllowFilteringByColumn="true" 
                runat="server" Width="900px" OnUpdateCommand="RadGrid1_UpdateCommand"
            GridLines="None" >
            <PagerStyle Mode="NextPrevAndNumeric" />
            <FilterItemStyle HorizontalAlign="Left" />
            <AlternatingItemStyle BackColor="#DCE2F3" />
                        <MasterTableView DataKeyNames="Id" Width="100%" CommandItemDisplay="Top"  OverrideDataSourceControlSorting="true"
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
                                Text='<%# Bind("Name")%>' Width="400px" MaxLength="200"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                ControlToValidate="txtName" Display="Dynamic" 
                                ErrorMessage="Name is required" ForeColor="Red" ></asp:RequiredFieldValidator>
                                    </td>
                      
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                                    
                    
                    <telerik:GridTemplateColumn HeaderText="Name" DataField="Id" SortExpression="Name" 
                      UniqueName="CertId" Visible="True">
                        <HeaderStyle VerticalAlign="Top" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        <div align="left">
                            <asp:DropDownList ID="ddlCert" CssClass="gridText" runat="server" DataSourceID="odsCert" DataTextField="Name" DataValueField="Id" SelectedValue='<%# GetSelectedValue(Eval("CertId")) %>'></asp:DropDownList>
                           
                        </div>
                        </EditItemTemplate>
                       
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="License(s)" DataField="Licenses" SortExpression="Licenses" 
                      UniqueName="Licenses" Visible="True">
                     <ItemTemplate>
                            <asp:Label ID="lblLicense" runat="server" Text='<%# Eval("Licenses")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                     <asp:TextBox ID="txtLicense" runat="server" Text='<%# Bind("Licenses")%>' Width="400px" MaxLength="100"></asp:TextBox><br />
                            
                                    </td>
                      
                                </tr>
                            </table>
                            
                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                     <telerik:GridTemplateColumn HeaderText="License Expire date" DataField="LicenseExpireDate" SortExpression="LicenseExpireDate" 
                      UniqueName="LicenseExpireDate" Visible="True">
                     <ItemTemplate>
                            <asp:Label ID="lblLicenseExpireDate" runat="server" Text='<%# Eval("LicenseExpireDisplayDate")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        
                              <table align="left">
                                <tr>
                                    <td align="left"> 
                                   
                                     <telerik:RadDatePicker DbSelectedDate='<%# Bind("LicenseExpireDate") %>' ID="dtLicenseExpireDate" runat="server"></telerik:RadDatePicker>

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


 <asp:ObjectDataSource ID="odsCert" runat="server" 
        DataObjectTypeName="Polst.Model.Cert" InsertMethod="UpsertCert" 
        SelectMethod="GetCerts" TypeName="Polst.BusinessLogic.CertProvider" 
        UpdateMethod="UpsertCert"></asp:ObjectDataSource> 

</asp:Content>  




