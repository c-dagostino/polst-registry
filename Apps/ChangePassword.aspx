<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="PolstWebApp.Apps.ChangePassword" MasterPageFile="~/Apps/PolstMaster.master" Title="Change Password"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 650px;text-align: center;padding-top:20px">
    <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#F9f9f9" BorderColor="#333333"
        BorderPadding="0" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
        Font-Size="12px" Height="164px" 
        InstructionText="Passwords need to be at least 8 characters Long and contain 1 Upper Case, 1 Lower Case and 1 non alpha-numeric character">
        <CancelButtonStyle CssClass="ruButtonMedium" />
      
        <PasswordHintStyle Font-Italic="True" ForeColor="#888888" />
        <ChangePasswordButtonStyle CssClass="ruButtonMedium" />
        <ContinueButtonStyle CssClass="ruButtonMedium" />
 
        <TitleTextStyle BackColor="#e798a8" Font-Bold="True" ForeColor="#333333" Font-Size="16px" />
            <InstructionTextStyle Font-Italic="True" />
            
            <TextBoxStyle Font-Size="11px" />
    </asp:ChangePassword></div>
</asp:Content>
