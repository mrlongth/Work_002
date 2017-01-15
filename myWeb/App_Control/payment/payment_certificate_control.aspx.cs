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
using Aware.WebControls;

namespace myWeb.App_Control.payment
{
    public partial class payment_certificate_control : PageBase
    {

        public static string getNumber(object pNumber)
        {
            if (!pNumber.ToString().Equals(""))
            {
                string strNumber = String.Format("{0:#,##0.00}", double.Parse(pNumber.ToString()));
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
                ViewState["sort"] = "payment_item_recv";
                ViewState["direction"] = "DESC";

                ViewState["sort2"] = "loan_name";
                ViewState["direction2"] = "DESC";

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

                if (Request.QueryString["req_cer_doc_no"] != null)
                {
                    ViewState["req_cer_doc_no"] = Request.QueryString["req_cer_doc_no"].ToString();
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

                imgList_person.Attributes.Add("onclick", "OpenPopUp('900px','500px','94%','ค้นหาข้อมูลบุคลากร' ,'../lov/person_lov.aspx?" +
                     "from=payment_control&person_code='+getElementById('" + txtperson_code.ClientID + "').value+'" +
                     "&person_name='+ getElementById('" + txtperson_thai_name.ClientID + "').value+ ' ' + getElementById('" + txtperson_thai_name.ClientID + "').value +'" +
                    "&ctrl1=" + txtperson_code.ClientID + "&ctrl2=" + txtperson_thai_name.ClientID + "&show=2', '2');return false;");
                //imgClear_item.Attributes.Add("onclick", "document.getElementById('" + txtperson_code.ClientID + "').value='';document.getElementById('" + txtperson_name.ClientID + "').value=''; return false;");



                imgList_position.Attributes.Add("onclick", "OpenPopUp('800px','400px','93%','ค้นหาข้อมูลระดับตำแหน่งปัจจุบัน' ,'../lov/position_lov.aspx?position_name='+document.forms[0]." + strPrefixCtr_main +
                                 "TabPanel1$txtreq_position_name.value+" + "'&ctrl2=" + txtreq_position_name.ClientID + "&show=2', '2');return false;");
                imgClear_position.Attributes.Add("onclick", "document.forms[0]." + strPrefixCtr_main + "TabPanel1$txtreq_position_name.value=''; return false;");

                imgList_level.Attributes.Add("onclick", "OpenPopUp('800px','400px','93%','ค้นหาข้อมูลระดับระดับตำแหน่ง' ,'../lov/level_position_lov.aspx?position_name='+document.forms[0]." + strPrefixCtr_main +
                                            "TabPanel1$txtreq_level_position_name.value+" + "'&ctrl2=" + txtreq_level_position_name.ClientID + "&show=2', '2');return false;");
                imgClear_level.Attributes.Add("onclick", "document.forms[0]." + strPrefixCtr_main + "TabPanel1$txtreq_level_position_name.value=''; return false;");


                imgList_req_work.Attributes.Add("onclick", "OpenPopUp('800px','400px','93%','ค้นหาข้อมูลงาน/หลักสูตร' ,'../lov/work_lov.aspx?year='+$('#" + cboYear.ClientID + " option:selected').val()+'&work_name='+document.forms[0]." + strPrefixCtr_main +
                            "TabPanel1$txtreq_work_name.value+" + "'&ctrl2=" + txtreq_work_name.ClientID + "&show=2', '2');return false;");
                imgClear_req_work.Attributes.Add("onclick", "document.forms[0]." + strPrefixCtr_main + "TabPanel1$txtreq_work_name.value=''; return false;");


                imgList_req_approve.Attributes.Add("onclick", "OpenPopUp('800px','400px','93%','ค้นหาข้อมูลผู้อนุมัติ' ,'../lov/cer_approve_lov.aspx?ctrl1=" + txtreq_approve.ClientID + "&ctrl2=" + txtreq_approve_position1.ClientID + "&ctrl3=" + txtreq_approve_position2.ClientID + "&show=2', '2');return false;");
                imgClear_req_approve.Attributes.Add("onclick", "document.forms[0]." + strPrefixCtr_main + "TabPanel1$txtreq_approve.value='';document.forms[0]." + strPrefixCtr_main + "TabPanel1$txtreq_approve_position1.value='';document.forms[0]." + strPrefixCtr_main + "TabPanel1$txtreq_approve_position2.value=''; return false;");

                #endregion

                InitcboRound();

                ClearAll();

                InitcboReqCerType();

                txttotal_payment_recv.Attributes.Add("onkeyup", "javascript:calTotal()");
                txttotal_payment_pay.Attributes.Add("onkeyup", "javascript:calTotal()");
                txttotal_payment_recv.Attributes.Add("onblur", "javascript:calTotal()");
                txttotal_payment_pay.Attributes.Add("onblur", "javascript:calTotal()");

                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {

                    txtreq_date.Text = cCommon.CheckDate(DateTime.Now.ToShortDateString());
                    txtreq_date_print.Text = cCommon.CheckDate(DateTime.Now.ToShortDateString());

                    ViewState["page"] = Request.QueryString["page"];
                    txtreq_cer_doc_no.CssClass = "textboxdis";

                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    setData();
                    txtreq_cer_doc_no.ReadOnly = true;
                    txtreq_cer_doc_no.CssClass = "textboxdis";
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
        }

        private void InitcboPay_Month()
        {
            string strMonth = string.Empty;
            strMonth = cboPay_Month.SelectedValue;
            if (strMonth.Equals(""))
            {
                if (DateTime.Now.Month < 10)
                {
                    strMonth = "0" + DateTime.Now.Month.ToString();
                }
                else
                {
                    strMonth = DateTime.Now.Month.ToString();
                }
            }
            DataTable odt;
            int i;
            cboPay_Month.Items.Clear();
            odt = ((DataSet)Application["xmlconfig"]).Tables["cboMonth"];
            for (i = 0; i <= odt.Rows.Count - 1; i++)
            {
                cboPay_Month.Items.Add(new ListItem(odt.Rows[i]["Text"].ToString(), odt.Rows[i]["Value"].ToString()));
            }
            if (cboPay_Month.Items.FindByValue(strMonth) != null)
            {
                cboPay_Month.SelectedIndex = -1;
                cboPay_Month.Items.FindByValue(strMonth).Selected = true;
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

        private void InitcboReqCerType()
        {
            cCommon oCommon = new cCommon();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strCode = cboReq_code.SelectedValue;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " Select * from  req_cer ";
            if (oCommon.SEL_SQL(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboReq_code.Items.Clear();
                int i;
                cboReq_code.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboReq_code.Items.Add(new ListItem(dt.Rows[i]["req_name"].ToString(), dt.Rows[i]["req_code"].ToString()));
                }
                if (cboReq_code.Items.FindByValue(strCode) != null)
                {
                    cboReq_code.SelectedIndex = -1;
                    cboReq_code.Items.FindByValue(strCode).Selected = true;
                }
            }
        }

        private void InitcboRound()
        {
            cPayment_round oPayment_round = new cPayment_round();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strYear = string.Empty;
            string strPay_Month = string.Empty;
            string strPay_Year = string.Empty;
            try
            {
                strCriteria = " and round_status= 'O' ";
                if (!oPayment_round.SP_PAYMENT_ROUND_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strYear = ds.Tables[0].Rows[0]["payment_year"].ToString();
                        strPay_Month = ds.Tables[0].Rows[0]["pay_month"].ToString();
                        strPay_Year = ds.Tables[0].Rows[0]["pay_year"].ToString();
                        #endregion
                    }
                    else
                    {
                        #region get Data
                        strYear = ((DataSet)Application["xmlconfig"]).Tables["default"].Rows[0]["yearnow"].ToString();
                        if (DateTime.Now.Year < 2200)
                        {
                            strPay_Year = (DateTime.Now.Year + 543).ToString();
                        }
                        if (DateTime.Now.Month < 10)
                            strPay_Month = "0" + DateTime.Now.Month;
                        else
                            strPay_Month = DateTime.Now.Month.ToString();
                        #endregion
                    }

                    #region set Control
                    InitcboYear();
                    if (cboYear.Items.FindByValue(strYear) != null)
                    {
                        cboYear.SelectedIndex = -1;
                        cboYear.Items.FindByValue(strYear).Selected = true;
                    }

                    InitcboPay_Month();
                    if (cboPay_Month.Items.FindByValue(strPay_Month) != null)
                    {
                        cboPay_Month.SelectedIndex = -1;
                        cboPay_Month.Items.FindByValue(strPay_Month).Selected = true;
                    }

                    InitcboPay_Year();
                    if (cboPay_Year.Items.FindByValue(strPay_Year) != null)
                    {
                        cboPay_Year.SelectedIndex = -1;
                        cboPay_Year.Items.FindByValue(strPay_Year).Selected = true;
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
                oPayment_round.Dispose();
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
            string strreq_cer_doc_no = string.Empty;
            string strCreatedBy = string.Empty;
            string strUpdatedBy = string.Empty;
            cReq_cer oReq_cer = new cReq_cer();
            DataSet ds = null;
            try
            {
                #region set Data
                strreq_cer_doc_no = txtreq_cer_doc_no.Text;
                strCreatedBy = Session["username"].ToString();
                strUpdatedBy = Session["username"].ToString();
                #endregion
                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    #region insert
                    if (!oReq_cer.SP_REQ_CER_HEAD_INS(cboReq_code.SelectedValue, txtreq_date.Text, txtreq_date_print.Text, cboYear.SelectedValue, cboPay_Month.SelectedValue, cboPay_Year.SelectedValue,
                        txtperson_code.Text.Trim(), txttitle_code.Text, txtperson_thai_name.Text.Trim(), txtperson_thai_surname.Text.Trim(), txtreq_money.Value.ToString(),
                        txtreq_person_group_name.Text.Trim(), txtreq_position_name.Text.Trim(), txtreq_work_name.Text.Trim(), txtreq_level_position_name.Text.Trim(),
                        txtreq_director_name.Text.Trim(), txtreq_unit_name.Text.Trim(), txtreq_start_work.Text, txtreq_age_work.Value.ToString(), txtreq_approve.Text.Trim(),
                        txtreq_approve_position1.Text.Trim(), txtreq_approve_position2.Text.Trim(), txttotal_payment_recv.Value.ToString(),
                        txttotal_payment_pay.Value.ToString(), txttotal_payment_net.Value.ToString(), strCreatedBy, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {


                        //string strGetcode = " and person_code = '" + txtperson_code.Text + "' and pay_year = '" + cboPay_Year.SelectedValue + "' and pay_month = '" + cboPay_Month.SelectedValue + "' ";
                        //if (!oPayment.SP_PAYMENT_HEAD_SEL(strGetcode, ref ds, ref strMessage))
                        //{
                        //    lblError.Text = strMessage;
                        //}
                        //if (ds.Tables[0].Rows.Count > 0)
                        //{
                        //    ViewState["req_cer_doc_no"] = ds.Tables[0].Rows[0]["req_cer_doc_no"].ToString();
                        //}                        
                        blnResult = true;
                    }
                    #endregion
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    #region update
                    if (!oReq_cer.SP_REQ_CER_HEAD_UPD(ViewState["req_cer_id"].ToString(), cboReq_code.SelectedValue, txtreq_date.Text, txtreq_date_print.Text, cboYear.SelectedValue, cboPay_Month.SelectedValue, cboPay_Year.SelectedValue,
                        txtperson_code.Text.Trim(), txttitle_code.Text, txtperson_thai_name.Text.Trim(), txtperson_thai_surname.Text.Trim(), txtreq_money.Value.ToString(),
                        txtreq_person_group_name.Text.Trim(), txtreq_position_name.Text.Trim(), txtreq_work_name.Text.Trim(), txtreq_level_position_name.Text.Trim(),
                        txtreq_director_name.Text.Trim(), txtreq_unit_name.Text.Trim(), txtreq_start_work.Text, txtreq_age_work.Value.ToString(), txtreq_approve.Text.Trim(),
                        txtreq_approve_position1.Text.Trim(), txtreq_approve_position2.Text.Trim(), txttotal_payment_recv.Value.ToString(),
                        txttotal_payment_pay.Value.ToString(), txttotal_payment_net.Value.ToString(), strUpdatedBy, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (oReq_cer.SP_REQ_CER_DETAIL_DEL(ViewState["req_cer_id"].ToString(), ref strMessage))
                        {
                            for (var count = 0; count < GridView1.Rows.Count; count++)
                            {
                                var gridRow = GridView1.Rows[count];
                                var lblitem_code = (Label)gridRow.FindControl("lblitem_code");
                                var txtpayment_item_recv = (AwNumeric)gridRow.FindControl("txtpayment_item_recv");
                                var txtpayment_item_pay = (AwNumeric)gridRow.FindControl("txtpayment_item_pay");
                                var CheckBox1 = (CheckBox)gridRow.FindControl("CheckBox1");
                                if (CheckBox1.Checked)
                                {
                                    if (!oReq_cer.SP_REQ_CER_DETAIL_INS(ViewState["req_cer_id"].ToString(), lblitem_code.Text,
                                        txtpayment_item_pay.Value.ToString(), txtpayment_item_recv.Value.ToString(), ref strMessage))
                                    {
                                        lblError.Text = strMessage;
                                    }
                                }
                            }
                        }
                        else
                        {
                            lblError.Text = strMessage;
                        }
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
                oReq_cer.Dispose();
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
                //if (ViewState["mode"].ToString().ToLower().Equals("add"))
                //{                    
                //    Response.Redirect(
                //        "payment_control.aspx?mode=edit&req_cer_doc_no=" + ViewState["req_cer_doc_no"].ToString() + "&page="
                //        + ViewState["page"].ToString() + "&PageStatus=save",
                //        true);
                //}
                //else
                //{
                //}
            }
        }

        private void setData()
        {
            cReq_cer oReq_cer = new cReq_cer();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strreq_cer_doc_no = string.Empty;

            string strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty;


            try
            {
                strCriteria = " and req_cer_doc_no = '" + ViewState["req_cer_doc_no"].ToString() + "' ";
                if (!oReq_cer.SP_REQ_CER_HEAD_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        var req_code = ds.Tables[0].Rows[0]["req_code"].ToString();
                        if (cboReq_code.Items.FindByValue(req_code) != null)
                        {
                            cboReq_code.SelectedIndex = -1;
                            cboReq_code.Items.FindByValue(req_code).Selected = true;
                        }
                        this.ChangedReqCerType();
                        ViewState["req_cer_id"] = ds.Tables[0].Rows[0]["req_cer_id"].ToString();

                        txtreq_cer_doc_no.Text = ds.Tables[0].Rows[0]["req_cer_doc_no"].ToString();
                        txtreq_date.Text = cCommon.CheckDate(ds.Tables[0].Rows[0]["req_date"].ToString());
                        txtreq_date_print.Text = cCommon.CheckDate(ds.Tables[0].Rows[0]["req_date_print"].ToString());

                        txtperson_code.Text = ds.Tables[0].Rows[0]["person_code"].ToString();
                        txttitle_code.Text = ds.Tables[0].Rows[0]["title_code"].ToString();
                        txtperson_thai_name.Text = ds.Tables[0].Rows[0]["person_thai_name"].ToString();
                        txtperson_thai_surname.Text = ds.Tables[0].Rows[0]["person_thai_surname"].ToString();

                        txtreq_person_group_name.Text = ds.Tables[0].Rows[0]["req_person_group_name"].ToString();
                        txtreq_position_name.Text = ds.Tables[0].Rows[0]["req_position_name"].ToString();
                        txtreq_level_position_name.Text = ds.Tables[0].Rows[0]["req_level_position_name"].ToString();
                        txtreq_director_name.Text = ds.Tables[0].Rows[0]["req_director_name"].ToString();
                        txtreq_unit_name.Text = ds.Tables[0].Rows[0]["req_unit_name"].ToString();
                        txtreq_work_name.Text = ds.Tables[0].Rows[0]["req_work_name"].ToString();
                        txtreq_age_work.Value = ds.Tables[0].Rows[0]["req_age_work"].ToString();
                        txtreq_money.Value = ds.Tables[0].Rows[0]["req_money"].ToString();
                        txtreq_start_work.Text = cCommon.CheckDate(ds.Tables[0].Rows[0]["req_start_work"].ToString());

                        txtreq_age_work.Value = ds.Tables[0].Rows[0]["req_age_work"].ToString();
                        txtreq_approve.Text = ds.Tables[0].Rows[0]["req_approve"].ToString();
                        txtreq_approve_position1.Text = ds.Tables[0].Rows[0]["req_approve_position1"].ToString();
                        txtreq_approve_position2.Text = ds.Tables[0].Rows[0]["req_approve_position2"].ToString();
                        txttotal_payment_recv.Value = ds.Tables[0].Rows[0]["total_payment_recv"].ToString();
                        txttotal_payment_pay.Value = ds.Tables[0].Rows[0]["total_payment_pay"].ToString();
                        txttotal_payment_net.Value = ds.Tables[0].Rows[0]["total_payment_net"].ToString();

                        var strpayment_year = ds.Tables[0].Rows[0]["payment_year"].ToString();
                        var strpay_year = ds.Tables[0].Rows[0]["pay_year"].ToString();
                        var strpay_month = ds.Tables[0].Rows[0]["pay_month"].ToString();

                        strCreatedBy = ds.Tables[0].Rows[0]["created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["created_date"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["updated_by"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["updated_date"].ToString();


                        #endregion

                        #region set Control

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

                        InitcboPay_Month();
                        if (cboPay_Month.Items.FindByValue(strpay_month) != null)
                        {
                            cboPay_Month.SelectedIndex = -1;
                            cboPay_Month.Items.FindByValue(strpay_month).Selected = true;
                        }


                        txtUpdatedBy.Text = strUpdatedBy;
                        txtUpdatedDate.Text = strUpdatedDate;
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
            cReq_cer oReq_cer = new cReq_cer();
            DataSet ds = new DataSet();
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            try
            {
                if (!oReq_cer.SP_REQ_CER_DETAIL_TMP_SEL(ViewState["req_cer_id"].ToString(), cboPay_Year.SelectedValue, cboPay_Month.SelectedValue, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    ds.Tables[0].DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                }
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
                oReq_cer.Dispose();
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

                ((CheckBox)e.Row.FindControl("cbSelectAll")).Attributes.Add("onclick", "javascript:SelectAll('" +
                ((CheckBox)e.Row.FindControl("cbSelectAll")).ClientID + "')");


                for (int iCol = 0; iCol < e.Row.Cells.Count; iCol++)
                {
                    e.Row.Cells[iCol].Attributes.Add("class", "table_h");
                    e.Row.Cells[iCol].Wrap = false;
                }

                //Label lblitem_code = (Label)e.Row.FindControl("lblitem_code");


                //ImageButton imgAdd = (ImageButton)e.Row.FindControl("imgAdd");
                //imgAdd.ImageUrl = ((DataSet)Application["xmlconfig"]).Tables["imgGridAdd"].Rows[0]["img"].ToString();
                //imgAdd.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgGridAdd"].Rows[0]["title"].ToString());
                //imgAdd.Attributes.Add("onclick", "OpenPopUp('800px','425px','94%','เพิ่มข้อมูลรายได้/ค่าใช้จ่าย','payment_item_control.aspx?mode=add&person_code=" +
                //                                                                txtperson_code.Text + "&person_name=" + txtperson_thai_name.Text + ' ' + txtperson_thai_surname.Text + "&req_cer_doc_no=" +
                //                                                                txtreq_cer_doc_no.Text + "&year=" + cboYear.SelectedValue + "','2');return false;");

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

                var CheckBox1 = ((CheckBox)e.Row.FindControl("CheckBox1"));
                CheckBox1.Attributes.Add("onclick", "javascript:calTotalAll()");

                int nNo = (GridView1.PageSize * GridView1.PageIndex) + e.Row.RowIndex + 1;
                lblNo.Text = nNo.ToString();

                DataRowView dv = (DataRowView)e.Row.DataItem;
                CheckBox1.Checked = Helper.CStr(dv["selected"]) == "1";

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
            cPerson oPerson = new cPerson();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            #region clear Data
            //Tab 1 
            string strperson_code = string.Empty,
                strtitle_code = string.Empty,
                strperson_thai_name = string.Empty,
                strperson_thai_surname = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty;
            //Tab 2 
            string strposition_code = string.Empty,
                strposition_name = string.Empty,
                strperson_level = string.Empty,
                strperson_postionno = string.Empty,
                strperson_group_name = string.Empty,
                strperson_manage_code = string.Empty,
                strperson_manage_name = string.Empty,
                strbudget_plan_code = string.Empty,
                strbudget_name = string.Empty,
                strproduce_name = string.Empty,
                stractivity_name = string.Empty,
                strplan_name = string.Empty,
                strwork_name = string.Empty,
                strfund_name = string.Empty,
                strdirector_name = string.Empty,
                strunit_name = string.Empty,
                strperson_work_status = string.Empty,
                strperson_start = string.Empty,
            strperson_birth = string.Empty;
            #endregion
            try
            {
                strCriteria = " and person_code = '" + txtperson_code.Text + "' ";
                if (!oPerson.SP_PERSON_ALL_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strperson_code = ds.Tables[0].Rows[0]["person_code"].ToString();

                        strtitle_code = ds.Tables[0].Rows[0]["title_name"].ToString();
                        strperson_thai_name = ds.Tables[0].Rows[0]["person_thai_name"].ToString();
                        strperson_thai_surname = ds.Tables[0].Rows[0]["person_thai_surname"].ToString();

                        strCreatedBy = ds.Tables[0].Rows[0]["c_created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["d_created_date"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();
                        //Tab 2 
                        strposition_code = ds.Tables[0].Rows[0]["position_code"].ToString();
                        strposition_name = ds.Tables[0].Rows[0]["position_name"].ToString();

                        strperson_level = ds.Tables[0].Rows[0]["person_level"].ToString();
                        strperson_postionno = ds.Tables[0].Rows[0]["person_postionno"].ToString();

                        strperson_group_name = ds.Tables[0].Rows[0]["person_group_name"].ToString();
                        strwork_name = ds.Tables[0].Rows[0]["work_name"].ToString();
                        strdirector_name = ds.Tables[0].Rows[0]["director_name"].ToString();
                        strunit_name = ds.Tables[0].Rows[0]["unit_name"].ToString();

                        strperson_start = ds.Tables[0].Rows[0]["person_start"].ToString();
                        strperson_birth = ds.Tables[0].Rows[0]["person_birth"].ToString();

                        #endregion

                        #region set Control

                        txtperson_code.Text = strperson_code;
                        txttitle_code.Text = strtitle_code;
                        txtperson_thai_name.Text = strperson_thai_name;
                        txtperson_thai_surname.Text = strperson_thai_surname;
                        txtreq_person_group_name.Text = strperson_group_name;

                        txtreq_position_name.Text = strposition_name;
                        txtreq_level_position_name.Text = strperson_level;

                        txtreq_director_name.Text = strdirector_name;
                        txtreq_unit_name.Text = strunit_name;
                        txtreq_work_name.Text = strwork_name;
                        txtreq_start_work.Text = cCommon.CheckDate(strperson_start);

                        DateTime dperson_birth = DateTime.Parse(strperson_birth);
                        DateTime dreq_start_work = DateTime.Parse(txtreq_start_work.Text);
                        DateTime dreq_date_print = DateTime.Parse(txtreq_date_print.Text);

                        long intperson_birth = cCommon.DateTimeUtil.DateDiff(cCommon.DateInterval.Year, dperson_birth.Date, dreq_date_print.Date);

                        long intperson_work_remain = 60 - intperson_birth;
                        txtreq_age_work.Value = intperson_work_remain;

                        #endregion
                    }
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
            txttitle_code.Text = string.Empty;
            txtperson_thai_name.Text = string.Empty;
            txtperson_thai_surname.Text = string.Empty;
            txtreq_person_group_name.Text = string.Empty;

            txtreq_position_name.Text = string.Empty;
            txtreq_level_position_name.Text = string.Empty;

            txtreq_director_name.Text = string.Empty;
            txtreq_unit_name.Text = string.Empty;
            txtreq_work_name.Text = string.Empty;
            txtreq_start_work.Text = cCommon.CheckDate(DateTime.Now.ToString());

            txtreq_age_work.Value = 0;

        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            string strScript = "createDate('" + txtreq_date.ClientID + "','" + DateTime.Now.Date.ToString("dd/MM/yyyy") + "');";
            strScript += "createDate('" + txtreq_date_print.ClientID + "','" + DateTime.Now.Date.ToString("dd/MM/yyyy") + "');";
            strScript += "createDate('" + txtreq_start_work.ClientID + "','" + DateTime.Now.Date.ToString("dd/MM/yyyy") + "');";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RegisterScript", strScript, true);

        }

        protected void cboReq_code_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangedReqCerType();
        }

        private void ChangedReqCerType()
        {
            cCommon oCommon = new cCommon();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strCode = cboReq_code.SelectedValue;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " Select * from  req_cer where  [req_code] = '" + strCode + "'";
            if (oCommon.SEL_SQL(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                ClearAll();
                if (dt.Rows.Count > 0)
                {
                    var row = dt.Rows[0];

                    txtperson_code.Enabled = true;
                    txtperson_code.CssClass = "textbox";
                    txttitle_code.Enabled = true;
                    txttitle_code.CssClass = "textbox";
                    txtperson_thai_name.Enabled = true;
                    txtperson_thai_name.CssClass = "textbox";
                    txtperson_thai_surname.Enabled = true;
                    txtperson_thai_surname.CssClass = "textbox";
                    imgList_person.Visible = true;
                    imgClear_person.Visible = true;

                    if (Helper.CBool(row["is_req_money"]) == true)
                    {
                        txtreq_money.CssClass = "textbox";
                        txtreq_money.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_person_group_name"]) == true)
                    {
                        txtreq_person_group_name.CssClass = "textbox";
                        txtreq_person_group_name.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_position_name"]) == true)
                    {
                        txtreq_position_name.CssClass = "textbox";
                        txtreq_position_name.Enabled = true;
                        imgClear_position.Visible = true;
                        imgList_position.Visible = true;
                    }

                    if (Helper.CBool(row["is_req_work_name"]) == true)
                    {
                        txtreq_work_name.CssClass = "textbox";
                        txtreq_work_name.Enabled = true;
                        imgList_req_work.Visible = true;
                        imgClear_req_work.Visible = true;
                    }

                    if (Helper.CBool(row["is_req_level_position_name"]) == true)
                    {
                        txtreq_level_position_name.CssClass = "textbox";
                        txtreq_level_position_name.Enabled = true;
                        imgList_level.Visible = true;
                        imgClear_level.Visible = true;
                    }

                    if (Helper.CBool(row["is_req_director_name"]) == true)
                    {
                        txtreq_director_name.CssClass = "textbox";
                        txtreq_director_name.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_unit_name"]) == true)
                    {
                        txtreq_unit_name.CssClass = "textbox";
                        txtreq_unit_name.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_start_work"]) == true)
                    {
                        txtreq_start_work.CssClass = "textbox";
                        txtreq_start_work.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_age_work"]) == true)
                    {
                        txtreq_age_work.CssClass = "textbox";
                        txtreq_age_work.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_approve"]) == true)
                    {
                        txtreq_approve.CssClass = "textbox";
                        txtreq_approve.Enabled = true;
                        imgList_req_approve.Visible = true;
                        imgClear_req_approve.Visible = true;
                    }

                    if (Helper.CBool(row["is_req_approve_position1"]) == true)
                    {
                        txtreq_approve_position1.CssClass = "textbox";
                        txtreq_approve_position1.Enabled = true;
                    }

                    if (Helper.CBool(row["is_req_approve_position2"]) == true)
                    {
                        txtreq_approve_position2.CssClass = "textbox";
                        txtreq_approve_position2.Enabled = true;
                    }

                    if (Helper.CBool(row["is_total_payment_recv"]) == true)
                    {
                        txttotal_payment_recv.CssClass = "textbox";
                        txttotal_payment_recv.Enabled = true;
                    }

                    if (Helper.CBool(row["is_total_payment_pay"]) == true)
                    {
                        txttotal_payment_pay.CssClass = "textbox";
                        txttotal_payment_pay.Enabled = true;
                    }

                    if (Helper.CBool(row["is_total_payment_net"]) == true)
                    {
                        txttotal_payment_net.CssClass = "textbox";
                        txttotal_payment_net.Enabled = true;
                    }

                    if (Helper.CBool(row["is_show_detail"]) == true)
                    {
                        TabPanel3.Visible = true;
                    }
                }

            }
        }

        private void ClearAll()
        {

            txtperson_code.Text = string.Empty;
            txttitle_code.Text = string.Empty;
            txtperson_thai_name.Text = string.Empty;
            txtperson_thai_surname.Text = string.Empty;

            txtreq_person_group_name.Text = string.Empty;
            txtreq_position_name.Text = string.Empty;
            txtreq_level_position_name.Text = string.Empty;
            txtreq_director_name.Text = string.Empty;
            txtreq_unit_name.Text = string.Empty;
            txtreq_work_name.Text = string.Empty;
            txtreq_age_work.Value = 0;
            txtreq_money.Value = 0;
            txtreq_start_work.Text = cCommon.CheckDate(DateTime.Now.ToShortDateString());
            txtreq_age_work.Value = 0;
            txtreq_approve.Text = string.Empty;
            txtreq_approve_position1.Text = string.Empty;
            txtreq_approve_position2.Text = string.Empty;
            txttotal_payment_recv.Value = 0;
            txttotal_payment_pay.Value = 0;
            txttotal_payment_net.Value = 0;



            txtperson_code.Enabled = false;
            txtperson_code.CssClass = "textboxdis";
            txttitle_code.Enabled = false;
            txttitle_code.CssClass = "textboxdis";
            txtperson_thai_name.Enabled = false;
            txtperson_thai_name.CssClass = "textboxdis";
            txtperson_thai_surname.Enabled = false;
            txtperson_thai_surname.CssClass = "textboxdis";
            imgList_person.Visible = false;
            imgClear_person.Visible = false;

            txtreq_person_group_name.CssClass = "textboxdis";
            txtreq_person_group_name.Enabled = false;

            txtreq_position_name.CssClass = "textboxdis";
            txtreq_position_name.Enabled = false;
            imgClear_position.Visible = false;
            imgList_position.Visible = false;

            txtreq_level_position_name.CssClass = "textboxdis";
            txtreq_level_position_name.Enabled = false;
            imgList_level.Visible = false;
            imgClear_level.Visible = false;

            txtreq_director_name.CssClass = "textboxdis";
            txtreq_director_name.Enabled = false;

            txtreq_unit_name.CssClass = "textboxdis";
            txtreq_unit_name.Enabled = false;


            txtreq_work_name.CssClass = "textboxdis";
            txtreq_work_name.Enabled = false;
            imgList_req_work.Visible = false;
            imgClear_req_work.Visible = false;

            txtreq_age_work.CssClass = "textboxdis";
            txtreq_age_work.Enabled = false;

            txtreq_money.CssClass = "textboxdis";
            txtreq_money.Enabled = false;

            txtreq_start_work.CssClass = "textboxdis";
            txtreq_start_work.Enabled = false;

            txtreq_age_work.CssClass = "textboxdis";
            txtreq_age_work.Enabled = false;

            txtreq_approve.CssClass = "textboxdis";
            txtreq_approve.Enabled = false;
            txtreq_approve_position1.Enabled = false;
            txtreq_approve_position2.Enabled = false;
            txtreq_approve_position1.CssClass = "textboxdis";
            txtreq_approve_position2.CssClass = "textboxdis";
            imgList_req_approve.Visible = false;
            imgClear_req_approve.Visible = false;

            txttotal_payment_recv.CssClass = "textboxdis";
            txttotal_payment_recv.Enabled = false;

            txttotal_payment_pay.CssClass = "textboxdis";
            txttotal_payment_pay.Enabled = false;

            txttotal_payment_net.CssClass = "textboxdis";
            txttotal_payment_net.Enabled = false;
            TabPanel3.Visible = false;


        }



    }
}