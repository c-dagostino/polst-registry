<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EParticipants.aspx.cs" Inherits="PolstWebApp.Apps.EPolst.EParticipants" MasterPageFile="~/Apps/PolstMaster.master" Title="ePolst Participants" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="dialogFormsContainer">
        <ul id="ulErrors">

        </ul>
    </div>
   
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
              <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="btnRefresh" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rblStatusOptions">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnRefresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                </UpdatedControls>
            </telerik:AjaxSetting>

        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadWindowManager Top="65px" Left="200px" Width="580px" Height="690px" ID="RadWindowManager1" runat="server" Skin="Vista">
        <Windows>

            <telerik:RadWindow ID="rwEditRegistrant" runat="server" Title="Edit Registrant" ReloadOnShow="false"
                Modal="true" Skin="Vista" NavigateUrl="./Forms/EditRegistrant.aspx" VisibleOnPageLoad="false" />

        </Windows>
    </telerik:RadWindowManager>

    <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px">
        <div style="width: 940px" class="fmHead">ePOLST Participants</div>
        <table style="margin-top: 10px;">
            <tr>
                <td align="left">
                    <asp:RadioButtonList ID="rblStatusOptions" runat="server" OnSelectedIndexChanged="rblStatusOptions_SelectedIndexChanged"
                        RepeatDirection="Horizontal" AutoPostBack="True" CausesValidation="true">
                    </asp:RadioButtonList>
                    <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label>
                </td>
                <td align="right">Get Last <asp:TextBox ID="txtDaysToGet" runat="server" Text="10" Width="30"></asp:TextBox> Days <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="ruButton" OnClick="btnRefresh_Click" /><br />
                    <asp:RangeValidator ID="rvDaysToGet" CssClass="validation" runat="server" MinimumValue="1" MaximumValue="90" ControlToValidate="txtDaysToGet" Type="Integer" Text="Days to Get must be a number between 1 and 90"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td colspan="2" id="GridContainer">
                   
                    <telerik:RadGrid runat="server" AllowFilteringByColumn="True" EnableLinqExpressions="false" ID="RadGrid1"
                        AllowPaging="True" AllowSorting="True" ShowFooter="true" OnItemCommand="RadGrid1_ItemCommand"
                        AutoGenerateColumns="false" Skin="Vista" PageSize="20" ShowStatusBar="false"
                        GridLines="Both" Font-Size="11px" Width="930px" Height="365px">
                        <FilterItemStyle HorizontalAlign="Left" />

                        <PagerStyle Mode="NextPrevAndNumeric" AlwaysVisible="true" />
                        <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false" CurrentResetPageIndexAction="SetPageIndexToFirst" AllowAutomaticInserts="false" Frame="Border" TableLayout="fixed">

                            <AlternatingItemStyle BackColor="#DCE2F3" />

                            <Columns>
                                <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="EditRegistrant" ItemStyle-Width="30" HeaderStyle-Width="30" >
                                    <ItemTemplate>
                                        <asp:Panel ID="editRegPanel" runat="server" Visible='<%# Eval("ActualParticipantId") != null%>'>
                                            <a href='javascript:EditRegistrant(<%# Eval("ActualParticipantId")%>)' onmouseover="this.style.cursor='pointer'">
                                                <img src="../../Images/Edit.gif" alt="View Registrant" border="0" /></a>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                          
                                <telerik:GridBoundColumn DataField="FullName" HeaderText="Full Name" SortExpression="FullName" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ActualParticipantId" HeaderText="Participant ID" SortExpression="ActualParticipantId" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BirthDate" HeaderText="DOB" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SSN" HeaderText="Last 4" SortExpression="SSN" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CreatedDate" HeaderText="Date Created" SortExpression="CreatedDate" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>


                                <telerik:GridTemplateColumn AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnlView" runat="server" ForeColor="#284775" CommandArgument='<%# Eval("Id") %>' CommandName='<%# Eval("Id") %>' Text="Process" OnClick="btnlView_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnlPolst" runat="server" ForeColor="#284775" CommandArgument='<%# Eval("Id") %>' CommandName='<%# Eval("RegistryForm.ActualPolstFormId") %>' Visible='<%# Eval("RegistryForm.ActualPolstFormId") != null %>' Text="Polst Form" OnClick="btnlView_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                 <telerik:GridTemplateColumn AllowFiltering="false">
                                    <ItemTemplate>
                                        <a onclick="javascript:void(0);"  onmouseover="this.style.cursor='pointer'" epid='<%# Eval("Id") %>' class="jqGetError">Errors</a>
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpScripts" runat="Server">
     
     <script src="../Scripts/EParticipants/EParticipants.js" type="text/javascript"></script>
    <style>
        .ui-dialog-titlebar {background-color: #e798a8}
    </style>
</asp:Content>