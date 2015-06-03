using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using myDLL;

namespace myWeb.App_Control.bank
{
    public partial class bank_control : PageBase
    {
        private string strPrefixCtr_main = "ctl00$ContentPlaceHolder1$";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    string strScript = "<script language=\"javascript\">\n self.opener.document.location.href=\"../../index.aspx\";\n self.close();\n</script>\n";
            //    this.RegisterStartupScript("close", strScript);
            //    return;
            //}
            lblError.Text = "";
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/save2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/save.jpg'");

                #region set QueryString
                if (Request.QueryString["bank_code"] != null)
                {
                    ViewState["bank_code"] = Request.QueryString["bank_code"].ToString();
                }
                if (Request.QueryString["page"] != null)
                {
                    ViewState["page"] = Request.QueryString["page"].ToString();
                }
                if (Request.QueryString["mode"] != null)
                {
                    ViewState["mode"] = Request.QueryString["mode"].ToString();
                }
                if (Request.QueryString["PageStatus"] != null)
                {
                    ViewState["PageStatus"] = Request.QueryString["PageStatus"].ToString();
                }

                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    Session["menupopup_name"] = "เพิ่มข้อมูลธนาคาร";
                    ViewState["page"] = Request.QueryString["page"];
                    txtbank_code.ReadOnly = false;
                    txtbank_code.CssClass = "textbox";
                    chkStatus.Checked = true;
                }

                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    Session["menupopup_name"] = "แก้ไขข้อมูลธนาคาร";
                    setData();
                    txtbank_code.ReadOnly = true;
                    txtbank_code.CssClass = "textboxdis";
                    //if (ViewState["PageStatus"] != null)
                    //{
                    //    if (ViewState["PageStatus"].ToString().ToLower().Equals("save"))
                    //    {
                    //        string strScript1 =
                    //            "self.opener.document.forms[0].ctl00$ASPxRoundPanel1$ContentPlaceHolder2$txthpage.value=" + ViewState["page"].ToString() + ";\n" +
                    //            "self.opener.document.forms[0].submit();\n" +
                    //            "self.focus();\n";
                    //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "frMainPage", strScript1, true);
                    //    }
                    //}
                }

                #endregion

                imgList_item.Attributes.Add("onclick", "OpenPopUp('750px','400px','93%','ค้นหาข้อมูลเช็ค' ,'../lov/cheque_lov.aspx?cheque_code='+document.forms[0]." + strPrefixCtr_main + "txtcheque_code.value+'" +
                        "&cheque_name='+document.forms[0]." + strPrefixCtr_main + "txtcheque_name.value+'" +
                        "&ctrl1=" + txtcheque_code.ClientID + "&ctrl2=" + txtcheque_name.ClientID + "&show=2', '2');return false;");

                imgClear_item.Attributes.Add("onclick", "document.forms[0]." + strPrefixCtr_main + "txtcheque_code.value='';" +
                                        "document.forms[0]." + strPrefixCtr_main + "txtcheque_name.value=''; return false;");


                imgList_item2.Attributes.Add("onclick", "OpenPopUp('800px','400px','93%','ค้นหาข้อมูลค่าธรรมเนียม' ,'../lov/item_lov.aspx?" +
                                "item_code='+ $('#" + txtitem_code.ClientID + "').val()+" +
                                "'&item_name='+ $('#" + txtitem_name.ClientID + "').val()+" +
                                "'&item_type=C" +
                                "&ctrl1=" + txtitem_code.ClientID + "&ctrl2=" + txtitem_name.ClientID + "&show=2&from=bank', '2');return false;");

                imgClear_item2.Attributes.Add("onclick", "$('#" + txtitem_code.ClientID + "').val('')+" +
                                        "$('#" + txtitem_name.ClientID + "').val('');return false;");


                //imgClose.Attributes.Add("onclick", "ClosePopUp('1');return false;");
            }
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.imgSaveOnly.Click += new System.Web.UI.ImageClickEventHandler(this.imgSaveOnly_Click);
            //this.imgSave.Click += new System.Web.UI.ImageClickEventHandler(this.imgSave_Click);

        }
        #endregion

        private bool saveData()
        {
            bool blnResult = false;
            bool blnDup = false;
            string strMessage = string.Empty;
            string strbank_code = string.Empty,
                strbank_name = string.Empty,
                strbank_fee_rate = string.Empty,
                strfee_charge_normal = string.Empty,
                strfee_charge_special = string.Empty,
                strfee_charge_medical = string.Empty,
                strfee_charge_bonus = string.Empty,
                strcheque_code = string.Empty,
                stritem_code = string.Empty,
                strActive = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty;
            string strScript = string.Empty;
            var oBank = new cBank();
            var ds = new DataSet();
            try
            {
                #region set Data
                strbank_code = txtbank_code.Text.Trim();
                strbank_name = txtbank_name.Text;
                strbank_fee_rate = txtbank_fee_rate.Value.ToString();
                strfee_charge_normal = chkfee_charge_normal.Checked ? "1" : "0";
                strfee_charge_special = chkfee_charge_special.Checked ? "1" : "0";
                strfee_charge_medical = chkfee_charge_medical.Checked ? "1" : "0";
                strfee_charge_bonus = chkfee_charge_bonus.Checked ? "1" : "0";
                strcheque_code = txtcheque_code.Text;
                stritem_code = txtitem_code.Text;
                strActive = chkStatus.Checked ? "Y" : "N";

                strCreatedBy = Session["username"].ToString();
                strUpdatedBy = Session["username"].ToString();
                #endregion
                if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    #region check dup
                    string strCheckDup = string.Empty;
                    strCheckDup = " and bank_name = '" + strbank_name.Trim() + "' " +
                                                  " and bank_code <> '" + strbank_code.Trim() + "' ";
                    if (!oBank.SP_SEL_BANK(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript =
                                "alert(\"ไม่สามารถแก้ไขข้อมูล เนื่องจากข้อมูล " + strbank_code.Trim() + " : " + strbank_name.Trim() + "  ซ้ำ\");\n";
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region edit
                    if (!blnDup)
                    {
                        if (oBank.SP_UPD_BANK(strbank_code, strbank_name, strbank_fee_rate, strfee_charge_normal,
                            strfee_charge_special, strfee_charge_medical, strfee_charge_bonus, strcheque_code,stritem_code, strActive, strUpdatedBy, ref strMessage))
                        {
                            blnResult = true;
                        }
                        else
                        {
                            lblError.Text = strMessage.ToString();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "frMainPage", strScript, true);
                    }
                    #endregion
                }
                else
                {
                    #region check dup
                    string strCheckDup = string.Empty;
                    strCheckDup = " and bank_code = '" + strbank_code.Trim() + "' ";
                    if (!oBank.SP_SEL_BANK(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript =
                                "alert(\"ไม่สามารถเพิ่มข้อมูล เนื่องจากข้อมูล " + strbank_code.Trim() + " : " + strbank_name.Trim() + "  ซ้ำ\");\n";
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region insert
                    if (!blnDup)
                    {
                        if (oBank.SP_INS_BANK(strbank_code, strbank_name, strbank_fee_rate, strfee_charge_normal,
                            strfee_charge_special, strfee_charge_medical, strfee_charge_bonus, strcheque_code, stritem_code, strActive, strCreatedBy, ref strMessage))
                        {
                            ViewState["bank_code"] = strbank_code;
                            blnResult = true;
                        }
                        else
                        {
                            lblError.Text = strMessage.ToString();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "frMainPage", strScript, true);
                    }
                    #endregion
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                oBank.Dispose();
            }
            return blnResult;
        }

        private void imgSaveOnly_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (saveData())
            {
                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    txtbank_code.Text = string.Empty;
                    txtbank_name.Text = string.Empty;
                    txtbank_code.Focus();
                    string strScript1 = "RefreshMain('" + ViewState["page"].ToString() + "');";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    string strScript1 = "ClosePopUpListPost('" + ViewState["page"].ToString() + "','1');";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
                }
                MsgBox("บันทึกข้อมูลสมบูรณ์");
            }
        }

        private void setData()
        {
            cBank oBank = new cBank();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strbank_code = string.Empty,
                strbank_name = string.Empty,
                strbank_fee_rate = string.Empty,
                strfee_charge_normal = string.Empty,
                strfee_charge_special = string.Empty,
                strfee_charge_medical = string.Empty,
                strfee_charge_bonus = string.Empty,
                strcheque_code = string.Empty,
                strcheque_name = string.Empty,
                stritem_code = string.Empty,
                stritem_name = string.Empty,
                strC_active = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty;

            try
            {
                strCriteria = " and bank_code = '" + ViewState["bank_code"].ToString() + "' ";
                if (!oBank.SP_SEL_BANK(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strbank_code = ds.Tables[0].Rows[0]["bank_code"].ToString();
                        strbank_name = ds.Tables[0].Rows[0]["bank_name"].ToString();
                        strC_active = ds.Tables[0].Rows[0]["c_active"].ToString();
                        strCreatedBy = ds.Tables[0].Rows[0]["c_created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["d_created_date"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();

                        strbank_fee_rate = ds.Tables[0].Rows[0]["bank_fee_rate"].ToString();
                        strfee_charge_normal = ds.Tables[0].Rows[0]["fee_charge_normal"].ToString();
                        strfee_charge_special = ds.Tables[0].Rows[0]["fee_charge_special"].ToString();
                        strfee_charge_medical = ds.Tables[0].Rows[0]["fee_charge_medical"].ToString();
                        strfee_charge_bonus = ds.Tables[0].Rows[0]["fee_charge_bonus"].ToString();
                        strcheque_code = ds.Tables[0].Rows[0]["cheque_code"].ToString();
                        strcheque_name = ds.Tables[0].Rows[0]["cheque_name"].ToString();
                        stritem_code = ds.Tables[0].Rows[0]["item_code"].ToString();
                        stritem_name = ds.Tables[0].Rows[0]["item_name"].ToString();


                        #endregion

                        #region set Control
                        txtbank_code.Text = strbank_code;
                        txtbank_name.Text = strbank_name;
                        txtbank_fee_rate.Value = strbank_fee_rate;
                        chkfee_charge_normal.Checked = strfee_charge_normal == "True";
                        chkfee_charge_special.Checked = strfee_charge_special == "True";
                        chkfee_charge_medical.Checked = strfee_charge_medical == "True";
                        chkfee_charge_bonus.Checked = strfee_charge_bonus == "True";
                        txtcheque_code.Text = strcheque_code;
                        txtcheque_name.Text = strcheque_name;
                        txtitem_code.Text = stritem_code;
                        txtitem_name.Text = stritem_name;

                        if (strC_active.Equals("Y"))
                        {
                            txtbank_name.ReadOnly = false;
                            txtbank_name.CssClass = "textbox";
                            chkStatus.Checked = true;
                        }
                        else
                        {
                            txtbank_name.ReadOnly = true;
                            txtbank_name.CssClass = "textboxdis";
                            chkStatus.Checked = false;
                        }
                        txtUpdatedBy.Text = strUpdatedBy;
                        txtUpdatedDate.Text = strUpdatedDate;
                        #endregion
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }

       
    }
}