<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Users, App_Web_2ntjiryh" title="POLST Registry Users" theme="Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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

 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="900px" >
 <div style="width: 890px" class="fmHead">POLST Users</div>
 <table style="margin-top: 15px">
    <tr>
        <td colspan="2" align="center"><asp:Label id="lblMessage" runat="server" EnableViewState="False" Visible="False" ForeColor="Red"></asp:Label></td>
    </tr>
   <tr>
   <td align="left">
   View: <asp:DropDownList ID="ddlUserType" runat="server" AutoPostBack="true">
    <asp:ListItem Text="Active Accounts" Value="1" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Inactive Accounts" Value="0"></asp:ListItem>
   </asp:DropDownList>
   </td>
   <td align="right"><asp:Button ID="btnlNew" runat="server" Text="New User" CssClass="ruButton" /></td>
   </tr>
   <tr>
   <td colspan="2">
     <div id="GridContainer">
   <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="false" EnableLinqExpressions="false"
         AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" ShowFooter="true" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="20" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="730px" Height="365px" >
         <FilterItemStyle HorizontalAlign="Left" />
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
             datasourceid="ObjectDataSource1" Frame="Border" TableLayout="fixed">
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             
             <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="20px">
                    <ItemTemplate>
                        <asp:ImageButton ID="btniDelete" ImageUrl="~/images/Edit.gif" runat="server" CommandArgument='<%# Eval("Username") %>' CommandName="Edit" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
               
                <telerik:GridBoundColumn DataField="UserName" HeaderText="UserName" SortExpression="UserName" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Email" HeaderText="Contact Email" SortExpression="Email" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UserId" HeaderText="UserId" SortExpression="UserId"  Visible="false"></telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" DataField="Active" HeaderText="Active" SortExpression="Active"></telerik:GridCheckBoxColumn>
                 <telerik:GridCheckBoxColumn HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" DataField="IsLockedOut" HeaderText="IsLockedOut" SortExpression="IsLockedOut"></telerik:GridCheckBoxColumn>
              
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

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetUsersByStatus" TypeName="POLST.BusinessLogic.UserProvider">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlUserType" DefaultValue="1" Name="Active" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

