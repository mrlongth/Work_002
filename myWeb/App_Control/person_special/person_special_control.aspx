<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="person_special_control.aspx.cs" Inherits="myWeb.App_Control.person_retire.person_special_control" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="1" cellspacing="2" style="width: 100%">
        <tr align="center">
            <td>
                <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                    <tr>
                        <td align="left" nowrap style="text-align: right" valign="middle">&nbsp;&nbsp;
                        </td>
                        <td align="left" style="width: 0%">&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" nowrap style="text-align: right" valign="middle">
                            <asp:Label ID="lblLastUpdatedBy" runat="server" CssClass="label_hbk">Last Updated By :</asp:Label>
                        </td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtUpdatedBy" runat="server" CssClass="textboxdis" ReadOnly="True"
                                Width="148px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" nowrap style="text-align: right" valign="middle">
                            <asp:Label ID="lblLastUpdatedDate" runat="server" CssClass="label_hbk">Last Updated Date :</asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtUpdatedDate" runat="server" CssClass="textboxdis" ReadOnly="True"
                                Width="148px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                    <tr align="left">
                        <td align="right" nowrap style="" valign="middle" width="10%">
                            <asp:Label ID="Label21" runat="server" CssClass="label_hbk">รหัสบุคลากร :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" width="40%" colspan="2">
                            <asp:TextBox ID="txtsp_person_code" runat="server" CssClass="textboxdis"
                                Width="120px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap style="height: 28px" valign="middle">
                            <asp:Label ID="Label71" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                ID="Label16" runat="server" CssClass="label_hbk">คำนำหน้าชื่อ :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="height: 28px" colspan="2">
                            <asp:DropDownList ID="cboTitle" runat="server" CssClass="textbox">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="cboTitle"
                                Display="None" ErrorMessage="กรุณาเลือกคำนำหน้าชื่อ" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtperson_thai_name"
                                    Display="None" ErrorMessage="กรุณาป้อนชื่อภาษาไทย" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label ID="Label73" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                ID="Label14" runat="server" CssClass="label_hbk">ชื่อภาษาไทย :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:TextBox ID="txtperson_thai_name" runat="server" CssClass="textbox" Width="400px"
                                MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle">
                            <asp:Label ID="Label15" runat="server" CssClass="label_hbk">นามสกุลภาษาไทย :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" colspan="2">
                            <asp:TextBox ID="txtperson_thai_surname" runat="server" CssClass="textbox" MaxLength="50"
                                Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label ID="Label72" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                ID="Label20" runat="server" CssClass="label_hbk">เลขที่บัตรประชาชน :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:TextBox ID="txtperson_id" runat="server" CssClass="textbox" Width="200px" MaxLength="13"></asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender
                                ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtperson_id" FilterType="Numbers"
                                Enabled="True" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtperson_id"
                                Display="None" ErrorMessage="กรุณาป้อนเลขที่บัตรประชาชน" ValidationGroup="A"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label
                                ID="Label79" runat="server" CssClass="label_hbk">เลขที่บัญชี :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:TextBox ID="txtperson_acc" runat="server" CssClass="textbox" Width="200px" MaxLength="13"></asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender
                                ID="txtperson_acc_FilteredTextBoxExtender" runat="server" TargetControlID="txtperson_acc" FilterType="Numbers"
                                Enabled="True" />
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label
                                ID="Label80" runat="server" CssClass="label_hbk">ธนาคาร :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:DropDownList ID="cboBank" runat="server" CssClass="textbox">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                <asp:Label runat="server" ID="Label86">ปีงบประมาณ :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                <font face="Tahoma">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboYear" 
                    AutoPostBack="True" onselectedindexchanged="cboYear_SelectedIndexChanged">
                </asp:DropDownList>
                </font>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label
                                ID="Label81" runat="server" CssClass="label_hbk">สังกัด :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboDirector" AutoPostBack="True"
                                OnSelectedIndexChanged="cboDirector_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label
                                ID="Label82" runat="server" CssClass="label_hbk">หน่วยงาน :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:DropDownList runat="server" CssClass="textbox" ID="cboUnit">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label
                                ID="Label83" runat="server" CssClass="label_hbk">งาน/หลักสูตร:</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:DropDownList ID="cboWork" runat="server" CssClass="textbox">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label ID="Label87" runat="server" CssClass="label_error">*</asp:Label>
                            <asp:Label
                                ID="Label84" runat="server" CssClass="label_hbk">วันเกิด :</asp:Label>
                        </td>
                        <td align="left" nowrap style="vertical-align: middle" width="10%" colspan="2">
                            <asp:TextBox ID="txtperson_birth" runat="server" CssClass="textbox" Width="120px"></asp:TextBox><ajaxtoolkit:CalendarExtender
                                ID="calendarButtonExtender" runat="server" BehaviorID="txtperson_birth_CalendarExtender"
                                Enabled="True" PopupButtonID="imgperson_birth" TargetControlID="txtperson_birth">
                            </ajaxtoolkit:CalendarExtender>
                            <asp:ImageButton ID="imgperson_birth" runat="server" AlternateText="Click to show calendar"
                                ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtperson_birth"
                                Display="None" ErrorMessage="กรุณาเลือกวันเกิด" ValidationGroup="A"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <%--<td align="left" nowrap style="vertical-align: middle">
                                        <asp:Label ID="lblAge" runat="server" CssClass="label_hbk" Font-Bold="True">อายุ :</asp:Label>
                                    </td>--%>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label ID="Label77" runat="server" CssClass="label_hbk">Email :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:TextBox ID="txtperson_email" runat="server" CssClass="textbox" Width="400px"
                                MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label ID="Label78" runat="server" CssClass="label_hbk">รหัสผ่าน :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="" colspan="2">
                            <asp:TextBox ID="txtperson_password" runat="server" CssClass="textbox" Width="200px"
                                MaxLength="50" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle" style="">
                            <asp:Label ID="Label85" runat="server" CssClass="label_hbk">หมายเหตุ :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle" style="">
                            <asp:TextBox ID="txtperson_remark" runat="server" CssClass="textbox" Width="400px"
                                MaxLength="50"></asp:TextBox>
                        </td>
                        <td align="left" nowrap valign="middle" rowspan="2">
                <asp:ImageButton runat="server" ValidationGroup="A" AlternateText="บันทึก" ImageUrl="~/images/controls/save.jpg"
                    ID="imgSaveOnly"></asp:ImageButton>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right" nowrap valign="middle">
                            <asp:Label ID="Label76" runat="server" CssClass="label_hbk">สถานะ :</asp:Label>
                        </td>
                        <td align="left" nowrap valign="middle">
                            <font face="Tahoma">
                                <asp:CheckBox ID="chkStatus" runat="server" Text="ปกติ" Checked="True" />
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="A" />
                            </font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; vertical-align: bottom;">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="75%">
                <asp:Button ID="BtnR1" runat="server" OnClick="BtnR1_Click" />
                <asp:Button ID="BtnR2" runat="server" OnClick="BtnR2_Click" />
                <asp:Button ID="BtnR3" runat="server" OnClick="BtnR3_Click" />
                &nbsp;
            </td>
            <td nowrap rowspan="2"
                style="text-align: center; vertical-align: bottom; width: 10%;">
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
