<%@ Page Language="C#" MasterPageFile="~/Site_list.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="payment_slip.aspx.cs" Inherits="myWeb.App_Control.payment.payment_slip"
    Title="��§ҹ��Ի�Թ��͹" %>

<%@ Register Assembly="Aware.WebControls" Namespace="Aware.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="1" cellspacing="1" style="width: 100%" border="0">
        <tr>
            <td style="text-align: right;" width="15%">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage4">�է�����ҳ :</asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboYear" AutoPostBack="True"
                    OnSelectedIndexChanged="cboYear_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="text-align: right" width="15%" colspan="2">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage7">������ؤ��ҡ� :
                </asp:Label>
            </td>
            <td style="text-align: left" colspan="2">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPerson_group">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage8">�ͺ�շ����� :</asp:Label>
            </td>
            <td width="5%">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Year">
                </asp:DropDownList>
            </td>
            <td style="text-align: right" width="15%" colspan="2">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage1">�ͺ��͹������ :</asp:Label>
            </td>
            <td style="text-align: left">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPay_Month">
                </asp:DropDownList>
            </td>
            <td rowspan="6" style="text-align: right; vertical-align: bottom; width: 30%;">
                <asp:ImageButton runat="server" AlternateText="����������" ImageUrl="~/images/button/print.png"
                    ID="imgPrint" OnClick="imgPrint_Click"></asp:ImageButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage12">�ѧ�Ѵ :
                </asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboDirector" AutoPostBack="True"
                    OnSelectedIndexChanged="cboDirector_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="text-align: right">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage13">˹��§ҹ :
                </asp:Label>
            </td>
            <td colspan="2">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboUnit" 
                    AutoPostBack="True" onselectedindexchanged="cboUnit_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage9">���ʺؤ��ҡ� :</asp:Label>
            </td>
            <td colspan="4">
                <asp:TextBox runat="server" CssClass="textbox" Width="100px" ID="txtperson_code"></asp:TextBox>
                &nbsp;<asp:ImageButton runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif"
                    ID="imgList_person"></asp:ImageButton>
                <asp:ImageButton runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif"
                    ID="imgClear_person"></asp:ImageButton>
                &nbsp;<asp:TextBox runat="server" CssClass="textbox" Width="300px" ID="txtperson_name"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage3">�Ţ����͡��� : </asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="textbox" Width="100px" ID="txtpayment_doc"></asp:TextBox>
            </td>
            <td style="text-align: right" colspan="2">
                &nbsp;
            </td>
            <td>
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage14">�ӹǹ����� : </asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboPrintType" AutoPostBack="True"
                    OnSelectedIndexChanged="cboDirector_SelectedIndexChanged" Width="100px">
                    <asp:ListItem Selected="True" Value="0">������</asp:ListItem>
                    <asp:ListItem Value="1">�кبӹǹ</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="text-align: right" colspan="2">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage15">�ӹǹ������ : </asp:Label>
            </td>
            <td>
                <cc1:AwNumeric ID="txtRowCount" runat="server" Width="100px" LeadZero="Hide" 
                    DecimalPlaces="0" ReadOnly="True"></cc1:AwNumeric>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage16">������ӴѺ��� : </asp:Label>
            </td>
            <td>
                <cc1:AwNumeric ID="txtbegin_page" runat="server" Width="100px" LeadZero="Hide" 
                    DecimalPlaces="0"></cc1:AwNumeric>
            </td>
            <td style="text-align: right" colspan="2">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage17">�֧�ӴѺ��� : </asp:Label>
            </td>
            <td>
                <cc1:AwNumeric ID="txtend_page" runat="server" Width="100px" LeadZero="Hide" 
                    DecimalPlaces="0"></cc1:AwNumeric>
            </td>
        </tr>
    </table>
</asp:Content>
