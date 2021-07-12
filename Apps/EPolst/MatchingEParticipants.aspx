<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MatchingEParticipants.aspx.cs" Inherits="PolstWebApp.Apps.EPolst.MatchingEParticipants" MasterPageFile="~/Apps/PolstMaster.master" Title="Matching ePolst Participants" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Apps/Controls/ParticipantDemographics.ascx" TagPrefix="uc1" TagName="ParticipantDemographics" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxPanel ID="rdw1" runat="server" EnableEmbeddedScripts="true" Width="930px" Height="100%">

        <script language="javascript" type="text/javascript">
            function EditRegistrant(val) {

                RWOnShow();
                window.radopen("../Forms/EditRegistrant.aspx?ea=0&pid=" + val.toString(), "rwEditRegistrant");


            }

            function refreshPage(arg) {
                __doPostBack('failform', 'refresh')

            }
            function redirectPage(arg) {
                window.location = "Eparticipants.aspx";
            }

            function FailForm() {
                if (confirm("Are you sure you want to mark this Record as 'Failure'?")) {
                    var epid = GetParameterValueByName("epid")
                    RWOnShow();
                    window.radopen("FailRecord.aspx?epid=" + epid, "rwFailRecord");
                }

            }


        </script>
        <telerik:RadWindowManager Top="65px" Left="200px" Width="580px" Height="690px" ID="RadWindowManager1" runat="server" Skin="Vista">
            <Windows>

                <telerik:RadWindow ID="rwEditRegistrant" runat="server" Title="Edit Registrant" ReloadOnShow="false"
                    Modal="true" Skin="Vista" NavigateUrl="./Forms/EditRegistrant.aspx" VisibleOnPageLoad="false" />
                <telerik:RadWindow ID="rwFailRecord" runat="server" Title="Set record to Failure" ReloadOnShow="false"
                    Modal="true" Skin="Vista" NavigateUrl="FailRecord.aspx" VisibleOnPageLoad="false" Height="250px" />

            </Windows>
        </telerik:RadWindowManager>

        <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="930px">
            <div style="width: 920px" class="fmHead">ePOLST Data for Review</div>
           
            <div style="width: 920px">
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: left; width: 50%"><h3>Incoming POLST Data</h3></td>
                        <td style="text-align: right; padding-right: 20px; margin-top: 10px;">
                    <a id="ancViewPDF" runat="server" target="_blank" href="/apps/viewdocument.aspx?epitem=">
                        <img src='/images/pdficon.png' border='0' title="View uploaded PDF" style="vertical-align: middle" /></a><span style="font-size: 14px">&nbsp;|&nbsp;<a href="/apps/epolst/Eparticipants.aspx?status=3" style="font-family: segoe ui,arial,sans-serif; font-size: 14px">Back to ePolst</a></span>
                </td>
                    </tr>
                </table>
               
               
                <uc1:ParticipantDemographics runat="server" ID="ParticipantDemographics" />
                <div style="text-align: left; padding-left: 10px"><span class="fmTopPolstHeader">Reason for Manual Review: </span><span id="spSubStatus" runat="server"></span></div>
            </div>
            <hr style="width: 85%" />
            <div style="padding-top: 20px; padding-bottom: 0px; padding-right: 20px; padding-left: 20px; line-height: 25px; text-align: left">
                
                <div style="font-weight: 600">For the above incoming registrant info, below are possible matches in the database.</div>
                <p style="margin-top: 0px">
                    To <strong>Review the POLST Data</strong> for an OPR registrant, click <strong>POLST Data</strong>.</li>
                    To <strong>Confirm</strong> a match, click on <span style="font-weight: bold; color: #284775">Match: Submit ePolst to Pending</span>.<br />
                    To <strong>Enter as a New Registrant</strong>, click <span style="font-weight: bold; color: darkgreen">No Match: Create New ID</span>.<br />
                    To <strong>Reject this incoming POLST</strong>, click <span style="font-weight: bold; color: red">Mark record as Failure</span> (e.g., due to Archived Participant, Opt-Out, etc.).<br />
                </p>
                <div style="text-align:center;width: 100%; margin-top: 15px">
                    <span style="padding-left: 10px; padding-right: 10px"><asp:Button runat="server" ID="btnContinue" Text="No Match: Create New ID" Font-Bold="true" OnClick="btnContinue_Click" ForeColor="DarkGreen" ClientIDMode="Predictable" /></span>
                    <span style="padding-left: 10px; padding-right: 10px"><asp:Button runat="server" ID="btnCancel" Text="Cancel and Back to ePolst" Font-Bold="true" OnClick="btnCancel_Click" ForeColor="#284775"  ClientIDMode="Predictable" /></span>
                    <span style="padding-left: 10px; padding-right: 10px"><asp:Button runat="server" id="btnFailure" title="Mark record as Failure" Font-Bold="true" OnClientClick="javascript:FailForm();return false" Text="Mark record as Failure" ForeColor="Red" ClientIDMode="Predictable" /></span>
                </div>
            </div>

            <div style="padding-bottom: 10px">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" Visible="false" EnableViewState="false" Text="This Registrant already has one Pending Form"></asp:Label>
            </div>

            <div align="center">
                <h5 style="text-align: left; margin-bottom: 5px; padding-left: 10px">Possible Registry Matches:</h5>
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" EnableEmbeddedScripts="true"
                    AllowPaging="False" AllowSorting="False"
                    AutoGenerateColumns="false" Skin="Vista" PageSize="20" ShowStatusBar="true"
                    GridLines="Both" Font-Size="11px" Width="910px">
                    <FilterItemStyle HorizontalAlign="Left" />
                    <MasterTableView CommandItemDisplay="None" Width="910px" FilterItemStyle-Wrap="false"
                        CurrentResetPageIndexAction="SetPageIndexToFirst"
                        Dir="LTR" Frame="Border" TableLayout="Auto" AllowFilteringByColumn="false">
                        <AlternatingItemStyle BackColor="#DCE2F3" />

                        <Columns>

                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="25px">
                                <ItemTemplate>

                                    <a href='javascript:EditRegistrant(<%# Eval("ParticipantId")%>)' onmouseover="this.style.cursor='pointer'">
                                        <img src="../../Images/Edit.gif" alt="View Registrant" border="0" /></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="FullName" HeaderText="Name" SortExpression="FullName" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="GenderId" HeaderText="Gender" SortExpression="GenderId" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="70" DataField="RegistryId" HeaderText="Registry ID" SortExpression="RegistryId" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="50" DataField="PStatus" HeaderText="Status" SortExpression="PStatus" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="55" DataField="BirthDate" HeaderText="DOB" SortExpression="BirthDate" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="SSN" HeaderText="Last 4" SortExpression="SSN" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="StateId" HeaderText="State" SortExpression="StateId" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderStyle-Width="40" DataField="Zip" HeaderText="Zip" SortExpression="Zip" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Latest Date Signed" HeaderStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Left" BackColor="Yellow" />
                                <ItemTemplate>
                                    <span><%# Eval("MaxDateSigned")%></span>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="40px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnlViewForm" ForeColor="#284775" runat="server" CommandArgument='<%# Eval("ParticipantId")%>' CommandName='<%# Eval("PFormId")%>' Text="POLST Data" OnClick="btnlView_Click" Enabled='<%# HasValidPolstForm(Eval("PFormId"))%>'></asp:LinkButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="40px">
                                <ItemTemplate>

                                    <%# Eval("ScannedFormId") != null ? String.Format("<a href='/apps/viewdocument.aspx?item={0}' target='_blank' title='View PDF' /><img src='/images/pdficon.png' border='0' title='View uploaded PDF'></a>", Eval("ScannedFormId").ToString()) : "No PDF" %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnlNewForm2011" ForeColor="#284775" runat="server" Enabled='<%# int.Parse(Eval("PStatusId").ToString()) == 1 && _currentEParticipant.SubmissionStatus.Id == Polst.DataService.tbl_EP_SubmissionStatus.Pending ? true : false%>' CommandArgument='<%# Eval("ParticipantId")%>' CommandName='newForm>' Text='<%# int.Parse(Eval("ParticipantId").ToString()) == _currentEParticipant.ActualParticipantId && _currentEParticipant.SubmissionStatus.Id == Polst.DataService.tbl_EP_SubmissionStatus.Success ? _matchSubmittedText : _submitEPolstToPendingText %>' OnClick="btnlNew2011_Click"></asp:LinkButton>
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
