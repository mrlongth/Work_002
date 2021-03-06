﻿using System;
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

namespace myWeb.App_Control.cheque
{
    public partial class cheque_control : PageBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
                  lblError.Text = "";
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/save2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/save.jpg'");

                #region set QueryString
                if (Request.QueryString["cheque_code"] != null)
                {
                    ViewState["cheque_code"] = Request.QueryString["cheque_code"].ToString();
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
                    Session["menupopup_name"] = "เพิ่มข้อมูลเช็ค";
                    ViewState["page"] = Request.QueryString["page"];
                    txtcheque_code.ReadOnly = false;
                    txtcheque_code.CssClass = "textbox";
                    chkStatus.Checked = true;
                }

                else if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    Session["menupopup_name"] =  "แก้ไขข้อมูลเช็ค";
                    setData();
                    txtcheque_code.ReadOnly = true;
                    txtcheque_code.CssClass = "textboxdis";
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

                InitcboCheque();
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

        private void InitcboCheque()
        {
            cCommon oCommon = new cCommon();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strCode = cboChequeBank.SelectedValue;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            strCriteria = " Select * from  cheque_bank ";
            if (oCommon.SEL_SQL(strCriteria, ref ds, ref strMessage))
            {
                dt = ds.Tables[0];
                cboChequeBank.Items.Clear();
                cboChequeBank.Items.Add(new ListItem("---- กรุณาเลือกข้อมูล ----", ""));
              
                int i;
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    cboChequeBank.Items.Add(new ListItem(dt.Rows[i]["cheque_acc_name"].ToString(), dt.Rows[i]["cheque_bank_code"].ToString()));
                }
                if (cboChequeBank.Items.FindByValue(strCode) != null)
                {
                    cboChequeBank.SelectedIndex = -1;
                    cboChequeBank.Items.FindByValue(strCode).Selected = true;
                }
            }
        }

        private bool saveData()
        {
            bool blnResult = false;
            bool blnDup = false;
            string strMessage = string.Empty;
            string strcheque_code = string.Empty,
                strcheque_name = string.Empty,
                strcheque_desc = string.Empty,
                strcheque_bank_code = string.Empty,
                strActive = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty;
            string strScript = string.Empty;
            cCheque oCheque = new cCheque();
            DataSet ds = new DataSet();
            try
            {
                #region set Data
                strcheque_code = txtcheque_code.Text.Trim();
                strcheque_name = txtcheque_name.Text;
                strcheque_desc = txtcheque_desc.Text;
                strcheque_bank_code = cboChequeBank.SelectedValue;
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
                if (ViewState["mode"].ToString().ToLower().Equals("edit"))
                {
                    #region check dup
                    string strCheckDup = string.Empty;
                    strCheckDup = " and cheque_name = '" + strcheque_name.Trim() + "'  and cheque_desc = '" + strcheque_desc.Trim() + "' and cheque_code <> '" + strcheque_code.Trim() + "' ";
                    if (!oCheque.SP_SEL_CHEQUE(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript =
                                "alert(\"ไม่สามารถแก้ไขข้อมูล เนื่องจากข้อมูล " + strcheque_code.Trim() + " : " + strcheque_name.Trim() + "  ซ้ำ\");\n";
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region edit
                    if (!blnDup)
                    {
                        if (oCheque.SP_UPD_CHEQUE(strcheque_code, strcheque_name,strcheque_desc,strcheque_bank_code, strActive, strUpdatedBy, ref strMessage))
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
                    strCheckDup = " and cheque_code = '" + strcheque_code.Trim() + "' ";
                    if (!oCheque.SP_SEL_CHEQUE(strCheckDup, ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            strScript = 
                                "alert(\"ไม่สามารถเพิ่มข้อมูล เนื่องจากข้อมูล " + strcheque_code.Trim() + " : " + strcheque_name.Trim() + "  ซ้ำ\");\n" ;
                            blnDup = true;
                        }
                    }
                    #endregion
                    #region insert
                    if (!blnDup)
                    {
                        if (oCheque.SP_INS_CHEQUE(strcheque_code, strcheque_name, strcheque_desc, strcheque_bank_code , strActive, strCreatedBy, ref strMessage))
                        {
                            ViewState["cheque_code"] = strcheque_code;
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
                oCheque.Dispose();
            }
            return blnResult;
        }

        private void imgSaveOnly_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (saveData())
            {
                if (ViewState["mode"].ToString().ToLower().Equals("add"))
                {
                    txtcheque_code.Text = string.Empty;
                    txtcheque_name.Text = string.Empty;
                    txtcheque_code.Focus();
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
            cCheque oCheque = new cCheque();
            DataSet ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strcheque_code = string.Empty,
                strcheque_name = string.Empty,
                strcheque_desc = string.Empty,
                strcheque_bank_code = string.Empty,
                strC_active = string.Empty,
                strCreatedBy = string.Empty,
                strUpdatedBy = string.Empty,
                strCreatedDate = string.Empty,
                strUpdatedDate = string.Empty;
            try
            {
                strCriteria = " and cheque_code = '" + ViewState["cheque_code"].ToString() + "' ";
                if (!oCheque.SP_SEL_CHEQUE(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        #region get Data
                        strcheque_code = ds.Tables[0].Rows[0]["cheque_code"].ToString();
                        strcheque_name = ds.Tables[0].Rows[0]["cheque_name"].ToString();
                        strcheque_desc = ds.Tables[0].Rows[0]["cheque_desc"].ToString();
                        strC_active = ds.Tables[0].Rows[0]["c_active"].ToString();
                        strcheque_bank_code = ds.Tables[0].Rows[0]["cheque_bank_code"].ToString();
                        strCreatedBy = ds.Tables[0].Rows[0]["c_created_by"].ToString();
                        strUpdatedBy = ds.Tables[0].Rows[0]["c_updated_by"].ToString();
                        strCreatedDate = ds.Tables[0].Rows[0]["d_created_date"].ToString();
                        strUpdatedDate = ds.Tables[0].Rows[0]["d_updated_date"].ToString();
                        #endregion

                        #region set Control
                        txtcheque_code.Text = strcheque_code;
                        txtcheque_name.Text = strcheque_name;
                        txtcheque_desc.Text = strcheque_desc;
                        if (strC_active.Equals("Y"))
                        {
                            txtcheque_name.ReadOnly = false;
                            txtcheque_name.CssClass = "textbox";
                            chkStatus.Checked = true;
                        }
                        else
                        {
                            txtcheque_name.ReadOnly = true;
                            txtcheque_name.CssClass = "textboxdis";
                            chkStatus.Checked = false;
                        }

                        
                        this.InitcboCheque();
                        if (cboChequeBank.Items.FindByValue(strcheque_bank_code) != null)
                        {
                            cboChequeBank.SelectedIndex = -1;
                            cboChequeBank.Items.FindByValue(strcheque_bank_code).Selected = true;
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

        protected void imgSaveOnly_Click1(object sender, ImageClickEventArgs e)
        {

        }

    }
}