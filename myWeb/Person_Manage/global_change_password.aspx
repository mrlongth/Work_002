<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="global_change_password.aspx.cs" Inherits="myWeb.Person_Manage.global_change_password" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;</td>
            <td align="left" colspan="2" nowrap valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;</td>
            <td align="left" colspan="2" nowrap valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;</td>
            <td align="left" colspan="2" nowrap valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                                        <asp:Label runat="server" CssClass="label_error" ID="Label72">*</asp:Label>
                <asp:Label runat="server" ID="lblPasswrod">รหัสผ่าน :</asp:Label>
            </td>
            <td align="left" colspan="2" nowrap valign="top">
                <asp:TextBox ID="txtpassword" runat="server" CssClass="textbox" MaxLength="100"
                      Width="200px" ValidationGroup="A" CausesValidation="True" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpassword"
                    Display="None" ErrorMessage="กรุณาป้อมรหัสผ่าน" ValidationGroup="A" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                                        <asp:Label runat="server" CssClass="label_error" ID="Label71">*</asp:Label>
                <asp:Label ID="Label11" runat="server">ยืนยันรหัสผ่าน :</asp:Label>
            </td>
            <td align="left" colspan="2" nowrap valign="top">
                <font face="Tahoma"><asp:TextBox ID="txtconfirm_password" runat="server" CssClass="textbox"
                    MaxLength="100"   Width="200px" CausesValidation="True" ValidationGroup="A" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtconfirm_password"
                    Display="None" ErrorMessage="กรุณาป้อนยืนยันรหัสผ่าน" ValidationGroup="A" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirm_password" Display="None" ErrorMessage="รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกันโปรดตรวสอบ" ValidationGroup="A"></asp:CompareValidator>
                </font>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;</td>
            <td align="left" colspan="2" nowrap valign="top">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" />
            </td>
            <td nowrap rowspan="4" align="center" colspan="2">
                <asp:ImageButton ID="imgSaveOnly" runat="server" ImageUrl="~/images/controls/save.jpg"
                    ValidationGroup="A" OnClick="imgSaveOnly_OnClick" />
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;</td>
            <td align="left" nowrap valign="top" colspan="2">
                    <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top" style="height: 20px">
                &nbsp;</td>
            <td align="left" nowrap valign="top" style="height: 20px">
                &nbsp;</td>
            <td align="right" nowrap valign="top" style="height: 20px">
                &nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;
            </td>
            <td align="left" nowrap valign="top">
                &nbsp;
            </td>
            <td align="right" nowrap style="text-align: left" valign="top">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
