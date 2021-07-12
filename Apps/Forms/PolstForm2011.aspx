<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolstForm2011.aspx.cs" Inherits="PolstWebApp.Apps.Forms.PolstForm2011" MasterPageFile="~/Apps/PolstMaster.master" Title="Polst Form" %>

 
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="txtBoxLengthValidator" Namespace="txtBoxLengthValidator" TagPrefix="cc1" %>
<%@ Register Src="../Controls/ParticipantDemographics.ascx" TagName="ParticDemographics" TagPrefix="uc2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpScripts" runat="Server">
    <script language="javascript" type="text/javascript">

        var redClass = "<%= _RedClass %>";
        var yellowClass = "<%= _YellowClass %>";
        var blueClass = "<%= _BlueClass %>";
        var greenClass = "<%= _GreenClass %>";
        var participantId = "<%=  _objP.ParticipantID %>";
    </script>

    <script type="text/javascript" src="../Scripts/PolstForm2011.js?id=<%= DateTime.Now.ToShortDateString() %>""></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>

            <telerik:RadWindowManager Top="65px" Width="730px" Height="690px" ID="RadWindowManager2"
                runat="server" Skin="Vista">
                <Windows>
                    <telerik:RadWindow ID="rwArchive" runat="server" Title="Archive Polst Form" ReloadOnShow="false"
                        Modal="true" Skin="Vista" NavigateUrl="ArchivePolstForm.aspx" VisibleOnPageLoad="false"
                        Top="35px" Left="100px" Width="640px" Height="400px" />
                    <telerik:RadWindow ID="rwNewScannedForm" runat="server" Title="Upload Scanned Form"
                        ReloadOnShow="false" Modal="true" Skin="Vista" NavigateUrl="ArchivePolstForm.aspx"
                        VisibleOnPageLoad="false" Top="35px" Left="100px" Width="640px" Height="280px" />
                </Windows>
            </telerik:RadWindowManager>
            <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" HorizontalAlign="Center">
                <table width="950px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="fmHead" style="width: 100%" id="tclHead" runat="server" colspan="2">2011/2014 POLST Form
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom: 10px; padding-top: 10px; text-align: center" colspan="2">
                            <div align="right" style="width: 750px">
                                <asp:LinkButton ID="btnlEditParticipant" runat="server" Text="Edit Registrant" OnClientClick="return ShowInsertForm();"  />
                            </div>
                            <div class="innerFormPanel">

                                <uc2:ParticDemographics ID="ParticDemographics1" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" nowrap>Form Status:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel" style="padding-bottom: 5px">
                                <asp:Label ID="lblFormStatus" runat="server" Text="Pending" ForeColor="Teal" Font-Bold="true"
                                    Style="padding-left: 5px;"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" nowrap>
                            <asp:CustomValidator ID="cvScannedForm" runat="server" EnableClientScript="false" OnServerValidate="cvScannedForm_ServerValidate"
                                ErrorMessage="You must select a scanned form" Text="*"></asp:CustomValidator>
                            Scanned Form:
                        </td>
                        <td class="fmFieldText" style="padding-right: 10px;">
                            <asp:Panel ID="pnlddlScannedForm" runat="server" Visible="true" class="innerFormPanel"
                                Style="padding-bottom: 5px">
                                <asp:UpdatePanel ID="updScannedForm" runat="server">
                                    <ContentTemplate>
                                        <div style="padding-left: 5px; display: inline">
                                            <asp:DropDownList ID="ddlScannedForm" Font-Size="11px" runat="server" TabIndex="2" OnSelectedIndexChanged="ddlScannedForm_SelectedIndexChanged"
                                                ClientIDMode="Static" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                        <div style="padding-left: 10px; display: inline">
                                            <asp:HyperLink ID="lnkScannedForm" runat="server" NavigateUrl="#" Enabled="false"
                                                Text="View Form" Target="_blank"></asp:HyperLink>
                                        </div>
                                        <div style="padding-left: 10px; display: inline">
                                            <asp:LinkButton ID="btnlNewScannedForm" runat="server" OnClientClick="return ShowUploadForm()"
                                                Text="Upload New Form"></asp:LinkButton>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <asp:Panel ID="pnlLnkScannedForm" runat="server" Visible="false" class="innerFormPanel"
                                Style="padding-bottom: 5px;">
                                <div style="padding-left: 5px; display: inline">
                                    <asp:HyperLink ID="lnkScannedForm2" runat="server" NavigateUrl="#" Enabled="true"
                                        Text="View Form" Target="_blank"></asp:HyperLink>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" nowrap>
                            <asp:CustomValidator ID="cvCPR" runat="server" EnableClientScript="false" OnServerValidate="cvCPR_ServerValidate" ErrorMessage="Cardiopulmonary Resuscitation is Required"
                                Text="*"></asp:CustomValidator>
                            A. Cardiopulmonary<br />
                            Resuscitation:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel" id="divCPR">
                                <asp:RadioButtonList ID="rblCPR" runat="server" RepeatDirection="Horizontal" TabIndex="3"
                                    CssClass="jqCPRRadio" ClientIDMode="Static">
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="false"
                                ErrorMessage="A Medical Intervention selection is required" Text="*" Display="Dynamic"
                                ControlToValidate="rblMedIntervention"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvMedIntervention" runat="server" OnServerValidate="cvMedIntervention_ServerValidate" EnableClientScript="false" ErrorMessage="Comfort Measures Only can not be selected when Attempt Resuscitation/CPR is selected" Text="*"></asp:CustomValidator>
                            B. Medical Interventions:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel">
                                <asp:RadioButtonList ID="rblMedIntervention" runat="server" RepeatDirection="Vertical"
                                    TabIndex="10" ClientIDMode="Static">
                                </asp:RadioButtonList>
                                <div style="height: 30px; padding-left: 5px">
                                    Additional Orders:&nbsp;<asp:TextBox ID="txtMedicalInterventionAO" TabIndex="21"
                                        runat="server" MaxLength="1000" Width="600"></asp:TextBox>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" EnableClientScript="false"
                                ErrorMessage="An Artificially Administered Nutrition selection is required" Text="*"
                                Display="Dynamic" ControlToValidate="rblAANutrition"></asp:RequiredFieldValidator>
                            C. Artificially Administered<br />
                            Nutrition:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel">
                                <asp:RadioButtonList ID="rblAANutrition" runat="server" RepeatDirection="Vertical"
                                    ClientIDMode="Static" TabIndex="31">
                                </asp:RadioButtonList>
                                <div style="height: 30px; padding-left: 5px">
                                    Additional Orders:&nbsp;<asp:TextBox ID="txtAANutritionAO" runat="server" MaxLength="1000"
                                        Width="600" TabIndex="40"></asp:TextBox>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">D. Documentation of<br />
                            Discussion:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel">
                                <table cellpadding="0" cellspacing="0" style="padding: 5px; color: #333333">
                                    <tr>
                                        <td class="fmFieldHeader" style="vertical-align: text-top;">
                                            <asp:CustomValidator ID="cvDiscussedWith" runat="server" EnableClientScript="false" OnServerValidate="cvDiscussedWith_ServerValidate"
                                                ErrorMessage="You must select at least 1 Discussed with option" Text="*"></asp:CustomValidator>
                                            Discussed with:
                                        </td>
                                        <td class="fmFieldText" style="vertical-align: text-top">
                                            <table style="font-size: 10px; vertical-align: text-top">
                                                <tr>
                                                    <td style="text-align: left;" nowrap>
                                                        <asp:CheckBox ID="cbROSPatient" runat="server" Text="Patient" Value="1" TabIndex="41" OnCheckedChanged="cbROSPatient_CheckedChanged"
                                                            AutoPostBack="True" />
                                                    </td>
                                                    <td style="text-align: left;" nowrap>
                                                        <asp:CheckBox ID="cbROHCR" runat="server" Text="Health Care Representative" Value="2"
                                                            TabIndex="44" AutoPostBack="True" />
                                                    </td>
                                                    <td style="text-align: left; vertical-align: middle" nowrap>
                                                        <asp:CheckBox ID="cbROSOther" runat="server" Text="Other" Value="6" TabIndex="46"
                                                            AutoPostBack="True" />&nbsp;<asp:TextBox ID="txtROSOther" runat="server" Width="200px" OnTextChanged="txtROSOther_TextChanged"
                                                                Font-Size="10px" TabIndex="47" AutoPostBack="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" nowrap>
                                                        <asp:CheckBox ID="cbROSParentOfMinor" runat="server" Text="Parent of Minor" Value="3"
                                                            TabIndex="42" AutoPostBack="True" />
                                                    </td>
                                                    <td style="text-align: left;" nowrap>
                                                        <asp:CheckBox ID="cbROSCAG" runat="server" Text="Court-Appointed Guardian" Value="4"
                                                            TabIndex="45" AutoPostBack="True" />
                                                    </td>
                                                    <td style="text-align: left;" nowrap>
                                                        <asp:CheckBox ID="cbROSNotFilledOut" runat="server" Text="Not Filled Out" Value="7" OnCheckedChanged="cbROSNotFilledOut_CheckedChanged"
                                                            TabIndex="48" AutoPostBack="True" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left;" nowrap>
                                                        <asp:CheckBox ID="cbROSSurrogate" runat="server" Text="Surrogate for patient with developmental disabilities"
                                                            Value="5" TabIndex="43" AutoPostBack="True" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fmFieldHeader" style="vertical-align: text-top">Signature of<br />
                                            Representative:
                                        </td>
                                        <td class="fmFieldText">
                                            <asp:Panel ID="pnlFormSigned" runat="server">
                                                <asp:UpdatePanel ID="updFormSigned" runat="server">
                                                    <ContentTemplate>
                                                        <table cellpadding="0" cellspacing="0" style="padding: 5px">
                                                            <tr>
                                                                <td class="fmFieldHeader">
                                                                    <asp:CustomValidator ID="cvFormIsSigned" runat="server" EnableClientScript="false" OnServerValidate="cvFormIsSigned_ServerValidate"
                                                                        ErrorMessage="You must select if form is signed " Text="*"></asp:CustomValidator>
                                                                    Form is Signed:
                                                                </td>
                                                                <td class="fmFieldText" colspan="2" onclick="GoToFormIsSigned2()">
                                                                    <asp:RadioButtonList ID="rblFormSigned" runat="server" ClientIDMode="Static" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblFormSigned_SelectedIndexChanged"
                                                                        TabIndex="48">
                                                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fmFieldHeader">If Yes, Relationship:
                                                                </td>
                                                                <td class="fmFieldText">
                                                                    <asp:DropDownList ID="ddlSignedRelationship" runat="server" AutoPostBack="true" ClientIDMode="Static"
                                                                        OnSelectedIndexChanged="ddlSignedRelationship_SelectedIndexChanged" TabIndex="49">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Panel ID="pnlSigRelationDesc" runat="server" ClientIDMode="Static" Enabled="false">
                                                                        Specify:&nbsp;<asp:TextBox ID="txtSigRelationDesc" runat="server" ClientIDMode="Static"
                                                                            MaxLength="100" TabIndex="50" Width="200px"></asp:TextBox>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">Attestation/Signature of<br />
                            Physician/NP/PA:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel">
                                <table cellpadding="0" cellspacing="0" style="padding: 5px; color: #333333">
                                    <tr>
                                        <td colspan="2">
                                            <asp:UpdatePanel ID="updSigningPhys" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table>
                                                        <tr>
                                                            <td class="fmFieldHeader" nowrap>
                                                                <asp:RequiredFieldValidator ID="rfvSignName" runat="server" EnableClientScript="false"
                                                                    ErrorMessage="Signing MD/NP/PA Name is Required" Text="*" Display="Dynamic" ControlToValidate="rcbSigningPhys"></asp:RequiredFieldValidator>
                                                                Signing MD/NP/PA<br />
                                                                Name:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <telerik:RadComboBox ID="rcbSigningPhys" runat="server" AllowCustomText="true" MaxLength="200" OnItemsRequested="rcbSigningPhys_ItemsRequested" OnSelectedIndexChanged="rcbSigningPhys_SelectedIndexChanged"
                                                                    Height="125px" class="fmFieldText" TabIndex="51" EnableLoadOnDemand="True" Skin="Vista"
                                                                    Font-Size="11px" ShowMoreResultsBox="True" ItemRequestTimeout="500" MarkFirstMatch="True"
                                                                    AutoPostBack="true" CausesValidation="false">
                                                                    <CollapseAnimation Duration="200" Type="OutQuint" />
                                                                </telerik:RadComboBox>
                                                            </td>
                                                            <td class="fmFieldHeader">
                                                                <asp:CustomValidator ID="cvSignerCert" runat="server" EnableClientScript="false" OnServerValidate="cvSignerCert_ServerValidate"
                                                                    ErrorMessage="You must select a Signer's Cert" Text="*"></asp:CustomValidator>
                                                                Cert:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:DropDownList ID="ddlSigningPhysCert" runat="server" Width="145px" TabIndex="52">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="fmFieldHeader" style="padding-left: 5px">Licenses:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:TextBox ID="txtSigningPhysLicenses" runat="server" Width="120px" MaxLength="100"
                                                                    TabIndex="53"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="fmFieldHeader" nowrap>
                                                                <asp:RangeValidator ID="rvDateSigned" runat="server" ControlToValidate="txtDateSigned"
                                                                    EnableClientScript="false" Display="Dynamic" ErrorMessage="Date Signed is Required and can not be a future date"
                                                                    MaximumValue="01/01/2099" MinimumValue="01/01/1992" Type="Date">*</asp:RangeValidator>
                                                                Date Signed:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <telerik:RadMaskedTextBox ID="txtDateSigned" Width="90px" TabIndex="54" runat="server"
                                                                    CssClass="formTextbox" Mask="<1..12>/<1..31>/<1900..2099>">
                                                                </telerik:RadMaskedTextBox>
                                                            </td>
                                                            <td colspan="2" class="fmFieldText">
                                                                <asp:CheckBox ID="chkSignerVerified" ClientIDMode="Static" runat="server" Text="Signer Verified" OnCheckedChanged="chkSignerVerified_CheckedChanged"
                                                                    TabIndex="55" />
                                                            </td>
                                                            <td class="fmFieldHeader" nowrap>
                                                                <asp:CustomValidator ID="cv_licenseExpire" runat="server" EnableClientScript="false" OnServerValidate="cvLicenseExpire_ServerValidate"
                                                                    ErrorMessage="License Expire date must be a valid date and Can't be earlier than the Signing Physician date"
                                                                    Text="*"></asp:CustomValidator>
                                                                License Expire Date:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <telerik:RadMaskedTextBox ID="txtLicenseExpireDate" ClientIDMode="Static" Width="90px"
                                                                    Text="" TabIndex="56" runat="server" CssClass="formTextbox" Mask="<1..12>/<1..31>/<1900..2099>">
                                                                </telerik:RadMaskedTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="rcbSigningPhys" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="rcbSigningPhys" EventName="ItemsRequested" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">
                            <cc1:TextBoxLengthValidator ID="TextBoxLengthValidator1" runat="server" ControlToValidate="txtAdditionalInformation"
                                ErrorMessage="Maximum Length for Additional Information is 1000 characters" MaximumLength="1000"
                                Text="*">             
                            </cc1:TextBoxLengthValidator>
                            Additional Information:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel" style="text-align: center; vertical-align: middle; padding-bottom: 5px">
                                <asp:TextBox ID="txtAdditionalInformation" runat="server" Rows="3" TabIndex="57"
                                    ClientIDMode="Static" TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: middle">Back Page is Missing:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel" style="padding-bottom: 5px">
                                <asp:CheckBox ID="chkBackPageIsMissing" runat="server" Text="Back Page is Missing" OnCheckedChanged="chkBackPageIsMissing_CheckedChanged"
                                    Font-Bold="true" TabIndex="57" AutoPostBack="true" />
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">Contact Information:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel">
                                <asp:Panel ID="pnlHCP" runat="server">
                                    <table cellpadding="0" cellspacing="0" style="padding: 5px">
                                        <tr>
                                            <td class="fmFieldHeader">
                                                <asp:CustomValidator ID="cvFilledOutByHCP" runat="server" EnableClientScript="false" OnServerValidate="cvFilledOutByHCP_ServerValidate"
                                                    ErrorMessage="You must select if the form is prepared by HCP" Text="*"></asp:CustomValidator>
                                                Prepared by HCP:
                                            </td>
                                            <td class="fmFieldText">
                                                <asp:RadioButtonList ID="rblHCPFiller" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblHCPFiller_SelectedIndexChanged"
                                                    TabIndex="60" ClientIDMode="Static" CssClass="jqHCPFiller">
                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td class="fmFieldHeader">If Yes, Title:
                                            </td>
                                            <td class="fmFieldText">
                                                <asp:DropDownList ID="ddlHCPTitle" runat="server" TabIndex="61" ClientIDMode="Static">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fmFieldHeader">
                                                <asp:CustomValidator ID="cvPCPIsSigner" runat="server" EnableClientScript="false" OnServerValidate="cvPCPIsSigner_ServerValidate"
                                                    ErrorMessage="You must select if the PCP is the Form Signer" Text="*"></asp:CustomValidator>
                                                Is the PCP the Form Signer:
                                            </td>
                                            <td class="fmFieldText" colspan="3">
                                                <asp:RadioButtonList ID="rblPCPIsSigner" runat="server" RepeatDirection="Horizontal"
                                                    TabIndex="62" ClientIDMode="Static">
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </div>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="fmFieldHeader" style="vertical-align: text-top">Sender:
                        </td>
                        <td class="fmFieldText">
                            <div class="innerFormPanel" style="text-align: center; vertical-align: middle; padding-bottom: 5px">
                                <asp:UpdatePanel ID="updSender" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="fmFieldHeader" width="110px">
                                                    <asp:RangeValidator ID="rvDateReceived" runat="server" ControlToValidate="txtDateReceived"
                                                        EnableClientScript="false" Display="Dynamic" ErrorMessage="Date Received is Required and can not be a future date"
                                                        MaximumValue="01/01/2099" MinimumValue="01/01/1992" Type="Date">*</asp:RangeValidator>Date
                                                    Received:
                                                </td>
                                                <td class="fmFieldText">
                                                    <telerik:RadMaskedTextBox ID="txtDateReceived" Width="90px" TabIndex="63" runat="server"
                                                        CssClass="formTextbox" Mask="<1..12>/<1..31>/<1900..2099>">
                                                    </telerik:RadMaskedTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fmFieldHeader" width="110px">
                                                    <asp:RequiredFieldValidator ID="rfvSendersName" runat="server" EnableClientScript="false"
                                                        ControlToValidate="rcbProposedSender" ErrorMessage="Sender's Name is Required"
                                                        Text="*"></asp:RequiredFieldValidator>Name:
                                                </td>
                                                <td class="fmFieldText">
                                                    <telerik:RadComboBox ID="rcbProposedSender" runat="server" MaxLength="200" Height="125px"
                                                        Width="600px" class="fmFieldText" TabIndex="64" EnableLoadOnDemand="True" Skin="Vista"
                                                        Font-Size="11px" ShowMoreResultsBox="True" ItemRequestTimeout="500" MarkFirstMatch="True" OnItemsRequested="rcbProposedSender_ItemsRequested" OnSelectedIndexChanged="rcbProposedSender_SelectedIndexChanged"
                                                        CausesValidation="True" AutoPostBack="true">
                                                        <CollapseAnimation Duration="200" Type="OutQuint" />
                                                    </telerik:RadComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fmFieldHeader" width="110px">Address 1:
                                                </td>
                                                <td class="fmFieldText">
                                                    <asp:Label ID="txtAddress1" Width="400px" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fmFieldHeader" width="110px">Address 2
                                                </td>
                                                <td class="fmFieldText">
                                                    <asp:Label ID="txtAddress2" Width="400px" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td class="fmFieldHeader" width="110px">City:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:Label ID="txtCity" Width="200px" runat="server"></asp:Label>
                                                            </td>
                                                            <td class="fmFieldHeader" style="padding-left: 10px">State:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:Label ID="txtStates" runat="server"></asp:Label>
                                                            </td>
                                                            <td class="fmFieldHeader" style="padding-left: 10px">Zip:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:Label ID="txtZip" Width="50px" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="left">
                                                    <table align="left">
                                                        <tr>
                                                            <td class="fmFieldHeader" width="110px">Phone:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:Label ID="txtPhone" Width="150px" runat="server"></asp:Label>
                                                            </td>
                                                            <td class="fmFieldHeader" style="padding-left: 10px">Ext:
                                                            </td>
                                                            <td class="fmFieldText">
                                                                <asp:Label ID="txtExt" Width="50px" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fmFieldHeader" width="110px">Fax:
                                                </td>
                                                <td class="fmFieldText" nowrap>
                                                    <asp:Label ID="txtFax" Width="150px" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-top: 10px; padding-bottom: 10px" align="center">
                                                    <hr style="width: 80%" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" colspan="2" style="padding-left: 30px">
                                                    <asp:CheckBox ID="chkNoSender" runat="server" AutoPostBack="true" TabIndex="73" OnCheckedChanged="chkNoSender_CheckedChanged" />
                                                    <strong>No Sender Letter Required</strong> &nbsp;OR&nbsp;<asp:CheckBox ID="chkNoSignerInfo" OnCheckedChanged="chkNoSignerInfo_CheckedChanged"
                                                        runat="server" AutoPostBack="true" TabIndex="74" /><strong>No Sender/Signer Info Received
                                                            with form</strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="chkNoSender" EventName="CheckedChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="chkNoSignerInfo" EventName="CheckedChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 10px" align="center">
                            <div style="padding-top: 10px; padding-bottom: 10px">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" BorderColor="Red" BorderWidth="1px"
                                    HeaderText="The following error(s) need to be fixed:" Width="419px" Style="padding-top: 5px; text-align: left" />
                                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" ForeColor="Red"
                                    Visible="False" Width="450px"></asp:Label>
                            </div>
                            <div id="divProcessing" style="display:none;"><img src="../../Images/page-loading.gif" /></div>
                            <asp:Button ID="btnSubmit" runat="server" CssClass="ruButton jqPostbackElement"  TabIndex="75" Text="Submit" OnClick="btnSubmit_Click"  ClientIDMode="Static" />
                            <div style="display: inline">
                                <asp:Button ID="btnCancel" runat="server" CssClass="ruButton jqPostbackElement" TabIndex="76" Text="Cancel" OnClick="btnCancel_Click" ClientIDMode="Static"
                                    CausesValidation="False" />
                            </div>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <% ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "StopProcessing();", true); %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <telerik:RadWindowManager Top="65px" Left="200px" Width="580px" Height="745px" ID="RadWindowManager1"
        runat="server" Skin="Vista">
        <Windows>
            <telerik:RadWindow ID="rwEditRegistrant" runat="server" Title="Edit Registrant" ReloadOnShow="false"
                Modal="true" Skin="Vista" NavigateUrl="EditRegistrant.aspx" VisibleOnPageLoad="false" />
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
