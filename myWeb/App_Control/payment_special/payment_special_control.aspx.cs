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

namespace myWeb.App_Control.payment_special
{
    public partial class payment_special_control : PageBase
    {

        public static string getNumber(object pNumber)
        {
            if (!pNumber.ToString().Equals(""))
            {
                string strNumber = String.Format("{0:#,##0.00}", float.Parse(pNumber.ToString()));
                return strNumber;
            }
            return "";
        }
        private string strPrefixCtr_main = "ctl00$ContentPlaceHolder1$TabContainer1$";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            lblError.Text = "";
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/save2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/save.jpg'");
                BtnR1.Style.Add("display", "none");
                LinkButton1.Style.Add("display", "none");
                ViewState["sort"] = "sp_payment_item_money";
                ViewState["direction"] = "DESC";

                #region set QueryString

                IsUserEdit = false;
                IsUserDelete = false;

                if (Request.QueryString["IsUserEdit"] != null)
                {
                    if (Request.QueryString["IsUserEdit"].ToString() == "Y")
                    {
                        IsUserEdit = true;
                    }
                }

                if (Request.QueryString["IsUserDelete"] != null)
                {
                    if (Request.QueryString["IsUserDelete"].ToString() == "Y")
                    {
                        IsUserDelete = true;
                    }
                }

                if (Request.QueryString["payment_doc"] != null)
                {
                    ViewState["payment_doc"] = Request.QueryString["payment_doc"].ToString();
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

                if (Request.QueryString["PageStatus"] != null)
                {
                    ViewState["PageStatus"] = Request.QueryString["PageStatus"].ToString();
                }



                #endregion

                #region Set Image

                imgList_item.Attributes.Add("onclick", "OpenPopUp('900px','500px','94%','ค้นหาข้อมูลบุคลากร' ,'../lov/person_lov.aspx?" +
                     "from=payment_special_control&person_code='+getElementById('" + txtperson_code.ClientID + "').value+'" +
                     "&person_name='+getElementById('" + txtperson_name.ClientID + "').value+'" +
                    "&ctrl1=" + txtperson_code.ClientID + "&ctrl2=" + txtperson_name.ClientID + "&show=2', '2');return false;");

                #endregion

                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    InitcboRound();
                    InitcboPerson_group();
                    ViewState["page"] = Request.QueryString["page"];
                    chkStatus.Checked = true;
                    txtpayment_doc.CssClass = "textboxdis";
                    imgList_item.Visible = true;
                    imgClear_item.Visible = true;
                    txtperson_code.CssClass = "textbox";
                    txtperson_code.ReadOnly = false;
                    //BindGridView();
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    setData();
                    txtpayment_doc.ReadOnly = true;
                    txtpayment_doc.CssClass = "textboxdis";
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("view"))
                {
                    setData();
                    SetControlView(this);
                    imgSaveOnly.Visible = false;
                }
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
            InitcboDirector();
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

        private void InitcboPerson_group()
        {
            cPerson_group oPerson_group = new cPerson_group();
            string strMessage = string.Empty,
                        strCriteria = string.Empty,
                        strperson_group_code = string.Empty;
            strperson_group_code = cboPerson_group.SelectedValue;
            int i;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " and c_active='Y' ";
            strCriteria += " and person_group_code IN (" + PersonGroupList + ") ";
            if (oPerson_group.SP_PERSON_GROUP_SEL(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboPerson_group.Items.Clear();
                cboPerson_group.Items.Add(new ListItem("---- เลือกข้อมูลทั้งหมด ----", ""));
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboPerson_group.Items.Add(new ListItem(dt.Rows[i]["person_group_name"].ToString(), dt.Rows[i]["person_group_code"].ToString()));
                }
                if (cboPerson_group.Items.FindByValue(strperson_group_code) != null)
                {
                    cboPerson_group.SelectedIndex = -1;
                    cboPerson_group.Items.FindByValue(strperson_group_code).Selected = true;
                }
            }
        }

        private void InitcboDirector()
        {
            cDirector oDirector = new cDirector();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strDirector_code = string.Empty;
            string strYear = cboYear.SelectedValue;
            strDirector_code = cboDirector.SelectedValue;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " and director_year = '" + strYear + "'  and  c_active='Y' ";
            if (DirectorLock == "Y")
            {
                strCriteria += " and substring(director_code,4,2) = substring('" + DirectorCode + "',4,2) ";
            }
            if (oDirector.SP_SEL_DIRECTOR(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboDirector.Items.Clear();
                cboDirector.Items.Add(new ListItem("---- เลือกข้อมูลทั้งหมด ----", ""));
                int i;
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboDirector.Items.Add(new ListItem(dt.Rows[i]["director_name"].ToString(), dt.Rows[i]["director_code"].ToString()));
                }
                if (cboDirector.Items.FindByValue(strDirector_code) != null)
                {
                    cboDirector.SelectedIndex = -1;
                    cboDirector.Items.FindByValue(strDirector_code).Selected = true;
                }
                InitcboUnit();
            }
        }

        private void InitcboUnit()
        {
            cUnit oUnit = new cUnit();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strUnit_code = cboUnit.SelectedValue;
            string strDirector_code = cboDirector.SelectedValue;
            string strYear = cboYear.SelectedValue;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " and unit.unit_year = '" + strYear + "'  and  unit.c_active='Y' " +
                                   " and unit.director_code = '" + strDirector_code + "' ";
            if (oUnit.SP_SEL_UNIT(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboUnit.Items.Clear();
                cboUnit.Items.Add(new ListItem("---- เลือกข้อมูลทั้งหมด ----", ""));
                int i;
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboUnit.Items.Add(new ListItem(dt.Rows[i]["unit_name"].ToString(), dt.Rows[i]["unit_code"].ToString()));
                }
                if (cboUnit.Items.FindByValue(strUnit_code) != null)
                {
                    cboUnit.SelectedIndex = -1;
                    cboUnit.Items.FindByValue(strUnit_code).Selected = true;
                }
            }
        }

        private void InitcboWork()
        {
            cWork oWork = new cWork();
            string strMessage = string.Empty,
                        strCriteria = string.Empty,
            strwork_code = string.Empty;
            string strYear = cboYear.SelectedValue;
            strwork_code = cboWork.SelectedValue;
            int i;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " and work_year = '" + strYear + "'  and  c_active='Y' ";

            if (oWork.SP_SEL_WORK(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboWork.Items.Clear();
                cboWork.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboWork.Items.Add(new ListItem(dt.Rows[i]["work_name"].ToString(), dt.Rows[i]["work_code"].ToString()));
                }
                if (cboWork.Items.FindByValue(strwork_code) != null)
                {
                    cboWork.SelectedIndex = -1;
                    cboWork.Items.FindByValue(strwork_code).Selected = true;
                }
            }
        }

        private void InitcboRound()
        {
            var oPayment_special_round = new cPayment_special_round();
            var ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strPay_Year = string.Empty;
            string strPay_Semeter = string.Empty;
            string strPay_Item = string.Empty;
            string strYear = cboYear.SelectedValue;
            string strRoundId = string.Empty;
            string strPay_begin_date = string.Empty;
            string strPay_end_date = string.Empty;
            try
            {
                strCriteria = " and round_status= 'O' ";
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
                        strPay_Year = ds.Tables[0].Rows[0]["pay_year"].ToString();
                        strPay_Semeter = ds.Tables[0].Rows[0]["pay_semeter"].ToString();
                        strPay_Item = ds.Tables[0].Rows[0]["pay_item"].ToString();
                        strRoundId = ds.Tables[0].Rows[0]["sp_round_id"].ToString();
                        strPay_begin_date = ds.Tables[0].Rows[0]["pay_begin_date"].ToString();
                        strPay_end_date = ds.Tables[0].Rows[0]["pay_end_date"].ToString();
                        #endregion
                    }
                    else
                    {
                        #region get Data
                        strPay_Year = ((DataSet)Application["xmlconfig"]).Tables["default"].Rows[0]["yearnow"].ToString();
                        if (DateTime.Now.Year < 2200)
                        {
                            strPay_Year = (DateTime.Now.Year + 543).ToString();
                        }
                        strYear = strPay_Year;

                        #endregion
                    }

                    #region set Control

                    hddsp_round_id.Value = strRoundId;
                    InitcboYear();
                    if (cboYear.Items.FindByValue(strYear) != null)
                    {
                        cboYear.SelectedIndex = -1;
                        cboYear.Items.FindByValue(strYear).Selected = true;
                    }


                    InitcboPay_Year();
                    if (cboPay_Year.Items.FindByValue(strPay_Year) != null)
                    {
                        cboPay_Year.SelectedIndex = -1;
                        cboPay_Year.Items.FindByValue(strPay_Year).Selected = true;
                    }

                    this.InitcboPaySemeter();
                    if (cboPay_Semeter.Items.FindByValue(strPay_Semeter) != null)
                    {
                        cboPay_Semeter.SelectedIndex = -1;
                        cboPay_Semeter.Items.FindByValue(strPay_Semeter).Selected = true;
                    }

                    this.InitcboPayItem();
                    if (cboPay_Item.Items.FindByValue(strPay_Item) != null)
                    {
                        cboPay_Item.SelectedIndex = -1;
                        cboPay_Item.Items.FindByValue(strPay_Item).Selected = true;
                    }
                    lblPay_begin_date.Value = cCommon.CheckDate(strPay_begin_date);
                    lblPay_end_date.Value = cCommon.CheckDate(strPay_end_date); ;

                    InitcboWork();




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
            string strpayment_doc = string.Empty;
            string strcomments = string.Empty;
            string strActive = string.Empty;
            string strCreatedBy = string.Empty;
            string strUpdatedBy = string.Empty;
            var oPayment_special = new cPayment_special();
            try
            {
                #region set Data
                strpayment_doc = txtpayment_doc.Text;
                strcomments = txtcomments.Text;
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
                    if (!oPayment_special.SP_PAYMENT_SPECIAL_HEAD_INS(strpayment_doc, hddsp_round_id.Value, txtperson_code.Text, cboUnit.SelectedValue, cboWork.SelectedValue,
                        "0", "0", "0", strcomments, "O", strActive, strUpdatedBy, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        blnResult = true;
                    }
                    #endregion
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    #region update
                    if (!oPayment_special.SP_PAYMENT_SPECIAL_HEAD_UPD(strpayment_doc, hddsp_round_id.Value, txtperson_code.Text, cboUnit.SelectedValue, cboWork.SelectedValue,
                        strcomments, "O", strActive, strUpdatedBy, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        blnResult = true;
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
                oPayment_special.Dispose();
            }
            return blnResult;
        }

        private void imgSaveOnly_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (saveData())
            {
                string strScript1 = "ClosePopUpListPost('" + ViewState["page"].ToString() + "','1');";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
                MsgBox("บันทึกข้อมูลสมบูรณ์");
            }
        }

        private void setData()
        {
            var oPayment_special = new cPayment_special();
            var ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strpayment_doc = string.Empty;
            string strpayment_year = string.Empty;
            string strpay_year = string.Empty;
            string strpay_semeter = string.Empty;
            string strpay_item = string.Empty;
            string strpay_begin_date = string.Empty;
            string strpay_end_date = string.Empty;
            string strperson_group = string.Empty;
            string strperson_code = string.Empty;
            string strperson_name = string.Empty;
            string strdirector_code = string.Empty;
            string strunit_code = string.Empty;
            string strwork_code = string.Empty;
            string strcomments = string.Empty;
            string strC_active = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty,
                strpayment_recv, strpayment_pay, strpayment_net;
       


            try
            {
                strCriteria = " and sp_payment_doc = '" + ViewState["payment_doc"].ToString() + "' ";
                if (!oPayment_special.SP_PAYMENT_SPECIAL_HEAD_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strpayment_doc = ds.Tables[0].Rows[0]["sp_payment_doc"].ToString();
                        strpayment_year = ds.Tables[0].Rows[0]["payment_year"].ToString();
                        strpay_year = ds.Tables[0].Rows[0]["pay_year"].ToString();
                        strpay_semeter = ds.Tables[0].Rows[0]["pay_semeter"].ToString();
                        strpay_item = ds.Tables[0].Rows[0]["pay_item"].ToString();
                        strpay_begin_date = ds.Tables[0].Rows[0]["pay_begin_date"].ToString();
                        strpay_end_date = ds.Tables[0].Rows[0]["pay_end_date"].ToString();
                        strperson_group = ds.Tables[0].Rows[0]["person_group_code"].ToString();
                        strperson_code = ds.Tables[0].Rows[0]["sp_person_code"].ToString();
                        strperson_name = ds.Tables[0].Rows[0]["person_thai_name"].ToString() + " " + ds.Tables[0].Rows[0]["person_thai_surname"].ToString();
                        strdirector_code = ds.Tables[0].Rows[0]["director_code"].ToString();
                        strunit_code = ds.Tables[0].Rows[0]["unit_code"].ToString();
                        strwork_code = ds.Tables[0].Rows[0]["work_code"].ToString();

                        strpayment_recv = ds.Tables[0].Rows[0]["sp_payment_recv"].ToString();
                        strpayment_pay = ds.Tables[0].Rows[0]["sp_payment_pay"].ToString();
                        strpayment_net = ds.Tables[0].Rows[0]["sp_payment_net"].ToString();

                        strcomments = ds.Tables[0].Rows[0]["comments"].ToString();
                        strC_active = ds.Tables[0].Rows[0]["c_active"].ToString();
                        strCreatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();
                        #endregion

                        #region set Control

                        hddsp_round_id.Value = ds.Tables[0].Rows[0]["sp_round_id"].ToString();
                        txtpayment_doc.Text = strpayment_doc;

                        InitcboYear();
                        if (cboYear.Items.FindByValue(strpayment_year) != null)
                        {
                            cboYear.SelectedIndex = -1;
                            cboYear.Items.FindByValue(strpayment_year).Selected = true;
                        }

                        InitcboPay_Year();
                        if (cboPay_Year.Items.FindByValue(strpay_year) != null)
                        {
                            cboPay_Year.SelectedIndex = -1;
                            cboPay_Year.Items.FindByValue(strpay_year).Selected = true;
                        }

                        this.InitcboPaySemeter();
                        if (cboPay_Semeter.Items.FindByValue(strpay_semeter) != null)
                        {
                            cboPay_Semeter.SelectedIndex = -1;
                            cboPay_Semeter.Items.FindByValue(strpay_semeter).Selected = true;
                        }

                        this.InitcboPayItem();
                        if (cboPay_Item.Items.FindByValue(strpay_item) != null)
                        {
                            cboPay_Item.SelectedIndex = -1;
                            cboPay_Item.Items.FindByValue(strpay_item).Selected = true;
                        }

                        lblPay_begin_date.Value = cCommon.CheckDate(strpay_begin_date);
                        lblPay_end_date.Value = cCommon.CheckDate(strpay_end_date);

                        InitcboPerson_group();
                        if (cboPerson_group.Items.FindByValue(strperson_group) != null)
                        {
                            cboPerson_group.SelectedIndex = -1;
                            cboPerson_group.Items.FindByValue(strperson_group).Selected = true;
                        }

                        txtperson_code.Text = strperson_code;
                        txtperson_name.Text = strperson_name;


                        this.InitcboDirector();
                        if (cboDirector.Items.FindByValue(strdirector_code) != null)
                        {
                            cboDirector.SelectedIndex = -1;
                            cboDirector.Items.FindByValue(strdirector_code).Selected = true;
                        }

                        this.InitcboUnit();
                        if (cboUnit.Items.FindByValue(strunit_code) != null)
                        {
                            cboUnit.SelectedIndex = -1;
                            cboUnit.Items.FindByValue(strunit_code).Selected = true;
                        }

                        this.InitcboWork();
                        if (cboWork.Items.FindByValue(strwork_code) != null)
                        {
                            cboWork.SelectedIndex = -1;
                            cboWork.Items.FindByValue(strwork_code).Selected = true;
                        }

                        txtcomments.Text = strcomments;

                        txtpayment_recv.Value = strpayment_recv;
                        txtpayment_pay.Value = strpayment_pay;
                        txtpayment_net.Value = strpayment_net;



                        if (strC_active.Equals("Y"))
                        {
                            chkStatus.Checked = true;
                        }
                        else
                        {
                            chkStatus.Checked = false;
                        }
                        txtUpdatedBy.Text = strUpdatedBy;
                        txtUpdatedDate.Text = cCommon.CheckDateTime(strUpdatedDate);
                        BindGridView();
                        #endregion
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }

        private void BindGridView()
        {
            var oPayment_special = new cPayment_special();
            var ds = new DataSet();
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            try
            {
                strCriteria = " and sp_payment_doc = '" + ViewState["payment_doc"].ToString() + "' ";
                if (!oPayment_special.SP_PAYMENT_SPECIAL_DETAIL_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    ds.Tables[0].DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                }
                //if (ViewState["mode"].ToString().ToLower().Equals("add"))
                //{
                //    strCriteria = " and sp_payment_doc = '" + ViewState["payment_doc"].ToString() + "' ";
                //    if (!oPayment_special.SP_PAYMENT_SPECIAL_DETAIL_SEL(strCriteria, ref ds, ref strMessage))
                //    {
                //        lblError.Text = strMessage;
                //    }
                //    else
                //    {
                //        ds.Tables[0].DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                //        GridView1.DataSource = ds.Tables[0];
                //        GridView1.DataBind();
                //    }
                //}
                //else if (ViewState["mode"].ToString().ToLower().Equals("edit") || ViewState["mode"].ToString().ToLower().Equals("view"))
                //{
                //    strCriteria = " and sp_payment_doc = '" + ViewState["payment_doc"].ToString() + "' ";
                //    if (!oPayment_special.SP_PAYMENT_SPECIAL_DETAIL_SEL(strCriteria, ref ds, ref strMessage))
                //    {
                //        lblError.Text = strMessage;
                //    }
                //    else
                //    {
                //        ds.Tables[0].DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                //        GridView1.DataSource = ds.Tables[0];
                //        GridView1.DataBind();
                //    }
                //}
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                if (GridView1.Rows.Count == 0)
                {
                    EmptyGridFix(GridView1);
                }
                oPayment_special.Dispose();
                ds.Dispose();
            }
        }

        #region EmptyGridFix
        protected void EmptyGridFix(GridView grdView)
        {
            // normally executes after a grid load method
            if (grdView.Rows.Count == 0 &&
                grdView.DataSource != null)
            {
                DataTable dt = null;

                // need to clone sources otherwise it will be indirectly adding to 
                // the original source

                if (grdView.DataSource is DataSet)
                {
                    dt = ((DataSet)grdView.DataSource).Tables[0].Clone();
                }
                else if (grdView.DataSource is DataTable)
                {
                    dt = ((DataTable)grdView.DataSource).Clone();
                }

                if (dt == null)
                {
                    return;
                }

                dt.Rows.Add(dt.NewRow()); // add empty row
                grdView.DataSource = dt;
                grdView.DataBind();

                // hide row
                grdView.Rows[0].Visible = false;
                grdView.Rows[0].Controls.Clear();
            }

            // normally executes at all postbacks
            if (grdView.Rows.Count == 1 &&
                grdView.DataSource == null)
            {
                bool bIsGridEmpty = true;

                // check first row that all cells empty
                for (int i = 0; i < grdView.Rows[0].Cells.Count; i++)
                {
                    if (grdView.Rows[0].Cells[i].Text != string.Empty)
                    {
                        bIsGridEmpty = false;
                    }
                }
                // hide row
                if (bIsGridEmpty)
                {
                    grdView.Rows[0].Visible = false;
                    grdView.Rows[0].Controls.Clear();
                }
            }
        }
        #endregion

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.Header))
            {
                for (int iCol = 0; iCol < e.Row.Cells.Count; iCol++)
                {
                    e.Row.Cells[iCol].Attributes.Add("class", "table_h");
                    e.Row.Cells[iCol].Wrap = false;
                }

                Label lblitem_code = (Label)e.Row.FindControl("lblitem_code");
                Label lblc_active = (Label)e.Row.FindControl("lblc_active");


                ImageButton imgAdd = (ImageButton)e.Row.FindControl("imgAdd");
                imgAdd.ImageUrl = ((DataSet)Application["xmlconfig"]).Tables["imgGridAdd"].Rows[0]["img"].ToString();
                imgAdd.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgGridAdd"].Rows[0]["title"].ToString());
                imgAdd.Attributes.Add("onclick", "OpenPopUp('800px','325px','94%','เพิ่มข้อมูลรายการค่าดำเนินงานภาคพิเศษ','payment_special_item_control.aspx?mode=add&person_code=" +
                                                                                txtperson_code.Text + "&person_name=" + txtperson_name.Text + "&payment_doc=" +
                                                                                txtpayment_doc.Text + "&year=" + cboYear.SelectedValue + "','2');return false;");

            }
            else if (e.Row.RowType.Equals(DataControlRowType.DataRow) || e.Row.RowState.Equals(DataControlRowState.Alternate))
            {
                #region Set datagrid row color
                string strEvenColor, strOddColor, strMouseOverColor;
                strEvenColor = ((DataSet)Application["xmlconfig"]).Tables["colorDataGridRow"].Rows[0]["Even"].ToString();
                strOddColor = ((DataSet)Application["xmlconfig"]).Tables["colorDataGridRow"].Rows[0]["Odd"].ToString();
                strMouseOverColor = ((DataSet)Application["xmlconfig"]).Tables["colorDataGridRow"].Rows[0]["MouseOver"].ToString();

                e.Row.Style.Add("valign", "top");
                e.Row.Style.Add("cursor", "hand");
                e.Row.Attributes.Add("onMouseOver", "this.style.backgroundColor='" + strMouseOverColor + "'");

                if (e.Row.RowState.Equals(DataControlRowState.Alternate))
                {
                    e.Row.Attributes.Add("bgcolor", strOddColor);
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor='" + strOddColor + "'");
                }
                else
                {
                    e.Row.Attributes.Add("bgcolor", strEvenColor);
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor='" + strEvenColor + "'");
                }
                #endregion
                Label lblNo = (Label)e.Row.FindControl("lblNo");
                Label lblitem_code = (Label)e.Row.FindControl("lblitem_code");
                Label lblitem_type = (Label)e.Row.FindControl("lblitem_type");
                int nNo = (GridView1.PageSize * GridView1.PageIndex) + e.Row.RowIndex + 1;
                lblNo.Text = nNo.ToString();

                DataRowView dv = (DataRowView)e.Row.DataItem;
                DataSet ds = new DataSet();
                cLot objLot = new cLot();
                string strMessage = string.Empty;

                if (dv["item_type"].ToString() == "D") lblitem_type.Visible = false;

                #region set Image Edit & Delete

                ImageButton imgEdit = (ImageButton)e.Row.FindControl("imgEdit");
                imgEdit.Attributes.Add("onclick", "OpenPopUp('800px','325px','94%','แก้ไขข้อมูลรายการค่าดำเนินงานภาคพิเศษ','payment_special_item_control.aspx?mode=edit&payment_doc=" +
                            txtpayment_doc.Text + "&item_code=" + lblitem_code.Text +
                            "&page=" + GridView1.PageIndex.ToString() + "','2');return false;");

                imgEdit.ImageUrl = ((DataSet)Application["xmlconfig"]).Tables["imgEdit"].Rows[0]["img"].ToString();
                imgEdit.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgEdit"].Rows[0]["title"].ToString());

                ImageButton imgDelete = (ImageButton)e.Row.FindControl("imgDelete");
                imgDelete.ImageUrl = ((DataSet)Application["xmlconfig"]).Tables["imgDelete"].Rows[0]["img"].ToString();
                imgDelete.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgDelete"].Rows[0]["title"].ToString());
                imgDelete.Attributes.Add("onclick", "return confirm(\"คุณต้องการลบข้อมูลนี้หรือไม่ ?\");");
                #endregion

                imgEdit.Visible = IsUserEdit;
                imgDelete.Visible = IsUserDelete;

                if (DirectorLock == "Y")
                {
                    if (Helper.CStr(dv["item_type"]) != "C")
                    {
                        imgEdit.Enabled = false;
                        imgEdit.ImageUrl = ((DataSet)Application["xmlconfig"]).Tables["imgEdit"].Rows[0]["imgdisable"].ToString();
                        imgEdit.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgEdit"].Rows[0]["titledisable"].ToString());

                        imgDelete.Enabled = false;
                        imgDelete.ImageUrl = ((DataSet)Application["xmlconfig"]).Tables["imgDelete"].Rows[0]["imgdisable"].ToString();
                        imgDelete.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgDelete"].Rows[0]["titledisable"].ToString());


                    }
                }

            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.Header))
            {
                #region Create Item Header
                bool bSort = false;
                int i = 0;
                for (i = 0; i < GridView1.Columns.Count; i++)
                {
                    if (ViewState["sort"].Equals(GridView1.Columns[i].SortExpression))
                    {
                        bSort = true;
                        break;
                    }
                }
                if (bSort)
                {
                    foreach (System.Web.UI.Control c in e.Row.Controls[i].Controls)
                    {
                        if (c.GetType().ToString().Equals("System.Web.UI.WebControls.DataControlLinkButton"))
                        {
                            if (ViewState["direction"].Equals("ASC"))
                            {
                                ((LinkButton)c).Text += "<img border=0 src='" + ((DataSet)Application["xmlconfig"]).Tables["imgAsc"].Rows[0]["img"].ToString() + "'>";
                            }
                            else
                            {
                                ((LinkButton)c).Text += "<img border=0 src='" + ((DataSet)Application["xmlconfig"]).Tables["imgDesc"].Rows[0]["img"].ToString() + "'>";
                            }
                        }
                    }
                }
                #endregion
            }
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                if (ViewState["sort"].ToString().Equals(e.SortExpression.ToString()))
                {
                    if (ViewState["direction"].Equals("DESC"))
                        ViewState["direction"] = "ASC";
                    else
                        ViewState["direction"] = "DESC";
                }
                else
                {
                    ViewState["sort"] = e.SortExpression;
                    ViewState["direction"] = "ASC";
                }
                BindGridView();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string strMessage = string.Empty;
            string strUpdatedBy = Session["username"].ToString();
            var hddsp_payment_detail_id = (HiddenField)GridView1.Rows[e.RowIndex].FindControl("hddsp_payment_detail_id");
            var oPayment_special = new cPayment_special();
            try
            {
                if (!oPayment_special.SP_PAYMENT_SPECIAL_DETAIL_DEL(hddsp_payment_detail_id.Value, strUpdatedBy, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                oPayment_special.Dispose();
            }
            setData();
        }

        protected void BtnR1_Click(object sender, EventArgs e)
        {
            setData();
        }

        protected void BtnR2_Click(object sender, EventArgs e)
        {
            setData2();
        }

        private void setData2()
        {
            var oPerson = new cPerson();
            var oPerson_special = new cPerson_special();
            var ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            #region clear Data
            //Tab 1 
            string strperson_code = string.Empty,
                   strperson_thai_name = string.Empty,
                   strperson_thai_surname = string.Empty,
                   strperson_group = string.Empty,
                   strwork_code = string.Empty,
                   strdirector_code = string.Empty,
                   strunit_code = string.Empty;
            #endregion
            try
            {

                if (cboPerson_group.SelectedValue != "08")
                {
                    strCriteria = " and person_code = '" + txtperson_code.Text + "' ";
                    if (!oPerson.SP_PERSON_ALL_SEL(strCriteria, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                }
                else
                {
                    strCriteria = " and sp_person_code = '" + txtperson_code.Text + "' ";
                    if (!oPerson_special.SP_PERSON_SPECIAL_SEL(strCriteria, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                }

                if (ds.Tables[0].Rows.Count > 0)
                {
                    #region get Data
                    strperson_thai_name = ds.Tables[0].Rows[0]["person_thai_name"].ToString();
                    strperson_thai_surname = ds.Tables[0].Rows[0]["person_thai_surname"].ToString();
                    //strperson_group =   ds.Tables[0].Rows[0]["person_group_code"].ToString();
                    strwork_code = ds.Tables[0].Rows[0]["work_code"].ToString();
                    strdirector_code = ds.Tables[0].Rows[0]["director_code"].ToString();
                    strunit_code = ds.Tables[0].Rows[0]["unit_code"].ToString();
                    #endregion

                    #region set Control
                    //txtperson_code.Text = strperson_code;
                    txtperson_name.Text = strperson_thai_name + " " + strperson_thai_surname;
                    
                    //InitcboPerson_group();
                    //if (cboPerson_group.Items.FindByValue(strperson_group) != null)
                    //{
                    //    cboPerson_group.SelectedIndex = -1;
                    //    cboPerson_group.Items.FindByValue(strperson_group).Selected = true;
                    //}

                    this.InitcboDirector();
                    if (cboDirector.Items.FindByValue(strdirector_code) != null)
                    {
                        cboDirector.SelectedIndex = -1;
                        cboDirector.Items.FindByValue(strdirector_code).Selected = true;
                    }

                    this.InitcboUnit();
                    if (cboUnit.Items.FindByValue(strunit_code) != null)
                    {
                        cboUnit.SelectedIndex = -1;
                        cboUnit.Items.FindByValue(strunit_code).Selected = true;
                    }

                    this.InitcboWork();
                    if (cboWork.Items.FindByValue(strwork_code) != null)
                    {
                        cboWork.SelectedIndex = -1;
                        cboWork.Items.FindByValue(strwork_code).Selected = true;
                    }
                                     
                    #endregion
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            setData2();
        }

        protected void imgClear_item_Click(object sender, ImageClickEventArgs e)
        {
            txtperson_code.Text = string.Empty;
            txtperson_name.Text = string.Empty;
            this.InitcboDirector();
            cboDirector.SelectedIndex = 0;
            cboUnit.SelectedIndex = 0;
            cboWork.SelectedIndex = 0;
        }

        protected void cboDirector_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitcboUnit();
        }

        protected void cboPerson_group_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboPerson_group.SelectedValue != "08")
            {
                imgList_item.Attributes.Add(
                    "onclick",
                    "OpenPopUp('900px','500px','94%','ค้นหาข้อมูลบุคลากร' ,'../lov/person_lov.aspx?"
                    + "from=payment_special_control&person_code='+getElementById('" + txtperson_code.ClientID
                    + "').value+'" + "&person_name='+getElementById('" + txtperson_name.ClientID + "').value+'"
                    + "&ctrl1=" + txtperson_code.ClientID + "&ctrl2=" + txtperson_name.ClientID
                    + "&show=2', '2');return false;");
                lblperson_name.Text = "รหัสบุคลากร :";
            }
            else
            {
                imgList_item.Attributes.Add(
                    "onclick",
                    "OpenPopUp('900px','500px','94%','ค้นหาข้อมูลอาจารย์พิเศษ' ,'../lov/person_special_lov.aspx?"
                    + "from=payment_special_control&person_code='+getElementById('" + txtperson_code.ClientID
                    + "').value+'" + "&person_name='+getElementById('" + txtperson_name.ClientID + "').value+'"
                    + "&ctrl1=" + txtperson_code.ClientID + "&ctrl2=" + txtperson_name.ClientID
                    + "&show=2', '2');return false;");
                lblperson_name.Text = "รหัสอาจารย์พิเศษ :";
            }

        }




    }
}