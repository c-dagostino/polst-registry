<%@ page language="VB" autoeventwireup="false" inherits="_Default, App_Web_km2z3msj" theme="Default" title="POLST Registry Login" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
        <script language="javascript" type="text/javascript">
           
            function forgotPassword() {

                window.radopen("ResetPassword.aspx", "rwResetPassword");

            }
            
        </script>
        <telerik:RadWindowManager Top="65px" Width="730px" Height="690px" ID="RadWindowManager1" runat="server" Skin="Vista">
        <Windows>
            
                       
             <telerik:RadWindow ID="rwResetPassword" runat="server" Title="Edit Child" ReloadOnShow="false"  
                Modal="true" Skin="Vista" KeepInScreenBounds="true" NavigateUrl="ResetPassword.aspx" VisibleOnPageLoad="false" Top="15px" Left="100px" Width="420px"  height="375px"/>
                
             
        </Windows>
   </telerik:RadWindowManager>
    
    <asp:Panel HorizontalAlign="Center" runat="server" style="vertical-align:middle">
    
    <div align="center">
     
    <asp:Image ID="imgLogin" runat="server" ImageUrl="~/Images/POLSTLoginPink.gif" style="border-left: solid 1px #999999; border-right: solid 1px #999999; border-top: solid 1px #999999"  />
   
    </div>
    <div align="center" style="margin-top:-3px">
   
        <asp:Login ID="Login1" runat="server" BorderPadding="0" Font-Names="Verdana" Font-Size="12px" ForeColor="#333333" BackColor="#d9dff0" Height="100px" Width="300px" DisplayRememberMe="False" TitleText="" 
            Style="border-left: solid 1px #999999; border-right: solid 1px #999999; border-bottom: solid 1px #999999">
            <TextBoxStyle Width="200px"  />
            <InstructionTextStyle Font-Italic="True" />
            <LoginButtonStyle Height="25px" Width="100px" Font-Size="12px" />
            <TextBoxStyle Font-Size="12px" Width="100px" />
        </asp:Login>
    </div>
     <div style="padding-left: 180px; padding-top: 5px"><a href="javascript:forgotPassword()" title="Forget Password" style="font-weight: bold" >Forgot Password?</a></div>
    <div align="center" style="padding-top:10px" class="normal">
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" EnableViewState="false" Text="Invalid Username/Password" Visible="false"></asp:Label>
    </div>
    <div align="center" style="padding-top:10px" class="normal">UNAUTHORIZED ACCESS Is Prohibited and<br />
				May Result in Both Civil and Criminal Prosecution.</div>
				</asp:Panel>
    </form>
</body>
</html>
