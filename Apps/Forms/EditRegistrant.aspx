<%@ page language="VB" autoeventwireup="false" inherits="Apps_Forms_EditRegistrant, App_Web_agr5ncgw" theme="Default" maintainscrollpositiononpostback="true" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="txtBoxLengthValidator" namespace="txtBoxLengthValidator" tagprefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Edit Registrant</title>
</head>
 <script type="text/javascript" src="../Scripts/jquery-1.4.4.min.js"></script>
    
        <script type="text/javascript">

            $(document).ready(function () {

                $(".gender_select").keyup(function (evt) {
                    if (evt.keyCode == 32) {

                        $('#tclGender input:radio:nth(' + this.index.toString() + ')').attr("checked", "checked");
                    }
                }).keydown(function (evt) {
                    if (evt.keyCode == 32) {

                        $('#tclGender input:radio:nth(' + this.index.toString() + ')').attr("checked", "checked");
                    }
                });

             
            })


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
	       

	      
	        
	        
        </script>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
        
           
            
        <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" >
            <table width="100%" cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="2" class="fmHead" style="width:700px;" id="tclHead" runat="server">Registrant

   </td>
   </tr>
    <tr>
   <td colspan="2" align="right" style="padding-right: 20px; padding-top: 10px">
        <asp:hyperlink ID="lnkArchive" runat="server" NavigateUrl="ArchiveRegistrant.aspx" title="Archive this Registrant" Text="Archive Registrant" />  
   </td>
   </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Registry ID:</td>
    <td class="fmFieldText">
        <asp:Label ID="lblRegistryID" runat="server" ></asp:Label>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Status:</td>
    <td class="fmFieldText">
       <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </td>
  </tr>
  <tr id="trwArchived" runat="server">
  <td colspan="2">
      <table>
          <tr valign="top" >
            <td class="fmFieldHeader" nowrap>Archive Reason:</td>
            <td class="fmFieldText">
               <asp:Label ID="lblArchivedReason" runat="server"></asp:Label>
            </td>
          </tr>
          <tr valign="top" >
            <td class="fmFieldHeader" nowrap>Archive Notes:</td>
            <td class="fmFieldText">
               <asp:Label ID="lblArchiveNotes" runat="server"></asp:Label>
            </td>
          </tr>
          <tr valign="top" >
            <td class="fmFieldHeader" nowrap>Archived Date:</td>
            <td class="fmFieldText">
               <asp:Label ID="lblArchivedDate" runat="server"></asp:Label>
            </td>
          </tr>
          <tr valign="top" >
            <td class="fmFieldHeader" nowrap>Archived by:</td>
            <td class="fmFieldText">
               <asp:Label ID="lblArchivedBy" runat="server"></asp:Label>
            </td>
          </tr>
      </table>
  </td>
  
  </tr>
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Last Name:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtLastName" runat="server" MaxLength="150" Width="345px" TabIndex="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvalLastName" runat="server" ControlToValidate="txtLastName"
            Display="Dynamic" ErrorMessage="Last Name is Required">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>First Name:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="150" Width="345px" TabIndex="2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
            Display="Dynamic" ErrorMessage="First Name is Required">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Middle Name:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="50" Width="345px" TabIndex="3"></asp:TextBox>
    </td>
  </tr>

  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>AKA:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtAlias" runat="server" MaxLength="50" Width="345px" TabIndex="4"></asp:TextBox>
    </td>
  </tr>
  
  <tr valign="top">
    <td colspan="2">
        <asp:UpdatePanel ID="updFacility" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                <tr valign="top" >
                    <td class="fmFieldHeader" nowrap width="105px">Facility of<br />Residence:</td>
                    <td class="fmFieldText">
                        <asp:DropDownList ID="ddlFacility" runat="server" TabIndex="5" AutoPostBack="true" style="font-size: 11px"></asp:DropDownList>
                    </td>
                  </tr>
                   <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>C/O:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtInCareOf" runat="server" MaxLength="255" Width="345px" TabIndex="6"></asp:TextBox>
                    </td>
                  </tr>
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Address:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" Width="345px" TabIndex="7"></asp:TextBox>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Apt #:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtApartmentNumber" runat="server" MaxLength="25" Width="75px" TabIndex="8"></asp:TextBox>
                    </td>
                  </tr>
                   
                    <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>City:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtCity" runat="server" MaxLength="150" Width="345px" TabIndex="9"></asp:TextBox>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>State:</td>
                    <td class="fmFieldText">
                        <asp:DropDownList ID="ddlState" runat="server" TabIndex="10"></asp:DropDownList>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="upd1" runat="server">
                            <ContentTemplate>
                            
                        <table cellpadding="0" cellspacing="0">
                        <tr valign="top" >
                            <td class="fmFieldHeader" nowrap width="115px">Zip Code:</td>
                            <td class="fmFieldText">
                                <asp:TextBox ID="txtZip" runat="server" MaxLength="5" Width="75px" TabIndex="11" AutoPostBack="true"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegExVal" runat="server" 
                                    ControlToValidate="txtZip" ErrorMessage="This is not a valid Zip Code" 
                                    ValidationExpression="\d{5}(-\d{4})?" >*</asp:RegularExpressionValidator>
                            </td>
                          </tr>
                  
                          <tr valign="top" >
                            <td class="fmFieldHeader" nowrap>County:</td>
                            <td class="fmFieldText">
                                <asp:DropDownList ID="ddlCounty" runat="server" TabIndex="-1" Enabled="false"></asp:DropDownList>
                            </td>
                          </tr>
                        </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlFacility" EventName="SelectedIndexChanged" />
                        </Triggers>
                        </asp:UpdatePanel>
                    </td>
                  </tr>
                  </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </td>
  
  </tr>
  <tr>
    <td colspan="2">
        <asp:UpdatePanel ID="updMA" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr valign="top" >
        
        <td class="fmFieldText" style="padding-left: 50px; padding-bottom: 5px">
            <asp:CheckBox ID="chkMailingAddress" runat="server" AutoPostBack="true" TabIndex="13" /> Participant has 2nd Address
            
        </td>
    </tr>
    <tr valign="top">
        
        <td align="left">
                <asp:Panel ID="pnlMailingAddress" runat="server">
                <table style="border: solid 1px gray; margin-right: 5px; margin-left: 50px" id="tblMailingAddress">
                
                 <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>C/O:<br /></td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingInCareOf" runat="server" MaxLength="255" Width="300px" TabIndex="14"></asp:TextBox>
                    </td>
                  </tr>
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Address:<br /></td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingAddress" runat="server" MaxLength="255" Width="300px" TabIndex="15"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMA" runat="server" ControlToValidate="txtMailingAddress" ErrorMessage="Address is Required" >*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Apt #:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingApartmentNumber" runat="server" MaxLength="25" Width="75px" TabIndex="16"></asp:TextBox>
                    </td>
                  </tr>
                   
                    <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>City:<br /></td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingCity" runat="server" MaxLength="150" Width="300px" TabIndex="17"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMACity" runat="server" ControlToValidate="txtMailingCity" ErrorMessage="City is Required" >*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>State:</td>
                    <td class="fmFieldText">
                        <asp:DropDownList ID="ddlMailingState" runat="server" TabIndex="18"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvMAState" runat="server" ControlToValidate="ddlMailingState" ErrorMessage="State is Required" >*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr valign="top" >
                            <td class="fmFieldHeader" nowrap width="140px">Zip Code:</td>
                            <td class="fmFieldText">
                                <asp:TextBox ID="txtMailingZip" runat="server" MaxLength="5" Width="75px" TabIndex="19" ></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtMailingZip" ErrorMessage="This is not a valid Zip Code" 
                                    ValidationExpression="\d{5}(-\d{4})?" >*</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="rfvMAZip" runat="server" ControlToValidate="txtMailingZip" ErrorMessage="Zip is Required" >*</asp:RequiredFieldValidator>
                            </td>
                  </tr>
                  
                  </table>
                    </asp:Panel>
                </td>
              
              </tr>
                
                </table>
            
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="chkMailingAddress" EventName="CheckedChanged" />
            
                </Triggers>
        
        </asp:UpdatePanel>
    
    </td>
  </tr>
  
     
   
  
  <tr valign="top">
  
      <td class="fmFieldHeader" nowrap>
          Date of Birth:</td>
      <td class="fmFieldText">
          <telerik:RadMaskedTextBox ID="txtDOB" Runat="server" TabIndex="20"   style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
              Mask="<01..12> / <01..31> / <1900..2099>" ></telerik:RadMaskedTextBox>
          <asp:RequiredFieldValidator ID="rfvDOB" runat="server" 
              ControlToValidate="txtDOB" Display="Dynamic" 
              ErrorMessage="Date of Birth is Required">*</asp:RequiredFieldValidator>
      </td>
  
  </tr>
  
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Last 4 SSN:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtSSN" runat="server" MaxLength="4" Width="75px" TabIndex="21"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtSSN" ErrorMessage="This is not valid for last 4 of SSN" 
            ValidationExpression="\d{4}?">*</asp:RegularExpressionValidator>
      
    </td>
  </tr>

  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Email:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="500" Width="200px" TabIndex="22"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="This is not valid Email Address" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
      
    </td>
  </tr>
  
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Gender:</td>
    <td class="fmFieldText" id="tclGender">
        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" TabIndex="23">
            <asp:ListItem Text="Male" Value="M" class="gender_select" index="0" ></asp:ListItem>
            <asp:ListItem Text="Female" Value="F" TabIndex="20" class="gender_select" index="1" ></asp:ListItem>
            <asp:ListItem Text="Not Indicated" Value="" TabIndex="21" class="gender_select" index="2" > </asp:ListItem>
        </asp:RadioButtonList>
    </td>
    
    </tr>
    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Hospice:</td>
    <td class="fmFieldText">
       <asp:DropDownList ID="ddlHospice" runat="server" style="font-size: 11px" TabIndex="24"></asp:DropDownList>
    </td>
    
    </tr>

    
    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Print Request:</td>
    <td class="fmFieldText">
        <telerik:RadMaskedTextBox ID="txtPrintRequestDate" Width="90px" ClientIDMode="Static"
                                                                    Text="" TabIndex="25" runat="server" CssClass="formTextbox" Mask="<1..12>/<1..31>/<1900..2099>" >
                                                                </telerik:RadMaskedTextBox>
         <asp:RangeValidator Type="Date" MinimumValue="01/01/1900" ID="rvPrintRequestDate" runat="server" EnableClientScript="false"
                              ErrorMessage="Print Request date must be a valid date and cannot be a future date" ControlToValidate="txtPrintRequestDate" Text="*"></asp:RangeValidator>
                                                                    
      
    </td>
  </tr>
    <tr valign="top" >
    <td class="fmFieldHeader" style="vertical-align: top">
    
    Note(s):
      </td>
    <td class="fmFieldText">
    
      <asp:TextBox ID="txtNote"  runat="server" TextMode="MultiLine" Rows="3" Width="95%" TabIndex="26"></asp:TextBox>
      <cc1:TextBoxLengthValidator 
            ID="tlvNote" MaximumLength="1000" ControlToValidate="txtNote" runat="server" 
            ErrorMessage="Maximum Length for Note is 1000 characters" Text="*">      
        </cc1:TextBoxLengthValidator>
    </td>
  </tr>
    <tr valign="top" id="trwButtons" runat="server">
    <td class="fmFieldHeader"></td>
    <td class="fmFieldText" style="padding-top:15px;">
        <div style="display:inline; padding-right: 10px">
          <asp:Button ID="btnSubmit" runat="server"  CssClass="ruButton" TabIndex="27" 
                Text="Update" />
                </div>
            <div style="display:inline;"> 
          <asp:Button ID="btnCancel" runat="server" Text="Close" CssClass="ruButton" TabIndex="28" CausesValidation="false" /> 
        </div>
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BorderColor="Red" BorderWidth="1px"
            HeaderText="The following error(s) need to be fixed:" Width="419px" style="padding-top:5px" />
        <asp:Label ID="lblMessage" runat="server" EnableViewState="False" 
            ForeColor="Red" Visible="False" Width="400px"></asp:Label>
    </td>
  </tr>
  
   
     
   </table>
   <input type="hidden" id="txtMode" runat="server" value="edit" />
 
    
        </asp:Panel>
  
          
    </form>
</body>
</html>
