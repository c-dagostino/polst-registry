<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewScannedForm.aspx.cs" Inherits="PolstWebApp.Apps.Forms.NewScannedForm" Title="New Scanned Form(s)" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Scanned Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager id="scm1" runat="server" ScriptMode="Release"></asp:ScriptManager>
   <div class="container">

        <script type="text/javascript">
	           		
	        function GetRadWindow()
	        {
		        var oWindow = null;
		        if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
		        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;//IE (and Moz as well)
    				
		        return oWindow;
		    }

		    function CloseAndRefreshPage(args) {
		        GetRadWindow().Close();
		        GetRadWindow().BrowserWindow.refreshPage(args);
		    }

	        function CancelEdit()
	        {
	            GetRadWindow().Close();		
	        }
	        
	        
        </script>
           
            
        <asp:Panel ID="pnlForm" runat=server SkinID=pnlForm >
            <telerik:radprogressmanager id="Radprogressmanager1" runat="server" />

            <table cellpadding="0" cellspacing="0">
                
                <tr>
                    <td class="fmHead" style="width: 600px">New Scanned Form(s)</td>
                </tr>
                <tr>
                    <td style="padding-top: 15px; padding-left: 10px; padding-right: 10px">   
                    
                            <asp:panel ID="pnlInner" runat="server" SkinID="pnlForm">
                            <table cellpadding="0" cellspacing="0" style="padding-top: 10px" >
                                
                                <tr>
                                     <td valign="top" class="fmFieldHeader" style="padding-left:10px; vertical-align: text-top" >
                                        Add File(s)
                                    </td>
                                    <td>
                        
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="vertical-align: top; text-align: left;">
                                                    
                                                   <telerik:radupload 
                                            id="RadUpload1" 
                                            runat="server" 
                                            Skin="Vista"
                                            initialfileinputscount="2" MaxFileInputsCount="10" 
                                           />
                                        <telerik:radprogressarea id="progressArea1" runat="server" Skin="Telerik"></telerik:radprogressarea>
                                        
                                   
                                    
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                            </tr>
                        </table>
                       </asp:panel>
                    </td>
                                
                                </tr>
                            
                <tr>
                <td align="center" style="padding-top:20px">
                 <asp:Button ID="btnSubmit" runat="server" Text="Save"  CssClass="ruButton" OnClick="btnSubmit_Click" />&nbsp&nbsp;<asp:Button ID="btnClose"
                        runat="server"  Text="Close" CausesValidation="false" CssClass="ruButton" OnClick="btnClose_Click" />
                </td>
                </tr>
                <tr>
                    <td id="tclRepeater" style="padding-left: 30px; padding-top: 10px">
                         <div align="left"> <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="validation" Visible="false"></asp:Label></div>
                        <asp:Label ID="lblNoFiles" Visible="false" EnableViewState="false" runat="server" CssClass="validation" style="padding-bottom: 10px">You must select at least one valid file</asp:Label>
                        <asp:Repeater ID="repeaterValidResults" runat="server" Visible="False" EnableViewState="false">
                            <HeaderTemplate>
                                The following files were successfully processed:
                           </HeaderTemplate>
                            <ItemTemplate>
                                <ul><li style="margin-top: -5px">
                                    <%# GetShortFileName(Eval("FileName").ToString())%></li></ul>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
               
            </table>
           
        </asp:Panel>
    
    </div> 
    </form>
</body>
</html>