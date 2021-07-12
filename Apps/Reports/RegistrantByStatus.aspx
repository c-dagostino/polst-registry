<%@ page title="" language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Reports_RegistrantByStatus, App_Web_fwiw5g31" theme="Default" %>
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
 <div style="width: 940px" class="fmHead">Registrants by Status</div>
 <table style="margin-top: 0px">
 <tr>
 <td align="center">
  <table align="center"><tr><td style="padding-right:5px;font-weight: 600; padding-left: 10px">Select a Form Status:</td>
    <td align="left" style="width: 400">
     <asp:RadioButtonList ID="rblStatusOptions" runat="server" 
         RepeatDirection="Horizontal" AutoPostBack="True">
       
 </asp:RadioButtonList>
  </td>
    <td width="200px">
          <div align="right" style="padding-left: 90px"><asp:LinkButton ID="ExportToWord" Text="Export to Word" CommandName="ExportToWord" runat="server" /></div>
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
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True"  EnableLinqExpressions="false"
         AllowPaging="False" AllowSorting="True" ShowFooter="true" OnItemCreated="RadGrid1_ItemCreated" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="50" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="700px" Height="365px" >
          
           <ExportSettings IgnorePaging="false" OpenInNewWindow="true">
            
            </ExportSettings>
                
        
         <FilterItemStyle HorizontalAlign="Left" />
         
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView FilterItemStyle-Wrap="false" 
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
            Frame="Border" TableLayout="Auto" CommandItemDisplay="None">
                   
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             <Columns>
                <telerik:GridTemplateColumn UniqueName="tcRegistryID" DataField="RegistryID" HeaderText="Registry ID" SortExpression="RegistryID" AllowFiltering="True" HeaderStyle-HorizontalAlign="Center">
                        <ItemStyle Width="80px" />
                        <HeaderStyle Width="80px" />
                        <ItemTemplate>
                           <%#Eval("RegistryID")%>
                        </ItemTemplate>
                       <FooterTemplate>
                            <table style="width: 100%" align="center">
                            <tr>
                            <td align="center">
                                <%=Application("confStatement")%>     
                            </td>
                            </tr>
                            
                            </table>
                        </FooterTemplate>
                </telerik:GridTemplateColumn>
               <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
               
                <telerik:GridTemplateColumn AllowFiltering="True" DataField="PStatus" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="100px" HeaderText="Participant Status">
                    <ItemTemplate>
                        <a href='javascript:EditRegistrant(<%# eval("pid") %>)' onmouseover="this.style.cursor='pointer'" style="color: #284775"><%#Eval("PStatus")%></a>
                     </ItemTemplate>
                </telerik:GridTemplateColumn>
              
                 <telerik:GridTemplateColumn AllowFiltering="True" ItemStyle-Wrap="false" DataField="RFormStatus" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="100px" HeaderText="Form Status">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnlViewForm" ForeColor="#284775" runat="server" CommandArgument='<%# eval("pid") %>' CommandName='<%# eval("pformid") %>' Text='<%# eval("RFormStatus") %>' OnClick="btnlView_Click"></asp:LinkButton>
                        
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

