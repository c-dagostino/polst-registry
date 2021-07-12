<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolstFormView.aspx.cs" Inherits="PolstWebApp.Apps.Search.PolstFormView" Title="POLST Form View" %>

<%@ Register Src="../Controls/ParticipantDemographics.ascx" TagName="ParticipantDemographics"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
        .Red
        {
            color: Red;
        }
    </style>
    <title>POLST Form View</title>
    <script type="text/javascript">
        function CloseAndRebind(args) {
            GetRadWindow().Close();
            GetRadWindow().BrowserWindow.refreshGrid(args);
        }
        function Close() {
            GetRadWindow().Close();
        }
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

            return oWindow;
        }

        function checkKeyCode(evt) {
            var evt = (evt) ? evt : ((event) ? event : null);
            var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
            if (event.keyCode == 116) { evt.keyCode = 0; return false; }
        }
        document.onkeydown = checkKeyCode;
	              
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scm1" runat="server" ScriptMode="Release">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="770px" HorizontalAlign="Center">
                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td class="fmHead" style="width: 100%" id="tclHead" runat="server">
                           <asp:Label ID="lblFormYear" runat="server"></asp:Label> POLST Form
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px">
                            <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                <tr>
                                    <td align="right" style="padding-top: 10px">
                                        <div style="display: inline; padding-right: 40px">
                                            <asp:HyperLink ID="lnkClose" runat="server" NavigateUrl="javascript:Close();" Text="Incorrect Registrant - Close Form" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px; padding-top: 10px">
                                        <div class="innerFormPanelSmall">
                                            <uc1:ParticipantDemographics ID="ParticipantDemographics1" runat="server" />
                                            <div style="text-align: center" align="center">
                                                <asp:Label CssClass="Red" ID="lblNoForm" runat="server" Visible="false" EnableViewState="false">The Requested POLST Form no longer exists.</asp:Label></div>
                                        </div>
                                        <div align="center">
                                            <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation"
                                                Visible="false"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="trwNoValidForm" runat="server">
                                    <td align="center" style="font-weight: 600">
                                        NO VALID POLST FORM CURRENTLY ASSOCIATED WITH THIS REGISTRANT.
                                    </td>
                                </tr>
                                <tr id="trwValidForm" runat="server">
                                    <td>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr valign="top">
                                                <td>
                                                    <div class="innerFormPanelSmall">
                                                        <div id="divCPR" runat="server" style="text-align: left">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td style="padding-top: 10px">
                                                    <div class="innerFormPanelSmall" style="overflow: auto; height: 167px">
                                                        <div id="divMedIntervention" runat="server" style="text-align: left">
                                                        </div>
                                                        <div class="polstViewText" style="text-align: left; padding-left: 10px">
                                                            Additional Orders:&nbsp;<asp:Label ID="lblMedInterventionAO" runat="server" CssClass="polstViewText"></asp:Label></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            
                                            <tr valign="top" id="trwSigningPhys2011" runat="server">
                                                <td class="fmFieldText">
                                                    <div class="innerFormPanel">
                                                        <table cellpadding="0" cellspacing="0" style="padding: 5px; color: #333333">
                                                            <tr>
                                                                <td class="fmFieldHeader" style="vertical-align: text-top; text-align: left" colspan="2" id="tclSigningPhysLabel" runat="server">
                                                                    E. Signature of Physician/NP/PA:
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fmFieldText">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="fmFieldHeader" nowrap>
                                                                                Signing MD/NP/PA Name:
                                                                            </td>
                                                                            <td class="fmFieldText">
                                                                                <asp:Label ID="lblSigningPhys2011" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="fmFieldHeader" valign="top" style="padding-left: 10px; vertical-align: text-top">
                                                                                Cert:
                                                                            </td>
                                                                            <td class="fmFieldText">
                                                                                <asp:Label ID="lblSigningPhysCert2011" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="fmFieldHeader" valign="top" style="padding-left: 10px; vertical-align: text-top">
                                                                                Licenses:
                                                                            </td>
                                                                            <td class="fmFieldText">
                                                                                <asp:Label ID="lblSigningPhysLicenses2011" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="fmFieldHeader" valign="top" style="padding-left: 10px; vertical-align: middle">
                                                                                Date Signed:
                                                                            </td>
                                                                            <td class="fmFieldText" style="vertical-align: middle">
                                                                                <asp:Label ID="lblDateSigned2011" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td colspan="4" class="fmFieldText">
                                                                              
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                    </tr>
                     <tr id="trwButtons" runat="server">
                                                <td style="padding-top: 20px">
                                                    <div style="display: inline; padding-right: 40px">
                                                        <asp:Button ID="lnkPFound" runat="server" Font-Bold="true" Text="POLST Form Found – Log Call" OnClick="lnkPFound_Click"
                                                            ForeColor="ForestGreen" /></div>
                                                    <div style="display: inline">
                                                        <asp:Button ID="lnkNPFound" runat="server" Font-Bold="true" Text="No POLST Form Found – Log Call" OnClick="lnkNPFound_Click"
                                                            ForeColor="DarkRed" /></div>
                                                </td>
                                            </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>