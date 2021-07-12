<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Search_CallForms, App_Web_mky4ulbn" title="POLST Call Forms" theme="Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <script language="javascript" type="text/javascript">
            function EditCallForm(callFormID, pFound, pid)
            {
               if (pFound == 0)
                {
                    RWOnShow();
                    var oWindow = window.radopen("NPF_CallForm.aspx?cfid=" + callFormID.toString(), "rwNPF");
                    
                              
                }
               else
                {
                     RWOnShow();
                     var oWindow = window.radopen("PF_CallForm.aspx?cfid=" + callFormID.toString() + "&pid=" + pid.toString(), "rwNPF");
                     

                 }

             }

             function resetForm() { //do nothing
             }
 
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
            
            
          function PolstFormView(pid, rfid) {

               RWOnShow();
               window.radopen("../Search/PolstFormView.aspx?search=0&pid=" + pid.toString() + "&rfid=" + rfid.toString(), "rwPolstFormView");

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
                     <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btnGetCallForms" />
                        </UpdatedControls>
                    </telerik:AjaxSetting> 
                    <telerik:AjaxSetting AjaxControlID="btnGetCallForms">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>

 
  
<telerik:RadWindowManager ID="RadWindowManager1" runat="server" Skin="Vista">
        <Windows>
              
            <telerik:RadWindow ID="rwPolstFormView" runat="server" Title="POLST Form View" ReloadOnShow="false" VisibleStatusbar="false"
                Modal="true" Skin="Vista" NavigateUrl="../Search/PolstFormView.aspx" VisibleOnPageLoad="false" Width="825px" Height="690px" KeepInScreenBounds="true" />
                
            <telerik:RadWindow ID="rwPF" runat="server" Title="Edit Call Form" ReloadOnShow="false" VisibleStatusbar="false"
                Modal="true" Skin="Vista" VisibleOnPageLoad="false" Top="35px" Left="100px" Width="650px" Height="730px" KeepInScreenBounds="true"  />
                
            <telerik:RadWindow ID="rwNPF" runat="server" Title="Edit Call Form" ReloadOnShow="false" VisibleStatusbar="false"
                Modal="true" Skin="Vista" VisibleOnPageLoad="false" Top="35px" Left="100px" Width="650px" Height="730px" KeepInScreenBounds="true"  />
           
        </Windows>
   </telerik:RadWindowManager>  
      
 <asp:Panel ID="pnlForm1" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">POLST Call Log</div>
 <table style="margin-top: 0px">
 <tr>
 <td align="left">
  <table><tr><td style="padding-right:5px;font-weight: 600">Get the Last</td>
  <td style="padding-right:5px">
  <asp:TextBox ID="txtDaysToGet" runat="server" Width="40px" Text="7"></asp:TextBox><strong> Days</strong>
       
</td>
 <td style="padding-right:5px">
 <asp:Button ID="btnGetCallForms" runat="server" Text="Get Call Forms" />
 </td>
 
 </tr></table>
 <asp:RequiredFieldValidator ID="rfvDaysToGet" runat="server" ControlToValidate="txtDaysToGet" Display="Dynamic" ErrorMessage="You must enter a valid number"></asp:RequiredFieldValidator>
         <asp:RangeValidator ID="rvDaysToGet" runat="server" EnableClientScript="true" Display="Dynamic" MaximumValue="1000000" MinimumValue="0" ControlToValidate="txtDaysToGet" Type="Integer" ErrorMessage="You must enter a valid number"></asp:RangeValidator>
 
  <div align="center">
             <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>
            </div>
 </td>
 <td align="right">
   
 </td>
 </tr>
 <tr>
 <td colspan="2" align="center" id="GridContainer">


  <telerik:RadGrid runat="server" AllowFilteringByColumn="True" EnableLinqExpressions="false" ID="RadGrid1"
         AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" ShowFooter="true" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="20" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="365px" >
         <FilterItemStyle HorizontalAlign="Left" />
         
         <PagerStyle Mode="NextPrevAndNumeric"  AlwaysVisible="true" />
         <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false" DataKeyNames="CallFormID"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
             datasourceid="ObjectDataSource1" Frame="Border" TableLayout="fixed">
             
             <AlternatingItemStyle BackColor="#DCE2F3"  />
             <Columns>
                
               
                <telerik:GridBoundColumn DataField="CallTakenByName" HeaderText="Call Taken By" SortExpression="CallTakenByName" ItemStyle-HorizontalAlign="Left">
                    <ItemStyle HorizontalAlign="Left" />
                 </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SearchStartedAt" HeaderText="Call Start Time" SortExpression="SearchStartedAt" ItemStyle-HorizontalAlign="Left">
                    <ItemStyle HorizontalAlign="Left" />
                 </telerik:GridBoundColumn>
                 
                 <telerik:GridTemplateColumn AllowFiltering="True" HeaderText="Result" SortExpression="Result" ItemStyle-HorizontalAlign="Left" DataField="Result" >
                    <ItemTemplate>
                       <span><%# TransformResult(Eval("Result"), Eval("CallFormID"), Eval("PID"))%></span>
                     </ItemTemplate>
                     
                 </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="MedicUnitHospital" HeaderText="Medic Unit or Hospital" SortExpression="MedicUnitHospital" ItemStyle-HorizontalAlign="Left" >
                    <ItemStyle HorizontalAlign="Left" />
                 </telerik:GridBoundColumn>
                 
                  <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="20px" UniqueName="Delete" >
                    <ItemTemplate>
                        <asp:ImageButton ID="btniDelete" OnClick="btniDelete_Click" ImageUrl="~/images/Delete.gif" runat="server" CommandArgument='<%# Eval("CallFormID") %>' OnClientClick="javascript:return confirm('Delete the Call Form and its History?')" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>          
               
             </Columns>
             
             
             <FilterItemStyle Wrap="False" />
             
              <DetailTables>
                    <telerik:GridTableView AllowPaging="false" DataKeyNames="PFormID, CallFormID" Width="840px" DataSourceID="ObjectDataSource2" runat="server" AllowFilteringByColumn="false" NoDetailRecordsText="No Polst Forms were viewed" >
                       
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="CallFormID" MasterKeyField="CallFormID" />
                        </ParentTableRelation>
                        <Columns>
                            <telerik:GridBoundColumn DataField="ViewedAt" HeaderText="Polst Form Viewed At" SortExpression="ViewedAt" ItemStyle-HorizontalAlign="Left" />
                            <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-HorizontalAlign="Left" />
                            <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-HorizontalAlign="Left" />
                            <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City" ItemStyle-HorizontalAlign="Left" />
                            <telerik:GridBoundColumn DataField="RFormStatus" HeaderText="Form Status" SortExpression="RFormStatus" ItemStyle-HorizontalAlign="Left" />
                              <telerik:GridTemplateColumn AllowFiltering ="false" ItemStyle-Wrap="false" HeaderStyle-Width="80px">
                    <ItemTemplate>
                        <a href="javascript:PolstFormView(<%# eval("pid") %>,<%# eval("pformid") %>)" style="color: #284775">POLST Data</a>
                       
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                        
                        </Columns>
                        
                         <DetailTables>
                            <telerik:GridTableView AllowPaging="false" DataKeyNames="SFViewID" Width="500px" DataSourceID="ObjectDataSource3" runat="server" AllowFilteringByColumn="false" NoDetailRecordsText="Scanned Form was not viewed">
                               
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="PFormID" MasterKeyField="PFormID" />
                                    <telerik:GridRelationFields DetailKeyField="CallFormID" MasterKeyField="CallFormID" />
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ViewedAt" HeaderText="Scanned Form Viewed At" SortExpression="ViewedAt" ItemStyle-HorizontalAlign="Left" />
                                    <telerik:GridBoundColumn DataField="FileName" HeaderText="File Name" SortExpression="FileName" ItemStyle-HorizontalAlign="Left" />
                                    <telerik:GridTemplateColumn AllowFiltering="false">
                                    <ItemStyle Width="75px" />
                                        <ItemTemplate>
                                            <a href="../ViewDocument.aspx?item=<%# Eval("ScannedFormID") %>" target="_blank" style="color: #284775" title="View Scanned Form">View</a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                </telerik:GridTableView>
                        </DetailTables>
                        
                        
                        
                        </telerik:GridTableView>
                        </DetailTables>
                    
         </MasterTableView>
         <ClientSettings>
             <Scrolling AllowScroll="True" UseStaticHeaders="True" />
         </ClientSettings>
     </telerik:RadGrid>
   
      <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
          SelectMethod="GetCallFormScannedFormsViewed" TypeName="Polst.BusinessLogic">
          <SelectParameters>
              <asp:SessionParameter Name="CallFormID" SessionField="CallFormID" Type="Int32" />
              <asp:SessionParameter Name="PFormID" SessionField="PFormID" Type="Int32" />
          </SelectParameters>
      </asp:ObjectDataSource>
   
 </td>
 </tr>
</table>
</asp:Panel>


   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetCallForms" TypeName="Polst.BusinessLogic.CallFormProvider">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtDaysToGet" Name="DaysToGet" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        SelectMethod="GetCallFormParticipantsViewed" TypeName="Polst.BusinessLogic.CallFormProvider">
        <SelectParameters>
            <asp:SessionParameter Name="CallFormID" SessionField="CallFormID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>



