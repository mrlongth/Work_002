<%@ Page Language="C#" MasterPageFile="~/Site_list.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_bonus_import.aspx.cs" Inherits="myWeb.App_Control.payment_bonus.payment_bonus_import"
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
                    <asp:ListItem Value="I" Selected="True">นำเข้าเงินรางวัล</asp:ListItem>
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
            <td align="left" nowrap rowspan="2" style="vertical-align: middle; width: 1%;" valign="middle">
                <asp:ImageButton ID="imgImport" runat="server" AlternateText="นำเข้า Excel" ImageUrl="~/images/button/import.png"
                    OnClick="imgImport_Click" />
                <asp:ImageButton ID="imgSaveOnly" runat="server" AlternateText="บันทึกข้อมุล" ImageUrl="~/images/button/save_add.png"
                    OnClick="imgSaveOnly_Click" />
                <asp:ImageButton ID="imgCancel" runat="server" AlternateText="ยกเลิก" CausesValidation="False"
                    ImageUrl="~/images/button/cancel.png" OnClick="imgCancel_Click" />
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label11">รหัสเงินรางวัล :</asp:Label>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtitem_code" Display="None" ErrorMessage="กรุณาป้อนรหัสค่าดำเนินงาน" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                <ajaxtoolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True" HighlightCssClass="validatorCalloutHighlight" TargetControlID="RequiredFieldValidator2">
                </ajaxtoolkit:ValidatorCalloutExtender>
                <asp:Label ID="lblError" runat="server" CssClass="label_error"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
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
            <asp:TemplateField HeaderText="เลขที่ประจำตัวประชาชน" SortExpression="sp_person_code">
                <ItemStyle HorizontalAlign="Center" Width="8%" Wrap="True" />
                <ItemTemplate>
                    <asp:TextBox ID="txtperson_id" runat="server" CssClass="textbox" MaxLength="100"
                        Width="120" Text='<%# DataBinder.Eval(Container, "DataItem.person_id") %>'>                        
                    </asp:TextBox>
                    &nbsp;
                    <asp:ImageButton ID="imgList_person" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                    <asp:ImageButton ID="imgClear_person" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                        ImageUrl="../../images/controls/erase.gif" Style="width: 18px" />
                    <asp:RequiredFieldValidator ID="reqperson_id" runat="server" ErrorMessage="กรุณาเลือกเลขที่ประจำตัวประชาชน" ControlToValidate="txtperson_id" SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
                    <asp:HiddenField ID="hddbudget_plan_code" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.budget_plan_code") %>' />
                    <asp:HiddenField ID="hddperson_group_code" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.person_group_code") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ชื่อ" SortExpression="person_thai_name">
                <ItemStyle HorizontalAlign="Left" Width="12%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_name" runat="server" Text='<%  # DataBinder.Eval(Container, "DataItem.bn_person_name")%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="นามสกุล" SortExpression="person_thai_surname">
                <ItemStyle HorizontalAlign="Left" Width="12%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_thai_surname" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.bn_person_surname")%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="จำนวน">
                <ItemStyle HorizontalAlign="Right" Width="10%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtitem_qty" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.item_qty"))%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="รวมจำนวนเงิน">
                <ItemStyle HorizontalAlign="Right" Width="10%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtmoney_credit" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.item_amt"))%>' />
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" Width="10%" Wrap="False" />
                <FooterTemplate>
                    <cc1:AwNumeric ID="txtsummoney_credit" runat="server" Width="95%" LeadZero="Show"
                        CssClass="numberbox" DisplayMode="Control" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" CssClass="stGridHeader" Font-Bold="True"></HeaderStyle>
    </asp:GridView>
    
    <script type="text/javascript">
        function RegisterScript() {
            $("input[id*=imgClear_person]").click(function () {
                $('#' + this.id.replace('imgClear_person', 'txtperson_id')).val('');
                $('#' + this.id.replace('imgClear_person', 'lblperson_name')).html('');
                $('#' + this.id.replace('imgClear_person', 'lblperson_thai_surname')).html('');
                return false;
            });
            $("input[id*=imgList_person]").click(function () {
                var txtperson_id = $('#' + this.id.replace('imgList_person', 'txtperson_id'));
                var lblperson_name = $('#' + this.id.replace('imgList_person', 'lblperson_name'));
                var lblperson_thai_surname = $('#' + this.id.replace('imgList_person', 'lblperson_thai_surname'));
                var url = "../lov/person_special_lov.aspx?" +
                          "person_id=" + txtperson_id.val() +
                          "&txtperson_id=" + $(txtperson_id).attr('id') +
                          "&lblperson_name=" + $(lblperson_name).attr('id') +
                          "&lblperson_thai_surname=" + $(lblperson_thai_surname).attr('id') +
                          "&show=1&from=payment_special_import";
                OpenPopUp('900px', '500px', '95%', 'ค้นหาข้อมูลบุคลากร/อาจารย์พิเศษ', url, '1');
                return false;
            });

        };

        function ToggleValidator(chk) {
            var requiredFieldValidator = chk.id.replace('CheckBox1', 'reqperson_id');

            var validatorObject = document.getElementById(requiredFieldValidator);
            console.log(validatorObject);
            validatorObject.enabled = chk.checked;
            validatorObject.isvalid = chk.checked;
            ValidatorUpdateDisplay(validatorObject);

        }

    </script>

</asp:Content>
