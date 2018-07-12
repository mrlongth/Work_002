<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_bonus_control.aspx.cs" Inherits="myWeb.App_Control.payment_bonus.payment_bonus_control" %>

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
            <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="ข้อมูลการจ่ายค่าสวัสดิการข้าราชการ/ลูกจ้างประจำ">
                <HeaderTemplate>
                    ข้อมูลการจ่ายเงินรางวัล
                </HeaderTemplate>
                <ContentTemplate>
                    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                        <tr align="left">
                            <td align="right" nowrap valign="middle" width="12%">&nbsp;</td>
                            <td align="left" nowrap valign="middle" width="20%">&nbsp;</td>
                            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;" colspan="2">&nbsp;</td>
                            <td align="left" nowrap valign="middle">&nbsp;</td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle" width="12%">
                                <asp:Label ID="Label79" runat="server">เลขที่เอกสาร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" width="20%">
                                <asp:TextBox ID="txtpayment_doc" runat="server" CssClass="textboxdis" ReadOnly="True" Width="100px"></asp:TextBox>
                            </td>
                            <td align="left" colspan="2" nowrap style="text-align: right; width: 10%;" valign="middle">&nbsp;&nbsp; </td>
                            <td align="left" nowrap valign="middle">&nbsp; </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;&nbsp; </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label runat="server" ID="Label80">วันที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtpayment_date" runat="server" CssClass="textbox" Width="120px"></asp:TextBox>
                                <ajaxtoolkit:CalendarExtender
                                    ID="txtpayment_date_CalendarExtender" runat="server" BehaviorID="txtpayment_date_CalendarExtender"
                                    Enabled="True" PopupButtonID="imgpay_begin_date" TargetControlID="txtpayment_date">
                                </ajaxtoolkit:CalendarExtender>
                                <asp:ImageButton ID="imgpay_begin_date" runat="server" AlternateText="Click to show calendar"
                                    ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtpayment_date"
                                    Display="None" ErrorMessage="กรุณาเลือกตั้งแต่วันที่" ValidationGroup="A"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right; width: 10%;" colspan="2">
                                <asp:Label runat="server" ID="Label82">ปีงบประมาณ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList runat="server" CssClass="textbox" ID="cboYear">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="cboYear" Display="None" ErrorMessage="กรุณาเลือกปีงบประมาณ" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle" style="height: 25px">
                                <asp:Label runat="server" ID="Label84">รอบเดือนที่จ่าย :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" style="height: 25px">
                                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Month">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="cboPay_Month" Display="None" ErrorMessage="กรุณาเลือกรอบเดือนที่จ่าย" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right; height: 25px;" colspan="2">
                                <asp:Label runat="server" ID="Label85">รอบปีที่จ่าย :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle" style="height: 25px">
                                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Year">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="cboPay_Year" Display="None" ErrorMessage="กรุณาเลือกรอบปีที่จ่าย" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%; height: 25px;">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label91" runat="server">รอบการจ่ายที่ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPay_Item" runat="server" CssClass="textbox">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="cboPay_Item" Display="None" ErrorMessage="กรุณาเลือกรอบการจ่ายที่" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" colspan="2" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label50" runat="server" CssClass="label_hbk">กลุ่มบุคลากร :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboPerson_group" runat="server" AutoPostBack="True" CssClass="textbox" OnSelectedIndexChanged="cboPerson_group_SelectedIndexChanged1">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label86" runat="server" cssclass="label_error">*</asp:Label>
                                <asp:Label ID="lblperson_name" runat="server" CssClass="label_hbk">รหัสบุคลากร :</asp:Label>
                            </td>
                            <td align="left" colspan="4" nowrap valign="middle">
                                <asp:TextBox ID="txtperson_code" runat="server" CssClass="textboxdis" Width="100px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_item" runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" Visible="False" />
                                <asp:ImageButton ID="imgClear_item" runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" OnClick="imgClear_item_Click" Style="width: 18px" Visible="False" />
                                &nbsp;<asp:TextBox ID="txtperson_name" runat="server" CssClass="textboxdis" ReadOnly="True" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtperson_code" Display="None" ErrorMessage="กรุณาเลือกบุคลากร" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" nowrap style="vertical-align: bottom; width: 1%;" valign="middle">&nbsp; </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label1" runat="server">ประเภทงบประมาณ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:DropDownList ID="cboBudget_type" runat="server" AutoPostBack="True" CssClass="textbox" OnSelectedIndexChanged="cboBudget_type_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td align="left" nowrap valign="middle" style="text-align: right;"></td>
                            <td align="left" nowrap valign="middle" colspan="2">&nbsp;</td>
                            <td align="left" nowrap valign="middle" style="vertical-align: bottom; width: 1%;"
                                rowspan="7">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label52" runat="server" CssClass="label_hbk">ผังงบประมาณ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtbudget_plan_code" runat="server" CssClass="textbox" MaxLength="10"
                                    Width="100px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="imgList_budget_plan" runat="server" CausesValidation="False"
                                    ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                <asp:ImageButton ID="imgClear_budget_plan" runat="server" CausesValidation="False"
                                    ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" />
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label54" runat="server" CssClass="label_hbk">แผนงาน :</asp:Label>
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">
                                <asp:TextBox ID="txtbudget_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label55" runat="server" CssClass="label_hbk">ผลผลิต :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtproduce_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label53" runat="server" CssClass="label_hbk">กิจกรรม :</asp:Label>
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">
                                <asp:TextBox ID="txtactivity_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label56" runat="server" CssClass="label_hbk">ยุทธศาสตร์ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtplan_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label57" runat="server" CssClass="label_hbk">งาน/หลักสูตร :</asp:Label>
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">
                                <asp:TextBox ID="txtwork_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label58" runat="server" CssClass="label_hbk">กองทุน :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtfund_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label60" runat="server" CssClass="label_hbk">สังกัด :</asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">
                                <asp:TextBox ID="txtdirector_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label61" runat="server" CssClass="label_hbk">หน่วยงาน :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <asp:TextBox ID="txtunit_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">&nbsp;</td>
                            <td align="left" colspan="2" nowrap valign="middle">&nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">
                                <asp:Label ID="Label81" runat="server">หมายเหตุ :</asp:Label>
                            </td>
                            <td align="left" nowrap valign="middle">
                                <font face="Tahoma">
                                    <asp:TextBox ID="txtcomments" runat="server" CssClass="textbox" MaxLength="255" Width="300px"></asp:TextBox></font>
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">
                                <asp:Label ID="Label12" runat="server">สถานะ :</asp:Label>
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">
                                <asp:CheckBox ID="chkStatus" runat="server" Text="ปกติ" />
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtperson_code"
                                    Display="None" ErrorMessage="กรุณาป้อนรหัสบุคลากร" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="A" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="right" nowrap valign="middle">&nbsp;
                            </td>
                            <td align="left" nowrap valign="middle">&nbsp;
                            </td>
                            <td align="left" nowrap style="text-align: right" valign="middle">&nbsp;
                            </td>
                            <td align="left" colspan="2" nowrap valign="middle">&nbsp;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
            <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ข้อมูลรายการค่าสวัสดิการข้าราชการ/ลูกจ้างประจำ">
                <HeaderTemplate>
                    ข้อมูลรายการเงินรางวัล
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
                                                    <asp:HiddenField ID="hddbn_payment_detail_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.bn_payment_detail_id") %>' />
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
                                                        DisplayMode="View" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.bn_payment_item_money"))%>'>
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
                                <asp:Label runat="server" ID="Label76" Font-Bold="True" Visible="True">ยอดรับ :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txtpayment_recv" runat="server" Text="0.00" Font-Bold="True" CssClass="numberdis"
                                    LeadZero="Show" MaxValue="99999999999" MinValue="-99999999999" ReadOnly="True" Visible="True">
                                </cc1:AwNumeric>
                            </td>
                            <td style="text-align: right; width: 10%;">
                                <asp:Label runat="server" ID="Label77" Font-Bold="True" Visible="True">ยอดจ่าย :</asp:Label>
                            </td>
                            <td style="text-align: right; width: 1%;">
                                <cc1:AwNumeric ID="txtpayment_pay" runat="server" Font-Bold="True" ForeColor="Red"
                                    CssClass="numberdis" LeadZero="Show" MaxValue="99999999999" MinValue="-99999999999"
                                    ReadOnly="True" Visible="True">0.00</cc1:AwNumeric>
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
