﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PF_CallForm.aspx.cs" Inherits="PolstWebApp.Apps.Search.PF_CallForm" Title="POLST, Registrant Found" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="txtBoxLengthValidator" namespace="txtBoxLengthValidator" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>POLST, No Registrant Found</title>
     <script type="text/javascript">

         function CloseAndReset() {
             GetRadWindow().Close();
             GetRadWindow().BrowserWindow.resetForm();
         }
     
	        function CloseAndRebind(args)
	        {
		        GetRadWindow().Close();
		        GetRadWindow().BrowserWindow.refreshGrid(args);
	        }
    		 function Close()
	        {
		        GetRadWindow().Close();
	        }
	        function GetRadWindow()
	        {
		        var oWindow = null;
		        if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
		        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;//IE (and Moz as well)
    				
		        return oWindow;
		    }

		    function openPolstForm(val) {

		        window.open("../ViewDocument.aspx?item=" + val, "PolstForm");
		        return false;
		    }
	       
        </script>
</head>
<body >
    <form id="form1" runat="server">
    <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
     
        <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="600px" HorizontalAlign="Center" >
            <table width="100%" cellpadding="0" cellspacing="0" align="center">
   <tr>
   <td colspan="2" class="fmHead" style="width:600px;" id="tclHead" runat="server">Call Form - Registrant Found

   </td>
   </tr>
  <tr id="trwDelete" runat="server">
   <td style="padding-top: 5px; padding-bottom: 5px; padding-right: 10px" align="right" colspan="2"><asp:LinkButton ID="btnlDelete" OnClientClick="javascript:return confirm('Delete this Call Form')" runat="server" Text="Delete Call Form" OnClick="btnlDelete_Click"></asp:LinkButton></td>
   </tr>
  <tr valign="top" >
  <td colspan="2" style="padding-bottom: 5px">
    <table align="center">
        <tr>
        <td>
            <table>
                <tr>
                <td class="fmFieldHeader" nowrap="nowrap">
                     Registrant Registry ID:
                  </td>
                    <td class="fmFieldText">
                      <asp:Label ID="lblRegistryID" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
        
       
        <td class="fmFieldText" style="padding-left: 20px">
          <asp:Button ID="btnForm" runat="server" Text="View/Print PDF Form" CausesValidation="false" OnClick="btnForm_Click" />
        </td>
        </tr>
    </table>
   
  </td>
  </tr>
  
  <tr>
  <td class="fmFieldHeader">
  <strong>*</strong> Denotes required field
  </td>
  <td></td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
   
     <asp:CustomValidator ID="cvSearchBegan" runat="server" ValidateEmptyText="true" OnServerValidate="cvSearchBegan_ServerValidate"
            Display="Dynamic" ControlToValidate="rtpSearchBegan" ErrorMessage="Search Began is required and can not be a future time" EnableClientScript="false">*</asp:CustomValidator>
            
        
        Date/Time Search Began<strong>*</strong>:
      </td>
    <td class="fmFieldText">
        
        <telerik:RadDateTimePicker ID="rtpSearchBegan" TabIndex="1"  Runat="server" Width="200px" TimeView-Interval="0:15:0"  TimeView-Columns="5" TimeView-CellPadding="0" TimeView-Width="375px" TimeView-CellSpacing="0">
            <TimeView TimeFormat="hh:mm:ss tt" runat="server"></TimeView>
             <DatePopupButton Visible="false" />
              <TimePopupButton Visible="false" />
            <DateInput DateFormat="MM/dd/yyyy hh:mm:ss tt" runat="server"></DateInput>
        </telerik:RadDateTimePicker>
      
    </td>
  </tr>
  
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
   
     <asp:CustomValidator ID="cvSearchEnded" runat="server" ValidateEmptyText="true" OnServerValidate="cvSearchEnded_ServerValidate"
            Display="Dynamic" ControlToValidate="rtpSearchEnded" ErrorMessage="Registrant Found is required and can not be a future time" EnableClientScript="false">*</asp:CustomValidator>
            
        
        Date/Time Registrant&nbsp;&nbsp;&nbsp;<br />Found<strong>*</strong>:
      </td>
    <td class="fmFieldText">
      
        <telerik:RadDateTimePicker ID="rtpSearchEnded" TabIndex="2" Runat="server" Width="200px" TimeView-Interval="0:15:0"  TimeView-Columns="5" TimeView-CellPadding="0" TimeView-Width="375px" TimeView-CellSpacing="0">
              <TimeView ID="TimeView1" TimeFormat="hh:mm:ss tt" runat="server"></TimeView>
              <DatePopupButton Visible="false" />
              <TimePopupButton Visible="false" />
              <DateInput ID="DateInput1" DateFormat="MM/dd/yyyy h:mm:ss tt" runat="server"></DateInput>
        </telerik:RadDateTimePicker>
      
    </td>
  </tr>
  <tr valign="top">
   
     <td class="fmFieldHeader">
     <asp:CustomValidator ID="rvMedicUnit" runat="server"  
            Display="Dynamic" ControlToValidate="ddlMedicUnit" ErrorMessage="You must select a Medic Unit or Hospital and not both" EnableClientScript="false" OnServerValidate="rvMedicUnit_ServerValidate">*</asp:CustomValidator>
    Medic Unit:</td>
    <td class="fmFieldText">
    
       <asp:DropDownList ID="ddlMedicUnit" runat="server" TabIndex="3"></asp:DropDownList>
    </td>
    </tr>
    <tr>
    
    <td style="font-weight: 600; padding-top: 5px" colspan="2" align="center">OR <strong>*</strong></td>
    </tr>
    <tr>
    <td class="fmFieldHeader">
     
    Hospital:
    </td>
    <td class="fmFieldText">
    
       <asp:DropDownList ID="ddlHospital" runat="server" TabIndex="4" AutoPostBack="true" OnSelectedIndexChanged="ddlHospital_SelectedIndexChanged"></asp:DropDownList>
    </td>
    </tr>
   
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>   
        ED Fax #:
      </td>
    <td class="fmFieldText">
      <asp:UpdatePanel ID="updFax" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        
        
      <telerik:RadMaskedTextBox ID="txtFaxNumber" Runat="server" TabIndex="5"   style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
              Mask="(###)-###-####" ></telerik:RadMaskedTextBox>
      </ContentTemplate>
      <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlHospital" EventName="SelectedIndexChanged" />
      </Triggers>
      </asp:UpdatePanel>
    </td>
  </tr>
    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
    <asp:CustomValidator ID="rfMDName" runat="server" ControlToValidate="ddlHospital" TabIndex="6" Display="Dynamic" ErrorMessage="Person Requesting Form is required when a hospital is selected" Text="*" EnableClientScript="false" OnServerValidate="rfMDName_ServerValidate"></asp:CustomValidator>  
        Person Requesting Form:
      </td>
    <td class="fmFieldText">
    
      <asp:TextBox Width="250px" ID="txtMDName" runat="server" TabIndex="6"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
    <asp:RangeValidator ID="rvRequestReason" runat="server" MinimumValue="1" MaximumValue="10000" Type="Integer" 
            Display="Dynamic" ControlToValidate="ddlRequestReason" ErrorMessage="Reason For Request is Required" EnableClientScript="false">*</asp:RangeValidator>
    Reason For Request<strong>*</strong>:</td>
    <td class="fmFieldText">
    
       <asp:DropDownList ID="ddlRequestReason" runat="server" TabIndex="8"></asp:DropDownList>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
    <asp:CustomValidator ID="cvMRHConsult" runat="server" ControlToValidate="rblMRHConsult" Display="Dynamic" ErrorMessage="MRH Consult is Required for Medic Unit Calls" Text="*" EnableClientScript="false" OnServerValidate="cvMRHConsult_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>  
     MRH Consult Requested:</td>
    <td class="fmFieldText">
       <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblMRHConsult" runat="server" >
       <asp:ListItem Text="Yes" Value="1" TabIndex="9"></asp:ListItem>
       <asp:ListItem Text="No" Value="0" TabIndex="10"></asp:ListItem>
       </asp:RadioButtonList>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Call Taken By<strong>*</strong>:</td>
    <td class="fmFieldText">
       <asp:DropDownList ID="ddlTakenBy" runat="server" TabIndex="11"></asp:DropDownList>
    </td>
  </tr>
  <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
        Recorded By<strong>*</strong>:</td>
    <td class="fmFieldText">
       <asp:DropDownList ID="ddlRecordedBy" runat="server" TabIndex="12"></asp:DropDownList>
    </td>
  </tr>
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>
    <asp:RangeValidator ID="RangeValidator2" runat="server" MinimumValue="1" MaximumValue="10000" Type="Integer" 
            Display="Dynamic" ControlToValidate="ddlCallTakenAt" ErrorMessage="Call Taken At is Required" EnableClientScript="false">*</asp:RangeValidator>    
    Call Taken At<strong>*</strong>:</td>
    <td class="fmFieldText">
        <asp:DropDownList ID="ddlCallTakenAt" runat="server" TabIndex="13">
        </asp:DropDownList>
    </td>
  </tr>
  
    <tr valign="top" >
    <td class="fmFieldHeader" style="vertical-align: top">
    
        <cc1:TextBoxLengthValidator ID="tblvNotes" runat="server" 
            ErrorMessage="Maximum length is 1500 characters" Text="*" 
            ControlToValidate="txtNote" Display="Dynamic" EnableClientScript="False"></cc1:TextBoxLengthValidator>
    
    Additional Note(s):
      </td>
    <td class="fmFieldText">
    
      <asp:TextBox ID="txtNote"  runat="server" TextMode="MultiLine" Rows="4" 
            Width="365px" TabIndex="14"></asp:TextBox>
      
    </td>
    </tr>
    <tr>
      <td align="left" colspan="2" style="padding-left:100px; padding-top: 10px">
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" BorderColor="Red" 
              BorderWidth="1px" HeaderText="The following error(s) need to be fixed:" 
              style="padding-top:5px; padding-left: 5px" Width="419px" />
      </td>
   </tr>
  
     <tr valign="top" >
    <td class="fmFieldHeader"></td>
    <td class="fmFieldText" style="padding-top:10px;" align="center">
        <div style="padding-top: 5px; padding-bottom: 5px"> 
        <asp:Label ID="lblMessage" runat="server" EnableViewState="False" 
            ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div style="display:inline; padding-right: 10px">
          <asp:Button ID="btnSubmit" runat="server"  CssClass="ruButton" TabIndex="15" OnClick="btnSubmit_Click"
                Text="Submit" />
                </div>
            <div style="display:inline;"> 
         
        </div>
       
       
    </td>
  </tr>
  
     
   </table>
   <input type="hidden" id="txtMode" runat="server" value="edit" />
 
    
        </asp:Panel>
    
    
 
    </form>
</body>
</html>