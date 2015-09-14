<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_special_item_control.aspx.cs" Inherits="myWeb.App_Control.payment_special.payment_special_item_control" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Assembly="Aware.WebControls" Namespace="Aware.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../js/jquery.min.js" type="text/javascript"></script>

    <asp:ValidationSummary runat="server" ID="valValidationSummary"></asp:ValidationSummary>

    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr>
            <td align="right" nowrap valign="middle">&nbsp;
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right">
                <asp:Label ID="lblError" runat="server" CssClass="label_error"></asp:Label>
                <asp:Label runat="server" ID="lblLastUpdatedBy">Last Updated By :</asp:Label>
            </td>
            <td align="left" style="width: 1%">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textboxdis" Width="148px" ID="txtUpdatedBy">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap valign="middle">&nbsp;</td>
            <td align="left" nowrap valign="middle" style="text-align: right">&nbsp;<asp:Label runat="server" ID="lblLastUpdatedDate">Last Updated Date :</asp:Label>
            </td>
            <td align="left">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textboxdis" Width="148px" ID="txtUpdatedDate"></asp:TextBox>
                &nbsp;</td>
        </tr>
    </table>
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="17%">
                <asp:Label runat="server" ID="Label15">เลขที่เอกสาร :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="2" style="width: 55%">
                <asp:Label runat="server" ID="lblpayment_doc" Font-Bold="True" ForeColor="#3366CC">XXXXX</asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" ID="Label73x">รหัสบุคลากร :</asp:Label>
                &nbsp;<asp:Label runat="server" ID="lblperson_code" Font-Bold="True" ForeColor="#3366CC">P001</asp:Label>
                <asp:Label runat="server" ID="lblPersoncode0" Font-Bold="True" ForeColor="#3366CC">-</asp:Label>
                <asp:Label runat="server" ID="lblperson_name" Font-Bold="True" ForeColor="#3366CC">XXXXX</asp:Label>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label14">ปีงบประมาณ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="2">
                <asp:TextBox runat="server" CssClass="textboxdis" Width="100px" ID="txtyear"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtitem_code" Display="None" ErrorMessage="กรุณาป้อนรหัสรายได้/จ่าย" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" CssClass="label_error" ID="Label71">*</asp:Label>
                <asp:Label runat="server" ID="lblPage9">รายได้/จ่าย :</asp:Label>
            </td>
            <td align="left" colspan="2" nowrap valign="middle">
                <asp:HiddenField ID="hddpayment_detail_id" runat="server" />
                <asp:TextBox runat="server" CssClass="textbox" Width="100px" ID="txtitem_code" MaxLength="10"></asp:TextBox>
                &nbsp;<asp:ImageButton runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif"
                    ID="imgList_item"></asp:ImageButton>
                <asp:ImageButton runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif"
                    ID="imgClear_item"></asp:ImageButton>
                &nbsp;<asp:TextBox runat="server" CssClass="textbox" Width="330px" ID="txtitem_name"
                    MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="lblPage16">รายละเอียดรายการ :</asp:Label>
            </td>
            <td align="left" colspan="2" nowrap valign="middle">
                <asp:TextBox runat="server" CssClass="textbox" Width="490px" ID="txtcomments_sub"
                    MaxLength="255"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="lblPage3">จำนวน :</asp:Label>
            </td>
            <td align="left" colspan="2" nowrap valign="middle">
                <cc1:AwNumeric ID="txtitem_qty" runat="server" CssClass="textbox" MaxValue="99999999" MinValue="-99999999" Width="100px"></cc1:AwNumeric>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label ID="Label72" runat="server" CssClass="label_error">*</asp:Label>
                <asp:Label ID="lblPage7" runat="server">จำนวนเงิน :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <cc1:AwNumeric ID="txtsp_payment_item_money" runat="server" CssClass="textbox" MaxValue="99999999" MinValue="-99999999" Width="100px"></cc1:AwNumeric>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsp_payment_item_money" Display="None" ErrorMessage="กรุณาป้อนจำนวนเงิน" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
            <td align="left" nowrap rowspan="2" style="width: 1%; vertical-align: bottom; text-align: right;"
                valign="middle"></td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label12">สถานะ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:CheckBox runat="server" Text="ปกติ" ID="chkStatus"></asp:CheckBox>
            </td>
        </tr>
    </table>
    <div style="float: right;">
        <asp:ImageButton ID="imgSaveOnly" runat="server" ImageUrl="~/images/controls/save.jpg"
            ValidationGroup="A" />&nbsp;&nbsp;&nbsp;
    </div>
</asp:Content>
