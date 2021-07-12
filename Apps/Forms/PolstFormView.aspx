<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Forms_PolstFormView, App_Web_agr5ncgw" title="POLST, Form View" clientidmode="Static" theme="Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Controls/ParticipantDemographics.ascx" TagName="ParticipantDemographics"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpScripts" runat="Server">
    

        <script type="text/javascript" src="../Scripts/PolstFormView.js"></script>
         <script type="text/javascript">

             function refreshPage() {
                 __doPostBack('page', 'refreshData');
             }

             function archiveForm() {

                 RWOnShow();
                 window.radopen('./ArchivePolstForm.aspx?rfid=<%= CurrentPFID.ToString + "&pid=" + _objP.ParticipantID.toString()  %>', "rwArchive");
            return false;
        }

    </script>
    

    <script type="text/javascript" src="../Scripts/PolstForm2011.js?id=<%= DateTime.Now.ToShortDateString() %>""></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script type="text/javascript" src="../Scripts/PolstFormView.js?id=<%= DateTime.Now.ToShortDateString() %>""></script>
   
    <telerik:RadWindowManager Top="65px" Width="730px" Height="690px" ID="RadWindowManager1"
        runat="server" Skin="Vista">
        <Windows>
            <telerik:RadWindow ID="rwArchive" runat="server" Title="Archive Polst Form" ReloadOnShow="false"
                Modal="true" Skin="Vista" NavigateUrl="ArchivePolstForm.aspx" VisibleOnPageLoad="false"
                Top="35px" Left="100px" Width="640px" Height="470px" />
        </Windows>
    </telerik:RadWindowManager>
    <div id="activateDialogForm" title="POLST Form Summary Review" class="editor-field dialog-box"
        style="font-size: 110%">
        <table>
            <tr>
                <td class="fmFieldHeader" style="width: 150px">
                    Patient Name:
                </td>
                <td class="fmFieldText" id="lblSubmitPatientName">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    DOB:
                </td>
                <td class="fmFieldText" id="lblSubmitDOB">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader" colspan="2" style="text-align: left">
                    The following Orders were selected:
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section A:
                </td>
                <td class="fmFieldText" id="lblSubmitCPR">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section B:
                </td>
                <td class="fmFieldText" id="lblSubmitMedIntervention">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section B<br />
                    Additional Orders:
                </td>
                <td class="fmFieldText" id="lblSubmitMedInterventionAO">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section C:
                </td>
                <td class="fmFieldText" id="lblSubmitAntibiotics">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section C<br />
                    Additional Orders:
                </td>
                <td class="fmFieldText" id="lblSubmitAntibioticsAO">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section D:
                </td>
                <td class="fmFieldText" id="lblSubmitAAN">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Section D<br />
                    Additional Orders:
                </td>
                <td class="fmFieldText" id="lblSubmitAANAO">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Signing MD/NP/PA Name:
                </td>
                <td class="fmFieldText" id="tclSubmitSignerName">
                </td>
            </tr>
            <tr>
                <td class="fmFieldHeader">
                    Date Signed:
                </td>
                <td class="fmFieldText" id="tclSubmitDateSigned">
                </td>
            </tr>
        </table>
    </div>
     <div id="divProcessing" style="display:none;"><img src="../../Images/page-loading.gif" /></div>
    <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" HorizontalAlign="Center">
        <table width="950px" cellpadding="0" cellspacing="0">
            <tr>
                <td class="fmHead" style="width: 100%" id="tclHead" runat="server" colspan="2">
                    2009 POLST Form
                </td>
            </tr>
           <tr id="trwAddEdit" runat="server">
                <td colspan="2" align="right" style="padding-top: 10px; padding-bottom: 10px; padding-right: 30px">
                    <asp:HyperLink ID="lnkEdit" runat="server" Text="Edit Form" Font-Bold="true" CssClass="jqPostbackElement" onClick="return BeginProcessing(true, this);"></asp:HyperLink>&nbsp;|&nbsp;<asp:LinkButton OnClick="btnlNew2011_Click" OnClientClick="BeginProcessing(true, this);"
                        ID="btnlNew2011" runat="server" Text="New 2011/2014 Form" Font-Bold="true" CausesValidation="false" CssClass="jqPostbackElement"></asp:LinkButton>&nbsp;|&nbsp;<asp:LinkButton
                            ID="btnlNew" runat="server" Text="New 2009 Form" Font-Bold="true" CausesValidation="false" OnClick="btnlNew_Click"  OnClientClick="BeginProcessing(true, this);" CssClass="jqPostbackElement"></asp:LinkButton>
                    &nbsp;|&nbsp;<a href="NewRegistrant.aspx" style="font-weight: bold"  OnClick="BeginProcessing(true, this)" class="jqPostbackElement">New Registrant</a><span
                        id="spBack" runat="server">&nbsp;|&nbsp;<asp:HyperLink ID="lnkBack" runat="server"
                            Text="Back to Search Results" Font-Bold="true" CssClass="jqPostbackElement" onClick="BeginProcessing(true, this);"></asp:HyperLink></span>
                    <div>
                        <asp:Label ID="lblMessageNewForm" runat="server" EnableViewState="False" ForeColor="Red"
                            Visible="False" Width="400px">There is already a Pending 
        form for this Registrant</asp:Label></div>
                </td>
            </tr>
            <tr>
                <td style="padding-bottom: 10px; padding-top: 10px" colspan="2">
                    <div class="innerFormPanel">
                        <div style="text-align: center" align="center">
                            <asp:Label ID="lblNoForm" runat="server" ForeColor="Red" Visible="false" EnableViewState="false">The Requested POLST Form no longer exists.</asp:Label></div>
                        <uc1:ParticipantDemographics ID="ParticipantDemographics1" runat="server" />
                    </div>
                    <div align="center">
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation"
                            Visible="false"></asp:Label></div>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    <div style="display: inline; padding-right: 15px">
                        <asp:Button ID="btnActivate" Text="Activate Form" runat="server" OnClientClick="javascript:return false;"
                            EnableViewState="false" />
                    </div>
                    <div style="display: inline; padding-right: 15px">
                        <asp:Button ID="btnArchive" Text="Archive Form" runat="server" OnClientClick="javascript:return archiveForm()"
                            EnableViewState="false" />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr id="trwNoPolstForm" runat="server">
                            <td align="center" colspan="2">
                                <asp:Label ID="lblNoPlostForm" runat="server" Font-Bold="true" Visible="false">NO POLST FORMS ARE CURRENTLY ASSOCIATED WITH THIS REGISTRANT.</asp:Label>
                            </td>
                        </tr>
                        <tr valign="top" id="trwSelectedForm" runat="server" visible="false">
                            <td colspan="2">
                                <table>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" nowrap>
                                            Selected POLST Form:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <div style="padding-right: 10px; padding-top: 5px; padding-left: 5px; padding-bottom: 5px;
                                                    display: inline">
                                                    <asp:DropDownList ID="ddlPostForms" AutoPostBack="true" runat="server" Style="font-size: 11px;">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader">
                                            Form Status:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel" style="padding-bottom: 5px;">
                                                <asp:Label ID="lblFormStatus" runat="server" Text="Pending" Font-Bold="true" Style="padding-left: 5px"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top" id="trwArchiveDetails" runat="server">
                                        <td class="fmFieldHeader">
                                        </td>
                                        <td style="padding-top: 10px;" align="left">
                                            <div class="innerFormPanel" style="padding-bottom: 10px">
                                                <table align="left">
                                                    <tr valign="top">
                                                        <td rowspan="4" width="10px">
                                                        </td>
                                                        <td class="fmFieldHeader" nowrap>
                                                            Archive Reason:
                                                        </td>
                                                        <td class="fmFieldText">
                                                            <asp:Label ID="lblArchivedReason" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td class="fmFieldHeader" nowrap>
                                                            Archive Notes:
                                                        </td>
                                                        <td class="fmFieldText">
                                                            <asp:Label ID="lblArchiveNotes" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td class="fmFieldHeader" nowrap>
                                                            Archived Date:
                                                        </td>
                                                        <td class="fmFieldText">
                                                            <asp:Label ID="lblArchivedDate" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td class="fmFieldHeader" nowrap>
                                                            Archived by:
                                                        </td>
                                                        <td class="fmFieldText">
                                                            <asp:Label ID="lblArchivedBy" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" nowrap>
                                            Scanned Form:
                                        </td>
                                        <td class="fmFieldText" style="padding-right: 10px">
                                            <div class="innerFormPanel" style="padding-bottom: 5px">
                                                <div style="padding-left: 5px; display: inline">
                                                    <asp:HyperLink ID="lnkScannedForm" runat="server" NavigateUrl="#" Enabled="true"
                                                        Text="View Form" Target="_blank"></asp:HyperLink></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" nowrap>
                                            A. Cardiopulmonary<br />
                                            Resuscitation:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <div id="divCPR" runat="server">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            B. Medical Interventions:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <div id="divMedIntervention" runat="server">
                                                </div>
                                                <div class="aomargins">
                                                    Additional Orders:&nbsp;<asp:Label ID="lblMedInterventionAO" runat="server" CssClass="polstViewTextHeightNormal"></asp:Label></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            C. Antibiotics:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <div id="divAntibiotics" runat="server">
                                                </div>
                                                <div class="aomargins">
                                                    Additional Orders:&nbsp;<asp:Label ID="lblAntibioticsAO" runat="server" CssClass="polstViewTextHeightNormal"></asp:Label></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            D. Artificially Administered<br />
                                            Nutrition:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <div id="divAAN" runat="server">
                                                </div>
                                                <div class="aomargins">
                                                    Additional Orders:&nbsp;<asp:Label ID="lblAANutritionAO" runat="server" CssClass="polstViewTextHeightNormal"></asp:Label></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            E. Reason for Orders<br />
                                            and Signatures:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <table cellpadding="0" cellspacing="0" style="padding: 5px; color: #333333">
                                                    <tr>
                                                        <td class="fmFieldHeader" style="vertical-align: text-top;">
                                                            Discussed with:
                                                        </td>
                                                        <td class="fmFieldText" style="vertical-align: text-top">
                                                            <table style="vertical-align: text-top">
                                                                <tr>
                                                                    <td style="text-align: left;" nowrap>
                                                                        <asp:Image ID="imgROSPatient" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td align="left">
                                                                        Patient
                                                                    </td>
                                                                    <td style="text-align: left;" nowrap>
                                                                        <asp:Image ID="imgROSHCR" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td>
                                                                        Health Care Representative
                                                                    </td>
                                                                    <td style="text-align: left; vertical-align: middle" nowrap>
                                                                        <asp:Image ID="imgROSOther" runat="server" ImageUrl="~/Images/cbEmpty.gif" /><td>
                                                                            Other
                                                                        </td>
                                                                        <td id="tclOtherText" runat="server">
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;" nowrap>
                                                                        <asp:Image ID="imgROSParentOfMinor" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td>
                                                                        Parent of Minor
                                                                    </td>
                                                                    <td style="text-align: left;" nowrap>
                                                                        <asp:Image ID="imgROSGaurdian" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td align="left">
                                                                        Court-Appointed Guardian
                                                                    </td>
                                                                    <td style="text-align: left;" nowrap>
                                                                        <asp:Image ID="imgROSNotFilledOut" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td colspan="3" align="left">
                                                                        Not Filled Out
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;" nowrap>
                                                                        <asp:Image ID="imgROSSurrogate" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td colspan="6" align="left">
                                                                        Surrogate for patient with developmental disabilities
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table>
                                                                <tr>
                                                                    <td class="fmFieldHeader" nowrap>
                                                                        Signing MD/NP/PA<br />
                                                                        Name:
                                                                    </td>
                                                                    <td class="fmFieldText">
                                                                        <asp:Label ID="lblSigningPhys" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="fmFieldHeader" valign="top" style="padding-left: 10px; vertical-align: text-top">
                                                                        Cert:
                                                                    </td>
                                                                    <td class="fmFieldText">
                                                                        <asp:Label ID="lblSigningPhysCert" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="fmFieldHeader" valign="top" style="padding-left: 10px; vertical-align: text-top">
                                                                        Licenses:
                                                                    </td>
                                                                    <td class="fmFieldText">
                                                                        <asp:Label ID="lblSigningPhysLicenses" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="fmFieldHeader" nowrap>
                                                                        <asp:CustomValidator ID="cvDateSigned" runat="server" EnableClientScript="false"
                                                                            ErrorMessage="A valid date signed is required" Text="*"></asp:CustomValidator>
                                                                        Date Signed:
                                                                    </td>
                                                                    <td class="fmFieldText" style="vertical-align: middle">
                                                                        <asp:Label ID="lblDateSigned" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td colspan="2" class="fmFieldText">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Image ID="imgSignerVerified" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    Signer Verified
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td class="fmFieldHeader" nowrap>
                                                                        License Expire Date:
                                                                    </td>
                                                                    <td class="fmFieldText" style="vertical-align: middle">
                                                                        <asp:Label ID="lblLicenseExpireDate" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr id="trwPCPName" runat="server">
                                                                    <td class="fmFieldHeader">
                                                                        PCP Name:
                                                                    </td>
                                                                    <td class="fmFieldText" colspan="5">
                                                                        <asp:Label ID="lblPCPName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            Additional Information:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel" style="text-align: left; vertical-align: middle; padding-bottom: 5px;">
                                                <asp:Label ID="lblAdditionInformation" runat="server" Style="padding-left: 5px"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: middle">
                                            Back Page:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="imgBackPageIsMissing" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                        </td>
                                                        <td>
                                                            <strong>Back page is missing</strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            Signature of<br />
                                            Representative:
                                        </td>
                                        <td class="fmFieldText">
                                            <asp:UpdatePanel ID="updSigRelation" runat="server">
                                                <ContentTemplate>
                                                    <div class="innerFormPanel">
                                                        <table cellpadding="0" cellspacing="0" style="padding: 5px">
                                                            <tr>
                                                                <td class="fmFieldHeader" style="color: #333333">
                                                                    Form is Signed:
                                                                </td>
                                                                <td class="fmFieldText" colspan="2">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="imgFormIsSignedYes" runat="server" ImageUrl="~/Images/rbEmpty.gif" />
                                                                            </td>
                                                                            <td>
                                                                                Yes
                                                                            </td>
                                                                            <td>
                                                                                <asp:Image ID="imgFormIsSignedNo" runat="server" ImageUrl="~/Images/rbEmpty.gif" />
                                                                            </td>
                                                                            <td>
                                                                                No
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fmFieldHeader" style="color: #333333">
                                                                    If Yes, Relationship:
                                                                </td>
                                                                <td class="fmFieldText">
                                                                    <asp:Label ID="lblSignedRelationship" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            Contact Information:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <table cellpadding="0" cellspacing="0" style="padding: 5px">
                                                    <tr>
                                                        <td class="fmFieldHeader" style="color: #333333">
                                                            Prepared by HCP:
                                                        </td>
                                                        <td class="fmFieldText">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="imgHCPYes" runat="server" ImageUrl="~/Images/rbEmpty.gif" />
                                                                    </td>
                                                                    <td>
                                                                        Yes
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="imgHCPNo" runat="server" ImageUrl="~/Images/rbEmpty.gif" />
                                                                    </td>
                                                                    <td>
                                                                        No
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td class="fmFieldHeader" style="color: #333333">
                                                            If Yes, Title:
                                                        </td>
                                                        <td class="fmFieldText" style="vertical-align: middle">
                                                            <asp:Label ID="lblHCPFillerTitle" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="fmFieldHeader" style="color: #333333">
                                                            Is the PCP the Form Signer:
                                                        </td>
                                                        <td class="fmFieldText" id="tclPCPIsFormSigner" runat="server">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            Sender:
                                        </td>
                                        <td class="fmFieldText">
                                            <div class="innerFormPanel">
                                                <table cellpadding="0" cellspacing="0" style="padding: 5px">
                                                    <tr>
                                                        <td colspan="2">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px">
                                                                        Date Received:
                                                                    </td>
                                                                    <td class="fmFieldText" align="left" style="text-align: left;">
                                                                        <asp:Label ID="lblDateRcvd" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px" style="padding-top: 5px">
                                                                        Name:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblSenderName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px" style="padding-top: 5px">
                                                                        Address 1:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblAddress1" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px" style="padding-top: 5px">
                                                                        Address 2:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblAddress2" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left">
                                                            <table>
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px" style="padding-top: 5px">
                                                                        City:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblCity" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="fmFieldHeader" style="padding-left: 10px; padding-top: 5px">
                                                                        State:
                                                                    </td>
                                                                    <td class="fmFieldText" width="100px" style="padding-top: 5px">
                                                                        <asp:Label ID="lblState" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="fmFieldHeader" style="padding-left: 10px; padding-top: 5px">
                                                                        Zip:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblZip" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left">
                                                            <table>
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px" style="padding-top: 5px">
                                                                        Phone:
                                                                    </td>
                                                                    <td class="fmFieldText" width="100px" style="padding-top: 5px">
                                                                        <asp:Label ID="lblPhone" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td class="fmFieldHeader" style="padding-left: 10px; padding-top: 5px">
                                                                        Ext:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblExt" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="fmFieldHeader" width="100px" style="padding-top: 5px">
                                                                        Fax:
                                                                    </td>
                                                                    <td class="fmFieldText" style="padding-top: 5px">
                                                                        <asp:Label ID="lblFax" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px" align="center">
                                                            <hr style="width: 80%" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2" style="padding-left: 30px">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="imgNoSenderRequired" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td>
                                                                        <strong>No Sender Letter Required</strong>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;OR&nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="imgNoSignerInfo" runat="server" ImageUrl="~/Images/cbEmpty.gif" />
                                                                    </td>
                                                                    <td>
                                                                        <strong>No Sender/Signer Info Received with form</strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            Entered By:
                                        </td>
                                        <td class="fmFieldText" style="padding-top: 5px;">
                                            <div class="innerFormPanel" style="text-align: left; vertical-align: middle; padding-bottom: 5px;">
                                                <asp:Label ID="lblEnteredBy" runat="server" Style="padding-left: 5px"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="fmFieldHeader" style="vertical-align: text-top">
                                            Last Modified By:
                                        </td>
                                        <td class="fmFieldText" style="padding-top: 5px;">
                                            <div class="innerFormPanel" style="text-align: left; vertical-align: middle; padding-bottom: 5px;">
                                                <table>
                                                    <tr>
                                                        <td id="tclModifiedBy" colspan="2" runat="server" style="text-align: left">
                                                        </td>
                                                    </tr>
                                                    <tr id="trwUpdateMade" runat="server">
                                                        <td valign="top">
                                                            Update(s) Made:
                                                        </td>
                                                        <td id="tclModifiedNote" runat="server" style="padding-left: 5px">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="lblModifiedBy" runat="server" Style="padding-left: 5px"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
