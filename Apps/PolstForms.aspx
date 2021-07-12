<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolstForms.aspx.cs" Inherits="PolstWebApp.Apps.PolstForms" MasterPageFile="~/Apps/PolstMaster.master" Title="Polst Forms" %>

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
                            <telerik:AjaxUpdatedControl ControlID="rblStatusOptions" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                      <telerik:AjaxSetting AjaxControlID="rblStatusOptions">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>


 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">POLST Registry Forms</div>
 <table style="margin-top: 10px">
 <tr>
 <td align="left">
  <asp:RadioButtonList ID="rblStatusOptions" runat="server" 
         RepeatDirection="Horizontal" AutoPostBack="True">
       
 </asp:RadioButtonList>
 <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>
 </td>
 <td align="right">
  
 </td>
 </tr>
 <tr>
 <td colspan="2" id="GridContainer">
    
    <telerik:RadGrid runat="server" AllowFilteringByColumn="True" EnableLinqExpressions="false" ID="RadGrid1"
         AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" ShowFooter="true" 
         AutoGenerateColumns="false" Skin="Vista" PageSize="20" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="365px" >
         <FilterItemStyle HorizontalAlign="Left" />
         
         <PagerStyle Mode="NextPrevAndNumeric"  AlwaysVisible="true" />
         <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
             datasourceid="ObjectDataSource1" Frame="Border" TableLayout="fixed">
             
             <AlternatingItemStyle BackColor="#DCE2F3"  />
             
             <Columns>
                
                <telerik:GridBoundColumn DataField="PersonName" HeaderText="Name" SortExpression="PersonName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RegistryID" HeaderText="Registry ID" SortExpression="RegistryID" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreatedByName" HeaderText="Created By" SortExpression="CreatedByName"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreatedDate" HeaderText="Date Created" SortExpression="CreatedDate" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                
                
                <telerik:GridTemplateColumn AllowFiltering ="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnlView" runat="server" ForeColor="#284775" CommandArgument='<%# Eval("pid") %>' CommandName='<%# Eval("pformid") %>' Text="POLST Data" OnClick="btnlView_Click"></asp:LinkButton>
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
 </td>
 </tr>
</table>

</asp:Panel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetPolstForms" TypeName="POLST.DataService.PolstFormDB">
        <SelectParameters>
            <asp:ControlParameter ControlID="rblStatusOptions" Name="FormStatusID" 
                PropertyName="SelectedValue" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
