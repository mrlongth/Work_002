<%@ Page Language="C#" MasterPageFile="~/Site_list.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="person_item_import.aspx.cs" Inherits="myWeb.App_Control.person.person_item_import"
    Title="นำเข้าข้อมูลรายรับประจำเดือน" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Assembly="Aware.WebControls" Namespace="Aware.WebControls" TagPrefix="cc1" %>
<%@ Register Assembly="DropDownCheckBoxes" Namespace="Saplin.Controls" TagPrefix="dcb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="20%">
                <asp:Label runat="server" ID="Label1">การคำนวณ :</asp:Label>
            </td>
            <td align="left" nowrap valign="middle" colspan="3">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" BorderWidth="0px" CellPadding="0"
                    CellSpacing="0" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="A">สร้างแบบฟร์อมการนำเข้า</asp:ListItem>
                    <asp:ListItem Value="I">นำเข้ารายรับจาก Excel</asp:ListItem>
                    <asp:ListItem Value="E">แก้ไขประวัติรายได้/ค่าใช้จ่าย</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:Panel ID="panelSeek" runat="server">
        <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
            <tr align="left">
                <td align="right" nowrap valign="middle" width="20%">
                    <asp:Label runat="server" ID="lblPage7">สังกัด : </asp:Label>
                </td>
                <td align="left" nowrap valign="middle" style="width: 20%;">
                    <asp:DropDownList runat="server" CssClass="textbox" ID="cboDirector" AutoPostBack="True"
                        OnSelectedIndexChanged="cboDirector_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;">
                    <asp:Label runat="server" ID="lblPage8">หน่วยงาน : </asp:Label>
                </td>
                <td align="left" nowrap valign="middle" colspan="2">
                    <asp:DropDownList runat="server" CssClass="textbox" ID="cboUnit">
                    </asp:DropDownList>
                    <asp:Label ID="lblError" runat="server" CssClass="label_error"></asp:Label>
                </td>
            </tr>
            <tr align="left">
                <td align="right" nowrap valign="middle" width="20%">
                    <asp:Label ID="lblPage2" runat="server">กลุ่มบุคลากร :</asp:Label>
                </td>
                <td align="left" nowrap valign="middle">
                    <asp:DropDownList ID="cboPerson_group" runat="server" CssClass="textbox">
                    </asp:DropDownList>
                    <dcb:DropDownCheckBoxes ID="cboPerson_group_dropdown_checkboxes" runat="server"
                        AddJQueryReference="True" UseButtons="False" UseSelectAllNode="True" Visible="False">
                        <Texts SelectBoxCaption="--- เลือกข้อมูลกลุ่มบุคลากร ---" />
                    </dcb:DropDownCheckBoxes>
                </td>
                <td align="left" nowrap valign="middle" style="text-align: right">
                    <asp:Label ID="Label74" runat="server" CssClass="label_error">*</asp:Label>
                    <asp:Label ID="lblPage3" runat="server">ประเภทรายการ :</asp:Label>
                </td>
                <td align="left" nowrap valign="middle">
                    <asp:DropDownList ID="cboItem_type" runat="server" CssClass="textbox"
                        AutoPostBack="True" OnSelectedIndexChanged="cboItem_type_SelectedIndexChanged">
                        <asp:ListItem Value="">---- กรุณาเลือกข้อมูล ----</asp:ListItem>
                        <asp:ListItem Value="D">Debit</asp:ListItem>
                        <asp:ListItem Value="C">Credit</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" nowrap rowspan="3" style="text-align: right;" valign="middle">
                    <asp:ImageButton ID="imgFind" runat="server" AlternateText="ค้นหาข้อมูล" ImageUrl="~/images/button/Search.png"
                        OnClick="imgFind_Click" ValidationGroup="A" />
                    <asp:ImageButton ID="imgSaveOnly" runat="server" AlternateText="บันทึกข้อมุล" ImageUrl="~/images/button/save_add.png"
                        OnClick="imgSaveOnly_Click" ValidationGroup="A" />
                    <asp:ImageButton ID="imgCancel" runat="server" AlternateText="ยกเลิก" CausesValidation="False"
                        ImageUrl="~/images/button/cancel.png" OnClick="imgCancel_Click" />
                </td>
            </tr>
            <tr align="left">
                <td align="right" nowrap valign="middle" width="20%">
                    <asp:Label ID="Label67" runat="server" CssClass="label_error">*</asp:Label>
                    <asp:Label ID="Label73" runat="server"> รหัสรายได้/ค่าใช้จ่าย :</asp:Label>
                </td>
                <td align="left" nowrap valign="middle" colspan="3">
                    <asp:TextBox ID="txtitem_code" runat="server" CssClass="textbox" MaxLength="10" ValidationGroup="A"
                        Width="100px"></asp:TextBox>
                    <asp:ImageButton ID="imgList_item" runat="server" ImageAlign="AbsBottom"
                        ImageUrl="../../images/controls/view2.gif" ValidationGroup="A" />
                    <asp:ImageButton ID="imgClear_item" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                        ImageUrl="../../images/controls/erase.gif" />
                    &nbsp;
                    <asp:TextBox ID="txtitem_name" runat="server" CssClass="textbox" MaxLength="100"
                        Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr align="left">
                <td align="right" nowrap valign="middle" width="20%">&nbsp;
                </td>
                <td align="left" colspan="3" nowrap valign="middle">
                    <asp:HyperLink ID="lnkExcelFile" runat="server" Target="_blank">
                        <img id="imgExcel" runat="server" alt="ดาวน์โหลดไฟล์" src="~/images/icon_exceldisable.gif"
                            border="0" />
                    </asp:HyperLink>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtitem_code"
                        Display="None" ErrorMessage="กรุณาป้อนรหัสรายได้/ค่าใช้จ่าย" SetFocusOnError="True"
                        ValidationGroup="A"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="cboItem_type" Display="None"
                        ErrorMessage="กรุณาเลือกประเภทรายการ" SetFocusOnError="True"
                        ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="panelSeek2" runat="server">
        <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
            <tr align="left">
                <td align="right" nowrap valign="middle" width="20%">
                    <asp:Label ID="Label75" runat="server" CssClass="label_error">*</asp:Label>
                    <asp:Label ID="Label11" runat="server">รหัสรายได้/ค่าใช้จ่าย :</asp:Label>
                </td>
                <td align="left" nowrap valign="middle">
                    <asp:TextBox ID="txtitem_code2" runat="server" CssClass="textbox" MaxLength="10"
                        Width="100px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgList_item2" runat="server" ImageAlign="AbsBottom"
                        ImageUrl="../../images/controls/view2.gif" />
                    <asp:ImageButton ID="imgClear_item2" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                        ImageUrl="../../images/controls/erase.gif" />
                    &nbsp;
                    <asp:TextBox ID="txtitem_name2" runat="server" CssClass="textbox" MaxLength="100"
                        Width="250px"></asp:TextBox>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">
                    </asp:LinkButton>
                    <asp:HiddenField ID="hddGUID" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtitem_code2"
                        Display="None" ErrorMessage="กรุณาป้อนรหัสค่าใช้จ่าย" SetFocusOnError="True"
                        ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
                <td align="left" nowrap valign="middle" style="text-align: right;">
                    <asp:ImageButton ID="imgImport" runat="server" AlternateText="นำเข้า Excel" ImageUrl="~/images/button/import.png"
                        OnClick="imgImport_Click" ValidationGroup="A" />
                    <asp:ImageButton ID="imgSaveOnly2" runat="server" AlternateText="บันทึกข้อมุล" ImageUrl="~/images/button/save_add.png"
                        OnClick="imgSaveOnly2_Click" ValidationGroup="A" />
                    <asp:ImageButton ID="imgCancel2" runat="server" AlternateText="ยกเลิก" CausesValidation="False"
                        ImageUrl="~/images/button/cancel.png" OnClick="imgCancel_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
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

            <asp:TemplateField HeaderText="เลขที่ประจำตัวประชาชน" SortExpression="sp_person_id">
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
                    <asp:HiddenField ID="hddperson_code" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.person_code") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <%--            
                <asp:TemplateField HeaderText="รหัสบุคลากร " SortExpression="person_code">
                <ItemStyle HorizontalAlign="Center" Width="8%" Wrap="True" />
                <ItemTemplate>
                    <asp:TextBox ID="txtperson_code" CssClass="textbox" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.person_code") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>--%>

            <asp:TemplateField HeaderText="ชื่อบุคลากร " SortExpression="person_thai_name">
                <ItemStyle HorizontalAlign="Left" Width="12%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_name" runat="server" Text='<%  # DataBinder.Eval(Container, "DataItem.title_name") + "" + DataBinder.Eval(Container, "DataItem.person_thai_name")%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="นามสกุล" SortExpression="person_thai_surname">
                <ItemStyle HorizontalAlign="Left" Width="12%" Wrap="True" />
                <ItemTemplate>
                    <asp:Label ID="lblperson_thai_surname" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.person_thai_surname")%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="จำนวนเงิน">
                <ItemStyle HorizontalAlign="Right" Width="10%" Wrap="False" />
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtmoney_credit" runat="server" Width="95%" LeadZero="Show" DisplayMode="Control"
                        CssClass="numberbox" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.money_credit"))%>' />
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Right" Width="10%" Wrap="False" />
                <FooterTemplate>
                    <cc1:AwNumeric ID="txtsummoney_credit" runat="server" Width="95%" LeadZero="Show"
                        CssClass="numberbox" DisplayMode="Control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete"
                        TabIndex="-1" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="3%" Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" CssClass="stGridHeader" Font-Bold="True"></HeaderStyle>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="A" />


    <script type="text/javascript">
        function RegisterScript() {
            $("input[id*=imgClear_person]").click(function () {
                $('#' + this.id.replace('imgClear_person', 'txtperson_id')).val('');
                $('#' + this.id.replace('imgClear_person', 'hddperson_code')).val('');
                $('#' + this.id.replace('imgClear_person', 'lblperson_name')).html('');
                $('#' + this.id.replace('imgClear_person', 'lblperson_thai_surname')).html('');
                return false;
            });
            $("input[id*=imgList_person]").click(function () {
                var txtperson_id = $('#' + this.id.replace('imgList_person', 'txtperson_id'));
                var hddperson_code = $('#' + this.id.replace('imgList_person', 'hddperson_code'));
                var lblperson_name = $('#' + this.id.replace('imgList_person', 'lblperson_name'));
                var lblperson_thai_surname = $('#' + this.id.replace('imgList_person', 'lblperson_thai_surname'));
                var url = "../lov/person_lov.aspx?" +
                          "person_id=" + txtperson_id.val() +
                          "&person_name=" + (lblperson_name.text() + ' ' + lblperson_thai_surname.text()) +
                          "&txtperson_id=" + $(txtperson_id).attr('id') +
                          "&hddperson_code=" + $(hddperson_code).attr('id') +
                          "&lblperson_name=" + $(lblperson_name).attr('id') +
                          "&lblperson_thai_surname=" + $(lblperson_thai_surname).attr('id') +
                          "&show=1&from=payment_item_import";
                OpenPopUp('900px', '500px', '95%', 'ค้นหาข้อมูลบุคลากร', url, '1');
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

        function funcsum() {
            var table = document.getElementById("<%= GridView1.ClientID %>");
            var sum = 0;
            for (var i = 1; i <= table.rows.length - 1; i++) //setting the incrementor=0, but if you have a header set it to 1 
            {
                var j = parseInt(i) + 1;
                if (j < 10) {
                    j = "0" + j;
                }
                if (i != table.rows.length - 1) {
                    var txtmoney_credit = document.getElementById(table.id + "_ctl" + j + "_txtmoney_credit");
                    sum = parseFloat(sum) + parseFloat(ToNumber(txtmoney_credit));
                }
                else
                {
                    document.getElementById(table.id + "_ctl" + j + "_txtsummoney_credit").value = sum;
                }
            }
        }

    </script>

</asp:Content>
