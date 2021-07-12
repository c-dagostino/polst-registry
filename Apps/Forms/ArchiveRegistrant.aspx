<%@ page language="VB" autoeventwireup="false" inherits="Apps_Forms_ArchiveRegistrant, App_Web_agr5ncgw" theme="Default" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="txtBoxLengthValidator" namespace="txtBoxLengthValidator" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Registrant</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
  
        <script type="text/javascript">
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
	       

	      
	        
	        
        </script>
           
            
        <asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" >
            <table width="100%" cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="2" class="fmHead" style="width:700px;" id="tclHead" runat="server">Archive Registrant

   </td>
    </tr>
    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Registry ID:</td>
    <td class="fmFieldText">
        <asp:Label id="lblRegistryID" runat="server"></asp:Label>
    </td>
  </tr>
   
    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Name:</td>
    <td class="fmFieldText">
        <asp:Label id="lblName" runat="server"></asp:Label>
    </td>
  </tr>
  
  <tr valign="top" style="vertical-align: text-top">
    <td class="fmFieldHeader" nowrap>Archive Reason:
   
    </td>
    <td class="fmFieldText">
        <asp:RadioButtonList ID="rblArchiveReason" runat="server" RepeatColumns="1" RepeatDirection="Vertical" TabIndex="1"></asp:RadioButtonList>
         <asp:RequiredFieldValidator ID="rfvArchiveReason" runat="server" Display="Dynamic" ControlToValidate="rblArchiveReason" ErrorMessage="Archive Reason is Required" ></asp:RequiredFieldValidator>
    </td>
  </tr>
  
    <tr valign="top" >
    <td class="fmFieldHeader" style="vertical-align: text-top">
    
    Note(s):
    
        
      </td>
    <td class="fmFieldText">
    
      <asp:TextBox ID="txtNote"  runat="server" TextMode="MultiLine" Rows="3" Width="95%" TabIndex="2"></asp:TextBox><br />
       <cc1:TextBoxLengthValidator 
            ID="tlvNote" MaximumLength="500" ControlToValidate="txtNote" runat="server" Display="Dynamic"
            ErrorMessage="Maximum Length for Note is 500 characters"> </cc1:TextBoxLengthValidator>
       
    </td>
  </tr>
    <tr valign="top" >
    <td class="fmFieldHeader"></td>
    <td class="fmFieldText" style="padding-top:15px;">
        <div id="divMessage" style="padding-top: 5px; padding-bottom: 5px"><asp:Label ID="lblMessage" runat="server" Visible="false" EnableViewState="false" CssClass="validation" Text="The specified Archive Reason requires notes about the reason"></asp:Label></div>
        <div style="display:inline; padding-right: 10px">
          <asp:Button ID="btnSubmit" runat="server"  CssClass="ruButton" TabIndex="3" 
                Text="Submit" />
                </div>
            <div style="display:inline;"> 
          <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="ruButton" TabIndex="4" CausesValidation="false" /> 
        </div>
       
        
    </td>
  </tr>
  
   
     
   </table>
   <input type="hidden" id="txtMode" runat="server" value="edit" />
 
    
        </asp:Panel>
  
          
    </form>
</body>
</html>
