using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using myDLL;

namespace myWeb.App_Control.payment_bonus
{
    public partial class payment_bonus_item_control : PageBase
    {
        #region private data
        private bool[] blnAccessRight = new bool[5] { false, false, false, false, false };
        private string strPrefixCtr = "ctl00$ContentPlaceHolder1$";
        private string strPrefixCtr_main = "ctl00$ContentPlaceHolder1$TabContainer1$";
        #endregion
        protected void Page_Load(object sender, System.EventArgs e)
        {
            lblError.Text = "";
            if (!IsPostBack)
            {
                #region set QueryString
                if (Request.QueryString["payment_doc"] != null)
                {
                    ViewState["payment_doc"] = Request.QueryString["payment_doc"].ToString();
                    lblpayment_doc.Text = ViewState["payment_doc"].ToString();
                }
                if (Request.QueryString["person_code"] != null)
                {
                    ViewState["person_code"] = Request.QueryString["person_code"].ToString();
                    lblperson_code.Text = ViewState["person_code"].ToString();
                }
                if (Request.QueryString["person_name"] != null)
                {
                    ViewState["person_name"] = Request.QueryString["person_name"].ToString();
                    lblperson_name.Text = ViewState["person_name"].ToString();
                }
                if (Request.QueryString["item_code"] != null)
                {
                    ViewState["item_code"] = Request.QueryString["item_code"].ToString();
                    txtitem_code.Text = ViewState["item_code"].ToString();
                }

                if (Request.QueryString["year"] != null)
                {
                    ViewState["year"] = Request.QueryString["year"].ToString();
                    txtyear.Text = ViewState["year"].ToString();
                }
                if (Request.QueryString["mode"] != null)
                {
                    ViewState["mode"] = Request.QueryString["mode"].ToString();
                }
                if (Request.QueryString["page"] != null)
                {
                    ViewState["page"] = Request.QueryString["page"].ToString();
                }
                if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    setData();
                }
                else
                {
                    //TabContainer1.Tabs[1].Visible = false;
                    chkStatus.Checked = true;
                    txtitem_code.Focus();
                }


                #endregion
                #region Set Image

                imgList_item.Attributes.Add("onclick", "OpenPopUp('800px','400px','93%','ค้นหาข้อมูลเงินรางวัล' ,'../lov/item_lov.aspx?" +
                                                "item_code='+ $('#" + txtitem_code.ClientID + "').val()+" +
                                                "'&item_name='+ $('#" + txtitem_name.ClientID + "').val()+" +
                                                "'&ctrl1=" + txtitem_code.ClientID + "&ctrl2=" + txtitem_name.ClientID +
                                                "&show=3&from=payment_bonus&is_bonus=1', '3');return false;");

                imgClear_item.Attributes.Add("onclick", "$('#" + txtitem_code.ClientID + "').val('')+" +
                                        "$('#" + txtitem_name.ClientID + "').val('');" +
                                        "return false;");

                #region Set Image

                #endregion


                #endregion
                imgSaveOnly.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgSaveOnly"].Rows[0]["title"].ToString());
                txtitem_code.Focus();
                valValidationSummary.ShowMessageBox = true;
                valValidationSummary.ShowSummary = false;
                valValidationSummary.ValidationGroup = "A";
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
        }
        #endregion

        private bool saveData()
        {
            bool blnResult = false;
            bool blnDup = false;
            string strMessage = string.Empty;
            string strpayment_doc = string.Empty,
                stritem_code = string.Empty,
                stritem_name = string.Empty,
                strsp_payment_item_money = string.Empty,
                stritem_qty = string.Empty,
                strcomments_sub = string.Empty,
                strActive = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty;
            string strScript = string.Empty;
            string strpayment_detail_id = "0";
            var oPayment_bonus = new cPayment_bonus();
            var ds = new DataSet();
            try
            {
                #region set Data
                strpayment_doc = lblpayment_doc.Text.Trim();
                stritem_code = txtitem_code.Text.Trim();
                stritem_name = txtitem_name.Text.Trim();
                strsp_payment_item_money = txtsp_payment_item_money.Value.ToString();
                stritem_qty = txtitem_qty.Value.ToString();
                if (chkStatus.Checked == true)
                {
                    strActive = "Y";
                }
                else
                {
                    strActive = "N";
                }
                strcomments_sub = txtcomments_sub.Text.Trim();
                strCreatedBy = Session["username"].ToString();
                strUpdatedBy = Session["username"].ToString();
                strpayment_detail_id = hddpayment_detail_id.Value;
                #endregion
                if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    #region edit
                    if (oPayment_bonus.SP_PAYMENT_BONUS_DETAIL_UPD(strpayment_detail_id, strpayment_doc, stritem_code, stritem_qty, strsp_payment_item_money,
                                                        strcomments_sub, strActive, strUpdatedBy, ref strMessage))
                    {
                        blnResult = true;
                    }
                    else
                    {
                        lblError.Text = strMessage.ToString();
                    }
                    #endregion
                }
                else
                {
                    #region check dup
                    string strCheckDup = string.Empty;
                    strCheckDup = " and bn_payment_doc = '" + strpayment_doc + "' " +
                        " and item_code = '" + stritem_code + "' ";
                    if (!oPayment_bonus.SP_PAYMENT_BONUS_DETAIL_SEL(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript =
                                "alert(\"ไม่สามารถเพิ่มข้อมูล เนื่องจากข้อมูล " + stritem_code.Trim() + " : " + stritem_name.Trim() + "  ซ้ำ\");\n";
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region insert
                    if (!blnDup)
                    {
                        if (oPayment_bonus.SP_PAYMENT_BONUS_DETAIL_INS(strpayment_doc, stritem_code, stritem_qty, strsp_payment_item_money, strcomments_sub, strActive, strCreatedBy, ref strMessage))
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
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                oPayment_bonus.Dispose();
            }
            return blnResult;
        }

        private void imgSaveOnly_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (saveData())
            {
                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    txtitem_code.Text = string.Empty;
                    txtitem_name.Text = string.Empty;
                    txtitem_qty.Value = 0;
                    txtsp_payment_item_money.Value = 0;
                    txtitem_code.Focus();
                    string strScript1 = "window.parent.frames['iframeShow1'].__doPostBack('ctl00$ContentPlaceHolder1$BtnR1','')";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    string strScript1 = "window.parent.frames['iframeShow1'].__doPostBack('ctl00$ContentPlaceHolder1$BtnR1','');ClosePopUp('2');";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
                }
                MsgBox("บันทึกข้อมูลสมบูรณ์");
            }
        }

        private void setData()
        {
            cPayment_bonus oPayment_bonus = new cPayment_bonus();
            DataSet ds = new DataSet();
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            string strpayment_doc = string.Empty;
            string strperson_code = string.Empty;
            string strperson_name = string.Empty;
            string stritem_code = string.Empty,
                stritem_name = string.Empty,
                strsp_payment_item_money = string.Empty,
                stritem_qty = string.Empty,
                strYear = string.Empty,
                strcommentsub = string.Empty,
                strC_active = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty;
            string strpayment_detail_id = "0";

            try
            {
                strCriteria = " and bn_payment_doc = '" + ViewState["payment_doc"].ToString() + "' "
                              + " and item_code = '" + ViewState["item_code"].ToString() + "' ";
                if (!oPayment_bonus.SP_PAYMENT_BONUS_DETAIL_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strpayment_doc = ds.Tables[0].Rows[0]["bn_payment_doc"].ToString();
                        strperson_code = ds.Tables[0].Rows[0]["bn_person_code"].ToString();
                        strperson_name = ds.Tables[0].Rows[0]["person_thai_name"].ToString() + "  " + ds.Tables[0].Rows[0]["person_thai_surname"].ToString();
                        strYear = ds.Tables[0].Rows[0]["payment_year"].ToString();
                        stritem_code = ds.Tables[0].Rows[0]["item_code"].ToString();
                        stritem_name = ds.Tables[0].Rows[0]["item_name"].ToString();
                        strsp_payment_item_money = ds.Tables[0].Rows[0]["bn_payment_item_money"].ToString();
                        stritem_qty = ds.Tables[0].Rows[0]["item_qty"].ToString();
                        strcommentsub = ds.Tables[0].Rows[0]["bn_comments_sub"].ToString();
                        strC_active = ds.Tables[0].Rows[0]["c_active_detail"].ToString();
                        strCreatedBy = ds.Tables[0].Rows[0]["c_created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["d_created_date"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();
                        strpayment_detail_id = ds.Tables[0].Rows[0]["bn_payment_detail_id"].ToString();
                        #endregion

                        #region set Control

                        imgList_item.Enabled = false;
                        imgClear_item.Enabled = false;
                        lblpayment_doc.Text = strpayment_doc;
                        lblperson_code.Text = strperson_code;
                        lblperson_name.Text = strperson_name;

                        txtyear.Text = strYear;
                        txtitem_code.Text = stritem_code;
                        txtitem_name.Text = stritem_name;
                        txtitem_qty.Value = stritem_qty;
                        txtsp_payment_item_money.Value = strsp_payment_item_money;

                        txtitem_code.ReadOnly = true;
                        txtitem_code.CssClass = "textboxdis";
                        txtitem_name.ReadOnly = true;
                        txtitem_name.CssClass = "textboxdis";
                        if (strC_active.Equals("Y"))
                        {
                            chkStatus.Checked = true;
                        }
                        else
                        {
                            chkStatus.Checked = false;
                        }
                        hddpayment_detail_id.Value = strpayment_detail_id;
                        txtcomments_sub.Text = strcommentsub;
                        txtUpdatedBy.Text = strUpdatedBy;
                        txtUpdatedDate.Text = strUpdatedDate;
                        txtitem_code.Focus();
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