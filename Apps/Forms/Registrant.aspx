<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Apps/PolstMaster.master" CodeBehind="Registrant.aspx.cs" Inherits="PolstWebApp.Apps.Forms.Registrant" title="Registrant Form" MaintainScrollPositionOnPostback="true"  %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="txtBoxLengthValidator" namespace="txtBoxLengthValidator" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <script language="javascript" type="text/javascript">

        $(document).ready(function() {

            $(".gender_select").keyup(function(evt) {
                if (evt.keyCode == 32) {

                    $('#tclGender input:radio:nth(' + this.index.toString() + ')').attr("checked", "checked");
                }
            }).keydown(function(evt) {
                if (evt.keyCode == 32) {

                    $('#tclGender input:radio:nth(' + this.index.toString() + ')').attr("checked", "checked");
                }
            });



        })

       
			
 </script>  
   <asp:UpdatePanel ID="upd1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
<asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="700px" >

<table width="700px" cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="2" class="fmHead" style="width:700px;" id="tclHead" runat="server">Registrant

   </td>
   </tr>
  
 <tr valign="top" >
    <td colspan="2" align="center" style="padding-top: 10px; padding-bottom: 20px; font-size: 14px; font-weight: 600">Registry ID: <asp:Label ID="lblRegistryID" runat="server"></asp:Label></td>
  </tr>
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Last Name:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtLastName" runat="server" MaxLength="150" Width="345px" TabIndex="99"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvalLastName" runat="server" ControlToValidate="txtLastName"
            Display="Dynamic" ErrorMessage="Last Name is Required">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>First Name:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="150" Width="345px" TabIndex="100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
            Display="Dynamic" ErrorMessage="First Name is Required">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Middle Name:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="50" Width="345px" TabIndex="101"></asp:TextBox>
    </td>
  </tr>
 
 <tr valign="top" >
    <td class="fmFieldHeader" nowrap>AKA:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtAlias" runat="server" MaxLength="50" Width="345px" TabIndex="3"></asp:TextBox>
    </td>
  </tr>
  
  <tr valign="top">
    <td colspan="2" align="left">
        <asp:UpdatePanel ID="updFacility" runat="server">
            <ContentTemplate>
                <table>
                <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Facility of Residence:</td>
                    <td class="fmFieldText">
                        <asp:DropDownList ID="ddlFacility" runat="server" TabIndex="4" AutoPostBack="true" OnSelectedIndexChanged="ddlFacility_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                  </tr>
                    <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>C/O:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtInCareOf" runat="server" MaxLength="255" Width="345px" TabIndex="5"></asp:TextBox>
                    </td>
                  </tr>
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Address:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" Width="345px" TabIndex="6"></asp:TextBox>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Apt #:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtApartmentNumber" runat="server" MaxLength="25" Width="75px" TabIndex="7"></asp:TextBox>
                    </td>
                  </tr>
                   
                    <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>City:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtCity" runat="server" MaxLength="150" Width="345px" TabIndex="8"></asp:TextBox>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>State:</td>
                    <td class="fmFieldText">
                        <asp:DropDownList ID="ddlState" runat="server" TabIndex="9"></asp:DropDownList>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            
                        <table cellpadding="0" cellspacing="0">
                        <tr valign="top" >
                            <td class="fmFieldHeader" nowrap width="140px">Zip Code:</td>
                            <td class="fmFieldText">
                                <asp:TextBox ID="txtZip" runat="server" MaxLength="5" Width="75px" TabIndex="10" AutoPostBack="true" OnTextChanged="txtZip_TextChanged"></asp:TextBox>
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
        
        <td class="fmFieldText" colspan="2" style="padding-left: 50px; padding-bottom: 5px">
            <asp:CheckBox ID="chkMailingAddress" runat="server" AutoPostBack="true" TabIndex="12" OnCheckedChanged="chkMailingAddress_CheckedChanged" /> Participant has 2nd Address
            
        </td>
    </tr>
    <tr valign="top">
        
        <td align="left" colspan="2">
                <asp:Panel ID="pnlMailingAddress" runat="server">
                <table style="border: solid 1px gray; margin-right: 5px; margin-left: 50px" id="tblMailingAddress">
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>C/O:<br /></td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingInCareOf" runat="server" MaxLength="255" Width="300px" TabIndex="15"></asp:TextBox>
                    </td>
                  </tr>
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Address:<br /></td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingAddress" runat="server" MaxLength="255" Width="300px" TabIndex="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMA" runat="server" ControlToValidate="txtMailingAddress" ErrorMessage="Address is Required" >*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>Apt #:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingApartmentNumber" runat="server" MaxLength="25" Width="75px" TabIndex="17"></asp:TextBox>
                    </td>
                  </tr>
                   
                    <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>City:<br /></td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtMailingCity" runat="server" MaxLength="150" Width="300px" TabIndex="18"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMACity" runat="server" ControlToValidate="txtMailingCity" ErrorMessage="City is Required" >*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  
                  <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>State:</td>
                    <td class="fmFieldText">
                        <asp:DropDownList ID="ddlMailingState" runat="server" TabIndex="19"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvMAState" runat="server" ControlToValidate="ddlMailingState" ErrorMessage="State is Required" >*</asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr valign="top" >
                            <td class="fmFieldHeader" nowrap width="140px">Zip Code:</td>
                            <td class="fmFieldText">
                                <asp:TextBox ID="txtMailingZip" runat="server" MaxLength="5" Width="75px" TabIndex="20" ></asp:TextBox>
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
          <div style="display: inline; padding-right: 30px">
              <telerik:RadMaskedTextBox ID="txtDOB" Runat="server" TabIndex="23" Width="90px"   style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
                  Mask="<1..12>/<1..31>/<1900..2099>">
              </telerik:RadMaskedTextBox>
              <asp:RangeValidator ID="rvDOB" runat="server" ControlToValidate="txtDOB" 
                              Display="Dynamic" ErrorMessage="DOB is Required and can not be a future date" MaximumValue="01/01/2099" 
                              MinimumValue="01/01/1901" Type="Date">*</asp:RangeValidator>
          </div>
          <div style="display: inline">
            <span style="color: #333; font-weight: 600">Age:</span><asp:Label ID="lblAge" runat="server" style="padding-left: 5px"></asp:Label>
          </div>
        
      </td>
  
  </tr>
  
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Last 4 SSN:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtSSN" runat="server" MaxLength="4" Width="75px" TabIndex="24"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtSSN" ErrorMessage="This is not valid for last 4 of SSN" 
            ValidationExpression="\d{4}?">*</asp:RegularExpressionValidator>
    </td>
  </tr>
  
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Email:</td>
    <td class="fmFieldText">
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="500" Width="200px" TabIndex="30"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="This is not valid Email Address" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
      
    </td>
  </tr>

   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Gender:</td>
    <td class="fmFieldText" id="tclGender">
        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Text="Male" Value="M" TabIndex="31"  class="gender_select" index="0" ></asp:ListItem>
            <asp:ListItem Text="Female" Value="F" TabIndex="32" class="gender_select" index="1" ></asp:ListItem>
            <asp:ListItem Text="Not Indicated" Value="" TabIndex="33" class="gender_select" index="2" > </asp:ListItem>
        </asp:RadioButtonList>
    </td>
    </tr>
    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Hospice:</td>
    <td class="fmFieldText">
       <asp:DropDownList ID="ddlHospice" runat="server" TabIndex="34"></asp:DropDownList>
    </td>
    
    </tr>

    <tr valign="top" >
    <td class="fmFieldHeader" style="vertical-align: text-top">
    
    Note(s):
      </td>
    <td class="fmFieldText">
    
      <asp:TextBox ID="txtNote"  runat="server" TextMode="MultiLine" Rows="3" Width="95%" TabIndex="35"></asp:TextBox>
     <cc1:TextBoxLengthValidator 
            ID="tlvNote" MaximumLength="1000" ControlToValidate="txtNote" runat="server" 
            ErrorMessage="Maximum Length for Note is 1000 characters" Text="*">      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
        </cc1:TextBoxLengthValidator>
    </td>
  </tr>
  
    <tr valign="top" >
    <td class="fmFieldHeader"></td>
    <td class="fmFieldText" style="padding-top:5px" align="center">
        
        <div style="display: inline; padding-right: 20px">
            <asp:Button ID="btnSaveNewReg" runat="server"  CssClass="ruButtonLarge" TabIndex="36" CommandArgument="newRegistrant" OnClick="btnSubmit_Click"
                Text="Save & Add New Registrant" />
        </div>
         <div style="display: inline">
          <asp:Button ID="btnSubmit2011" runat="server"  CssClass="ruButtonLarge" TabIndex="37" CommandArgument="polstData" OnClick="btnSubmit2011_Click"
                Text="Save & Add 2011/14 POLST Data" />
         
        </div>
        <div style="display: inline;">
          <asp:Button ID="btnSubmit" runat="server"  CssClass="ruButtonLarge" TabIndex="38" CommandArgument="polstData" OnClick="btnSubmit_Click" 
                Text="Save & Add 2009 POLST Data" />
         
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
   <input type="hidden" id="txtMode" runat=server value="edit" />
   </asp:Panel>
   <script language="javascript" type="text/javascript">
    document.getElementById('<%= ddlFacility.ClientID %>').focus();
   </script>
  
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="btnSaveNewReg" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
</asp:Content>


