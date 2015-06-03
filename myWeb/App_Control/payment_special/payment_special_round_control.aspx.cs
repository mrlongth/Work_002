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

namespace myWeb.App_Control.payment_round
{
    public partial class payment_special_round_control : PageBase
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {
            lblError.Text = "";
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/save2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/save.jpg'");

                txtpay_begin_date.Text = cCommon.CheckDate(DateTime.Now.Date.ToString("dd/MM/yyyy"));
                txtpay_end_date.Text = cCommon.CheckDate(DateTime.Now.Date.ToString("dd/MM/yyyy"));

                #region set QueryString
                if (Request.QueryString["round_id"] != null)
                {
                    ViewState["round_id"] = Request.QueryString["round_id"].ToString();
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
                    InitcboYear();
                    InitcboPay_Year();
                    InitcboPayItem();
                    InitcboPaySemeter();
                    ViewState["page"] = Request.QueryString["page"];
                    chkStatus.Checked = true;
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("view"))
                {
                    setData();
                    SetControlView(this);
                    imgSaveOnly.Visible = false;
                }


                txtpay_begin_date.Attributes.Add("onchange",
                    "document.getElementById('" + txtpay_day.ClientID + "').value=show_special_diff_day(document.getElementById('" + txtpay_begin_date.ClientID + "').value,document.getElementById('" + txtpay_end_date.ClientID + "').value);return false;");
                txtpay_end_date.Attributes.Add("onchange",
                    "document.getElementById('" + txtpay_day.ClientID + "').value=show_special_diff_day(document.getElementById('" + txtpay_begin_date.ClientID + "').value,document.getElementById('" + txtpay_end_date.ClientID + "').value);return false;");

                #endregion
            }
        }

        #region private function

        private void InitcboYear()
        {
            string strYear = string.Empty;
            strYear = cboYear.SelectedValue;
            if (strYear.Equals(""))
            {
                strYear = ((DataSet)Application["xmlconfig"]).Tables["default"].Rows[0]["yearnow"].ToString();
            }
            DataTable odt;
            int i;
            cboYear.Items.Clear();
            odt = ((DataSet)Application["xmlconfig"]).Tables["cboYear"];
            for (i = 0; i <= odt.Rows.Count - 1; i++)
            {
                cboYear.Items.Add(new ListItem(odt.Rows[i]["Text"].ToString(), odt.Rows[i]["Value"].ToString()));
            }
            if (cboYear.Items.FindByValue(strYear) != null)
            {
                cboYear.SelectedIndex = -1;
                cboYear.Items.FindByValue(strYear).Selected = true;
            }
        }

        private void InitcboPayItem()
        {
            var oCommon = new cCommon();
            string strMessage = string.Empty,
                   strCriteria = string.Empty,
                   strPay_item = string.Empty;

            int i;
            var ds = new DataSet();
            var dt = new DataTable();
            strPay_item = cboPay_Item.SelectedValue;
            strCriteria = " and g_type='special_item' ";
            if (oCommon.SP_SEL_OBJECT("sp_GENERAL_SEL", strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboPay_Item.Items.Clear();
                cboPay_Item.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboPay_Item.Items.Add(new ListItem(dt.Rows[i]["g_name"].ToString(), dt.Rows[i]["g_code"].ToString()));
                }
                if (cboPay_Item.Items.FindByValue(strPay_item) != null)
                {
                    cboPay_Item.SelectedIndex = -1;
                    cboPay_Item.Items.FindByValue(strPay_item).Selected = true;
                }
            }
        }

        private void InitcboPaySemeter()
        {
            var oCommon = new cCommon();
            string strMessage = string.Empty,
                   strCriteria = string.Empty,
                   strPay_semeter = string.Empty;

            int i;
            var ds = new DataSet();
            var dt = new DataTable();
            strPay_semeter = cboPay_Semeter.SelectedValue;
            strCriteria = " and g_type='semeter' ";
            if (oCommon.SP_SEL_OBJECT("sp_GENERAL_SEL", strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboPay_Semeter.Items.Clear();
                cboPay_Semeter.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboPay_Semeter.Items.Add(new ListItem(dt.Rows[i]["g_name"].ToString(), dt.Rows[i]["g_code"].ToString()));
                }
                if (cboPay_Semeter.Items.FindByValue(strPay_semeter) != null)
                {
                    cboPay_Semeter.SelectedIndex = -1;
                    cboPay_Semeter.Items.FindByValue(strPay_semeter).Selected = true;
                }
            }
        }

        private void InitcboPay_Year()
        {
            string strYear = string.Empty;
            strYear = cboPay_Year.SelectedValue;
            if (strYear.Equals(""))
            {
                if (DateTime.Now.Year < 2200)
                {
                    strYear = (DateTime.Now.Year + 543).ToString();
                }
                else
                {
                    strYear = DateTime.Now.Year.ToString();
                }
            }
            DataTable odt;
            int i;
            cboPay_Year.Items.Clear();
            odt = ((DataSet)Application["xmlconfig"]).Tables["cboYear"];
            for (i = 0; i <= odt.Rows.Count - 1; i++)
            {
                cboPay_Year.Items.Add(new ListItem(odt.Rows[i]["Text"].ToString(), odt.Rows[i]["Value"].ToString()));
            }
            if (cboPay_Year.Items.FindByValue(strYear) != null)
            {
                cboPay_Year.SelectedIndex = -1;
                cboPay_Year.Items.FindByValue(strYear).Selected = true;
            }
        }

        #endregion

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
            string strMessage = string.Empty;
            string strYear = string.Empty;
            string strPayment_year = string.Empty;
            string strPay_year = string.Empty;
            string strPay_semeter = string.Empty;
            string strPay_item = string.Empty;
            string strPay_begin_date = string.Empty;
            string strPay_end_date = string.Empty;
            string strPay_day = string.Empty;
            //string strRound_status = string.Empty;
            string strComments = string.Empty;
            string strActive = string.Empty;
            string strCreatedBy = string.Empty;
            string strUpdatedBy = string.Empty;
            string strScript = string.Empty;
            var ds = new DataSet();
            var oPayment_special_round = new cPayment_special_round();
            try
            {

                #region set Data
                strYear = cboYear.SelectedValue;
                strPayment_year = cboPay_Year.SelectedValue;
                strPay_year = cboPay_Year.SelectedValue;
                strPay_semeter = cboPay_Semeter.SelectedValue;
                strPay_item = cboPay_Item.SelectedValue;
                strPay_begin_date = txtpay_begin_date.Text;
                strPay_end_date = txtpay_end_date.Text;
                strPay_day = txtpay_day.Text;
                strComments = txtComments.Text;

                if (chkStatus.Checked == true)
                {
                    strActive = "Y";
                }
                else
                {
                    strActive = "N";
                }
                strCreatedBy = Session["username"].ToString();
                strUpdatedBy = Session["username"].ToString();
                #endregion

                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    #region insert
                    string strCheckDup = string.Empty;
                    strCheckDup = " and pay_year = '" + strPay_year + "' "
                                    + " and pay_semeter = '" + strPay_semeter
                                    + "' " + " and pay_item = '" + strPay_item + "' ";
                    if (!oPayment_special_round.SP_PAYMENT_SPECIAL_ROUND_SEL(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                        return false;
                    }

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        strScript =
                            "alert(\"ไม่สามารถบันทึกข้อมูลได้ เนื่องจาก" +
                            "\\nข้อมูลปีงบประมาณ : " + cboYear.SelectedValue +
                            "\\nภาคการศึกษาที่ : " + cboPay_Year.SelectedItem.Text +
                            "\\nภาคเรียนที่ : " + cboPay_Semeter.SelectedValue +
                            "\\nรอบการจ่ายที่ : " + cboPay_Item.SelectedValue +
                            "\\nมีอยู่ในระบบแล้ว\");\n";
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript, true);
                        return false;
                    }

                    if (!oPayment_special_round.SP_PAYMENT_SPECIAL_ROUND_INS(strYear, strPay_year, strPay_semeter, strPay_item, strPay_begin_date,
                        strPay_end_date, strPay_day, "O", strComments, strActive, strCreatedBy, ref strMessage))
                    {
                        lblError.Text = strMessage;
                        return false;
                    }

                    blnResult = true;
                    #endregion
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                oPayment_special_round.Dispose();
            }
            return blnResult;
        }

        private void imgSaveOnly_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (saveData())
            {
                string strScript =
                       "alert(\"บันทึกข้อมูลสมบูรณ์\");\n" +
                       "ClosePopUpListPost('" + ViewState["page"].ToString() + "','1');";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript, true);
            }
        }

        private void setData()
        {
            var oPayment_special_round = new cPayment_special_round();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strYear = string.Empty;
            string strPay_year = string.Empty;
            string strPay_semeter = string.Empty;
            string strPay_item = string.Empty;
            string strPay_begin_date = string.Empty;
            string strPay_end_date = string.Empty;
            string strPay_day = string.Empty;
            //string strRound_status = string.Empty;
            string strComments = string.Empty;
            string strActive = string.Empty;
            string strCreatedBy = string.Empty;
            string strUpdatedBy = string.Empty;
            string strCreatedDate = string.Empty;
            string strUpdatedDate = string.Empty;

            try
            {
                strCriteria = " and sp_round_id = '" + ViewState["round_id"].ToString() + "' ";
                if (!oPayment_special_round.SP_PAYMENT_SPECIAL_ROUND_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strYear = ds.Tables[0].Rows[0]["payment_year"].ToString();
                        strPay_year = ds.Tables[0].Rows[0]["pay_year"].ToString();
                        strPay_semeter = ds.Tables[0].Rows[0]["pay_semeter"].ToString();
                        strPay_item = ds.Tables[0].Rows[0]["pay_item"].ToString();
                        strPay_begin_date = ds.Tables[0].Rows[0]["pay_begin_date"].ToString();
                        strPay_end_date = ds.Tables[0].Rows[0]["pay_end_date"].ToString();
                        strPay_day = ds.Tables[0].Rows[0]["pay_day"].ToString();
                        //string strRound_status = string.Empty;
                        strComments = ds.Tables[0].Rows[0]["comments"].ToString();
                        strActive = ds.Tables[0].Rows[0]["c_active"].ToString();
                        strCreatedBy = ds.Tables[0].Rows[0]["c_created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["d_created_date"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();
                        #endregion

                        #region set Control
                        InitcboYear();
                        if (cboYear.Items.FindByValue(strYear) != null)
                        {
                            cboYear.SelectedIndex = -1;
                            cboYear.Items.FindByValue(strYear).Selected = true;
                        }

                        InitcboPay_Year();
                        if (cboPay_Year.Items.FindByValue(strPay_year) != null)
                        {
                            cboPay_Year.SelectedIndex = -1;
                            cboPay_Year.Items.FindByValue(strPay_year).Selected = true;
                        }

                        InitcboPaySemeter();
                        if (cboPay_Semeter.Items.FindByValue(strPay_semeter) != null)
                        {
                            cboPay_Semeter.SelectedIndex = -1;
                            cboPay_Semeter.Items.FindByValue(strPay_semeter).Selected = true;
                        }

                        InitcboPayItem();
                        if (cboPay_Item.Items.FindByValue(strPay_item) != null)
                        {
                            cboPay_Item.SelectedIndex = -1;
                            cboPay_Item.Items.FindByValue(strPay_item).Selected = true;
                        }

                        txtpay_begin_date.Text = cCommon.CheckDate(strPay_begin_date);
                        txtpay_end_date.Text = cCommon.CheckDate(strPay_end_date);
                        txtpay_day.Text = strPay_day;

                        if (strActive.Equals("Y"))
                        {
                            chkStatus.Checked = true;
                        }
                        else
                        {
                            chkStatus.Checked = false;
                        }

                        txtComments.Text = strComments;
                        cboYear.Enabled = false;
                        cboYear.CssClass = "textboxdis";
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