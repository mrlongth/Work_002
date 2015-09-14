﻿<%@ Page Language="C#" MasterPageFile="~/Site_list.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="paymentdetail_report.aspx.cs" Inherits="myWeb.App_Control.payment.paymentdetail_report"
    Title="รายงานข้อมูลการจ่ายเงินเดือน" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <table cellpadding="1" cellspacing="1" style="width: 100%" border="0">
        <tr>
            <td style="text-align: left; width: 20%; vertical-align: top;">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="0">รายงานสรุปรายรับ-รายจ่ายบุคลากรประจำเดือน (แบบ 01)</asp:ListItem>
                    <asp:ListItem Value="0_1">รายงานสรุปรายรับ-รายจ่ายบุคลากรประจำเดือน (แบบ 01 แยกตามกลุ่มบุคลากร)</asp:ListItem>
                    <asp:ListItem Value="6">รายงานสรุปรายรับ-รายจ่ายบุคลากรประจำเดือน (แบบ 02)</asp:ListItem>
                    <asp:ListItem Value="6_1">รายงานสรุปรายรับ-รายจ่ายบุคลากรประจำเดือน (แบบ 02 แยกตามกลุ่มบุคลากร)</asp:ListItem>
                    <asp:ListItem Value="1">รายงานแสดงรายรับ-รายจ่ายแยกตามประเภท (แบบ 03)</asp:ListItem>
                    <asp:ListItem Value="1_1">รายงานแสดงรายรับ-รายจ่ายแยกตามประเภท (แบบ 03 แยกตามกลุ่มบุคลากร)</asp:ListItem>
                    <asp:ListItem Value="14">รายงานแสดงรายรับ-รายจ่ายประจำเดือน</asp:ListItem>
                    <asp:ListItem Value="15">รายงานสรุปรวมรายจ่ายประจำเดือน</asp:ListItem>
                    <asp:ListItem Value="2">รายงานการจ่ายเงินเดือนแยกตามสังกัด</asp:ListItem>
                    <asp:ListItem Value="18">สรุปการรับ - จ่ายเงินประจำเดือนทุกประเภทที่มีกำหนดจ่ายเป็นรายเดือน</asp:ListItem>
                    <asp:ListItem Value="8">รายงานสรุปรายได้ทั้งหมดแยกตามรหัสรายได้ (Excel)</asp:ListItem>
                    <asp:ListItem Value="A1">รายงานบัญชีคู่จ่ายรายบุคคลประจำเดือน</asp:ListItem>
                    <asp:ListItem Value="A3">รายงานภาษีแยกตามผลผลิต</asp:ListItem>
                    <asp:ListItem Value="A2">รายงานยอดเงินส่งธนาคารประจำเดือน</asp:ListItem>
                    <asp:ListItem Value="A4">ใบนำส่งเช็คและรายละเอียดจำนวนเงินสุทธิ</asp:ListItem>
                    <asp:ListItem Value="A6">รายละเอียดการนำส่งเงินชำระหนี้เงินกู้ธนาคาร</asp:ListItem>
                    <asp:ListItem Value="A7">รายงานสรุปการรับ - จ่ายเงิน ประจำเดือน ระบบเบิกตรง</asp:ListItem>
                    <asp:ListItem Value="A8">รายงานสรุปการรับ - จ่ายเงินแยกตามผลผลิต ประจำเดือน ระบบเบิกตรง </asp:ListItem>

                </asp:RadioButtonList>
            </td>
            <td style="text-align: right; width: 70%; vertical-align: top;">
                <table cellpadding="1" cellspacing="1" style="width: 100%;" border="0">
                    <tr>
                        <td style="text-align: right; width: 20%;">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage4">ปีงบประมาณ :</asp:Label>
                        </td>
                        <td style="width: 1%; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboYear" AutoPostBack="True"
                                OnSelectedIndexChanged="cboYear_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                        </td>
                        <td style="width: 20%; text-align: right;" colspan="2">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage2">กลุ่มบุคลากร :</asp:Label>
                        </td>
                        <td style="height: 23px; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboPerson_group">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 20%;">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage10">รอบปีที่จ่าย :</asp:Label>
                        </td>
                        <td style="width: 1%; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Year">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%; text-align: right;" colspan="2">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage1">รอบเดือนที่จ่าย :</asp:Label>
                        </td>
                        <td style="height: 23px; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Month">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 20%;">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage7">สังกัด :
                            </asp:Label>
                        </td>
                        <td style="width: 1%; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboDirector" AutoPostBack="True"
                                OnSelectedIndexChanged="cboDirector_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%; text-align: right;" colspan="2">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage8">หน่วยงาน :
                            </asp:Label>
                        </td>
                        <td style="height: 23px; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboUnit">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 20%;">
                            <asp:Label runat="server" CssClass="label_error" ID="Label71">*</asp:Label>
                            <asp:Label runat="server" ID="lblPage9" CssClass="label_h">รายได้/จ่าย :</asp:Label>
                        </td>
                        <td style="text-align: left;" colspan="4">
                            <asp:TextBox runat="server" CssClass="textbox" Width="80px" ID="txtitem_code" MaxLength="20">
                            </asp:TextBox>
                            &nbsp;<asp:ImageButton runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif"
                                ID="imgList_item"></asp:ImageButton>
                            <asp:ImageButton runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif"
                                ID="imgClear_item"></asp:ImageButton>
                            &nbsp;<asp:TextBox runat="server" CssClass="textbox" Width="230px" ID="txtitem_name"
                                MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtitem_code"
                                Display="None" ErrorMessage="กรุณาป้อนรายได้/จ่าย" ValidationGroup="A" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 20%;">
                            <asp:Label runat="server" CssClass="label_h" ID="lblPage11">ประเภทข้อมูล :
                            </asp:Label>
                        </td>
                        <td style="text-align: left;" colspan="2">

                            <asp:RadioButton runat="server" GroupName="A" Checked="True" Text="ทั้งหมด" CssClass="label_h"
                                ID="RadioAll"></asp:RadioButton>
                            <asp:RadioButton runat="server" GroupName="A" Text="รายเดือนอย่างเดียว" CssClass="label_h" ID="RadioPayment"></asp:RadioButton>
                            <asp:RadioButton runat="server" GroupName="A" Text="ตกเบิกอย่างเดียว" CssClass="label_h" ID="RadioPaymentBack"></asp:RadioButton>

                        </td>
                        <td style="text-align: right;">&nbsp;</td>
                        <td style="text-align: left;">

                            <asp:CheckBox ID="chkNegative" runat="server" CssClass="label_h" Text="แสดงเฉพาะยอดติดลบ" />

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 20%;">
                            <asp:Label runat="server" ID="Label15" CssClass="label_h" Visible="False">ผลผลิต :</asp:Label>
                        </td>
                        <td style="text-align: left;">
                            <font face="Tahoma">
                                <asp:DropDownList runat="server" CssClass="textbox" ID="cboProduce">
                                </asp:DropDownList>
                            </font>
                        </td>
                        <td style="text-align: right;" colspan="2">
                            <asp:Label runat="server" ID="lblLot" CssClass="label_h" Visible="False">งบ :</asp:Label>
                        </td>
                        <td style="height: 23px; text-align: left;">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboLot" Visible="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 20%;">&nbsp;<asp:Label runat="server" ID="lblBank" CssClass="label_h" Visible="False">ธนาคาร :</asp:Label>
                            &nbsp;
                        </td>
                        <td style="text-align: left;" colspan="3">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboBank" Visible="False">
                            </asp:DropDownList>
                        </td>
                        <td style="height: 23px; text-align: right;">
                            <asp:ImageButton runat="server" AlternateText="พิมพ์ข้อมูล" ImageUrl="~/images/button/print.png"
                                ID="imgPrint" OnClick="imgPrint_Click" ValidationGroup="A"></asp:ImageButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
