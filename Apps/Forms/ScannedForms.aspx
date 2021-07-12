<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScannedForms.aspx.cs" Inherits="PolstWebApp.Apps.Forms.ScannedForms" MasterPageFile="~/Apps/PolstMaster.master" Title="Scanned Forms" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript" type="text/javascript">
  function ShowInsertForm()
            {
                RWOnShow();
               window.radopen("NewScannedForm.aspx?rid=2", "rwNewScannedForm");         
               return false;
            }

            function refreshPage(arg)
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
                     <telerik:AjaxSetting AjaxControlID="rblStatusOptions">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                      <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="rblStatusOptions" />
                        </UpdatedControls>
                    </telerik:AjaxSetting> 
                </AjaxSettings>
</telerik:RadAjaxManager>
            
 <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" >
 <div style="width: 940px" class="fmHead">Scanned Forms</div>
 <table style="margin-top: 10px">
 <tr>
 <td align="left">
  <asp:RadioButtonList ID="rblStatusOptions" runat="server" 
         RepeatDirection="Horizontal" AutoPostBack="True">
        <asp:ListItem Value="1" Text="Unassigned" Selected="True"></asp:ListItem>
        <asp:ListItem Value="2" Text="Assigned"></asp:ListItem>
 </asp:RadioButtonList>
  <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>

 </td>
 <td align="right" style="padding-right: 15px">
    <asp:Button ID="btnNewForm" runat="server" Text="New Form" OnClientClick="return ShowInsertForm();" CssClass="ruButton" />
 </td>
 </tr>
 <tr>
 <td colspan="2" align="center">
  <div id="GridContainer">
     <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" EnableLinqExpressions="false"
         AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" ShowFooter="true" OnDeleteCommand="RadGrid1_DeleteCommand"
         AutoGenerateColumns="false" Skin="Vista" PageSize="10" ShowStatusBar="false"
          GridLines="Both" Font-Size="11px" Width="930px" Height="365px" >
         <FilterItemStyle HorizontalAlign="Left" />
         <PagerStyle Mode="NextPrevAndNumeric" />
         <MasterTableView CommandItemDisplay="None" Width="930px" FilterItemStyle-Wrap="false"
             CurrentResetPageIndexAction="SetPageIndexToFirst"  AllowAutomaticInserts="false"
             datasourceid="ObjectDataSource1" Frame="Border" TableLayout="fixed">
             <AlternatingItemStyle BackColor="#DCE2F3" Height="15px"  />
             
             <ItemStyle Height="15px" />
             
             <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="20px">
                    <ItemTemplate>
                        <asp:ImageButton ID="btniDelete" ImageUrl="~/images/Delete.gif" runat="server" CommandArgument='<%# Eval("ScannedFormID") %>' CommandName="Delete" OnClientClick="javascript:return confirm('Delete the selected Scanned Form?')" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
               
                <telerik:GridBoundColumn HeaderStyle-Width="300px" DataField="FileName" HeaderText="File Name" SortExpression="FileName" ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="280px" DataField="PersonName" HeaderText="Uploaded By" SortExpression="PersonName" ItemStyle-HorizontalAlign="Left" ></telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderStyle-Width="170px" DataField="UploadedDate" HeaderText="Date Uploaded" SortExpression="UploadedDate"  ItemStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                <telerik:GridTemplateColumn AllowFiltering="false">
                <ItemStyle Width="75px" />
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkViewDoc" runat="server" NavigateUrl='<%# "~/Apps/ViewDocument.aspx?item=" + Eval("ScannedFormID") %>' Target="_blank" ForeColor="#284775" ToolTip="View Scanned Form" Text="View"></asp:HyperLink>
                        
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                
              
             </Columns>
             
             
         </MasterTableView>
      
     </telerik:RadGrid>
     </div>
 </td>
 </tr>
</table>
</asp:Panel>
   

<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetScannedForms" 
        TypeName="Polst.BusinessLogic.ScannedFormProvider">
       
       
       <SelectParameters>
           <asp:ControlParameter ControlID="rblStatusOptions" Name="ScannedFormStatus" 
               PropertyName="SelectedValue" Type="Object" />
       </SelectParameters>
    </asp:ObjectDataSource>
    <telerik:RadWindowManager Top="65px" Left="200px" Width="580px" Height="500px" ID="RadWindowManager1"
        runat="server" Skin="Vista">
        <Windows>
            
            <telerik:RadWindow ID="rwNewScannedForm" runat="server" Title="New Form" ReloadOnShow="false"
                Modal="true" Skin="Vista" NavigateUrl="NewScannedForm.aspx" VisibleOnPageLoad="false" />
           
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
