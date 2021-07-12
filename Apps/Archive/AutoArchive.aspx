<%@ page title="" language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Archive_AutoArchive, App_Web_wlxarlwq" theme="Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgMatching" />
                    <telerik:AjaxUpdatedControl ControlID="rgNonMatching" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rgMatching">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgMatching" />
				</UpdatedControls>
			</telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rgNonMatching">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgMNonMatching" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px">
		<div style="width: 940px" class="fmHead">
			Mass Archive</div>
             <telerik:radprogressmanager id="Radprogressmanager1" runat="server" />
              <telerik:RadProgressArea ID="progressArea1" runat="server" Skin="Telerik">
								</telerik:RadProgressArea>
             <div align="center" style="padding-left: 25px; text-align: center"> <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label></div>
		<table style="margin-top: 10px">
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" style="padding-top: 10px">
						<tr>
							<td valign="top" class="fmFieldHeader" style="padding-left: 10px; vertical-align: text-top">
								Upload File:
							</td>
							<td>
								<telerik:RadUpload ID="RadUpload1" runat="server" Skin="Vista" 
                                    InitialFileInputsCount="1" ControlObjectsVisibility="None"
									MaxFileInputsCount="1" AllowedFileExtensions="xlsx" InputSize="30" Width="300px"  />
								
							</td>
                            <td style="vertical-align: text-top; text-align: left">
                                <asp:Button ID="btnUpload" runat="server" Text="Upload" />
                            </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
                 <div>
                        <div align="left" style="text-align: left; font-size: 120%; font-weight: bold; margin-top: 20px">Non-Matching or Already Archived Participants</div>
						<telerik:RadGrid ID="rgNonMatching" runat="server" AllowFilteringByColumn="True" EnableLinqExpressions="false"
							AllowPaging="True" AllowSorting="True" ShowFooter="true"
							AutoGenerateColumns="false" Skin="Vista" PageSize="10" ShowStatusBar="false"
							GridLines="Both" Font-Size="11px" Width="930px">
							<FilterItemStyle HorizontalAlign="Left" />
							<PagerStyle Mode="NextPrevAndNumeric" />
							<MasterTableView CommandItemDisplay="None" Width="930px" FilterItemStyle-Wrap="false"
								CurrentResetPageIndexAction="SetPageIndexToFirst" AllowAutomaticInserts="false"
								Frame="Border" TableLayout="fixed">
								<AlternatingItemStyle BackColor="#DCE2F3" Height="15px" />
								<ItemStyle Height="15px" />
								<Columns>
									<telerik:GridBoundColumn HeaderStyle-Width="125px" DataField="PID" HeaderText="PID"
										SortExpression="PID" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
									<telerik:GridBoundColumn HeaderStyle-Width="150px" DataField="RegistryID" HeaderText="Registry ID"
										SortExpression="RegistryID" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
									<telerik:GridBoundColumn HeaderStyle-Width="250px" DataField="NotArchivableReason" HeaderText="Reason"
										SortExpression="NotArchivableReason" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
								
								 
								</Columns>
							</MasterTableView>
						</telerik:RadGrid>
					</div>
					<div style="padding-top: 20px">
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; font-size: 120%; font-weight: bold">Archiveable Matching Participants</td>
                                <td style="text-align: right"><asp:Button ID="btnArchive" runat="server" Text="Archive these Participants" /></td>
                            </tr>
                        </table>

						<telerik:RadGrid ID="rgMatching" runat="server" AllowFilteringByColumn="True" EnableLinqExpressions="false"
							AllowPaging="True" AllowSorting="True" ShowFooter="true"
							AutoGenerateColumns="false" Skin="Vista" PageSize="10" ShowStatusBar="false"
							GridLines="Both" Font-Size="11px" Width="930px">
							<FilterItemStyle HorizontalAlign="Left" />
							<PagerStyle Mode="NextPrevAndNumeric" />
							<MasterTableView CommandItemDisplay="None" Width="930px" FilterItemStyle-Wrap="false"
								CurrentResetPageIndexAction="SetPageIndexToFirst" AllowAutomaticInserts="false"
								Frame="Border" TableLayout="fixed">
								<AlternatingItemStyle BackColor="#DCE2F3" Height="15px" />
								<ItemStyle Height="15px" />
								<Columns>
									<telerik:GridBoundColumn HeaderStyle-Width="125px" DataField="PID" HeaderText="PID"
										SortExpression="PID" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
									<telerik:GridBoundColumn HeaderStyle-Width="150px" DataField="RegistryID" HeaderText="Registry ID"
										SortExpression="RegistryID" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
									<telerik:GridBoundColumn HeaderStyle-Width="250px" DataField="LName" HeaderText="Last Name"
										SortExpression="LName" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
									<telerik:GridBoundColumn HeaderStyle-Width="250px" DataField="FName" HeaderText="First Name"
										SortExpression="FName" ItemStyle-HorizontalAlign="Left">
									</telerik:GridBoundColumn>
								 
								</Columns>
							</MasterTableView>
						</telerik:RadGrid>
					</div>
                   
				</td>
			</tr>
		</table>
	</asp:Panel>
</asp:Content>
