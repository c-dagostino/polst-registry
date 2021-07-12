<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" maintainscrollpositiononpostback="true" autoeventwireup="false" inherits="Apps_ManageUser, App_Web_2ntjiryh" title="Create/Edit User" theme="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:Panel ID="pnlForm" runat=server SkinID=pnlForm Width="700px" >

<table width="700px" cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="2" class="fmHead" style="width:700px;" id="tclHead" runat="server">Manage User

   </td>
   </tr>
   <tr><td colspan="2" >&nbsp;</td></tr>
   <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Username:</td><td class="fmFieldText">
        <asp:TextBox ID="txtUsername" runat="server" MaxLength="100" Width="345px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvalUsername" runat="server" ControlToValidate="txtUsername"
            Display="Dynamic" ErrorMessage="Username is Required">*</asp:RequiredFieldValidator></td>
    </tr>
     
    <tr height="15px">
       <td class="fmFieldHeader" nowrap valign="top">Role:</td><td class="fmFieldText" valign="middle" nowrap>
       <asp:RadioButtonList CellPadding="0" CellSpacing="0"  RepeatColumns="3"  RepeatDirection="horizontal" ID="rblRole" runat="server" Width="220px" Height="15px">
       <asp:ListItem Value="user" Text="User"></asp:ListItem>
       <asp:ListItem Value="dataentry" Text="Data Entry"></asp:ListItem>
        <asp:ListItem Value="admin" Text="Admin"></asp:ListItem>
       </asp:RadioButtonList></td>
    </tr>
     
     <tr valign="top" id="trwPassword1" runat="server">
    <td class="fmFieldHeader" nowrap>Password:</td><td class="fmFieldText">
        <asp:TextBox ID="txtPassword1" runat="server" Width="345px" MaxLength=50 TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfValPassword" runat="server" ControlToValidate="txtPassword1"
            Display="Dynamic" ErrorMessage="Password is Required">*</asp:RequiredFieldValidator></td>
    </tr>
     <tr valign="top" id="trwPassword2" runat="server" >
    <td class="fmFieldHeader" nowrap>Retype Password:</td><td class="fmFieldText">
        <asp:TextBox ID="txtPassword2" runat="server" Width="345px" MaxLength=50 TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword1"
            ControlToValidate="txtPassword2" ErrorMessage="Passwords must match" Display="Dynamic">Passwords must match</asp:CompareValidator></td>
    </tr>
    <tr valign="top" >
    <td class="fmFieldHeader" >Contact Email:</td><td class="fmFieldText">
        <asp:TextBox ID="txtEmail" runat="server" Width="345px" MaxLength=255></asp:TextBox>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
            Display="Dynamic" ErrorMessage="The email address entered is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
      <td class="fmFieldHeader" >Contact First Name:</td><td class="fmFieldText">
        <asp:TextBox ID="txtFName" runat="server" Width="345px" MaxLength=50></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td class="fmFieldHeader" >Contact Last Name:</td><td class="fmFieldText">
        <asp:TextBox ID="txtLName" runat="server" Width="345px" MaxLength=50></asp:TextBox>
    </td>
    </tr>
     <tr valign="top" id="trwReset1" runat="server" nowrap>
    <td class="fmFieldHeader">Reset Password:</td><td class="fmFieldText">
    <asp:Button ID="btnResetPassword" runat="server" Text="Reset" />
    </td>
    </tr>
    <tr valign="top" id="trwReset2" runat="server" nowrap>
    <td class="fmFieldHeader">New Password:</td><td class="fmFieldText">
    <asp:Label ID="lblNewPassword" runat="server" Width="342px" EnableViewState="false"></asp:Label>
    </td>
    </tr>
     <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Account is Active:</td><td class="fmFieldText">
        <asp:CheckBox id="chkAccountActive" runat=server  />
     </td>
    </tr>
     <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Account Locked:</td><td class="fmFieldText">
        <asp:CheckBox id="chkAccountLocked" runat=server  />
     </td>
    </tr>

     <tr valign="top" >
    <td class="fmFieldHeader" valign="top" style="vertical-align: text-top; padding-top: 20px" nowrap>Access Level:</td><td class="fmFieldText" valign="top" style="vertical-align: text-top">
        <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" ID="rblAccessLevel" runat="server"></asp:RadioButtonList><br />
        <asp:CheckBox ID="chkEpolstSigner" runat="server" Text="User can sign E-Polst Forms" />
     </td>
    </tr>

    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Cert:</td><td class="fmFieldText">
        <asp:DropDownList ID="ddlCert" runat="server"></asp:DropDownList>
     </td>
    </tr>

    <tr valign="top" >
    <td class="fmFieldHeader" nowrap>License(s):</td><td class="fmFieldText">
        <asp:TextBox ID="txtLicense" runat="server" Width="345" MaxLength="100"></asp:TextBox>
     </td>
    </tr>
    
     
      <tr valign="top" >
    <td class="fmFieldHeader" nowrap>Phone:</td><td class="fmFieldText">
        <telerik:RadMaskedTextBox ID="txtPhoneNumber" Runat="server" Mask="(###)-###-####" ></telerik:RadMaskedTextBox>
     </td>
    </tr>

     <tr valign="top" >
    <td class="fmFieldHeader" ></td><td class="fmFieldText" style="padding-top:15px">
        <div><asp:Button ID="btnSubmit" runat="server" Text="Submit" />&nbsp;&nbsp;&nbsp;<asp:Button id="btnCancel" runat="server" Text="Close" CausesValidation="false"></asp:Button></div>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="The following error(s) where encountered"
            Width="419px" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="False" Width="400px" EnableViewState="False"></asp:Label></td>
    </tr>
    
   </table>
   <input type="hidden" id="txtMode" runat=server value="edit" />
   </asp:Panel>
</asp:Content>

