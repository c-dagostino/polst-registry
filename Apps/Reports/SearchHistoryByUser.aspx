<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" theme="Default" inherits="Apps_SearchHistoryByUser, App_Web_fwiw5g31" title="POLST, Search History by User" %>
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
                     <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="ddlUsers" />
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

 
  
 
      
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">Search History By User</div>
 <table style="margin-top: 0px">
 <tr>
 <td align="left" width="100%">
  <table><tr><td style="padding-right:5px;font-weight: 600; padding-left: 10px">Select a User:</td>
  <td style="padding-right:5px" align="left">
  <asp:DropDownList ID="ddlUsers" runat="server"></asp:DropDownList>
  </td>
  <td align="left">
     <table><tr><td style="padding-right:5px;font-weight: 600">Get the Last</td>
          <td style="padding-right:5px">
          <asp:TextBox ID="txtDaysToGet" runat="server" Width="50px" Text="7"></asp:TextBox><strong> Days</strong>
               
        </td>
         <td style="padding-right:5px">
         <asp:Button ID="btnDaysToGet" runat="server" Text="Go" />
         </td>
         
         </tr></table>
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
            <div id="GridContainer">
      <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="False" EnableLinqExpressions="false"
         AllowPaging="True" AllowSorting="True" ShowFooter="true" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="10" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="365px" >
         <FilterItemStyle HorizontalAlign="Left" />
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView CommandItemDisplay="None" Width="930px" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
            Frame="Border" TableLayout="fixed">
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             <Columns>
                
                
                <telerik:GridBoundColumn DataField="SearchDate" HeaderText="Date" SortExpression="SearchDate" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="ssn" HeaderText="Last 4" SortExpression="ssn" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="StateID" HeaderText="State" SortExpression="StateID" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>              
                 <telerik:GridTemplateColumn AllowFiltering ="false" ItemStyle-Wrap="false" HeaderStyle-Width="80px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnlViewForm" ForeColor="#284775" runat="server" CommandArgument='<%# eval("SearchHistoryID") %>' Text="View" OnClick="btnlView_Click"></asp:LinkButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
             </Columns>
             
             
         </MasterTableView>
          <ClientSettings>
             <Scrolling AllowScroll="True" UseStaticHeaders="True" />
         </ClientSettings>
     </telerik:RadGrid>
   </div>
 </td>
 </tr>
</table>
</asp:Panel>


</asp:Content>

