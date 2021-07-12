<%@ page language="VB" masterpagefile="~/Apps/PolstMaster.master" autoeventwireup="false" inherits="Apps_Forms_NewRegistrant, App_Web_agr5ncgw" title="POLST, New Registrant" theme="Default" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:UpdatePanel ID="upd1" runat="server">
    <ContentTemplate>
   <script language="javascript" type="text/javascript">
   <!--
   function ClientDateValidate(source, arguments)
   {
      if (Date.parse(arguments.Value) > Date.parse('<%= DateTime.Today %>'))
         arguments.IsValid= false;
      else
         arguments.IsValid= true;
   }
   // -->
</script>

<asp:Panel ID="pnlForm" runat="server" SkinID="pnlForm" Width="700px" >
<table width="700px" cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="2" class="fmHead" style="width:700px;" id="tclHead" runat="server">New Registrant or Form

   </td>
   </tr>
    <tr>
    <td colspan="2" align="center" style="padding-top: 10px; padding-right: 10px; padding-right: 10px"><p>To begin, fill out the Registrant's Name, DOB and Last 4 if known <strong><U>OR</U></strong> enter the Registrant's Registry ID and the date the Form was signed</p>
</td>
    </tr>
    
    <tr>
        <td  colspan="2" style="padding: 10px">
            <div style="border: solid 1px Gray">
            <table width="95%">
                <tr valign="top" >
                    <td class="fmFieldHeader" nowrap>
                    <asp:RequiredFieldValidator ID="rfvalLastName" runat="server" ControlToValidate="txtLastName"
                            Display="Dynamic" ErrorMessage="Last Name is Required" ValidationGroup="newp">*</asp:RequiredFieldValidator>
                    Last Name:</td>
                    <td class="fmFieldText">
                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="150" Width="345px" TabIndex="1" ValidationGroup="newp"></asp:TextBox>
                        
                    </td>
                </tr>
              <tr valign="top" >
                <td class="fmFieldHeader" nowrap>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                        Display="Dynamic" ErrorMessage="First Name is Required" ValidationGroup="newp">*</asp:RequiredFieldValidator>
                First Name:</td>
                <td class="fmFieldText">
                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="150" Width="345px" TabIndex="2" ValidationGroup="newp"></asp:TextBox>
                    
                </td>
              </tr>
               <tr valign="top" >
                <td class="fmFieldHeader" nowrap>Middle Name:</td>
                <td class="fmFieldText">
                    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="50" Width="345px" TabIndex="3" ValidationGroup="newp"></asp:TextBox>
                </td>
              </tr>
  
   
  
              <tr valign="top">
              
                  <td class="fmFieldHeader" nowrap>
                   <asp:RangeValidator ID="rvDOB" runat="server" ControlToValidate="txtDOB" 
                          Display="Dynamic" ErrorMessage="DOB is required and can not be a future date" MaximumValue="01/01/2099" 
                          MinimumValue="01/01/1889" Type="Date" ValidationGroup="newp">*</asp:RangeValidator>
                      Date of Birth:</td>
                  <td class="fmFieldText">
                      <telerik:RadMaskedTextBox ID="txtDOB" Runat="server" TabIndex="4"   style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
                          Mask="<1..12>/<1..31>/<1888..2099>" 
                          EmptyMessage="DOB is Required" Text="01011888" Width="90px" ValidationGroup="newp">
                           
                      </telerik:RadMaskedTextBox>
                     
                      
                  </td>
              
              </tr>
  
             
              <tr valign="top" >
                <td class="fmFieldHeader" nowrap>State:</td>
                <td class="fmFieldText">
                    <asp:DropDownList ID="ddlState" runat="server" TabIndex="6"></asp:DropDownList>
                </td>
              </tr>
  
   
  
            <tr valign="top" >
            <td class="fmFieldHeader"></td>
            <td class="fmFieldText" style="padding-top:15px">
                <div>
                  <asp:Button ID="btnSubmit" runat="server"  CssClass="ruButton" TabIndex="7" 
                        Text="Next >" ValidationGroup="newp" 
                        PostBackUrl="~/Apps/Forms/MatchingRegistrants.aspx" />
                 
                </div>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" BorderColor="Red" BorderWidth="1px"
                    HeaderText="The following error(s) need to be fixed:" Width="419px" style="padding-top:5px" ValidationGroup="newp" />
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" 
                    ForeColor="Red" Visible="False" Width="400px"></asp:Label>
                   
                
                
                </td>
            </tr>
    </table>
     </div>
   
    </td>
  </tr>
  <tr>
    <td colspan="2" style="padding-bottom: 10px; padding-top: 10px"> <p style="text-align: center; font-size: 14px; font-weight: 600">OR</p></td>
  </tr>
  <tr>
 
  <td  colspan="2" style="padding: 10px">
      <div style="border: solid 1px Gray">
            <table width="95%">
             <tr valign="top" >
            <td class="fmFieldHeader" nowrap>
            <asp:RequiredFieldValidator ID="rfvRegistryID" runat="server" ControlToValidate="txtRegistryID" ErrorMessage="Registry ID is required" Text="*" ValidationGroup="polstid"></asp:RequiredFieldValidator>
            Registry ID:</td>
            
            <td class="fmFieldText">
                <asp:TextBox ID="txtRegistryID" runat="server" MaxLength="100" Width="100px" ValidationGroup="polstid"
                    TabIndex="8"></asp:TextBox>
                    
            </td>
                <td class="fmFieldHeader" nowrap>
                <asp:RangeValidator ID="rvDateSigned" runat="server" ControlToValidate="txtDateSigned" EnableClientScript="true" ValidationGroup="polstid"
                              Display="Dynamic" ErrorMessage="Date Signed is Required and can not be a future date" MaximumValue="01/01/2099" 
                              MinimumValue="01/01/1990" Type="Date">*</asp:RangeValidator>
              Date Signed:</td>
                  <td class="fmFieldText" colspan="3">
                      <telerik:RadMaskedTextBox ID="txtDateSigned" ValidationGroup="polstid" Width="90px" TabIndex="9" Runat="server" style="border-bottom: solid 1px #d2d2d2; border-right: solid 1px #d2d2d2; border-left: solid 1px #d2d2d2; border-top: outset 2px #d2d2d2; font-family: Verdana; font-size: 11px; color: #333333"
                         Mask="<1..12>/<1..31>/<1900..2099>">
                      </telerik:RadMaskedTextBox>
                   
                  </td>
                  <td valign="middle">
                  <asp:Button ID="btnSubmitLower" 
                    runat="server" text="Next >" CssClass="ruButton" ValidationGroup="polstid"  TabIndex="10"
                    />
                  </td>
             </tr>
             <td align="left" colspan="5" style="padding-left: 50px">
             <asp:ValidationSummary ID="ValidationSummary2" runat="server" BorderColor="Red" BorderWidth="1px"
                    HeaderText="The following error(s) need to be fixed:" Width="419px" style="padding-top:5px" ValidationGroup="polstid" />
              <asp:Label ID="lblMessageLower" runat="server" EnableViewState="False" 
                    ForeColor="Red" Visible="False" Width="500px"></asp:Label>
             </td>
                
              
            </td>
          </tr>
     
            </table>
            </div>
    </td>
  </tr>
  </table>
  
   </asp:Panel>
   
   <script language="javascript" type="text/javascript">
        document.getElementById('<% =txtLastName.ClientID %>').focus();
   </script>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


