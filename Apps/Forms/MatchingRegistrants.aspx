<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Forms_MatchingRegistrants, App_Web_agr5ncgw" title="POLST, Matching Paricipants" theme="Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <telerik:RadAjaxPanel ID="rdw1" runat="server" EnableEmbeddedScripts="true" Width="930px" Height="100%" >

 <script language="javascript" type="text/javascript">
            function EditRegistrant(val)
            {

                RWOnShow();
               window.radopen("./EditRegistrant.aspx?ea=0&pid=" + val.toString(), "rwEditRegistrant");          
               
               
            }
 
		   function refreshGrid(arg)
			{
			    __doPostBack('registrant', 'refresh')
			 
		    }
			
 </script>  
<telerik:RadWindowManager Top="65px" Left="200px" Width="580px" Height="690px" ID="RadWindowManager1" runat="server" Skin="Vista">
        <Windows>
            
            <telerik:RadWindow ID="rwEditRegistrant" runat="server" Title="Edit Registrant" ReloadOnShow="false" 
                Modal="true" Skin="Vista" NavigateUrl="./EditRegistrant.aspx" VisibleOnPageLoad="false" />
           
        </Windows>
   </telerik:RadWindowManager>  
      
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="930px" >
 <div style="width: 920px" class="fmHead">Matching Registry Registrants</div>
 <div style="padding-top: 20px; padding-bottom: 20px; padding-right: 20px; padding-left: 20px; line-height: 25px">
     Based on the information entered, below are some possible matching Registrants. 
     If a Registrant is a match, Select the Registrant&#39;s &quot;POLST Data&quot; to enter a 
     new Form, press<span style="padding-left: 10px; padding-right: 10px"><asp:Button runat="server" ID="btnConitnue" Text="Continue" Font-Bold="true" CssClass="ruButton" /></span>
     to add a new Registrant, or press<span style="padding-left: 10px; padding-right: 10px"><asp:Button runat="server" ID="btnCancel" Text="Cancel" Font-Bold="true" CssClass="ruButton" /></span>to exit the process.</div>
 <div style="padding-bottom: 10px"><asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" Visible="false" EnableViewState="false" Text="This Registrant already has one Pending Form"></asp:Label></div>
 <div align="center">
 
      <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" EnableEmbeddedScripts="true"
         AllowPaging="False" AllowSorting="True"
         AutoGenerateColumns="false" Skin="Vista" PageSize="20" ShowStatusBar="true"
          GridLines="Both" Font-Size="11px" Width="910px" >
         <FilterItemStyle HorizontalAlign="Left" />
         <MasterTableView CommandItemDisplay="None" Width="890px" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  
           Dir="LTR" Frame="Border" TableLayout="Auto" AllowFilteringByColumn="false">
             <AlternatingItemStyle BackColor="#DCE2F3" />
             
             <Columns>
                
                 <telerik:GridTemplateColumn AllowFiltering ="false" HeaderStyle-Width="25px">
                    <ItemTemplate>
                       
                        <a href='javascript:EditRegistrant(<%# Eval("ParticipantId")%>)' onmouseover="this.style.cursor='pointer'"><img src="../../Images/Edit.gif" alt="View Registrant" border="0" /></a>
                     </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="FullName" HeaderText="Name" SortExpression="FullName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="70" DataField="RegistryId" HeaderText="Registry ID" SortExpression="RegistryId" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="50" DataField="PStatus" HeaderText="Status" SortExpression="PStatus" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="55" DataField="BirthDate" HeaderText="DOB" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="SSN" HeaderText="Last 4" SortExpression="SSN" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>              
                <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="StateId" HeaderText="State" SortExpression="StateId" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="Zip" HeaderText="Zip" SortExpression="Zip" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn HeaderText="Last Signature Date">
                    <ItemStyle HorizontalAlign="Left" BackColor="Yellow" />
                    <ItemTemplate>
                        <span><%# Eval("MaxDateSigned")%></span>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn HeaderStyle-Width="40px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnlViewForm" ForeColor="#284775" runat="server" CommandArgument='<%# Eval("ParticipantId")%>' CommandName='<%# Eval("PFormId")%>' Text="POLST Data" OnClick="btnlView_Click" Enabled='<%# HasValidPolstFOrm(Eval("PFormId"))%>'></asp:LinkButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="40px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnlNewForm" ForeColor="#284775" runat="server" Enabled='<%# IIf(Eval("PStatusId") = 1, True, False)%>' CommandArgument='<%# Eval("ParticipantId")%>' CommandName='<%# Eval("PFormId")%>' Text="New 2009 Form" OnClick="btnlNew_Click"></asp:LinkButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn HeaderStyle-Width="40px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnlNewForm2011" ForeColor="#284775" runat="server" Enabled='<%# IIf(Eval("PStatusId") = 1, True, False)%>' CommandArgument='<%# Eval("ParticipantId")%>' CommandName='<%# eval("PFormId") %>' Text="New 2011 Form" OnClick="btnlNew2011_Click"></asp:LinkButton>
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

</asp:Panel>

</telerik:RadAjaxPanel>
 
</asp:Content>

