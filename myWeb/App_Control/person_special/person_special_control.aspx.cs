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

namespace myWeb.App_Control.person_retire
{
    public partial class person_special_control : PageBase
    {
        #region private data
        private bool[] blnAccessRight = new bool[5] { false, false, false, false, false };
        private string strPrefixCtr_main = "ctl00$ContentPlaceHolder1$TabContainer1$";
        #endregion

        protected void Page_Load(object sender, System.EventArgs e)
        {
            AjaxPro.Utility.RegisterTypeForAjax(typeof(person_special_control));
            lblError.Text = "";
            if (!IsPostBack)
            {

                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/save2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/save.jpg'");

                BtnR1.Style.Add("display", "none");
                BtnR2.Style.Add("display", "none");
                BtnR3.Style.Add("display", "none");
                txtperson_id.Attributes.Add("onblur", "checkInt(this,9999999999999)");

                InitcboYear();
                InitcboBank();
                InitcboWork();

                txtperson_birth.Text = cCommon.CheckDate(DateTime.Now.Date.ToString("dd/MM/yyyy"));

                #region set QueryString
                if (Request.QueryString["sp_person_code"] != null)
                {
                    ViewState["sp_person_code"] = Request.QueryString["sp_person_code"].ToString();
                }
                if (Request.QueryString["page"] != null)
                {
                    ViewState["page"] = Request.QueryString["page"].ToString();
                }
                if (Request.QueryString["mode"] != null)
                {
                    ViewState["mode"] = Request.QueryString["mode"].ToString();
                }
                else
                {
                    ViewState["mode"] = string.Empty;
                }
                if (Request.QueryString["PageStatus"] != null)
                {
                    ViewState["PageStatus"] = Request.QueryString["PageStatus"].ToString();
                }
                if (Request.QueryString["FromPage"] != null)
                {
                    ViewState["FromPage"] = Request.QueryString["FromPage"].ToString();
                }

                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    InitcboTitle();
                    ViewState["page"] = Request.QueryString["page"];
                    txtsp_person_code.ReadOnly = true;
                    txtsp_person_code.CssClass = "textboxdis";
                    txtsp_person_code.CssClass = "textboxdis";


                }
                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    setData();
                    txtsp_person_code.ReadOnly = true;
                    txtsp_person_code.CssClass = "textboxdis";
                }
                else if (ViewState["mode"].ToString().ToLower().Equals("view"))
                {
                    setData();
                    SetControlView(this);
                    imgSaveOnly.Visible = false;
                }

                #endregion


            }

        }

        #region private function

        private void InitcboTitle()
        {
            cTitle oTitle = new cTitle();
            string strMessage = string.Empty,
                        strCriteria = string.Empty,
                        strtitle_code = string.Empty;
            strtitle_code = cboTitle.SelectedValue;
            int i;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " and c_active='Y' ";
            if (oTitle.SP_SEL_TITLE(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboTitle.Items.Clear();
                cboTitle.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboTitle.Items.Add(new ListItem(dt.Rows[i]["title_name"].ToString(), dt.Rows[i]["title_code"].ToString()));
                }
                if (cboTitle.Items.FindByValue(strtitle_code) != null)
                {
                    cboTitle.SelectedIndex = -1;
                    cboTitle.Items.FindByValue(strtitle_code).Selected = true;
                }
            }
        }

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
            strCriteria = strCriteria + " and budget_type <> 'R' ";
            if (oDirector.SP_SEL_DIRECTOR(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboDirector.Items.Clear();
                cboDirector.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
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
            strCriteria = " and unit.unit_year = '" + strYear + "'  and  unit.c_active='Y' ";
            strCriteria = strCriteria + " and unit.director_code = '" + strDirector_code + "' ";
            strCriteria = strCriteria + " and unit.budget_type <> 'R' ";

            if (oUnit.SP_SEL_UNIT(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboUnit.Items.Clear();
                cboUnit.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
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

        private void InitcboBank()
        {
            cBank oBank = new cBank();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strbank_code = string.Empty;
            string strYear = cboBank.SelectedValue;
            strbank_code = cboBank.SelectedValue;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " and c_active='Y' ";
            if (oBank.SP_SEL_BANK(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboBank.Items.Clear();
                cboBank.Items.Add(new ListItem("---- เลือกข้อมูลทั้งหมด ----", ""));
                int i;
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboBank.Items.Add(new ListItem(dt.Rows[i]["bank_name"].ToString(), dt.Rows[i]["bank_code"].ToString()));
                }
                if (cboBank.Items.FindByValue(strbank_code) != null)
                {
                    cboBank.SelectedIndex = -1;
                    cboBank.Items.FindByValue(strbank_code).Selected = true;
                }
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
            //this.imgSave.Click += new System.Web.UI.ImageClickEventHandler(this.imgSave_Click);

        }
        #endregion

        private bool saveData()
        {
            bool blnResult = false;
            bool blnDup = false;
            string strMessage = string.Empty;
            //Tab 1 
            string strsp_person_code = string.Empty,
                strtitle_code = string.Empty,
                strperson_thai_name = string.Empty,
                strperson_thai_surname = string.Empty,
                strperson_id = string.Empty,
                strperson_acc = string.Empty,
                strperson_bank_code = string.Empty,
                strdirector_code = string.Empty,
                strunit_code = string.Empty,
                strwork_code = string.Empty,
                strperson_birth = string.Empty,
                strperson_password = string.Empty,
                strperson_email = string.Empty,
                strperson_remark = string.Empty,
                strC_active = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strScript = string.Empty;
            cPerson_special oPerson_special = new cPerson_special();
            DataSet ds = new DataSet();
            try
            {
                #region set Data
                strsp_person_code = txtsp_person_code.Text;
                strtitle_code = cboTitle.SelectedValue;
                if (Request.Form[strPrefixCtr_main + "TabPanel1$cboTitle"] != null)
                {
                    strtitle_code = Request.Form[strPrefixCtr_main + "TabPanel1$cboTitle"].ToString();
                }
                strperson_thai_name = txtperson_thai_name.Text;
                strperson_thai_surname = txtperson_thai_surname.Text;
                strperson_id = txtperson_id.Text;
                if (chkStatus.Checked == true)
                {
                    strC_active = "Y";
                }
                else
                {
                    strC_active = "N";
                }

                strperson_acc = txtperson_acc.Text.Trim();
                strperson_bank_code = cboBank.SelectedValue;
                strdirector_code = cboDirector.SelectedValue;
                strunit_code = cboUnit.SelectedValue;
                strwork_code = cboWork.SelectedValue;
                strperson_birth =txtperson_birth.Text.Trim();
                strperson_password = txtperson_password.Text.Trim();
                strperson_email = txtperson_email.Text.Trim();
                strperson_remark = txtperson_remark.Text.Trim();
                strCreatedBy = Session["username"].ToString();
                strUpdatedBy = Session["username"].ToString();
                #endregion
                if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    #region check dup
                    string strCheckDup = string.Empty;
                    strCheckDup = " and person_thai_name = '" + strperson_thai_name.Trim() + "' and person_thai_surname= '" +
                                                  strperson_thai_surname.Trim() + "' and sp_person_code<>'" + strsp_person_code.Trim() + "' ";
                    if (!oPerson_special.SP_PERSON_SPECIAL_SEL(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript =
                                "alert(\"ไม่สามารถแก้ไขข้อมูลได้ เนื่องจาก" +
                                "\\nข้อมูลบุคลากร : " + strperson_thai_name.Trim() + "  " + strperson_thai_surname.Trim() +
                                "\\nซ้ำ\");\n";
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region edit
                    if (!blnDup)
                    {
                        if (oPerson_special.SP_PERSON_SPECIAL_UPD(strsp_person_code, strtitle_code, strperson_thai_name, strperson_thai_surname,
                            strperson_id, strperson_acc ,strperson_bank_code , strdirector_code, strunit_code , strwork_code , strperson_birth , strperson_password,  
                            strperson_email , strperson_remark , strC_active, strUpdatedBy , ref strMessage))
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
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "chkdup", strScript, true);
                    }
                    #endregion
                }
                else
                {
                    #region check dup
                    string strCheckDup = string.Empty;
                    strCheckDup = " and person_thai_name = '" + strperson_thai_name.Trim() + "' and person_thai_surname= '" + strperson_thai_surname.Trim() + "' ";
                    if (!oPerson_special.SP_PERSON_SPECIAL_SEL(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript =
                                "alert(\"ไม่สามารถแก้ไขข้อมูลได้ เนื่องจาก" +
                                "\\nข้อมูลบุคลากร : " + strperson_thai_name.Trim() + "  " + strperson_thai_surname.Trim() +
                                "\\nซ้ำ\");\n";
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region insert
                    if (!blnDup)
                    {


                        if (oPerson_special.SP_PERSON_SPECIAL_INS(strsp_person_code, strtitle_code, strperson_thai_name, strperson_thai_surname,
                            strperson_id, strperson_acc, strperson_bank_code, strdirector_code, strunit_code, strwork_code, strperson_birth, strperson_password,
                            strperson_email, strperson_remark, strC_active, strCreatedBy, ref strMessage))
                        {
                            string strGetcode = " and person_thai_name = '" + strperson_thai_name.Trim() + "' and person_thai_surname = '" + strperson_thai_surname + "' ";
                            if (!oPerson_special.SP_PERSON_SPECIAL_SEL(strGetcode, ref ds, ref strMessage))
                            {
                                lblError.Text = strMessage;
                            }
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                strsp_person_code = ds.Tables[0].Rows[0]["sp_person_code"].ToString();
                            }
                            ViewState["sp_person_code"] = strsp_person_code;
                            txtsp_person_code.Text = ViewState["sp_person_code"].ToString();
                            blnResult = true;
                        }
                        else
                        {
                            lblError.Text = strMessage.ToString();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "close", strScript, true);
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
                oPerson_special.Dispose();
            }
            return blnResult;
        }

        private void imgSaveOnly_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (saveData())
            {
                MsgBox("บันทึกข้อมูลสมบูรณ์");
                string strScript1 = "ClosePopUpListPost('" + ViewState["page"].ToString() + "','1');";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
            }
        }

        private void setData()
        {
            cPerson_special oPerson_special = new cPerson_special();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            #region clear Data
            //Tab 1 
            string strsp_person_code = string.Empty,
                strtitle_code = string.Empty,
                strperson_thai_name = string.Empty,
                strperson_thai_surname = string.Empty,
                strperson_id = string.Empty,
                strperson_acc = string.Empty,
                strperson_bank_code = string.Empty,
                strunit_code = string.Empty,
                strwork_code = string.Empty,
                strperson_birth = string.Empty,
                strperson_password = string.Empty,
                strdirector_code = string.Empty,             
                strperson_email = string.Empty,
                strperson_remark = string.Empty, 
                strC_active = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty;

            #endregion
            try
            {
                strCriteria = " and sp_person_code = '" + ViewState["sp_person_code"].ToString() + "' ";
                if (!oPerson_special.SP_PERSON_SPECIAL_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        //Tab 1 
                        strsp_person_code = ds.Tables[0].Rows[0]["sp_person_code"].ToString();
                        strtitle_code = ds.Tables[0].Rows[0]["title_code"].ToString();
                        strperson_thai_name = ds.Tables[0].Rows[0]["person_thai_name"].ToString();
                        strperson_thai_surname = ds.Tables[0].Rows[0]["person_thai_surname"].ToString();

                        strperson_id = ds.Tables[0].Rows[0]["person_id"].ToString();
                        strperson_acc = ds.Tables[0].Rows[0]["person_acc"].ToString();
                        strperson_bank_code = ds.Tables[0].Rows[0]["person_bank_code"].ToString();
                        strdirector_code = ds.Tables[0].Rows[0]["director_code"].ToString();
                        strunit_code = ds.Tables[0].Rows[0]["unit_code"].ToString();
                        strwork_code = ds.Tables[0].Rows[0]["work_code"].ToString();
                        strperson_birth = ds.Tables[0].Rows[0]["person_birth"].ToString();
                        strperson_email = ds.Tables[0].Rows[0]["person_email"].ToString();
                        strperson_remark = ds.Tables[0].Rows[0]["person_remark"].ToString();

                        strC_active = ds.Tables[0].Rows[0]["c_active"].ToString();
                        strCreatedBy = ds.Tables[0].Rows[0]["c_created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["d_created_date"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();


                        #endregion

                        #region set Control

                        txtsp_person_code.Text = strsp_person_code;
                        Session["sp_person_code"] = strsp_person_code;
                        InitcboTitle();
                        if (cboTitle.Items.FindByValue(strtitle_code) != null)
                        {
                            cboTitle.SelectedIndex = -1;
                            cboTitle.Items.FindByValue(strtitle_code).Selected = true;
                        }
                        txtperson_thai_name.Text = strperson_thai_name;
                        txtperson_thai_surname.Text = strperson_thai_surname;

                        txtperson_id.Text = strperson_id;

                        txtperson_acc.Text = strperson_acc ;

                        InitcboBank();
                        if (cboBank.Items.FindByValue(strperson_bank_code) != null)
                        {
                            cboBank.SelectedIndex = -1;
                            cboBank.Items.FindByValue(strperson_bank_code).Selected = true;
                        }

                        InitcboDirector();
                        if (cboDirector.Items.FindByValue(strdirector_code) != null)
                        {
                            cboDirector.SelectedIndex = -1;
                            cboDirector.Items.FindByValue(strdirector_code).Selected = true;
                        }

                        InitcboUnit();
                        if (cboUnit.Items.FindByValue(strunit_code) != null)
                        {
                            cboUnit.SelectedIndex = -1;
                            cboUnit.Items.FindByValue(strunit_code).Selected = true;
                        }

                        InitcboWork();
                        if (cboWork.Items.FindByValue(strwork_code) != null)
                        {
                            cboWork.SelectedIndex = -1;
                            cboWork.Items.FindByValue(strwork_code).Selected = true;
                        }

                        txtperson_birth.Text = cCommon.CheckDate(strperson_birth);
                        txtperson_email.Text = strperson_email ;
                        txtperson_remark.Text = strperson_remark;

                        txtUpdatedBy.Text = strUpdatedBy;
                        txtUpdatedDate.Text = strUpdatedDate;

                        if (strC_active.Equals("Y"))
                        {
                            chkStatus.Checked = true;
                        }
                        else
                        {
                            chkStatus.Checked = false;
                        }

                        #endregion
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }

        protected void BtnR1_Click(object sender, EventArgs e)
        {
            //BindGridView1();
        }

        protected void BtnR2_Click(object sender, EventArgs e)
        {
            //BindGridView2();
        }

        protected void BtnR3_Click(object sender, EventArgs e)
        {
            //BindGridView3();
        }

        protected void cboDirector_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitcboUnit();
        }

        protected void cboYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitcboDirector();
        }


    }
}