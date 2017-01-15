<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_certificate_control.aspx.cs" Inherits="myWeb.App_Control.payment.payment_certificate_control" %>

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
             calTotalAll();
        }

        function calTotalAll() { //คำนวณ Total

            var tablename = "<%= GridView1.ClientID %>";
            var txttotal_payment_recv = $("#" + tablename + " input[id*='txttotal_payment_recv']");
            var txttotal_payment_pay = $("#" + tablename + " input[id*='txttotal_payment_pay']");
            var txttotal_payment_net = $("#" + tablename + " input[id*='txttotal_payment_net']");

            var sumtotal_payment_recv = 0.00;
            var sumtotal_payment_pay = 0.00;
            var sumtotal_payment_net = 0.00;

            $("#" + tablename + " input[id*=txtpayment_item_recv]").each(function (index)
            {
                if ($(this).val() != '' && $('#' + this.id.replace("txtpayment_item_recv", 'CheckBox1')).is(":checked")) {
                    sumtotal_payment_recv += parseFloat(RemoveCommasStringAwNumeric($(this).val()));
                }
            });


            $("#" + tablename + " input[id*=txtpayment_item_pay]").each(function (index) {
                if ($(this).val() != '' && $('#' + this.id.replace("txtpayment_item_pay", 'CheckBox1')).is(":checked")) {
                    sumtotal_payment_pay += parseFloat(RemoveCommasStringAwNumeric($(this).val()));
                }
            });

     
          
            sumtotal_payment_net = sumtotal_payment_recv - sumtotal_payment_pay;
           
            sumtotal_payment_recv = delimitNumbers(sumtotal_payment_recv.toFixed(2).toString());
            $("#<%= txttotal_payment_recv.ClientID %>").val(sumtotal_payment_recv);

            sumtotal_payment_pay = delimitNumbers(sumtotal_payment_pay.toFixed(2).toString());
            $("#<%= txttotal_payment_pay.ClientID %>").val(sumtotal_payment_pay);

            sumtotal_payment_net = delimitNumbers(sumtotal_payment_net.toFixed(2).toString());
            $("#<%= txttotal_payment_net.ClientID %>").val(sumtotal_payment_net);


            function delimitNumbers(str) {
                return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function (a, b, c) {
                    return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
                });
            }

        };

        function calTotal() { //คำนวณ Total

             var sumtotal_payment_recv = 0.00;
             var sumtotal_payment_pay = 0.00;
             var sumtotal_payment_net = 0.00;

            var txttotal_payment_recv = $("#<%= txttotal_payment_recv.ClientID %>");
            var txttotal_payment_pay = $("#<%= txttotal_payment_pay.ClientID %>");
            var txttotal_payment_net = $("#<%= txttotal_payment_net.ClientID %>");

            sumtotal_payment_recv = parseFloat(RemoveCommasStringAwNumeric(txttotal_payment_recv.val()));
            sumtotal_payment_pay = parseFloat(RemoveCommasStringAwNumeric(txttotal_payment_pay.val()));
            sumtotal_payment_net = sumtotal_payment_recv - sumtotal_payment_pay;
            sumtotal_payment_net = delimitNumbers(sumtotal_payment_net.toFixed(2).toString());
            $("#<%= txttotal_payment_net.ClientID %>").val(sumtotal_payment_net);

            function delimitNumbers(str) {
                return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function (a, b, c) {
                    return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
                });
            }

        };



    </script>

    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
        <tr>
            <td align="left" nowrap style="text-align: right">
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                <asp:Label runat="server" ID="lblLastUpdatedBy">Last Updated By :</asp:Label>
            </td>
            <td align="left" style="width: 1%">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textbox" Width="144px" ID="txtUpdatedBy">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" nowrap style="text-align: right">
                <asp:Label runat="server" CssClass="text" ID="lblLastUpdatedDate">Last Updated Date :</asp:Label>
            </td>
            <td align="left">
                <asp:TextBox runat="server" ReadOnly="True" CssClass="textbox" Width="144px" ID="txtUpdatedDate">
                </asp:TextBox>
            </td>
        </tr>
    </table>
    <div style="text-align: center;">
        <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="370px"
            BorderWidth="0px" Style="text-align: left" Width="98%">
            <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="ข้อมูลประวัติบุคลากร">
                <HeaderTemplate>
                    ข้อมูลการจ่ายเงินเดือน
                </HeaderTemplate>
                <ContentTemplate>
                    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                        <tr align="left">
                            <td align="right" nowrap valign="middle" width="12%">
                                <asp:Label runat="server" ID="Label79">เลขที่เอกสาร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" width="20%">
                                <asp:TextBox runat="server" CssClass="textbox" Width="100px" ID="txtreq_cer_doc_no"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;" colspan="2">
                                <asp:Label ID="Label89" runat="server">ปีงบประมาณ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboYear" runat="server" CssClass="textbox">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label97" runat="server">รอบปีที่จ่าย :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPay_Year" runat="server" CssClass="textbox">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;" colspan="2">
                                <asp:Label ID="Label98" runat="server">รอบเดือนที่จ่าย :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPay_Month" runat="server" CssClass="textbox">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label99" runat="server">วันที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtreq_date" runat="server" CssClass="textbox" ReadOnly="True" Width="100px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right" colspan="2">
                                <asp:Label ID="Label96" runat="server">วันที่ในหนังสือรับรอง :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtreq_date_print" runat="server" CssClass="textbox" ReadOnly="True" Width="100px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label111" runat="server" CssClass="label_error">*</asp:Label>
                                <asp:Label ID="Label81" runat="server">ประเภทหนังสือรับรอง :</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap valign="middle">
                                <asp:DropDownList ID="cboReq_code" runat="server" AutoPostBack="True" CssClass="textbox" OnSelectedIndexChanged="cboReq_code_SelectedIndexChanged" Width="300px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cboReq_code" Display="None" ErrorMessage="กรุณาเลือกประเภทหนังสือรับรอง" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label93" runat="server" CssClass="label_error">*</asp:Label>
                                <asp:Label ID="Label94" runat="server" CssClass="label_hbk">รหัสบุคลากร :</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap valign="middle">
                                <asp:TextBox ID="txtperson_code" runat="server" CssClass="textbox" Width="100px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_person" runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                <asp:ImageButton ID="imgClear_person" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" OnClick="imgClear_item_Click" Style="width: 18px" />
                                &nbsp;<asp:TextBox ID="txttitle_code" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                &nbsp;<asp:TextBox ID="txtperson_thai_name" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:TextBox ID="txtperson_thai_surname" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtperson_code" Display="None" ErrorMessage="กรุณาเลือกบุคลากร" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label95" runat="server" CssClass="label_hbk">กลุ่มบุคลากร :</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap valign="middle">
                                <asp:TextBox ID="txtreq_person_group_name" runat="server" CssClass="textbox" MaxLength="500" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label49" runat="server" CssClass="label_hbk">ตำแหน่งปัจจุบัน :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" colspan="4">
                                <asp:TextBox ID="txtreq_position_name" runat="server" CssClass="textbox"
                                    Width="300px" MaxLength="500"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_position" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                <asp:ImageButton ID="imgClear_position" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" />
                                &nbsp;</td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;"
                                rowspan="5">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label3" runat="server" CssClass="label_hbk">ระดับตำแหน่ง :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" colspan="4">
                                <asp:TextBox ID="txtreq_level_position_name" runat="server" CssClass="textbox"
                                    MaxLength="500" Width="300px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_level" runat="server" CausesValidation="False"
                                    ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                <asp:ImageButton ID="imgClear_level" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                    ImageUrl="../../images/controls/erase.gif" />
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label101" runat="server" CssClass="label_hbk">สังกัด :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtreq_director_name" runat="server" CssClass="textbox" Width="300px" MaxLength="500"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: left" valign="middle" colspan="3">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle" style="height: 23px">
                                <asp:Label ID="Label100" runat="server" CssClass="label_hbk">หน่วยงาน :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" style="height: 23px">
                                <asp:TextBox ID="txtreq_unit_name" runat="server" CssClass="textbox" Width="300px" MaxLength="500"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: left; height: 23px;" valign="middle" colspan="3"></td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle" style="height: 15px">
                                <asp:Label ID="Label102" runat="server" CssClass="label_hbk">งาน/หลักสูตร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" style="height: 15px" colspan="4">
                                <asp:TextBox ID="txtreq_work_name" runat="server" CssClass="textbox" Width="300px" MaxLength="500"></asp:TextBox>
                                <asp:ImageButton ID="imgList_req_work" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                <asp:ImageButton ID="imgClear_req_work" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" />
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle" style="height: 17px">
                                <asp:Label ID="Label103" runat="server">จำนวนเงินที่ขอกู้ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" style="height: 17px">
                                <cc1:AwNumeric ID="txtreq_money" runat="server" CssClass="textbox" MaxValue="9999999999" Width="120px"></cc1:AwNumeric>
                            </td>
                            <td align="left" nowrap style="text-align: right; height: 17px;" valign="middle">&nbsp;</td>
                            <td align="left" colspan="2" nowrap valign="middle" style="height: 17px">&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap style="height: 17px" valign="middle">
                                <asp:Label ID="Label108" runat="server">วันที่เริ่มทำงาน :</asp:Label>
                            </td>
                            <td align="left" nowrap style="height: 17px" valign="middle">
                                <asp:TextBox ID="txtreq_start_work" runat="server" CssClass="textbox" ReadOnly="True" Width="120px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right; height: 17px;" valign="middle">
                                <asp:Label ID="Label107" runat="server">อายุงานคงเหลือ :</asp:Label>
                            </td>
                            <td align="left" colspan="2" nowrap style="height: 17px" valign="middle">
                                <cc1:AwNumeric ID="txtreq_age_work" runat="server" CssClass="textbox" MaxValue="9999999999" Width="120px" DecimalPlaces="0"></cc1:AwNumeric>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap style="height: 17px" valign="middle">
                                <asp:Label ID="Label106" runat="server">ผู้อนุมัติ :</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap style="height: 17px" valign="middle">
                                <asp:TextBox ID="txtreq_approve" runat="server" CssClass="textbox" MaxLength="255" Width="300px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_req_approve" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                <asp:ImageButton ID="imgClear_req_approve" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" />
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap style="height: 17px" valign="middle">
                                <asp:Label ID="Label109" runat="server">ตำแหน่ง 1 :</asp:Label>
                            </td>
                            <td align="left" nowrap style="height: 17px" valign="middle">
                                <asp:TextBox ID="txtreq_approve_position1" runat="server" CssClass="textbox" Width="300px" MaxLength="500"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right; height: 17px;" valign="middle">&nbsp;</td>
                            <td align="left" colspan="2" nowrap style="height: 17px" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap style="height: 17px" valign="middle">
                                <asp:Label ID="Label110" runat="server">ตำแหน่ง 2 :</asp:Label>
                            </td>
                            <td align="left" nowrap style="height: 17px" valign="middle">
                                <asp:TextBox ID="txtreq_approve_position2" runat="server" CssClass="textbox" MaxLength="500" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right; height: 17px;" valign="middle">&nbsp;</td>
                            <td align="left" colspan="2" nowrap style="height: 17px" valign="middle">&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
            <ajaxtoolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="ข้อมูลประวัติสถานะภาพส่วนตัว ">
                <HeaderTemplate>
                    ข้อมูลรายรับ/จ่าย
                </HeaderTemplate>
                <ContentTemplate>
                    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                        <tr align="left">
                            <td>
                                <div class="div-lov" style="height: 340px">
                                    <asp:GridView runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="2"
                                        BackColor="White" BorderWidth="1px" CssClass="stGrid" Font-Bold="False" Font-Size="10pt"
                                        Width="100%" ID="GridView1" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                                        OnSorting="GridView1_Sorting">
                                        <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbSelectAll" runat="server" Checked="False" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="False" TabIndex="-1" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="1%"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNo" runat="server"> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="2%"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="รหัสรายได้/ค่าใช้จ่าย" SortExpression="item_code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitem_code" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_code") %>'> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="รายละเอียดรายได้/ค่าใช้จ่าย" SortExpression="item_name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblitem_name" runat="server" CssClass="label_hbk" Text='<% # DataBinder.Eval(Container, "DataItem.item_name")%>'> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="30%" Wrap="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debit" SortExpression="payment_item_recv">
                                                <ItemTemplate>
                                                    <cc1:AwNumeric ID="txtpayment_item_recv" runat="server" Width="80px" LeadZero="Show" ReadOnly="False" 
                                                        DisplayMode="Control" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_recv"))%>'>
                                                    </cc1:AwNumeric>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Credit" SortExpression="payment_item_pay">
                                                 <%-- <HeaderTemplate>
                                                    <asp:ImageButton ID="imgAdd" runat="server" CommandName="Add" />
                                                </HeaderTemplate>--%>
                                                <ItemTemplate>
                                                    <cc1:AwNumeric ID="txtpayment_item_pay" runat="server" Width="80px" LeadZero="Show" ReadOnly="False"
                                                        DisplayMode="Control" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_pay"))%>'>
                                                    </cc1:AwNumeric>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
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
                                <asp:Label runat="server" ID="Label76" Font-Bold="True">ยอดรับ :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txttotal_payment_recv" runat="server" CssClass="textbox" MaxValue="9999999999" Width="120px"  ></cc1:AwNumeric>
                            </td>
                            <td style="text-align: right; width: 10%;">
                                <asp:Label runat="server" ID="Label77" Font-Bold="True">ยอดจ่าย :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txttotal_payment_pay" runat="server" CssClass="textbox" MaxValue="9999999999" Width="120px"></cc1:AwNumeric>
                            </td>
                            <td style="text-align: right; width: 12%;">
                                <asp:Label runat="server" ID="Label78" Font-Bold="True">รวมคงเหลือสุทธิ :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txttotal_payment_net" runat="server" CssClass="textbox" MaxValue="9999999999" Width="120px"></cc1:AwNumeric>
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
    <asp:ValidationSummary runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" ID="ValidationSummary1"></asp:ValidationSummary>
    
    
    

</asp:Content>
