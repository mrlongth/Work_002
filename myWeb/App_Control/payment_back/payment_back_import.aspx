<%@ Page Language="C#" MasterPageFile="~/Site_list.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_back_import.aspx.cs" Inherits="myWeb.App_Control.payment_back.payment_back_import"
    Title="นำเข้าข้อมูลค่าใช้จ่ายประจำเดือน" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Assembly="Aware.WebControls" Namespace="Aware.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" language="javascript">

        function SelectAll(id) {
            var grid = document.getElementById("<%= GridView1.ClientID %>");
            var cell;

            if (grid.rows.length > 0) {
                for (i = 1; i < grid.rows.length; i++) {
                    cell = grid.rows[i].cells[0];
                    for (j = 0; j < cell.childNodes.length; j++) {
                        if (cell.childNodes[j].type == "checkbox") {
                            cell.childNodes[j].checked = document.getElementById(id).checked;
                        }
                    }
                }
            }
        }

    </script>

    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label1">การคำนวณ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="4">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" BorderWidth="0px" CellPadding="0"
                    CellSpacing="0" RepeatDirection="Horizontal" AutoPostBack="True">
                    <asp:ListItem Value="I" Selected="True">นำเข้าเงินตกเบิก</asp:ListItem>
                </asp:RadioButtonList>
                <asp:HiddenField ID="hddGUID" runat="server" />
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label7">ปีงบประมาณ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" style="width: 20%;">
                <asp:DropDownList runat="server" CssClass="textboxdis" ID="cboYear" Enabled="False">
                </asp:DropDownList>
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;">&nbsp;</td>
            <td align="left" nowrap valign="middle" colspan="2">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">
                </asp:LinkButton>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label85">รอบปีที่จ่าย :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:DropDownList runat="server" CssClass="textboxdis" ID="cboPay_Year" Enabled="False"></asp:DropDownList>
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right;">
                <asp:Label runat="server" ID="Label84">รอบเดือนที่จ่าย :</asp:Label></td>
            <td align="left" nowrap valign="middle">
                <asp:DropDownList runat="server" CssClass="textboxdis" ID="cboPay_Month" Enabled="False"></asp:DropDownList>
            </td>
            <td align="left" nowrap rowspan="5" style="vertical-align: middle; width: 1%;" valign="middle">
                <asp:ImageButton ID="imgImport" runat="server" AlternateText="นำเข้า Excel" ImageUrl="~/images/button/import.png"
                    OnClick="imgImport_Click" ValidationGroup="A" />
                <asp:ImageButton ID="imgSaveOnly" runat="server" AlternateText="บันทึกข้อมุล" ImageUrl="~/images/button/save_add.png"
                    OnClick="imgSaveOnly_Click" ValidationGroup="A" />
                <asp:ImageButton ID="imgCancel" runat="server" AlternateText="ยกเลิก" CausesValidation="False"
                    ImageUrl="~/images/button/cancel.png" OnClick="imgCancel_Click" />
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label90">ตั้งแต่วันที่ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:TextBox ID="txtdate_begin" runat="server" CssClass="textbox" Width="100px" />
                <%--                <ajaxtoolkit:CalendarExtender ID="txtdate_begin_CalendarExtender" runat="server"
                    Enabled="True" PopupButtonID="imgdate_begin" TargetControlID="txtdate_begin" />
                <asp:ImageButton ID="imgdate_begin" runat="server" AlternateText="Click to show calendar"
                    ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />--%>
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right;">
                <asp:Label runat="server" ID="Label91">ถึงวันที่ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:TextBox ID="txtdate_end" runat="server" CssClass="textbox" Width="100px" />
                <%--                <ajaxtoolkit:CalendarExtender ID="txtdate_end_CalendarExtender" runat="server" Enabled="True"
                    PopupButtonID="imgdate_end" TargetControlID="txtdate_end" />
                <asp:ImageButton ID="imgdate_end" runat="server" AlternateText="Click to show calendar"
                    ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />--%>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label92">ระยะเวลา :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <cc1:AwNumeric ID="txtdate_count_year" runat="server" CssClass="textbox" LeadZero="Show"
                    MaxValue="99999999" MinValue="-99999999" Width="30px" DecimalPlaces="0"></cc1:AwNumeric>
                &nbsp;<asp:Label runat="server" ID="Label93">ปี</asp:Label>
                &nbsp;<cc1:AwNumeric ID="txtdate_count_month" runat="server" CssClass="textbox" LeadZero="Show"
                    MaxValue="99999999" MinValue="-99999999" Width="30px" DecimalPlaces="0"></cc1:AwNumeric>&nbsp;<asp:Label
                        runat="server" ID="Label94">เดือน</asp:Label>
                &nbsp;<cc1:AwNumeric ID="txtdate_count_day" runat="server" CssClass="textbox" LeadZero="Show"
                    MaxValue="99999999" MinValue="-99999999" Width="30px" DecimalPlaces="0"></cc1:AwNumeric>&nbsp;<asp:Label
                        runat="server" ID="Label95">วัน</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" style="text-align: right;">
                <asp:Label runat="server" ID="Label81" Visible="False">จำนวนวัน/เดือน :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle">
                <asp:TextBox runat="server" CssClass="textbox" Width="100px" ID="txtdate_count_des"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="lblPage12">ประเภทการตกเบิก :
                </asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="3">
                <asp:RadioButtonList ID="rdoPayment_back_type" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="N">รายการใหม่</asp:ListItem>
                    <asp:ListItem Value="O">รายการเดิม</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label11">รหัสรายได้ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="3">
                <asp:TextBox ID="txtitem_code" runat="server" CssClass="textbox" MaxLength="10"
                    Width="100px"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgList_item"
                        runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                <asp:ImageButton ID="imgClear_item" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                    ImageUrl="../../images/controls/erase.gif" />
                &nbsp;
                    <asp:TextBox ID="txtitem_name" runat="server" CssClass="textbox" MaxLength="100"
                        Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtitem_code" Display="None" ErrorMessage="กรุณาป้อนรหัสรายได้" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" />

                <asp:Label ID="lblError" runat="server" CssClass="label_error"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:GridView runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="2"
        ShowFooter="True" BackColor="White" BorderWidth="1px" CssClass="stGrid" Font-Bold="False"
        Font-Size="10pt" Width="100%" ID="GridView1" OnRowCreated="GridView1_RowCreated"
        OnRowDataBound="GridView1_RowDataBound" OnSorting="GridView1_Sorting">
        <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="cbSelectAll" runat="server" Checked="True" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" TabIndex="-1" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="1%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server"> </asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="2%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="เลขที่การจ่ายเงินเดือน" SortExpression="sp_person_code">
                <ItemStyle HorizontalAlign="Center" Width="8%" Wrap="True" />
                <ItemTemplate>
                    <asp:TextBox ID="txtpayment_doc" runat="server" CssClass="textbox" MaxLength="100"
                        Width="100" Text='<%# DataBinder.Eval(Container, "DataItem.payment_doc") %>'></asp:TextBox>
                    <asp:ImageButton ID="imgList_payment_doc" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                    <asp:ImageButton ID="imgClear_payment_doc" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                        ImageUrl="../../images/controls/erase.gif" Style="width: 18px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="รหัสบุคลากร" SortExpression="sp_person_code">
                <ItemStyle HorizontalAlign="Center" Width="8%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.person_code") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ชื่อ" SortExpression="person_thai_name">
                <ItemStyle HorizontalAlign="Left" Width="12%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_name" runat="server" Text='<%  # DataBinder.Eval(Container, "DataItem.bk_person_name")%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="นามสกุล" SortExpression="person_thai_surname">
                <ItemStyle HorizontalAlign="Left" Width="12%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_thai_surname" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.bk_person_surname")%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="อัตราเดิม">
                <ItemStyle HorizontalAlign="Right" Width="5%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtpayment_item_old" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_old"))%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="อัตราใหม่">
                <ItemStyle HorizontalAlign="Right" Width="5%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtpayment_item_new" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_new"))%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ผลต่าง">
                <ItemStyle HorizontalAlign="Right" Width="5%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtpayment_item_diff" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_diff"))%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="รวมตกเบิก">
                <ItemStyle HorizontalAlign="Right" Width="5%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtpayment_item_back" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_back"))%>' />
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" Width="10%" Wrap="False" />
                <FooterTemplate>
                    <cc1:AwNumeric ID="txtsumpayment_item_back" runat="server" Width="95%" LeadZero="Show"
                        CssClass="numberbox" DisplayMode="Control" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" CssClass="stGridHeader" Font-Bold="True"></HeaderStyle>
    </asp:GridView>


    <script type="text/javascript">
        function RegisterScript()
        {
            $("input[id*=imgClear_payment_doc]").click(function ()
            {                
                $('#' + this.id.replace('imgClear_payment_doc', 'txtpayment_doc')).val('');
                $('#' + this.id.replace('imgClear_payment_doc', 'lblperson_code')).val('');
                $('#' + this.id.replace('imgClear_payment_doc', 'lblperson_name')).html('');
                $('#' + this.id.replace('imgClear_payment_doc', 'lblperson_thai_surname')).html('');
                return false;
            });
            $("input[id*=imgList_payment_doc]").click(function ()
            {
                var txtpayment_doc = $('#' + this.id.replace('imgList_payment_doc', 'txtpayment_doc'));
                var lblperson_code = $('#' + this.id.replace('imgList_payment_doc', 'lblperson_code'));
                var lblperson_name = $('#' + this.id.replace('imgList_payment_doc', 'lblperson_name'));
                var lblperson_thai_surname = $('#' + this.id.replace('imgList_payment_doc', 'lblperson_thai_surname'));
                var url = "../lov/payment_lov.aspx?" +
                    "person_name=" + (lblperson_name.text() + ' ' + lblperson_thai_surname.text()) +
                    "&txtpayment_doc=" + $(txtpayment_doc).attr('id') +
                    "&lblperson_code=" + $(lblperson_code).attr('id') +
                    "&lblperson_name=" + $(lblperson_name).attr('id') +
                    "&lblperson_thai_surname=" + $(lblperson_thai_surname).attr('id') +
                    "&show=1&from=payment_import";
                OpenPopUp('900px', '500px', '95%', 'ค้นหาข้อมูลการจ่ายเงินเดือน', url, '1');
                return false;
            });

        };


    </script>

</asp:Content>
