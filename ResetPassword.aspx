<%@ page language="VB" autoeventwireup="false" inherits="ResetPassword, App_Web_km2z3msj" theme="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Polst Registry: Reset Password</title>
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
</head>
<body>
    <form id="form1" runat="server">
  <div>
     <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
  
        <script type="text/javascript">
	        function CloseAndRefresh()
	        {
		        GetRadWindow().Close();
		        GetRadWindow().BrowserWindow.refreshPage();
		    }
		    function CloseAndLogout() {
		        GetRadWindow().Close();
		        GetRadWindow().BrowserWindow.logout();
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
   
<asp:Panel ID="pnlPart1" runat="server" Visible="true">
            <table cellpadding="0" cellspacing="0" align="center" style="text-align: left;border: solid 1px #594d41">
            <tr>
                <td colspan="2" class="fmHead" style="padding-bottom: 15px; width: 100%">Forgot Your Password?</td>
            </tr>
            <tr>
            <td colspan="2" style="padding: 5px 5px 5px 5px">Please enter your username and the email address associated with your account and a new password will be sent to your email address.</td>
            </tr>
            <tr valign="top">
               <td align="right" style="padding-top: 20px; font-weight: 600" nowrap>Username:</td>
               <td style="padding-top: 20px; padding-left: 5px"><asp:TextBox ID="txtUsername" runat="server" MaxLength="255"></asp:TextBox><br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUsername"
                        Display="Dynamic" ErrorMessage="Username is Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
            <td align="right" style="font-weight: 600; vertical-align: top; padding-top: 10px" nowrap>Email Address:</td>
            <td align="left" style="padding-left: 5px; padding-top: 10px">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" Width="250px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtEmail" Text="Email Address is required" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                        Display="Dynamic" EnableTheming="True" ErrorMessage="A valid e-mail address is required"
                                        
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
            </td>
            </tr>

            

            
            <tr>
            <td align="center" style="text-align:center; padding-top: 20px; padding-bottom: 10px" colspan="2">
                <div align="center"><asp:Label ID="lblMessage" runat="server" EnableViewState="false" Visible="false" ForeColor="Red"></asp:Label></div>
                <div><span><asp:Button ID="btnSubmit" runat="server" Text="Submit" /></span>
                <span style="padding-left: 25px"><asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClientClick="Close()" /></span></div>
            </td>
            </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlPart2" runat="server" Visible="false">
            <table cellpadding="0" cellspacing="0" align="center" style="text-align: left; margin: 10px; padding: 5px 15px 15px 15px; border: solid 1px #594d41">
            <tr>
                <td style="text-align: center; padding-bottom: 15px; padding-top: 15px"><h3>Your Password has been sent to the email address provided.</h3></td>
            </tr>
            
            <tr>
            <td align="center" style="text-align:center; padding-top: 20px; padding-bottom: 10px">
                <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClientClick="Close()" />
            </td>
            </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
