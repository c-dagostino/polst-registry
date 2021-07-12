<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Reports_SearchHistoryView, App_Web_fwiw5g31" title="POLST, Search History Item View" theme="Default" %>
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
                    
                </AjaxSettings>
            </telerik:RadAjaxManager>
    
 <script language="javascript" type="text/javascript">

     function PolstFormView(pid) {

         RWOnShow();
         window.radopen("../Search/PolstFormView.aspx?search=0&pid=" + pid.toString(), "rwPolstFormView");

     }
     
          
		 
			
 </script>  
<telerik:RadWindowManager Top="65px" Left="200px" Width="580px" Height="690px" ID="RadWindowManager1" runat="server" Skin="Vista">
        <Windows>
            
            <telerik:RadWindow ID="rwPolstFormView" runat="server" Title="POLST Form View" ReloadOnShow="false"
                Modal="true" Skin="Vista" NavigateUrl="PolstFormView.aspx" VisibleOnPageLoad="false" Width="825px" />
           
        </Windows>
   </telerik:RadWindowManager>     
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">Search History Item View</div>
 
 <div style="text-align: center; padding-top: 10px; padding-bottom: 10px">
   

     <table cellpadding="0" cellspacing="0" style="padding:5px;border: solid 1px gray">
            <tr>
                <td class="fmTopPolstHeader">Last Name:</td>
                <td class="fmTopPolstText"><asp:Label ID="lblLastName" runat="server"></asp:Label></td>
                <td class="fmTopPolstHeader">First Name:</td>
                <td class="fmTopPolstText"><asp:Label ID="lblFirstName" runat="server"></asp:Label></td>
                <td class="fmTopPolstHeader">Middle Name:</td><td class="fmTopPolstText" style="text-align:left" colspan="3"><asp:Label ID="lblMiddleName" runat="server"></asp:Label></td>
                <td class="fmTopPolstHeader">Registry ID:</td>
                <td class="fmTopPolstText"><asp:Label ID="lblRegistryID" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="fmTopPolstHeader">DOB:</td>
                <td class="fmTopPolstText"><asp:Label ID="lblBirthMonth" runat="server"></asp:Label>/<asp:Label ID="lblBirthDay" runat="server"></asp:Label>/<asp:Label ID="lblBirthYear" runat="server"></asp:Label></td>
                <td class="fmTopPolstHeader">Approx Age:</td>
                <td class="fmTopPolstText"><asp:label ID="lblAge" runat="server"></asp:label></td>
                <td class="fmTopPolstHeader">Last 4 SSN:</td>
                <td class="fmTopPolstText"><asp:Label ID="lblSSN" runat="server"></asp:Label></td>
                <td class="fmTopPolstHeader">Gender:</td><td class="fmTopPolstText" colspan="3"><asp:Label ID="lblGender" runat="server"></asp:Label></td>
                
            </tr>
            <tr>
               
                
                <td class="fmTopPolstHeader">Address:</td>
                <td colspan="3" class="fmTopPolstText"><asp:label ID="lblAddress" runat="server"></asp:label></td>
                <td class="fmTopPolstHeader">City:</td>
                <td class="fmTopPolstText" colspan="4"><asp:label ID="lblCity" runat="server"></asp:label></td>
           
            </tr>
            <tr>
               
                
                <td class="fmTopPolstHeader">County:</td>
                <td colspan="3" class="fmTopPolstText"><asp:label ID="lblCounty" runat="server"></asp:label></td>
                <td class="fmTopPolstHeader">State:</td>
                <td class="fmTopPolstText"><asp:label ID="lblState" runat="server"></asp:label></td>
                <td class="fmTopPolstHeader">Zip:</td>
                <td class="fmTopPolstText"><asp:label ID="lblZip" runat="server"></asp:label></td>
           
            </tr>
            
            
           
            </table>

            
 </div>
 <div align="center">
             <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>
            </div>
 <asp:panel ID="pnlGrid" runat="server" Visible="true">
 <div id="GridContainer">
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="false"  EnableLinqExpressions="false"
         AllowPaging="True" AllowSorting="True" ShowFooter="true" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="50" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="365px" >
         <FilterItemStyle HorizontalAlign="Left" />
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
             Frame="Border" TableLayout="fixed">
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             <Columns>
                
               
                <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
               
                 <telerik:GridBoundColumn DataField="BirthDate" HeaderText="DOB" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ssn" HeaderText="Last 4" SortExpression="ssn" ItemStyle-HorizontalAlign="Left" DataType="System.String" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Address" HeaderText="Address" SortExpression="Address" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Score" HeaderText="Score" SortExpression="Score"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                
                
                <telerik:GridTemplateColumn AllowFiltering ="false" ItemStyle-Wrap="false" >
                    <ItemTemplate>
                      
                       <a href="javascript:PolstFormView(<%# Eval("ParticipantId")%>)" style="color: #284775">POLST Data</a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
              
             </Columns>
             
             <RowIndicatorColumn CurrentFilterFunction="NoFilter" 
                 FilterListOptions="VaryByDataType" Visible="False">
                 <HeaderStyle Width="20px" />
             </RowIndicatorColumn>
             <ExpandCollapseColumn CurrentFilterFunction="NoFilter" 
                 FilterListOptions="VaryByDataType" Resizable="False" Visible="False">
                 <HeaderStyle Width="20px" />
             </ExpandCollapseColumn>
             <EditFormSettings>
                 <EditColumn CurrentFilterFunction="NoFilter" FilterListOptions="VaryByDataType">
                 </EditColumn>
             </EditFormSettings>
         </MasterTableView>
         <ClientSettings>
             <Scrolling AllowScroll="True" UseStaticHeaders="True" />
         </ClientSettings>
     </telerik:RadGrid>
     </div>
       </asp:panel>        

   

 </asp:Panel>

</asp:Content>

