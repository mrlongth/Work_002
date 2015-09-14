<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_special_round_control.aspx.cs" Inherits="myWeb.App_Control.payment_round.payment_special_round_control" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Assembly="Aware.WebControls" Namespace="Aware.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr>
            <td align="left" nowrap style="text-align: right">
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                <asp:Label runat="server" ID="lblLastUpdatedBy">Last Updated By :</asp:Label>
            </td>
            <td align="left" style="width: 1%">
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
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label82">ปีงบประมาณ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" style="width: 20%;">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboYear">
                </asp:DropDownList>
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;">&nbsp;</td>
            <td align="left" nowrap valign="middle" colspan="3">&nbsp;</td>
            <td align="left" nowrap valign="middle" rowspan="3" style="vertical-align: bottom; width: 1%;">&nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label84">ปีการศึกษา :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Year">
                </asp:DropDownList>
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right">
                <asp:Label runat="server" ID="Label85">ภาคเรียนที่ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Semeter">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="cboPay_Semeter"
                    Display="None" ErrorMessage="กรุณาเลือกภาคเรียนที่" ValidationGroup="A"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>

            </td>
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label86">รอบการจ่ายที่ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Item">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="cboPay_Item"
                    Display="None" ErrorMessage="กรุณาเลือกรอบการจ่ายที่ " ValidationGroup="A"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label87">ตั้งแต่วันที่ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:TextBox ID="txtpay_begin_date" runat="server" CssClass="textbox" Width="120px"></asp:TextBox>
                <ajaxtoolkit:CalendarExtender
                    ID="txtpay_begin_date_CalendarExtender" runat="server" BehaviorID="txtpay_begin_date_CalendarExtender"
                    Enabled="True" PopupButtonID="imgpay_begin_date" TargetControlID="txtpay_begin_date">
                </ajaxtoolkit:CalendarExtender>
                <asp:ImageButton ID="imgpay_begin_date" runat="server" AlternateText="Click to show calendar"
                    ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtpay_begin_date"
                    Display="None" ErrorMessage="กรุณาเลือกตั้งแต่วันที่" ValidationGroup="A"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>

            </td>
            <td align="left" nowrap valign="middle" style="text-align: right">
                <asp:Label runat="server" ID="Label88">ถึงวันที่ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:TextBox ID="txtpay_end_date" runat="server" CssClass="textbox" Width="120px"></asp:TextBox>
                <ajaxtoolkit:CalendarExtender
                    ID="txtpay_end_date_CalendarExtender" runat="server" BehaviorID="txtpay_end_date_CalendarExtender"
                    Enabled="True" PopupButtonID="imgpay_end_date" TargetControlID="txtpay_end_date">
                </ajaxtoolkit:CalendarExtender>
                <asp:ImageButton ID="imgpay_end_date" runat="server" AlternateText="Click to show calendar"
                    ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtpay_end_date"
                    Display="None" ErrorMessage="กรุณาเลือกถึงวันที่" ValidationGroup="A"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label89">จำนวนวัน :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <cc1:AwNumeric runat="server" MaxValue="99999999" MinValue="-99999999" CssClass="textbox" Width="80px" ID="txtpay_day" DecimalPlaces="0"></cc1:AwNumeric>

            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label81">กำหนดจ่ายเงิน :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="5">
                <font face="Tahoma">
                    <asp:TextBox ID="txtComments" runat="server" CssClass="textbox"
                        MaxLength="255" CausesValidation="True" ValidationGroup="A" Width="120px"></asp:TextBox>


                    <ajaxtoolkit:CalendarExtender
                        ID="CalendarExtender1" runat="server" BehaviorID="txtComments_CalendarExtender"
                        Enabled="True" PopupButtonID="imgtxtComments" TargetControlID="txtComments">
                    </ajaxtoolkit:CalendarExtender>
                    <asp:ImageButton ID="imgtxtComments" runat="server" AlternateText="Click to show calendar"
                        ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />





                </font>
            </td>
            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" ID="Label12">สถานะ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="5">
                <asp:CheckBox runat="server" Text="ปกติ" ID="chkStatus"></asp:CheckBox>
            </td>
            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;"
                rowspan="4">
                <asp:ImageButton runat="server" ValidationGroup="A" ImageUrl="~/images/controls/save.jpg"
                    ID="imgSaveOnly"></asp:ImageButton>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" style="height: 17px"></td>
            <td align="left" nowrap valign="middle" colspan="5" style="height: 17px">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="A" />
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">&nbsp;</td>
            <td align="left" nowrap valign="middle" colspan="5">&nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" colspan="6">
                <div style="width: 100%; text-align: left;">
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
