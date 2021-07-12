<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArchivePolstForm.aspx.cs" Inherits="PolstWebApp.Apps.Forms.ArchivePolstForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="txtBoxLengthValidator" namespace="txtBoxLengthValidator" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Archive Polst Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
  
        <script type="text/javascript">
            function CloseAndRebind() {
                GetRadWindow().Close();
                GetRadWindow().BrowserWindow.refreshPage("refreshData");
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
           
            
        <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" >
            <table width="100%" cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="2" class="fmHead" style="width:100%" id="tclHead" runat="server">Archive POLST Form

   </td>
    </tr>
     
  <tr valign="top" style="vertical-align: text-top;">
    <td class="fmFieldHeader" nowrap valign="top" style="vertical-align: text-top; padding-top: 10px">Archive Reason:
   
    </td>
    <td class="fmFieldText">
        <asp:RadioButtonList ID="rblArchiveReason" runat="server" RepeatColumns="1" RepeatDirection="Vertical" TabIndex="1"></asp:RadioButtonList>
         <asp:RequiredFieldValidator ID="rfvArchiveReason" runat="server" Display="Dynamic" ControlToValidate="rblArchiveReason" ErrorMessage="Archive Reason is Required" ></asp:RequiredFieldValidator>
    </td>
  </tr>
  
    <tr valign="top">
    <td class="fmFieldHeader" style="vertical-align: text-top">
    
    Note(s):
    
        
      </td>
    <td class="fmFieldText">
    
      <asp:TextBox ID="txtNote"  runat="server" TextMode="MultiLine" Rows="3" Width="95%" TabIndex="2"></asp:TextBox><br />
       <cc1:TextBoxLengthValidator 
            ID="tlvNote" MaximumLength="400" ControlToValidate="txtNote" runat="server" Display="Dynamic"
            ErrorMessage="Maximum Length for Note is 400 characters"> </cc1:TextBoxLengthValidator>
       
    </td>
  </tr>
    <tr valign="top" >
    <td class="fmFieldHeader"></td>
    <td class="fmFieldText" style="padding-top:15px;">
        <div id="divMessage" style="padding-top: 5px; padding-bottom: 5px"><asp:Label ID="lblMessage" runat="server" Visible="false" EnableViewState="false" CssClass="validation" Text="The specified Archive Reason requires notes about the reason"></asp:Label></div>
        <div style="display:inline; padding-right: 10px">
          <asp:Button ID="btnSubmit" runat="server"  CssClass="ruButton" TabIndex="3" 
                Text="Submit" onClick="btnSubmit_Click" />
                </div>
            <div style="display:inline;"> 
          <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="ruButton" TabIndex="4" CausesValidation="false" OnClick="btnCancel_Click" /> 
        </div>
       
        
    </td>
  </tr>
  
   
     
   </table>
  
    
        </asp:Panel>
  
          
    </form>
</body>
</html>
