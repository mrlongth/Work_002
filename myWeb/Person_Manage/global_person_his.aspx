<%@ Page Language="C#" MasterPageFile="~/Site_person.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="global_person_his.aspx.cs" Inherits="myWeb.Person_Manage.global_person_his" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Assembly="Aware.WebControls" Namespace="Aware.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table border="0" cellpadding="1" cellspacing="2" style="width: 100%">
        <tr align="center">
            <td>
                <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="400px"
                    BorderWidth="0px" Style="text-align: left" Width="900px">
                    <ajaxtoolkit:TabPanel runat="server" HeaderText="�����Ż���ѵԺؤ�ҡ�" ID="TabPanel1">
                        <HeaderTemplate>
                            ����ѵԺؤ�ҡ�
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle" width="10%">
                                        &nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" width="40%" colspan="2">
                                        &nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" width="20%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle" width="10%">
                                        <asp:Label ID="Label21" runat="server" CssClass="label_h">���ʺؤ�ҡ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" width="40%" colspan="2">
                                        <asp:TextBox ID="txtperson_code" runat="server" CssClass="textbox" Width="120px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td align="left" nowrap valign="middle" width="20%">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle">
                                        <asp:Label ID="Label16" runat="server" CssClass="label_h">�ӹ�˹�Ҫ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:DropDownList ID="cboTitle" runat="server" CssClass="textbox" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" nowrap rowspan="9" style="text-align: center" valign="middle">
                                        <asp:Image ID="imgPerson" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="200px"
                                            ImageUrl="~/person_pic/image_n_a.jpg" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label14" runat="server" CssClass="label_h">���������� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" colspan="2">
                                        <asp:TextBox ID="txtperson_thai_name" runat="server" CssClass="textbox" Width="400px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label15" runat="server" CssClass="label_h">���ʡ�������� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_thai_surname" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="400px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label17" runat="server" CssClass="label_h">���������ѧ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_eng_name" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="400px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label18" runat="server" CssClass="label_h">���ʡ�������ѧ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_eng_surname" runat="server" CssClass="textbox" Width="400px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label20" runat="server" CssClass="label_h">�Ţ���ѵû�ЪҪ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" colspan="2">
                                        <asp:TextBox ID="txtperson_id" runat="server" CssClass="textbox" Width="200px" MaxLength="13"
                                            ReadOnly="True"></asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1"
                                                runat="server" TargetControlID="txtperson_id" FilterType="Numbers" Enabled="True" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label19" runat="server" CssClass="label_h">������� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_nickname" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label76" runat="server" CssClass="label_h">ʶҹ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap colspan="2">
                                        <font face="Tahoma">
                                            <asp:CheckBox ID="chkStatus" runat="server" Text="����" Enabled="False" />
                                        <asp:TextBox ID="txtperson_pic" runat="server" CssClass="textbox" Visible="False" Width="225px"></asp:TextBox>
                                        </font>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" rowspan="4">
                                    </td>
                                    <td align="left" nowrap valign="top" rowspan="4" style="width: 1%">
                                        &nbsp;<asp:Image ID="Image4" runat="server" ImageUrl="~/images/password.jpg" />
                                    </td>
                                    <td align="left" nowrap style="width: 99%" valign="top">&nbsp;</td>
                                    <td align="left" rowspan="4">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="left" nowrap valign="top">
                                        <asp:LinkButton ID="lnkChangePass" runat="server">����¹���ʼ�ҹ</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="left" nowrap valign="top">&nbsp;</td>
                                </tr>
                                <tr align="left">
                                    <td align="left" nowrap valign="top">&nbsp;</td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" colspan="4" style="text-align: center">
                                        <asp:Label ID="Label78" runat="server">*�ҡ��������ǹ��Ǣͧ��ҹ���١��ͧ����ö���������ͧ�����çҹ�ؤ�� �Դ��ͧҹ����¹����ѵԡͧ�ؤ�� 5339</asp:Label>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 15px">
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 15px" colspan="2">
                                    </td>
                                    <td style="height: 15px">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" colspan="4">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="�����š�÷ӧҹ">
                        <HeaderTemplate>
                            ��÷ӧҹ
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td nowrap valign="middle" align="right">
                                        <asp:Label ID="Label49" runat="server" CssClass="label_h">���˹觻Ѩ�غѹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtposition_code" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px" ReadOnly="True"></asp:TextBox>
                                        &nbsp;
                                        <asp:TextBox ID="txtposition_name" runat="server" CssClass="textbox" MaxLength="100"
                                            Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="10%">
                                        <asp:Label ID="Label77" runat="server" CssClass="label_h">���������˹� :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txttype_position_code" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px" ReadOnly="True"></asp:TextBox>
                                        &nbsp;&nbsp;<asp:TextBox ID="txttype_position_name" runat="server" CssClass="textbox"
                                            MaxLength="100" Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label3" runat="server" CssClass="label_h">�дѺ���˹� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_level" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px" ReadOnly="True"></asp:TextBox>
                                        &nbsp;&nbsp;<asp:TextBox ID="txtlevel_position_name" runat="server" CssClass="textbox"
                                            MaxLength="100" Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="10%">
                                        <asp:Label ID="Label6" runat="server" CssClass="label_h">�Ţ�����˹� :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtperson_postionno" runat="server" CssClass="textbox" Width="130px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" style="text-align: right">
                                        <asp:Label ID="Label8" runat="server" CssClass="label_h">�ҢҸ�Ҥ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="3" style="text-align: left">
                                        <asp:TextBox ID="txtbranch_code" runat="server" CssClass="textbox" MaxLength="6"
                                            Width="80px" ReadOnly="True"></asp:TextBox>
                                        &nbsp;&nbsp;<asp:TextBox ID="txtbranch_name" runat="server" CssClass="textbox" MaxLength="100"
                                            Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" align="right">
                                        <asp:Label ID="Label22" runat="server" CssClass="label_h">��Ҥ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbank_name" runat="server" CssClass="textbox" Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label38" runat="server" CssClass="label_h">�Ţ���ѭ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbank_no" runat="server" CssClass="textbox" MaxLength="20" Width="130px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label41" runat="server" CssClass="label_h">�Թ��͹�Ѩ�غѹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_salaly" runat="server" CssClass="numberbox" Width="130px">0.00</asp:TextBox>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                            Enabled="True" FilterType="Custom, Numbers" TargetControlID="txtperson_salaly"
                                            ValidChars=".">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label50" runat="server" CssClass="label_h">������ؤ�ҡ� :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cboPerson_group" runat="server" CssClass="textbox" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label43" runat="server" CssClass="label_h">�ѹ����è� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_start" runat="server" CssClass="textbox" Width="130px"
                                            ReadOnly="True"></asp:TextBox>
                                        <ajaxtoolkit:CalendarExtender ID="txtperson_start_CalendarExtender" runat="server"
                                            Enabled="True" PopupButtonID="imgperson_start" TargetControlID="txtperson_start">
                                        </ajaxtoolkit:CalendarExtender>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label44" runat="server" CssClass="label_h">�ѹ������³ :</asp:Label>
                                    </td>
                                    <td align="left" style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_end" runat="server" CssClass="textbox" ReadOnly="True"
                                            Width="130px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label45" runat="server" CssClass="label_h">�������Ҫԡ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:DropDownList ID="cboMember_type" runat="server" CssClass="textbox" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label51" runat="server" CssClass="label_h">�ѵ������ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtmember_type_add" runat="server" CssClass="numberbox" Width="130px">0.00</asp:TextBox>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                            Enabled="True" FilterType="Custom, Numbers" TargetControlID="txtmember_type_add"
                                            ValidChars=".">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label46" runat="server" CssClass="label_h">���˹觺����� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="text-align: left">
                                        <asp:TextBox ID="txtperson_manage_code" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px" ReadOnly="True"></asp:TextBox>
                                        &nbsp;&nbsp;<asp:TextBox ID="txtperson_manage_name" runat="server" CssClass="textbox"
                                            MaxLength="100" Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label1" runat="server" CssClass="label_h">������������ҳ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;<asp:DropDownList runat="server" CssClass="textbox" ID="cboBudget_type" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label52" runat="server" CssClass="label_h">�ѧ������ҳ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbudget_plan_code" runat="server" CssClass="textbox" MaxLength="10"
                                            Width="80px" ReadOnly="True"></asp:TextBox>&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label54" runat="server" CssClass="label_h">Ἱ�ҹ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbudget_name" runat="server" CssClass="textbox" Width="300px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label55" runat="server" CssClass="label_h">�ż�Ե :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtproduce_name" runat="server" CssClass="textbox" Width="300px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label53" runat="server" CssClass="label_h">�Ԩ���� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtactivity_name" runat="server" CssClass="textbox" Width="300px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label56" runat="server" CssClass="label_h">�ط���ʵ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtplan_name" runat="server" CssClass="textbox" Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label57" runat="server" CssClass="label_h">�ҹ/��ѡ�ٵ� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtwork_name" runat="server" CssClass="textbox" Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 22px">
                                        <asp:Label ID="Label58" runat="server" CssClass="label_h">�ͧ�ع :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 22px">
                                        <asp:TextBox ID="txtfund_name" runat="server" CssClass="textbox" Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right; height: 22px;">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="height: 22px">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label60" runat="server" CssClass="label_h">�ѧ�Ѵ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtdirector_name" runat="server" CssClass="textbox" Width="300px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label61" runat="server" CssClass="label_h">˹��§ҹ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtunit_name" runat="server" CssClass="textbox" Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label64" runat="server" CssClass="label_h">�է�����ҳ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbudget_plan_year" runat="server" CssClass="textbox" Width="130px"
                                            ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label62" runat="server" CssClass="label_h">ʶҹС�÷ӧҹ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="cboPerson_work_status" runat="server" CssClass="textbox" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="3">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" colspan="4">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="�����Ż���ѵ�ʶҹ��Ҿ��ǹ��� ">
                        <HeaderTemplate>
                            ʶҹ��Ҿ��ǹ���
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%" colspan="2">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="" width="8%">
                                        <asp:Label ID="Label4" runat="server" CssClass="label_h">�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%" colspan="2">
                                        <asp:DropDownList ID="cboPerson_sex" runat="server" CssClass="textbox" Enabled="False">
                                            <asp:ListItem Selected="True">---- ������кآ����� ----</asp:ListItem>
                                            <asp:ListItem Value="M">���</asp:ListItem>
                                            <asp:ListItem Value="F">˭ԧ</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label5" runat="server" CssClass="label_h">���˹ѡ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" colspan="2">
                                        <asp:TextBox ID="txtperson_width" runat="server" CssClass="textbox" Width="120px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label7" runat="server" CssClass="label_h">��ǹ�٧ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_high" runat="server" CssClass="textbox" Width="120px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label9" runat="server" CssClass="label_h">���ͪҵ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_origin" runat="server" CssClass="textbox" Width="360px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label23" runat="server" CssClass="label_h">�ѭ�ҵ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" colspan="2">
                                        <asp:TextBox ID="txtperson_nation" runat="server" CssClass="textbox" Width="360px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label24" runat="server" CssClass="label_h">��ʹ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_religion" runat="server" CssClass="textbox" Width="360px"
                                            MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label25" runat="server" CssClass="label_h">�ѹ�Դ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle" width="10%">
                                        <asp:TextBox ID="txtperson_birth" runat="server" CssClass="textbox" Width="120px"
                                            ReadOnly="True"></asp:TextBox>
                                        <%--<ajaxtoolkit:CalendarExtender ID="calendarButtonExtender"
                                                runat="server" BehaviorID="txtperson_birth_CalendarExtender" Enabled="True" PopupButtonID="imgperson_birth"
                                                TargetControlID="txtperson_birth">
                                            </ajaxtoolkit:CalendarExtender>--%>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle">
                                        <asp:Label ID="lblAge" runat="server" CssClass="label_h" Font-Bold="True">���� :</asp:Label>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label26" runat="server" CssClass="label_h">ʶҹ����� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2" >
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" Width="120px"
                                            ReadOnly="True"></asp:TextBox>
                                        <asp:DropDownList ID="cboPerson_marry" runat="server" CssClass="textbox" Visible="False" >
                                            <asp:ListItem Selected="True">---- ������кآ����� ----</asp:ListItem>
                                            <asp:ListItem Value="1">�ʴ</asp:ListItem>
                                            <asp:ListItem Value="2">����</asp:ListItem>
                                            <asp:ListItem Value="3">����</asp:ListItem>
                                            <asp:ListItem Value="4">�����</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="�����Ż���ѵԷ����������� ">
                        <HeaderTemplate>
                            ������������
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle" width="13%">
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="35%">
                                    </td>
                                    <td nowrap style="text-align: right;" width="15%">
                                    </td>
                                    <td style="text-align: left" width="35%">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="" width="13%">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" width="35%">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td style="text-align: left" width="35%">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label10" runat="server" CssClass="label_h">��ͧ�Ţ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" width="35%">
                                        <asp:TextBox ID="txtperson_room" runat="server" CssClass="textbox" Width="260px"
                                            MaxLength="10" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        <asp:Label ID="Label27" runat="server" CssClass="label_h">��鹷�� :</asp:Label>
                                    </td>
                                    <td style="text-align: left" width="35%">
                                        <asp:TextBox ID="txtperson_floor" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label11" runat="server" CssClass="label_h">�����ҹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_village" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label28" runat="server" CssClass="label_h">�Ţ��� :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtperson_homeno" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label12" runat="server" CssClass="label_h">��͡/��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_soi" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label34" runat="server" CssClass="label_h">������ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_moo" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label30" runat="server" CssClass="label_h">��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_road" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label35" runat="server" CssClass="label_h">�Ӻ� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_tambol" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label31" runat="server" CssClass="label_h">����� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_aumphur" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label36" runat="server" CssClass="label_h">�ѧ��Ѵ :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtperson_province" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label32" runat="server" CssClass="label_h">������ɳ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_postno" runat="server" CssClass="textbox" MaxLength="10"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label37" runat="server" CssClass="label_h">���Ѿ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_tel" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label40" runat="server" CssClass="label_h">���Դ��͡óթء�Թ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_contact" runat="server" CssClass="textbox" MaxLength="100"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label33" runat="server" CssClass="label_h">��������ѹ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_ralation" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label39" runat="server" CssClass="label_h">���Ѿ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_contact_tel" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="����������Ѻ/����">
                        <HeaderTemplate>
                            ����������Ѻ/����
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="center">
                                    <td align="center" nowrap style="width: 42%" valign="top">
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td align="center" nowrap style="width: 42%" valign="top">
                                        <div id="div-gridfix">
                                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                                                OnRowDeleting="GridView1_RowDeleting" OnSorting="GridView1_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��������¡��" SortExpression="item_type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_type" runat="server" Text='<%# getItemtype(DataBinder.Eval(Container, "DataItem.item_type")) %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���������/����" SortExpression="item_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.item_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����/��������" SortExpression="item_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_name" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.item_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�ѧ������ҳ" SortExpression="budget_plan_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbudget_plan_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.budget_plan_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="������������ҳ" SortExpression="budget_type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbudget_type" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.budget_type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit" SortExpression="item_debit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_debit" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.item_debit") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" SortExpression="item_credit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_credit" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.item_credit") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="stGridHeader" HorizontalAlign="Center" />
                                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
                                                    Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous">
                                                </PagerSettings>
                                                <PagerStyle BackColor="Gainsboro" ForeColor="#8C4510" HorizontalAlign="Center" Wrap="True" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="�������Ҫԡ"
                        ScrollBars="Vertical">
                        <HeaderTemplate>
                            �������Ҫԡ
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="left">
                                    <td>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <div id="div-gridfix2">
                                            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="GridView2_RowCreated" OnRowDataBound="GridView2_RowDataBound"
                                                OnRowDeleting="GridView2_RowDeleting" OnSorting="GridView2_Sorting" Style="width: 100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo1" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���ʡ������Ҫԡ" SortExpression="member_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.member_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���͡������Ҫԡ" SortExpression="member_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_name" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.member_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="45%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�ӹǹ����Ҫԡ" SortExpression="member_quan">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_quan" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.member_quan") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus1" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <AlternatingRowStyle BackColor="#EAEAEA" />
                                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="stGridHeader" HorizontalAlign="Center" />
                                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
                                                    Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous" />
                                                <PagerStyle BackColor="Gainsboro" ForeColor="#8C4510" HorizontalAlign="Center" Wrap="True" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="�����š�è����Թ��͹"
                        ScrollBars="Vertical">
                        <HeaderTemplate>
                            �����š�è����Թ��͹
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td style="text-align: right;">
                                        <asp:Label runat="server" CssClass="label_h" ID="lblPage8">�ͺ�շ����� :</asp:Label>
                                    </td>
                                    <td width="5%">
                                        <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Year" AutoPostBack="True"
                                            OnSelectedIndexChanged="cboPay_Year_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right" width="15%">
                                        <asp:Label runat="server" CssClass="label_h" ID="lblPage1">�ͺ��͹������ :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Month" AutoPostBack="True"
                                            OnSelectedIndexChanged="cboPay_Month_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="4">
                                        <br />
                                        <div id="div1" style="overflow: auto; height: 350px;">
                                            <asp:GridView runat="server" AllowSorting="False" AutoGenerateColumns="False" CellPadding="2"
                                                BackColor="White" BorderWidth="1px" CssClass="stGrid" Font-Bold="False" Font-Size="10pt"
                                                Width="100%" ID="GridView4" OnRowCreated="GridView4_RowCreated" OnRowDataBound="GridView4_RowDataBound">
                                                <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Wrap="False" Width="2%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���������/����" SortExpression="item_code">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hddpayment_detail_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.payment_detail_id") %>' />
                                                            <asp:Label ID="lblitem_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.item_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����/��������" SortExpression="item_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_name" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.item_name") %>'> </asp:Label><asp:HiddenField
                                                                ID="hdfpayment_item_tax" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.payment_item_tax") %>' />
                                                            <asp:HiddenField ID="hdfpayment_item_sos" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.payment_item_sos") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="30%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="������������ҳ" SortExpression="budget_type" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hddbudget_type" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.payment_detail_budget_type") %>' />
                                                            <asp:Label ID="lblbudget_type" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.payment_detail_budget_type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�ѧ������ҳ" SortExpression="payment_detail_budget_plan_code"
                                                        Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpayment_detail_budget_plan_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.payment_detail_budget_plan_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��" SortExpression="payment_detail_lot_code" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpayment_detail_lot_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.payment_detail_lot_code") %>'
                                                                Visible="false" />
                                                            <asp:Label ID="lblpayment_detail_lot_name" runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit" SortExpression="payment_item_recv">
                                                        <ItemTemplate>
                                                            <cc1:AwNumeric ID="txtpayment_item_pay" runat="server" Width="80px" LeadZero="Show"
                                                                DisplayMode="View" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_recv")) %>'>
                                                            </cc1:AwNumeric>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" SortExpression="payment_item_pay">
                                                        <ItemTemplate>
                                                            <cc1:AwNumeric ID="txtipayment_item_pay" runat="server" Width="80px" LeadZero="Show"
                                                                DisplayMode="View" Text='<% # getNumber(DataBinder.Eval(Container, "DataItem.payment_item_pay")) %>'>
                                                            </cc1:AwNumeric>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active_detail") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" CssClass="stGridHeader" Font-Bold="True"></HeaderStyle>
                                            </asp:GridView>
                                            <div style="width: 50%; float: left;">
                                                &nbsp;
                                            </div>
                                            <div style="width: 35%; float: left; text-align: right; padding: 2px 0px 3px 0px">
                                                <span class="label_hbk">����Ѻ</span>
                                            </div>
                                            <div style="width: 15%; float: left; text-align: right; padding: 2px 0px 3px 0px">
                                                <cc1:AwNumeric ID="txttotal_recv" runat="server" Width="120px" LeadZero="Show" Font-Bold="true"
                                                    DisplayMode="Control" Text="0.00" Enabled="false">
                                                </cc1:AwNumeric>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                             <div style="width: 50%; float: left;">
                                                &nbsp;
                                            </div>
                                            <div style="width: 35%; float: left; text-align: right; padding: 2px 0px 3px 0px">
                                                <span class="label_hbk">�������</span>
                                            </div>
                                            <div style="width: 15%; float: left; text-align: right; padding: 2px 0px 2px 0px">
                                                <cc1:AwNumeric ID="txttotal_pay" runat="server" Width="120px" LeadZero="Show" Font-Bold="true"
                                                    DisplayMode="Control" Text="0.00" Enabled="false">
                                                </cc1:AwNumeric>
                                            </div>
                                             <div style="clear: both;">
                                            </div>
                                             <div style="width: 50%; float: left;">
                                                &nbsp;
                                            </div>
                                            <div style="width: 35%; float: left; text-align: right; padding: 2px 0px 3px 0px">
                                                <span class="label_hbk">�������</span>
                                            </div>
                                            <div style="width: 15%; float: left; text-align: right; padding: 2px 0px 2px 0px">
                                                <cc1:AwNumeric ID="txttotal_all" runat="server" Width="120px" LeadZero="Show" Font-Bold="true"
                                                    DisplayMode="Control" Text="0.00" Enabled="false">
                                                </cc1:AwNumeric>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                </ajaxtoolkit:TabContainer>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; vertical-align: bottom;">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="75%" style="text-align: left">
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
