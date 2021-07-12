<%@ page title="" language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Reports_ArchivedRegistrants, App_Web_fwiw5g31" theme="Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
       function EditRegistrant(val) {

            RWOnShow();
            window.radopen("../forms/EditRegistrant.aspx?pid=" + val.toString(), "rwEditRegistrant");


        }
        function refreshGrid(args) {
            // Do nothing just a stub for the EditRegistrants Page
        }
 </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                            <telerik:AjaxUpdatedControl ControlID="ddlUsers" />
                        </UpdatedControls>
                    </telerik:AjaxSetting> 
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    
                    <telerik:AjaxSetting AjaxControlID="ddlUsers">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="btnDaysToGet">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
                 
            </telerik:RadAjaxManager>
  <telerik:RadWindowManager Top="65px" Width="730px" Height="690px" ID="RadWindowManager1" runat="server" Skin="Vista">
        <Windows>       
             <telerik:RadWindow ID="rwEditRegistrant" runat="server" Title="Edit Registrant" ReloadOnShow="false"  
                Modal="true" Skin="Vista" KeepInScreenBounds="true" NavigateUrl="../forms/EditRegistrant.aspx" VisibleOnPageLoad="false" Top="15px" Left="100px" Width="580px"  height="745px"/>  
        </Windows>
  </telerik:RadWindowManager>
    
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">Archived Registrants</div>
 <table style="margin-top: 0px">
 <tr>
 <td align="center">
  <table align="center"><tr><td style="padding-right:5px;font-weight: 600; padding-left: 10px">Select a User:</td>
  <td style="padding-right:5px" align="left">
  <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="false"></asp:DropDownList>
  </td>
  <td align="left">
        <table >
        <tr>
            <td style="padding-right:5px;font-weight: 600">Get the Last</td>
              <td style="padding-right:5px">
                <asp:TextBox ID="txtDaysToGet" runat="server" Width="50px" Text="7"></asp:TextBox><strong> Days</strong>
                   
            </td>
             <td style="padding-right:5px">
                <asp:Button ID="btnDaysToGet" runat="server" Text="Go" />
             </td>
         <td>
          <div align="right" style="padding-left: 90px"><asp:LinkButton ID="ExportToWord" Text="Export to Word" CommandName="ExportToWord" runat="server" /></div>
         </td>  
         </tr>
         </table>
         <asp:RequiredFieldValidator ID="rfvDaysToGet" runat="server" ControlToValidate="txtDaysToGet" Display="Dynamic" ErrorMessage="You must enter a valid number"></asp:RequiredFieldValidator>
         <asp:RangeValidator ID="rvDaysToGet" runat="server" EnableClientScript="true" Display="Dynamic" MaximumValue="1000000" MinimumValue="0" ControlToValidate="txtDaysToGet" Type="Integer" ErrorMessage="You must enter a valid number"></asp:RangeValidator>
  
  </td>
  
 </tr></table>
 </td>
 <td align="right">
   
 </td>
 </tr>
 <tr>
 <td colspan="2" align="center">

 <div align="center" >
             <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>
            </div>
      
     <asp:panel ID="pnlGrid" runat="server" Visible="true">
     <div id="GridContainer">
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="true"  EnableLinqExpressions="false"
         AllowPaging="True" AllowSorting="True" ShowFooter="true" OnItemCreated="RadGrid1_ItemCreated" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="50" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="365px" >
          
          <ExportSettings IgnorePaging="false" OpenInNewWindow="true">
              
            </ExportSettings>
            
      
         <FilterItemStyle HorizontalAlign="Left" />
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView CommandItemDisplay="None" Width="930px" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
            Frame="Border" TableLayout="fixed">
                       
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             <Columns>
                
                <telerik:GridTemplateColumn UniqueName="tcUsername" DataField="Username" HeaderText="Username" SortExpression="Username" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                           <%#Eval("Username")%>
                        </ItemTemplate>
                        <FooterTemplate>
                            <table style="width: 890" align="center">
                            <tr>
                            <td align="center">
                                <%=Application("confStatement")%>     
                            </td>
                            </tr>
                            
                            </table>
                        </FooterTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="ArchivedDate" HeaderText="Date Archived" SortExpression="ArchivedDate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                           <%#DateTime.Parse(Eval("ArchivedDate")).ToShortDateString%>
                        </ItemTemplate>
                </telerik:GridTemplateColumn>
                
                 
                <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pArchivedReason" HeaderText="Reason" SortExpression="pArchivedReason" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="200" HeaderStyle-Width="200"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pArchivedReasonNote" HeaderText="ReasonNote" SortExpression="pArchivedReasonNote" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"  ItemStyle-Width="200" HeaderStyle-Width="200"></telerik:GridBoundColumn>
                <telerik:GridTemplateColumn AllowFiltering="false" DataField="PStatus" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="25px" HeaderStyle-Width="25px">
                    <ItemTemplate>
                        <a href='javascript:EditRegistrant(<%# eval("pid") %>)' onmouseover="this.style.cursor='pointer'" style="color: #284775">View</a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
              
           </Columns>
           
                      
         </MasterTableView>
         <ClientSettings>
             <Scrolling AllowScroll="True" UseStaticHeaders="True" />
         </ClientSettings>
         
     </telerik:RadGrid>
     </div>
     </asp:panel>
   
 </td>
 </tr>
</table>
</asp:Panel>


</asp:Content>


