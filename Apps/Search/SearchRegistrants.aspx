<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_SearchRegistrants, App_Web_mky4ulbn" title="POLST, Search Registrants" theme="Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ MasterType VirtualPath="~/Apps/PolstMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <script type="text/javascript" src="../Scripts/SearchRegistrants.js?id=<%= DateTime.Now.ToShortDateString() %>""></script>
  
 
 
<telerik:RadWindowManager Top="65px" Width="810px" Height="710px" ID="RadWindowManager1" runat="server" Skin="Vista" KeepInScreenBounds="true" ReloadOnShow="true">
        <Windows>
            
            <telerik:RadWindow ID="rwPolstFormView" runat="server" Title="POLST Form View" ReloadOnShow="true"
                Modal="true" Skin="Vista" NavigateUrl="PolstFormView.aspx" VisibleOnPageLoad="false" Width="825px" Height="725px" />
                
             <telerik:RadWindow ID="rwNPF" runat="server" Title="Edit Call Form" ReloadOnShow="true"
                Modal="true" Skin="Vista" NavigateUrl="NPF_CallForm.aspx" VisibleOnPageLoad="false" Top="35px" Left="100px" Width="640px" Height="670px"   />
           
        </Windows>
   </telerik:RadWindowManager>

<asp:UpdatePanel ID="upd1" runat="server">
    <ContentTemplate>
 <input type="hidden" runat="server" value="-1" id="txtCallFormID" clientidmode="Static" />
 <input type="hidden" runat="server" value="-1" id="txtNPFCallFormID" clientidmode="Static" />      
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" DefaultButton="btnSearch" >
 <div style="width: 940px" class="fmHead">
 <table width="100%">
 <tr>
 <td style="width: 120px"><asp:Button ID="btnBeginCall" runat="server" Text="Begin Call" BackColor="#e798a8" /></td>
 <td  style="width: 120px"><asp:Button ID="btnCancelCall" runat="server" 
         Text="Cancel Call" BackColor="#e798a8" CausesValidation="false" /></td>
 <td  style="width: 460px">Search Active Registrants</td>
 <td  style="width: 240px"><asp:Button ID="btnNoRegistrantFound" runat="server" Text="No Registrant Found - Log Call" BackColor="#e798a8" OnClientClick="return OpenNPF();" /></td>
 </tr>
 </table>
 </div>
 <div align="center" style="padding-Top: 5px; padding-bottom: 5px"><asp:Label ID="lblCurrentCall" runat="server" Visible="false" Text="Call began at " Font-Bold="true" ForeColor="Red" Font-Size="14px"></asp:Label></div>
 <asp:panel ID="pnlSearch" runat="server" style="text-align: center; padding-top: 10px; padding-bottom: 10px">
   
 
     <table cellpadding="0" cellspacing="0" style="padding:5px;border: solid 1px gray">
            <tr>
            <td align="left">
                <table>
                <tr>
                     <td class="fmTopPolstHeader">Last Name:</td><td id="tclName" class="fmTopPolstText">
                
                <telerik:RadComboBox ID="rcbLastName" runat="server" AllowCustomText="true" 
                        MaxLength="200" Height="125px" class="fmFieldText" TabIndex="1" AutoPostBack="true"
                EnableLoadOnDemand="True" Skin="Vista" Font-Size="11px"  ShowMoreResultsBox="True" 
                        ItemRequestTimeout="500" MarkFirstMatch="False" CausesValidation="false" 
                        onclientselectedindexchanged="ClearFirstName" >
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
                
                </td><td class="fmTopPolstHeader" style="padding-left: 15px">First Name:</td><td class="fmTopPolstText">
                
                <telerik:RadComboBox ID="rcbFirstName" runat="server" AllowCustomText="true" MaxLength="200" Height="125px" class="fmFieldText" TabIndex="2"
                EnableLoadOnDemand="True" Skin="Vista" Font-Size="11px"  ShowMoreResultsBox="True" ItemRequestTimeout="500" MarkFirstMatch="False" CausesValidation="false">
                </telerik:RadComboBox>
                
                </td><td class="fmTopPolstHeader"  style="padding-left: 15px">Middle Name:</td><td class="fmTopPolstText" style="text-align:left" colspan="3"><asp:Textbox ID="txtMiddleName" runat="server" MaxLength="1" Width="20px" TabIndex="3"></asp:Textbox></td>
                <td class="fmTopPolstHeader"  style="padding-left: 15px">Registry ID:</td><td class="fmTopPolstText" style="text-align:left" colspan="3"><asp:Textbox ID="txtRegistryID" runat="server" MaxLength="20" Width="100px" TabIndex="4"></asp:Textbox></td>
                
                </tr>
               
                
                </table>
            
            </td>
           </tr>
            <tr>
                <td align="left">
                <table>
                <tr>
                    <td class="fmTopPolstHeader">DOB:</td><td id="tclDOB" class="fmTopPolstText"> 
                    <asp:TextBox ID="txtBirthMonth" runat="server" Width="25px" MaxLength="2" TabIndex="5" CssClass="jqNumberOnly" ClientIDMode="Static" ></asp:TextBox>&nbsp;/&nbsp;
                    <asp:TextBox ID="txtBirthDay" runat="server" Width="25px" MaxLength="2" TabIndex="6" CssClass="jqNumberOnly" ClientIDMode="Static"></asp:TextBox>&nbsp;/&nbsp;
                    <asp:TextBox ID="txtBirthYear" runat="server" Width="50px" MaxLength="4" TabIndex="7" onkeydown="clearAge()" CssClass="jqNumberOnly" ClientIDMode="Static" ></asp:TextBox>
                    </td>
                     <td class="fmTopPolstHeader" style="padding-left: 15px" >Approx. Age:</td>
                        <td class="fmTopPolstText"><asp:TextBox ID="txtAge" runat="server" Width="35px" TabIndex="8" MaxLength="3" onkeydown="clearBirthYear()" CssClass="jqNumberOnly" ClientIDMode="Static"></asp:TextBox><br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" MinimumValue="1" MaximumValue="200" ControlToValidate="txtAge" Display="Dynamic" CssClass="validation" Text="This is not a valid age"></asp:RangeValidator>
                        </td>
                    <td class="fmTopPolstHeader" style="padding-left: 15px">Last 4 SSN:</td>
                    <td class="fmTopPolstText">   
                    <asp:TextBox ID="txtSSN" runat="server" MaxLength="4" Width="75px" TabIndex="9" CssClass="jqNumberOnly"></asp:TextBox><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtSSN" ErrorMessage="SSN is invalid" Display="Dynamic" 
                    ValidationExpression="\d{4}?">This is not valid for last 4 of SSN</asp:RegularExpressionValidator></td>
                    
                    <td class="fmTopPolstHeader" style="padding-left: 15px">Gender:</td><td class="fmTopPolstText">
                     <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Male" Value="M" TabIndex="10"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="F" TabIndex="11"></asp:ListItem>
                    <asp:ListItem Text="All" Value="" Selected="True" TabIndex="12"></asp:ListItem>
                </asp:RadioButtonList>
                    </td>
                </tr>
                </table>
                </td>
             </tr>
            
             <tr>
              <td align="left">
                <table>
                <tr>
                <td class="fmTopPolstHeader">Address:</td>
                <td colspan="3" class="fmTopPolstText"><asp:TextBox ID="txtAddress" runat="server" Width="350px" TabIndex="13"></asp:TextBox></td>
                <td class="fmTopPolstHeader" style="padding-left: 15px">City:</td>
                <td class="fmTopPolstText" colspan="2"><asp:TextBox ID="txtCity" runat="server" Width="125px" TabIndex="14"></asp:TextBox></td>
           
                </tr>
                </table>
              </td>
            </tr>
            
            
            <tr>
             <td align="left">
                <table>
                <tr>
                        <td class="fmTopPolstHeader">County:</td>
                        <td colspan="3" class="fmTopPolstText"><asp:TextBox ID="txtCounty" runat="server" Width="125px" TabIndex="15"></asp:TextBox></td>
                        <td class="fmTopPolstHeader" style="padding-left: 15px">State:</td>
                        <td class="fmTopPolstText"><asp:TextBox ID="txtState" runat="server" Width="25px" TabIndex="16" MaxLength="2"></asp:TextBox></td>
                        <td class="fmTopPolstHeader" style="padding-left: 15px">Zip:</td>
                        <td class="fmTopPolstText"><asp:TextBox ID="txtZip" runat="server" Width="50px" TabIndex="17" MaxLength="5" CssClass="jqNumberOnly"></asp:TextBox><br />
                           <asp:RegularExpressionValidator ID="revZip" runat="server" 
                                    ControlToValidate="txtZip" Text="This is not a valid Zip Code" CssClass="validation jqNumberOnly"
                                    ValidationExpression="\d{5}(-\d{4})?" ></asp:RegularExpressionValidator>
                             
                        </td>
                           <td align="left" style="padding-left: 50px">
                           <span style="padding-right: 15px">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="ruButton" TabIndex="18" ClientIDMode="static"  /></span>
                                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="ruButton" TabIndex="18" />
                           </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
            
          
            </table>
</asp:panel>
<div align="center" >
 <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>
</div>            
 
 
 <asp:panel ID="pnlGrid" runat="server" Visible="true">
 <div id="GridContainer">
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="false"  EnableLinqExpressions="false"
         AllowPaging="True" AllowSorting="True" ShowFooter="true" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="50" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="356px">
         <FilterItemStyle HorizontalAlign="Left" />
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
             Frame="Border" TableLayout="fixed" ShowFooter="false">
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             <Columns>
                <telerik:GridTemplateColumn AllowFiltering ="false" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        
                       
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
               
                <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RegistryID" HeaderText="Registry ID" SortExpression="RegistryID" ItemStyle-HorizontalAlign="Left" DataType="System.String" ></telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="BirthDate" HeaderText="DOB" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="Age">
                    <ItemTemplate>
                       <%#GetAge(Eval("BirthDate"))%> 
                    </ItemTemplate>
                 </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="SSN" HeaderText="Last 4" SortExpression="ssn" ItemStyle-HorizontalAlign="Left" DataType="System.String" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="GenderId" HeaderText="Gender" SortExpression="GenderID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Score" HeaderText="Score" SortExpression="Score"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
               
                 
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
       <div style="padding-top: 5px; padding-right: 15px" align="right"><asp:Label ID="lblMatches" runat="server" Font-Bold="true"></asp:Label></div>
       </div>
       </asp:panel>        

  


 </asp:Panel>
</ContentTemplate>
</asp:UpdatePanel> 

 <script type="text/javascript">
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

   
     function ClearFirstName(sender, args) {
         var comboInstance = $find('<%=rcbFirstName.ClientID%>');
         comboInstance.clearItems();
         comboInstance.set_text("");
         comboInstance.requestItems(sender.get_text(), false);


     }

     function EndRequestHandler(sender, args) {

         var callFormID = $("#txtNPFCallFormID").val();

         if (callFormID != "-1") {
             OpenNPFOnCancel(callFormID);
         }

         $("#txtNPFCallFormID").val("-1");
     }

</script>
  
</asp:Content>

