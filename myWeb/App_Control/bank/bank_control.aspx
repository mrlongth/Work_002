<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="bank_control.aspx.cs" Inherits="myWeb.App_Control.bank.bank_control" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Aware.WebControls" namespace="Aware.WebControls" tagprefix="cc11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr>
            <td align="left" nowrap style="width: 90%; height: 17px;">
                &nbsp;
            </td>
            <td align="left" style="width: 0%; height: 17px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" nowrap style="text-align: right">
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                <asp:Label runat="server" ID="lblLastUpdatedBy">Last Updated By :</asp:Label>
            </td>
            <td align="left">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textboxdis" Width="144px" ID="txtUpdatedBy"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" nowrap style="text-align: right">
                <asp:Label runat="server" CssClass="text" ID="lblLastUpdatedDate">Last Updated Date :</asp:Label>
            </td>
            <td align="left">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textboxdis" Width="144px" ID="txtUpdatedDate"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr align="left">
            <td align="right" nowrap valign="top">
                                        <asp:Label runat="server" CssClass="label_error" ID="Label71">*</asp:Label>
                <asp:Label runat="server" ID="lblFName">รหัสธนาคาร :</asp:Label>
            </td>
            <td align="left" colspan="3" nowrap valign="top">
                <asp:TextBox ID="txtbank_code" runat="server" CssClass="textbox" MaxLength="5"  
                    Width="144px" ValidationGroup="A"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                                        <asp:Label runat="server" CssClass="label_error" 
                    ID="Label72">*</asp:Label>
                <asp:Label ID="Label11" runat="server">ธนาคาร :</asp:Label>
            </td>
            <td align="left" colspan="3" nowrap valign="top">
                <font face="Tahoma">
                    <asp:TextBox ID="txtbank_name" runat="server" CssClass="textbox" MaxLength="100"
                          Width="344px" CausesValidation="True" ValidationGroup="A"></asp:TextBox>
                </font>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                <asp:Label ID="Label73" runat="server">อัตราค่าธรรมเนียม :</asp:Label>
            </td>
            <td align="left" nowrap valign="top">
                <cc11:AwNumeric ID="txtbank_fee_rate" runat="server" CssClass="textbox" MaxValue="99999999" MinValue="-99999999" Width="100px"></cc11:AwNumeric>
            </td>
            <td align="left" nowrap valign="top">
                &nbsp;</td>
            <td align="left" nowrap valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                <asp:Label ID="Label74" runat="server">คิดค่าธรรมเนียม :</asp:Label>
            </td>
            <td align="left" nowrap valign="top">
                <asp:CheckBox ID="chkfee_charge_normal" runat="server" Text="การจ่ายเงินเดือน" />
            </td>
            <td align="left" nowrap valign="top">
                <asp:CheckBox ID="chkfee_charge_special" runat="server" Text="การจ่ายเงินภาคพิเศษ" />
            </td>
            <td align="left" nowrap valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                                        &nbsp;</td>
            <td align="left" nowrap valign="top">
                <asp:CheckBox ID="chkfee_charge_medical" runat="server" Text="การจ่ายค่าสวัสดิการข้าราชการ/ลูกจ้างประจำ (ข้าราชการบำนาญ)" />
            </td>
            <td align="left" nowrap valign="top">
                <asp:CheckBox ID="chkfee_charge_bonus" runat="server" Text="การจ่ายเงินรางวัล" />
            </td>
            <td align="left" nowrap valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                <asp:Label runat="server" ID="lblPage11">จ่ายเช็คให้ :</asp:Label>
            </td>
            <td align="left" colspan="3" nowrap valign="top">
                <asp:TextBox runat="server" CssClass="textbox"   Width="100px" ID="txtcheque_code"
                    MaxLength="10"></asp:TextBox>
                &nbsp;<asp:ImageButton runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif"
                      ID="imgList_item"></asp:ImageButton>
                <asp:ImageButton runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif"
                      ID="imgClear_item"></asp:ImageButton>
                &nbsp;<asp:TextBox runat="server" CssClass="textbox"   Width="250px" ID="txtcheque_name"
                    MaxLength="100"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                <asp:Label runat="server" ID="lblPage12">รหัสค่าธรรมเนียม :</asp:Label>
            </td>
            <td align="left" colspan="3" nowrap valign="top">

                            <asp:TextBox runat="server" MaxLength="10" CssClass="textbox" Width="100px" ID="txtitem_code"></asp:TextBox>

                            &nbsp;<asp:ImageButton runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" ID="imgList_item2"></asp:ImageButton>

                            <asp:ImageButton runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" ID="imgClear_item2"></asp:ImageButton>

                            &nbsp;<asp:TextBox runat="server" MaxLength="100" CssClass="textbox" Width="250px" ID="txtitem_name"></asp:TextBox>

            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                <asp:Label ID="Label12" runat="server">สถานะ :</asp:Label>
            </td>
            <td align="left" colspan="3" nowrap valign="top">
                <asp:CheckBox ID="chkStatus" runat="server" Text="ปกติ" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="top">
                &nbsp;
            </td>
            <td align="left" colspan="3" nowrap valign="top">
                &nbsp;
            </td>
            <td>
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
            <td align="right" nowrap valign="top" colspan="2">
                &nbsp;
            </td>
            <td nowrap rowspan="2" align="center" 
                style="vertical-align: bottom; ">
                <asp:ImageButton ID="imgSaveOnly" runat="server" ImageUrl="~/images/controls/save.jpg"
                    ValidationGroup="A" />
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
            <td align="right" nowrap valign="top" style="text-align: left" colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbank_code"
                    Display="None" ErrorMessage="กรุณาป้อนรหัสธนาคาร" ValidationGroup="A" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtbank_name"
                    Display="None" ErrorMessage="กรุณาป้อนธนาคาร" ValidationGroup="A" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</asp:Content>
