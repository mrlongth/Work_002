﻿<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_special_control.aspx.cs" Inherits="myWeb.App_Control.payment_special.payment_special_control" %>

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
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textboxdis" Width="144px" ID="txtUpdatedBy">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" nowrap style="text-align: right">
                <asp:Label runat="server" CssClass="text" ID="lblLastUpdatedDate">Last Updated Date :</asp:Label>
            </td>
            <td align="left">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textboxdis" Width="144px" ID="txtUpdatedDate">
                </asp:TextBox>
            </td>
        </tr>
    </table>
    <div style="text-align: center;">
        <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="370px"
            BorderWidth="0px" Style="text-align: left" Width="98%">
            <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="ข้อมูลการจ่ายค่าดำเนินงานภาคพิเศษ">
                <HeaderTemplate>
                    ข้อมูลการจ่ายค่าดำเนินงานภาคพิเศษ
                </HeaderTemplate>
                <ContentTemplate>
                    <table border="0" cellpadding="2" cellspacing="2" style="padding: 2px;">
                        <tr align="left">
                            <td align="right" nowrap valign="middle" width="12%">
                                <asp:Label runat="server" ID="Label79">เลขที่เอกสาร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" width="20%">
                                <asp:TextBox runat="server" CssClass="textboxdis" Width="100px" ID="txtpayment_doc"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;" colspan="2">&nbsp;</td>
                            <td align="left" nowrap valign="middle">&nbsp;</td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label87" runat="server">ปีงบประมาณ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboYear" runat="server" CssClass="textboxdis" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;" colspan="2">&nbsp;</td>
                            <td align="left" nowrap valign="middle">
                                <asp:HiddenField ID="hddsp_round_id" runat="server" />
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label88" runat="server">ปีการศึกษา :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPay_Year" runat="server" CssClass="textboxdis" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td align="left" colspan="2" nowrap style="text-align: right; width: 10%;" valign="middle">&nbsp;</td>
                            <td align="left" nowrap valign="middle">&nbsp;</td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;&nbsp; </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label92" runat="server">ภาคเรียนที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPay_Semeter" runat="server" CssClass="textboxdis" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right" colspan="2">
                                <asp:Label ID="Label91" runat="server">รอบการจ่ายที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPay_Item" runat="server" CssClass="textboxdis" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label93" runat="server">ตั้งแต่วันที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <cc1:AwLabelDateTime ID="lblPay_begin_date" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.pay_end_date") %>' DateFormat="dd/MM/yyyy"></cc1:AwLabelDateTime></td>
                            <td align="left" colspan="2" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label94" runat="server">ถึงวันที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <cc1:AwLabelDateTime ID="lblPay_end_date" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.pay_end_date") %>' DateFormat="dd/MM/yyyy"></cc1:AwLabelDateTime></td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label80" runat="server" cssclass="label_error">*</asp:Label>
                                <asp:Label ID="Label50" runat="server" CssClass="label_hbk">กลุ่มบุคลากร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPerson_group" runat="server" CssClass="textbox" AutoPostBack="True" OnSelectedIndexChanged="cboPerson_group_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cboPerson_group" Display="None" ErrorMessage="กรุณาเลือกกลุ่มบุคลากร" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" colspan="2" nowrap style="text-align: right" valign="middle">&nbsp;</td>
                            <td align="left" nowrap valign="middle">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtperson_code" Display="None" ErrorMessage="กรุณาป้อนรหัสบุคลากร" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label96" runat="server" cssclass="label_error">*</asp:Label>
                                <asp:Label ID="lblperson_name" runat="server" CssClass="label_hbk">รหัสบุคลากร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtperson_code" runat="server" CssClass="textboxdis" Width="100px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_item" runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" Visible="False" />
                                <asp:ImageButton ID="imgClear_item" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" OnClick="imgClear_item_Click" Style="width: 18px" Visible="False" />
                                &nbsp;<asp:TextBox ID="txtperson_name" runat="server" CssClass="textboxdis" ReadOnly="True" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" colspan="2" nowrap style="text-align: right" valign="middle">&nbsp;</td>
                            <td align="left" nowrap valign="middle">&nbsp;</td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp; </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label95" runat="server" CssClass="label_hbk">สังกัด :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" colspan="4">
                                <asp:DropDownList ID="cboDirector" runat="server" AutoPostBack="True" CssClass="textbox" OnSelectedIndexChanged="cboDirector_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;"
                                rowspan="4">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label82" runat="server" CssClass="label_hbk">หน่วยงาน :</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap valign="middle">
                                <asp:DropDownList ID="cboUnit" runat="server" CssClass="textbox">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label83" runat="server" CssClass="label_hbk">งาน/หลักสูตร:</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap valign="middle">
                                <asp:DropDownList ID="cboWork" runat="server" CssClass="textbox">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label81" runat="server">หมายเหตุ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" colspan="4">
                                <font face="Tahoma">
                                    <asp:TextBox ID="txtcomments" runat="server" CssClass="textbox" MaxLength="255" Width="400px"></asp:TextBox>
                                </font>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label12" runat="server">สถานะ :</asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:CheckBox ID="chkStatus" runat="server" Text="ปกติ" />
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">&nbsp;
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">&nbsp;</td>
                            <td align="left" nowrap valign="middle">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" showmessagebox="True" showsummary="False" validationgroup="A" />
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">&nbsp;</td>
                            <td align="left" colspan="2" nowrap valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
            <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ข้อมูลรายการค่าดำเนินงานภาคพิเศษ">
                <HeaderTemplate>
                    ข้อมูลรายการค่าดำเนินงานภาคพิเศษ
                </HeaderTemplate>
                <ContentTemplate>
                    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                        <tr align="left">
                            <td colspan="2">
                                <div class="div-lov" style="height: 340px">
                                    <asp:GridView runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="2"
                                        BackColor="White" BorderWidth="1px" CssClass="stGrid" Font-Bold="False" Font-Size="10pt"
                                        Width="100%" ID="GridView1" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                                        OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">
                                        <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                        <Columns>
                                            <asp:TemplateField HeaderText="No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNo" runat="server"> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="2%"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="รหัสรายได้" SortExpression="item_code">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hddsp_payment_detail_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.sp_payment_detail_id") %>' />
                                                    <asp:Label ID="lblitem_code" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_code") %>'> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="รายละเอียด" SortExpression="item_name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitem_name" runat="server" CssClass="label_hbk" Text='<% # DataBinder.Eval(Container, "DataItem.item_name")%>'> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="30%" Wrap="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="จำนวน" SortExpression="item_qty">
                                                <ItemTemplate>
                                                    <cc1:AwNumeric ID="txtitem_qty" runat="server" Width="80px" LeadZero="Show" DecimalPlaces="0"
                                                        DisplayMode="View" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.item_qty"))%>'>
                                                    </cc1:AwNumeric>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="จำนวนเงิน" SortExpression="sp_payment_item_money">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitem_type" runat="server" Text="-" />
                                                    <cc1:AwNumeric ID="txtsp_payment_item_money" runat="server" Width="80px" LeadZero="Show"
                                                        DisplayMode="View" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.sp_payment_item_money"))%>'>
                                                    </cc1:AwNumeric>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Edit" />
                                                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete" />
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:ImageButton ID="imgAdd" runat="server" CommandName="Add" />
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="stGridHeader" Font-Bold="True"></HeaderStyle>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr align="left">
                            <td style="text-align: right"></td>
                            <td style="text-align: right">
                                <asp:Label runat="server" ID="Label76" Font-Bold="True" Visible="true">ยอดรับ :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txtpayment_recv" runat="server" Text="0.00" Font-Bold="True" CssClass="numberdis"
                                    LeadZero="Show" MaxValue="99999999999" MinValue="-99999999999" ReadOnly="True" Visible="true">
                                </cc1:AwNumeric>
                            </td>
                            <td style="text-align: right; width: 10%;">
                                <asp:Label runat="server" ID="Label77" Font-Bold="true" Visible="true">ยอดจ่าย :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txtpayment_pay" runat="server" Font-Bold="True" ForeColor="Red"
                                    CssClass="numberdis" LeadZero="Show" MaxValue="99999999999" MinValue="-99999999999"
                                    ReadOnly="True" Visible="true">0.00</cc1:AwNumeric>
                            </td>
                            <td style="text-align: right; width: 12%;">
                                <asp:Label runat="server" ID="Label78" Font-Bold="True">รวมทั้งสิ้น :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txtpayment_net" runat="server" Font-Bold="True" ForeColor="#003399"
                                    CssClass="numberdis" LeadZero="Show" MaxValue="99999999999" MinValue="-99999999999"
                                    ReadOnly="True">0.00</cc1:AwNumeric>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
        </ajaxtoolkit:TabContainer>
    </div>
    <div style="float: right; padding-right: 20px;">
        <asp:ImageButton runat="server" ValidationGroup="A" ImageUrl="~/images/controls/save.jpg"
            ID="imgSaveOnly"></asp:ImageButton>
    </div>
    <asp:Button ID="BtnR1" runat="server" OnClick="BtnR1_Click" />
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
</asp:Content>
