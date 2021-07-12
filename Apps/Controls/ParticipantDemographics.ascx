<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ParticipantDemographics.ascx.cs" Inherits="PolstWebApp.Apps.Controls.ParticipantDemographics" ClientIDMode="Static" %>
<table cellpadding="0" cellspacing="0" style="padding: 5px; width: 100%">
    <tr>
        <td colspan="3" style="font-size: 120%; font-weight: 600; text-align: center;">
            <table align="center">
                <tr id="trwRegistryId" runat="server">
                    <td>
                        Registry ID:
                    </td>
                    <td id="tclRegistryID" runat="server" align="left">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td class="fmTopPolstHeader">
                        Name:
                    </td>
                    <td id="tclName" runat="server" class="fmTopPolstText" controlIdMode="static">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        AKA:
                    </td>
                    <td id="tclAlias" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        DOB:
                    </td>
                    <td id="tclDOB" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        Age:
                    </td>
                    <td id="tclAge" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        SSN:
                    </td>
                    <td id="tclSSN" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        Gender:
                    </td>
                    <td id="tclGender" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <%--<tr>
                    <td class="fmTopPolstHeader">
                        Email:
                    </td>
                    <td id="tclEmail" runat="server" class="fmTopPolstText">
                    </td>
                </tr>--%>
            </table>
        </td>
        <td valign="top">
            <table>
                <tr>
                    <td class="fmTopPolstHeader">
                        Facility:
                    </td>
                    <td id="tclFacilityOfResidence" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr id="trwCO" runat="server">
                    <td class="fmTopPolstHeader">
                        C/O:
                    </td>
                    <td id="tclCO" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        Address:
                    </td>
                    <td id="tclAddresPrimary" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        City:
                    </td>
                    <td id="tclCityPrimary" runat="server" class="fmTopPolstText" align="left">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        State:
                    </td>
                    <td style="text-align: left; vertical-align: text-top">
                        <table cellpadding="0" cellspacing="0" style="vertical-align: top; margin-top: -1px">
                            <tr>
                                <td id="tclstatePrimary" runat="server" class="fmTopPolstText">
                                </td>
                                <td class="fmTopPolstHeader" style="padding-left: 10px; vertical-align: top">
                                    Zip:
                                </td>
                                <td id="tclZipPrimary" runat="server" class="fmTopPolstText" style="vertical-align: text-top">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        County:
                    </td>
                    <td id="tclCountyPrimary" runat="server" class="fmTopPolstText" align="left">
                    </td>
                </tr>
                <%-- <tr>
                    <td class="fmTopPolstHeader">
                        
                    </td>
                    <td id="Td1" class="fmTopPolstText">
                    </td>
                </tr>--%>
            </table>
        </td>
        <td valign="top">
            <table>
                <tr>
                    <td class="fmTopPolstHeader">
                        Hospice:
                    </td>
                    <td id="tclHospice" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr id="trwCOSecondary" runat="server">
                    <td class="fmTopPolstHeader">
                        C/O:
                    </td>
                    <td id="tclCOSecondary" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        2nd Address:
                    </td>
                    <td id="tclAddressSecondary" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        City:
                    </td>
                    <td id="tclCitySecondary" runat="server" class="fmTopPolstText" align="left">
                    </td>
                </tr>
                <tr>
                    <td class="fmTopPolstHeader">
                        State:
                    </td>
                    <td style="text-align: left; vertical-align: text-top; margin-top: -1px">
                        <table cellpadding="0" cellspacing="0" style="vertical-align: top; margin-top: -1px">
                            <tr>
                                <td id="tclStateSecondary" runat="server" class="fmTopPolstText">
                                </td>
                                <td class="fmTopPolstHeader" style="padding-left: 10px">
                                    Zip:
                                </td>
                                <td id="tclZipSecondary" runat="server" class="fmTopPolstText">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="trwPrintDate" runat="server">
                    <td class="fmTopPolstHeader">
                        Print Date:
                    </td>
                    <td id="tclPrintDate" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
                   <%--  <tr>
                    <td class="fmTopPolstHeader">
                        
                    </td>
                    <td id="Td2" class="fmTopPolstText">
                    </td>
                </tr>--%>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" align="left" style="text-align: left">
            <table>
                <tr id="trwNote" runat="server">
                    <td class="fmTopPolstHeader">
                        Note:
                    </td>
                    <td id="tclNote" runat="server" class="fmTopPolstText">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
