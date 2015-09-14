﻿<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="person_view.aspx.cs" Inherits="myWeb.App_Control.person.person_view" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" language="javascript">    
     function RunValidationsAndSetActiveTab() {
           if (typeof (Page_Validators) == "undefined") return;
           try {
               var noOfValidators = Page_Validators.length;
               for (var validatorIndex = 0; validatorIndex < noOfValidators; validatorIndex++) {
                   var validator = Page_Validators[validatorIndex];
                   ValidatorValidate(validator);
                   if (!validator.isvalid) {
                       var tabPanel = validator.parentElement.parentElement.parentElement.parentElement.parentElement.control ;
                        var tabContainer = tabPanel.get_owner();            
                       tabContainer.set_activeTabIndex(tabPanel.get_tabIndex());
                       break;
                   }
               }
           }
           catch (Error) {
               alert("Failed");
           }
       }
       
    function RetrieveMembertype(res)
   { 
        var retVal = res.value; 
        var cbomember_type = document.getElementById("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_cboMember_type");
        if( retVal != null && retVal.Rows.length > 0) 
        { 
             var Len=retVal.Rows.length; 
              // Reset 
              for(i=cbomember_type.options.length-1;i>=0;i--)
              {
                cbomember_type.remove(i);
              }
               // Add  Data
               var optn = document.createElement("OPTION");
               optn.text = "N";
               optn.value = '';
               cbomember_type.options.add(optn);
                for(i=0;i<Len;i++) 
                { 
                    var opt = document.createElement("OPTION");
                    opt.text=retVal.Rows[i].member_type_name; 
                    opt.value=retVal.Rows[i].member_type_code;
                    opt.setAttribute("wv",retVal.Rows[i].member_type_code); 
                    cbomember_type.add(opt); 
                } 
            } 
            else
          { 
              // Reset 
              for(i=cbomember_type.options.length-1;i>=0;i--)
              {
                cbomember_type.remove(i);
              }
               var optn = document.createElement("OPTION");
               optn.text = "N";
               optn.value = '';
               cbomember_type.options.add(optn);
           } 
    } 
    
    function changeMembertype(e,gbk,gsj){ 
          myWeb.App_Control.person.person_view.GetDataMemberType(e.options[e.selectedIndex].value,gbk,gsj,RetrieveMembertype); 
    } 
    </script>

    <table border="0" cellpadding="1" cellspacing="2" style="width: 100%">
        <tr align="center">
            <td>
                <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" Active  Height="365px"
                    BorderWidth="0px" Style="text-align: left">
                    <ajaxtoolkit:TabPanel runat="server" HeaderText="ข้อมูลประวัติบุคลากร" ID="TabPanel1">
                        <HeaderTemplate>
                            ประวัติบุคลากร
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                                <tr>
                                    <td align="left" nowrap style="text-align: right" valign="middle">
                                        &#160;&#160;
                                    </td>
                                    <td align="left" style="width: 0%">
                                        &#160;&#160;
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
                            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle" width="10%">
                                        <asp:Label ID="Label21" runat="server" CssClass="label_hbk">รหัสบุคลากร :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" width="40%">
                                        <asp:TextBox ID="txtperson_code" runat="server" CssClass="textboxdis"  
                                            Width="120px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td align="left" nowrap valign="middle" width="20%">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle">
                                        <asp:Label ID="Label16" runat="server" CssClass="label_hbk">คำนำหน้าชื่อ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:DropDownList ID="cboTitle" runat="server" CssClass="textboxdis"  
                                            Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" nowrap rowspan="9" style="text-align: center" valign="middle">
                                        <asp:Image ID="imgPerson" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="200px"
                                            ImageUrl="~/person_pic/image_n_a.jpg" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label14" runat="server" CssClass="label_hbk">ชื่อภาษาไทย :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_thai_name" runat="server" CssClass="textboxdis"  
                                            Width="400px" MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label15" runat="server" CssClass="label_hbk">นามสกุลภาษาไทย :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_thai_surname" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="400px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label17" runat="server" CssClass="label_hbk">ชื่อภาษาอังกฤษ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_eng_name" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="400px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label18" runat="server" CssClass="label_hbk">นามสกุลภาษาอังกฤษ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_eng_surname" runat="server" CssClass="textboxdis"  
                                            Width="400px" MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label20" runat="server" CssClass="label_hbk">เลขที่บัตรประชาชน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_id" runat="server" CssClass="textboxdis"  
                                            Width="200px" MaxLength="13" ReadOnly="True"></asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender
                                                ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtperson_id" FilterType="Numbers"
                                                Enabled="True" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label19" runat="server" CssClass="label_hbk">ชื่อเล่น :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_nickname" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="200px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label63" runat="server" CssClass="label_hbk">รูปบุคลากร :</asp:Label>
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="txtperson_pic" runat="server" CssClass="textboxdis"  
                                            Width="400px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &#160;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:Label ID="lblError" runat="server" CssClass="label_error"></asp:Label>
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &#160;&#160;
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 15px">
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 15px">
                                    </td>
                                    <td style="height: 15px">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" colspan="2" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" colspan="3">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ข้อมูลการทำงาน">
                        <HeaderTemplate>
                            การทำงาน
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%;">
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                    <td colspan="3">
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" style="text-align: right">
                                        <asp:Label ID="Label49" runat="server" CssClass="label_hbk">ตำแหน่งปัจจุบัน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="3">
                                        <asp:TextBox ID="txtposition_code" runat="server" CssClass="textboxdis"  
                                            Width="130px" MaxLength="5" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;<asp:TextBox
                                                ID="txtposition_name" runat="server" CssClass="textboxdis" MaxLength="100"  
                                                Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" align="right">
                                        <asp:Label ID="Label3" runat="server" CssClass="label_hbk">ระดับ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_level" runat="server" CssClass="textboxdis" MaxLength="5"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        <asp:Label ID="Label6" runat="server" CssClass="label_hbk">เลขที่ตำแหน่ง :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtperson_postionno" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" style="text-align: right">
                                        <asp:Label ID="Label8" runat="server" CssClass="label_hbk">สาขาธนาคาร :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="3" style="text-align: left">
                                        <asp:TextBox ID="txtbranch_code" runat="server" CssClass="textboxdis"  
                                            Width="130px" MaxLength="6" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;<asp:TextBox
                                                ID="txtbranch_name" runat="server" CssClass="textboxdis" MaxLength="100"  
                                                Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label22" runat="server" CssClass="label_hbk">ธนาคาร :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbank_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label38" runat="server" CssClass="label_hbk">เลขที่บัญชี :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbank_no" runat="server" CssClass="textboxdis" MaxLength="20"
                                              Width="130px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label41" runat="server" CssClass="label_hbk">เงินเดือนปัจจุบัน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="" valign="middle">
                                        <asp:TextBox ID="txtperson_salaly" runat="server" CssClass="numberdis" Width="130px"
                                              ReadOnly="True">0.00</asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender
                                                ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtperson_salaly"
                                                FilterType="Custom, Numbers" ValidChars="." Enabled="True" />
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label50" runat="server" CssClass="label_hbk">กลุ่มบุคลากร :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cboPerson_group" runat="server" CssClass="textboxdis"  
                                            Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label43" runat="server" CssClass="label_hbk">วันที่บรรจุ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_start" runat="server" CssClass="textboxdis" ReadOnly="True"
                                            Width="130px"></asp:TextBox><ajaxtoolkit:CalendarExtender ID="txtperson_start_CalendarExtender"
                                                runat="server" Enabled="True" PopupButtonID="imgperson_start" TargetControlID="txtperson_start">
                                            </ajaxtoolkit:CalendarExtender>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label44" runat="server" CssClass="label_hbk">วันที่เกษียณ :</asp:Label>
                                    </td>
                                    <td align="left" style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_end" runat="server" CssClass="textboxdis" Width="130px"
                                            ReadOnly="True"></asp:TextBox><ajaxtoolkit:CalendarExtender ID="txtperson_end_CalendarExtender"
                                                runat="server" Enabled="True" PopupButtonID="imgperson_end" TargetControlID="txtperson_end">
                                            </ajaxtoolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label45" runat="server" CssClass="label_hbk">การเป็นสมาชิก :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:DropDownList ID="cboMember_type" runat="server" CssClass="textboxdis" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label51" runat="server" CssClass="label_hbk">อัตราเพิ่ม :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtmember_type_add" runat="server" CssClass="numberdis"  
                                            Width="130px" ReadOnly="True">0.00</asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender
                                                ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtmember_type_add"
                                                FilterType="Custom, Numbers" ValidChars="." Enabled="True" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label46" runat="server" CssClass="label_hbk">ตำแหน่งบริหาร :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="3" style="text-align: left">
                                        <asp:TextBox ID="txtperson_manage_code" runat="server" CssClass="textboxdis" MaxLength="5"
                                              Width="130px" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;<asp:TextBox
                                                ID="txtperson_manage_name" runat="server" CssClass="textboxdis" MaxLength="100"
                                                  Width="300px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label52" runat="server" CssClass="label_hbk">ผังงบประมาณ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbudget_plan_code" runat="server" CssClass="textboxdis"  
                                            Width="130px" MaxLength="6" ReadOnly="True"></asp:TextBox>&#160;
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label54" runat="server" CssClass="label_hbk">แผนงาน :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbudget_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label55" runat="server" CssClass="label_hbk">ผลผลิต :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtproduce_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label53" runat="server" CssClass="label_hbk">กิจกรรม :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtactivity_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label56" runat="server" CssClass="label_hbk">ยุทธศาสตร์ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtplan_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label57" runat="server" CssClass="label_hbk">งาน/หลักสูตร :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtwork_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 22px">
                                        <asp:Label ID="Label58" runat="server" CssClass="label_hbk">กองทุน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 22px">
                                        <asp:TextBox ID="txtfund_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right; height: 22px;">
                                        <asp:Label ID="Label59" runat="server" CssClass="label_hbk">งบประมาณ :</asp:Label>
                                    </td>
                                    <td align="left" style="height: 22px">
                                   <%--     <asp:TextBox ID="txtlot_name" runat="server" CssClass="textboxdis"   Width="260px"
                                            ReadOnly="True"></asp:TextBox>--%>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label60" runat="server" CssClass="label_hbk">สังกัด :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtdirector_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label61" runat="server" CssClass="label_hbk">หน่วยงาน :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtunit_name" runat="server" CssClass="textboxdis"  
                                            Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label64" runat="server" CssClass="label_hbk">ปีงบประมาณ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbudget_plan_year" runat="server" CssClass="textboxdis"  
                                            Width="130px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label62" runat="server" CssClass="label_hbk">สถานะการทำงาน :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="cboPerson_work_status" runat="server" CssClass="textboxdis" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 17px">
                                        &#160;&#160;
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 17px">
                                        &#160;&#160;
                                    </td>
                                    <td nowrap style="text-align: right; height: 17px;">
                                        &#160;&#160;
                                    </td>
                                    <td align="left" style="height: 17px">
                                        &#160;&#160;
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
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="ข้อมูลประวัติสถานะภาพส่วนตัว ">
                        <HeaderTemplate>
                            สถานะภาพส่วนตัว
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle">
                                        &#160;&#160;
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%">
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="" width="8%">
                                        <asp:Label ID="Label4" runat="server" CssClass="label_hbk">เพศ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%">
                                        <asp:DropDownList ID="cboPerson_sex" runat="server" CssClass="textboxdis" Enabled="False">
                                            <asp:ListItem Selected="True">---- กรุณาเลือกข้อมูล ----</asp:ListItem>
                                            <asp:ListItem Value="M">ชาย</asp:ListItem>
                                            <asp:ListItem Value="F">หญิง</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label5" runat="server" CssClass="label_hbk">น้ำหนัก :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_width" runat="server" CssClass="textboxdis"  
                                            Width="120px" MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label7" runat="server" CssClass="label_hbk">ส่วนสูง :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_high" runat="server" CssClass="textboxdis"  
                                            Width="120px" MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label9" runat="server" CssClass="label_hbk">เชื้อชาติ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_origin" runat="server" CssClass="textboxdis"  
                                            Width="360px" MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label23" runat="server" CssClass="label_hbk">สัญชาติ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_nation" runat="server" CssClass="textboxdis"  
                                            Width="360px" MaxLength="50" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label24" runat="server" CssClass="label_hbk">ศาสนา :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_religion" runat="server" CssClass="textboxdis" Width="360px"
                                            MaxLength="50"   ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label25" runat="server" CssClass="label_hbk">วันเกิด :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_birth" runat="server" CssClass="textboxdis" Width="120px"
                                            ReadOnly="True"></asp:TextBox><ajaxtoolkit:CalendarExtender ID="calendarButtonExtender"
                                                runat="server" BehaviorID="txtperson_birth_CalendarExtender" Enabled="True" PopupButtonID="imgperson_birth"
                                                TargetControlID="txtperson_birth">
                                            </ajaxtoolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label26" runat="server" CssClass="label_hbk">สถานะสมรส :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:DropDownList ID="cboPerson_marry" runat="server" CssClass="textboxdis" Enabled="False">
                                            <asp:ListItem Selected="True">---- กรุณาเลือกข้อมูล ----</asp:ListItem>
                                            <asp:ListItem Value="1">โสด</asp:ListItem>
                                            <asp:ListItem Value="2">สมรส</asp:ListItem>
                                            <asp:ListItem Value="3">หย่า</asp:ListItem>
                                            <asp:ListItem Value="4">หม้าย</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &#160;&#160;
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="2" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="ข้อมูลประวัติที่อยู่อาศัย ">
                        <HeaderTemplate>
                            ที่อยู่อาศัย
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%;">
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
                                        &#160;&#160;
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" width="35%">
                                        &#160;&#160;
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        &#160;&#160;
                                    </td>
                                    <td style="text-align: left" width="35%">
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label10" runat="server" CssClass="label_hbk">ห้องเลขที่ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" width="35%">
                                        <asp:TextBox ID="txtperson_room" runat="server" CssClass="textboxdis"  
                                            Width="260px" MaxLength="10" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        <asp:Label ID="Label27" runat="server" CssClass="label_hbk">ชั้นที่ :</asp:Label>
                                    </td>
                                    <td style="text-align: left" width="35%">
                                        <asp:TextBox ID="txtperson_floor" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label11" runat="server" CssClass="label_hbk">หมู่บ้าน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_village" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label28" runat="server" CssClass="label_hbk">เลขที่ :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtperson_homeno" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label12" runat="server" CssClass="label_hbk">ตรอก/ซอย :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_soi" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label34" runat="server" CssClass="label_hbk">หมู่ที่ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_moo" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label30" runat="server" CssClass="label_hbk">ถนน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_road" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label35" runat="server" CssClass="label_hbk">ตำบล :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_tambol" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label31" runat="server" CssClass="label_hbk">อำเภอ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_aumphur" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label36" runat="server" CssClass="label_hbk">จังหวัด :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtperson_province" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label32" runat="server" CssClass="label_hbk">รหัสไปรษณีย์ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_postno" runat="server" CssClass="textboxdis" MaxLength="10"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label37" runat="server" CssClass="label_hbk">โทรศัพท์ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_tel" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label40" runat="server" CssClass="label_hbk">ผู้ติดต่อกรณีฉุกเฉิน :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_contact" runat="server" CssClass="textboxdis" MaxLength="100"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label33" runat="server" CssClass="label_hbk">ความสัมพันธ์ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_ralation" runat="server" CssClass="textboxdis" MaxLength="50"
                                              Width="260px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label39" runat="server" CssClass="label_hbk">โทรศัพท์ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_contact_tel" runat="server" CssClass="textboxdis" MaxLength="50"
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
                    <ajaxtoolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="ข้อมูลรายรับ/จ่าย">
                        <HeaderTemplate>
                            ข้อมูลรายรับ/จ่าย
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
                                                OnSorting="GridView1_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo" runat="server" CssClass="label_hbk"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ประเภทรายการ" SortExpression="item_type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_type" runat="server" CssClass="label_hbk" Text='<%# getItemtype(DataBinder.Eval(Container, "DataItem.item_type")) %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="13%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="รหัสรายได้/จ่าย" SortExpression="item_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_code" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="รายได้/ค่าใช้จ่าย" SortExpression="item_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_name" runat="server" CssClass="label_hbk" Text='<% # DataBinder.Eval(Container, "DataItem.item_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="30%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit" SortExpression="item_debit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_debit" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_debit") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" SortExpression="item_credit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_credit" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_credit") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="สถานะ" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="สถานะ" SortExpression="c_active">
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
                    <ajaxtoolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="การเป็นสมาชิก"
                        ScrollBars="Vertical">
                        <HeaderTemplate>
                            การเป็นสมาชิก
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
                                                OnSorting="GridView2_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo1" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="รหัสการเป็นสมาชิก" SortExpression="member_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.member_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ชื่อการเป็นสมาชิก" SortExpression="member_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_name" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.member_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="45%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="จำนวนเป็นสมาชิก" SortExpression="member_quan">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_quan" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.member_quan") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="สถานะ" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="สถานะ" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus1" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                </Columns>
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
                    <ajaxtoolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="ประวัติตำแหน่ง" ScrollBars="Vertical">
                        <HeaderTemplate>
                            ประวัติตำแหน่ง
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="left">
                                    <td align="left" nowrap style="width: 42%" valign="top" width="30%">
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td align="center" nowrap style="width: 42%" valign="top" width="30%">
                                        <div id="div-gridfix3">
                                            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="GridView3_RowCreated" OnRowDataBound="GridView3_RowDataBound"
                                                OnSorting="GridView3_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo2" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="วันที่ปรับ" SortExpression="change_date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblchange_date" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.change_date") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="เงินเดือนอัตราเดิม" SortExpression="salary_old">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsalary_old" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.salary_old") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="เงินเดือนอัตราใหม่" SortExpression="salary_new">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsalary_new" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.salary_new") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ตำแหน่งเดิม" SortExpression="position_old_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblposition_old" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.position_old") %>'
                                                                Visible="false"> </asp:Label><asp:Label ID="lblposition_name_old" runat="server"
                                                                    Text='<% # DataBinder.Eval(Container, "DataItem.position_old_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="25%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ตำแหน่งใหม่" SortExpression="position_new_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblposition_new" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.position_new") %>'
                                                                Visible="false"> </asp:Label><asp:Label ID="lblposition_new_name" runat="server"
                                                                    Text='<% # DataBinder.Eval(Container, "DataItem.position_new_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="25%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="สถานะ" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="สถานะ" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus2" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                </Columns>
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
                </ajaxtoolkit:TabContainer>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; vertical-align: bottom;">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="75%">
                &nbsp;
            </td>
            <td nowrap style="text-align: center; vertical-align: bottom; width: 10%;">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
