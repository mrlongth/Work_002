﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="excel_upload_item_person_group_item_person_group.aspx.cs"
    Inherits="myWeb.App_Control.payment_adj.excel_upload_item_person_group" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../scripts/form.js" type="text/javascript"></script>
    <link href="StyleSheet_popup.css" rel="stylesheet" type="text/css" />
    <title>Upload Excel ค่าใช้จ่าย</title>
    <style type="text/css">

.label_error {
	font-size:9pt;
	color:Red ;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" runat="server">
    </asp:ScriptManager>
        <table style="width: 100%">
            <tr>
                <td colspan="2" >
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                                        <asp:Label runat="server" CssClass="label_hbk" ID="Label63">ไฟล์ Excel :</asp:Label>

                </td>
                <td style="text-align: left">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="300px"  />
                </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1"
                    Display="None" ErrorMessage="กรุณาเลือกรูป" 
                    ValidationGroup="A" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="A" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    <asp:ImageButton runat="server" ValidationGroup="A" AlternateText="Upload" ImageUrl="~/images/controls/Upload.jpg"
                        ID="imgSaveOnly" OnClick="imgSaveOnly_Click"></asp:ImageButton>
                </td>
            </tr>
        </table>
        <br />
    </div>
    </form>
</body>
</html>
