<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Forms_Registrants, App_Web_uo0bbhtv" title="POLST Registrants" theme="Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/Apps/PolstMaster.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpScripts" runat="Server">
    <script type="text/javascript" src="./Scripts/Registrants.js"></script>
    <script type="text/javascript">


        function ClearFirstName(sender, args) {
            var comboInstance = $find('<%=rcbFirstName.ClientID%>');
            comboInstance.clearItems();
            comboInstance.set_text("");
            comboInstance.requestItems(sender.get_text(), false);



        }


        function clearBirthYear() {

            var el = document.getElementById('<%= txtBirthYear.ClientID %>');
            el.value = '';
        }

        function clearAge() {

            var el = document.getElementById('<%= txtAge.ClientID %>');
            el.value = '';
        }



    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    
    <telerik:RadWindowManager Top="65px" Width="730px" Height="690px" ID="RadWindowManager1"
        runat="server" Skin="Vista">
        <Windows>
            <telerik:RadWindow ID="rwEditRegistrant" runat="server" Title="Edit Registrant" ReloadOnShow="true"
                Modal="true" Skin="Vista" KeepInScreenBounds="true" NavigateUrl="./forms/EditRegistrant.aspx"
                VisibleOnPageLoad="false" Top="15px" Left="100px" Width="750px" Height="745px" />
        </Windows>
    </telerik:RadWindowManager>
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="950px" DefaultButton="btnSearch" >
                <div style="width: 940px" class="fmHead">
                    <table width="100%">
                        <tr>
                            <td style="width: 120px">
                            </td>
                            <td style="width: 120px">
                            </td>
                            <td style="width: 460px">
                                Registrant Administration
                            </td>
                            <td style="width: 240px">
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Panel ID="pnlSearch" runat="server" Style="text-align: center; padding-top: 10px;
                    padding-bottom: 10px">
                    <table cellpadding="0" cellspacing="0" style="padding: 5px; border: solid 1px gray">
                        <tr>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td class="fmTopPolstHeader">
                                            Registrant Status:
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rblParticipantStatus" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Having a Form with a Status of:
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rblFormStatus" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td class="fmTopPolstHeader">
                                            Last Name:
                                        </td>
                                        <td id="tclName" class="fmTopPolstText">
                                            <telerik:RadComboBox ID="rcbLastName" runat="server" AllowCustomText="true" MaxLength="200"
                                                Height="125px" class="fmFieldText" TabIndex="1" AutoPostBack="true" EnableLoadOnDemand="True"
                                                Skin="Vista" Font-Size="11px" ShowMoreResultsBox="True" ItemRequestTimeout="500"
                                                MarkFirstMatch="False" CausesValidation="false" OnClientSelectedIndexChanged="ClearFirstName">
                                                <CollapseAnimation Duration="200" Type="OutQuint" />
                                            </telerik:RadComboBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            First Name:
                                        </td>
                                        <td class="fmTopPolstText">
                                            <telerik:RadComboBox ID="rcbFirstName" runat="server" AllowCustomText="true" MaxLength="200"
                                                Height="125px" class="fmFieldText" TabIndex="2" EnableLoadOnDemand="True" Skin="Vista"
                                                Font-Size="11px" ShowMoreResultsBox="True" ItemRequestTimeout="500" MarkFirstMatch="False"
                                                CausesValidation="false">
                                            </telerik:RadComboBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Middle Name:
                                        </td>
                                        <td class="fmTopPolstText" style="text-align: left" colspan="3">
                                            <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="1" Width="20px" TabIndex="3"></asp:TextBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Registry ID:
                                        </td>
                                        <td class="fmTopPolstText" style="text-align: left" colspan="3">
                                            <asp:TextBox ID="txtRegistryID" runat="server" MaxLength="20" Width="100px" TabIndex="4"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td class="fmTopPolstHeader">
                                            DOB:
                                        </td>
                                        <td id="tclDOB" class="fmTopPolstText">
                                            <asp:TextBox ID="txtBirthMonth" runat="server" Width="25px" MaxLength="2" TabIndex="5"
                                                CssClass="jqNumberOnly"></asp:TextBox>&nbsp;/&nbsp;
                                            <asp:TextBox ID="txtBirthDay" runat="server" Width="25px" MaxLength="2" TabIndex="6"
                                                CssClass="jqNumberOnly"></asp:TextBox>&nbsp;/&nbsp;
                                            <asp:TextBox ID="txtBirthYear" runat="server" Width="50px" MaxLength="4" TabIndex="7"
                                                onkeydown="clearAge()" CssClass="jqNumberOnly"></asp:TextBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Approx. Age:
                                        </td>
                                        <td class="fmTopPolstText">
                                            <asp:TextBox ID="txtAge" runat="server" Width="35px" TabIndex="8" MaxLength="3" onkeydown="clearBirthYear()"
                                                CssClass="jqNumberOnly"></asp:TextBox><br />
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" MinimumValue="1"
                                                MaximumValue="200" ControlToValidate="txtAge" Display="Dynamic" CssClass="validation"
                                                Text="This is not a valid age" ValidationGroup="search"></asp:RangeValidator>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Last 4 SSN:
                                        </td>
                                        <td class="fmTopPolstText">
                                            <asp:TextBox ID="txtSSN" runat="server" MaxLength="4" Width="75px" TabIndex="9" CssClass="jqNumberOnly"></asp:TextBox><br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSSN"
                                                ErrorMessage="This is not valid for last 4 of SSN" Display="Dynamic" ValidationExpression="\d{4}?"
                                                ValidationGroup="search">This is not valid for last 4 of SSN</asp:RegularExpressionValidator>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Gender:
                                        </td>
                                        <td class="fmTopPolstText">
                                            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" TabIndex="10">
                                                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                                <asp:ListItem Text="All" Value="" Selected="True"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td class="fmTopPolstHeader">
                                            Address:
                                        </td>
                                        <td colspan="3" class="fmTopPolstText">
                                            <asp:TextBox ID="txtAddress" runat="server" Width="350px" TabIndex="11"></asp:TextBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            City:
                                        </td>
                                        <td class="fmTopPolstText" colspan="2">
                                            <asp:TextBox ID="txtCity" runat="server" Width="125px" TabIndex="12"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table>
                                    <tr>
                                        <td class="fmTopPolstHeader">
                                            County:
                                        </td>
                                        <td colspan="3" class="fmTopPolstText">
                                            <asp:TextBox ID="txtCounty" runat="server" Width="125px" TabIndex="13"></asp:TextBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            State:
                                        </td>
                                        <td class="fmTopPolstText">
                                            <asp:TextBox ID="txtState" runat="server" Width="25px" TabIndex="14" MaxLength="2"></asp:TextBox>
                                        </td>
                                        <td class="fmTopPolstHeader" style="padding-left: 15px">
                                            Zip:
                                        </td>
                                        <td class="fmTopPolstText">
                                            <asp:TextBox ID="txtZip" runat="server" Width="50px" TabIndex="15" MaxLength="5"
                                                CssClass="jqNumberOnly"></asp:TextBox><br />
                                            <asp:RangeValidator ID="fvZip" runat="server" Type="Integer" MinimumValue="10000"
                                                MaximumValue="99999" ControlToValidate="txtZip" Display="Dynamic" CssClass="validation"
                                                Text="Zip must be a 5 digit number" ValidationGroup="search"></asp:RangeValidator>
                                        </td>
                                        <td align="left" style="padding-left: 50px">
                                            <span style="padding-right: 15px">
                                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="ruButton jqPostbackElement" TabIndex="16" 
                                                    ValidationGroup="search" /></span>
                                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="ruButton jqPostbackElement" TabIndex="17" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-bottom: 5px">
                                <asp:LinkButton ID="btnlAdvancedOptions" runat="server" Text="Show Advanced Options"
                                    CommandArgument="show"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr id="trwAdvancedOptions" runat="server" visible="false">
                            <td>
                                <div style="border: solid 1px gray">
                                    <table>
                                        <tr>
                                            <td class="fmTopPolstHeader">
                                                Date Signed:
                                            </td>
                                            <td align="left">
                                                <telerik:RadDatePicker ID="rdpSigning_Phys_Date" runat="server">
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td class="fmTopPolstHeader" style="padding-left: 5px">
                                                Date Entered:
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdpCreatedDate" runat="server">
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td class="fmTopPolstHeader" style="padding-left: 5px">
                                                Signing MD:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSigningMD" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <div align="center">
                    <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation"
                        Visible="false"></asp:Label>
                </div>
                 <div id="divProcessing" style="display:none;"><img src="../../Images/page-loading.gif" /></div>
                <asp:Panel ID="pnlGrid" runat="server" Visible="true">
                    <div id="GridContainer">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            AllowPaging="True" AllowSorting="True" ShowFooter="true" AutoGenerateColumns="false"
                            Skin="Vista" PageSize="50" ShowStatusBar="false" GridLines="Both" Font-Size="11px"
                            Width="930px" Height="356px">
                            <FilterItemStyle HorizontalAlign="Left" />
                            <PagerStyle Mode="NextPrevAndNumeric" />
                            <MasterTableView CommandItemDisplay="None" FilterItemStyle-Wrap="false" CurrentResetPageIndexAction="SetPageIndexToFirst"
                                AllowAutomaticInserts="false" Frame="Border" TableLayout="fixed" ShowFooter="false">
                                <AlternatingItemStyle BackColor="#DCE2F3" />
                                <Columns>
                                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="25px">
                                        <ItemTemplate>
                                            <a href='javascript:EditRegistrant(<%# eval("pid") %>)' onmouseover="this.style.cursor='pointer'">
                                                <img src="../Images/Edit.gif" alt="View Participant" border="0" height="15px" height="15px" /></a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" SortExpression="LastName"
                                        ItemStyle-HorizontalAlign="Left">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" SortExpression="FirstName"
                                        ItemStyle-HorizontalAlign="Left">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderStyle-Width="60px" DataField="BirthDate" HeaderText="DOB"
                                        SortExpression="BirthDate" ItemStyle-HorizontalAlign="Left">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderStyle-Width="50px" DataField="ssn" HeaderText="Last 4"
                                        SortExpression="ssn" ItemStyle-HorizontalAlign="Left" DataType="System.String">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderStyle-Width="170px" DataField="Address" HeaderText="Address"
                                        SortExpression="Address" ItemStyle-HorizontalAlign="Left">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="City" HeaderText="City" SortExpression="City"
                                        ItemStyle-HorizontalAlign="Left">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Wrap="false" HeaderStyle-Width="80px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnlViewForm" ForeColor="#284775" runat="server" CommandArgument='<%# eval("pid") %>'
                                                Text="POLST Data" OnClick="btnlView_Click" OnClientClick="BeginProcessing(true, this);" CssClass="jqPostbackElement"></asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <RowIndicatorColumn CurrentFilterFunction="NoFilter" FilterListOptions="VaryByDataType"
                                    Visible="False">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn CurrentFilterFunction="NoFilter" FilterListOptions="VaryByDataType"
                                    Resizable="False" Visible="False">
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
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
