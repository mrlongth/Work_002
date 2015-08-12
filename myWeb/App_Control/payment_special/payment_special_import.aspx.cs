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
using Aware.WebControls;
using myDLL;

namespace myWeb.App_Control.payment_special
{
    public partial class payment_special_import : PageBase
    {
        private string strPrefixCtr = "ctl00$ASPxRoundPanel1$ASPxRoundPanel2$ContentPlaceHolder1$";

        public static string getNumber(object pNumber)
        {
            string strNumber = pNumber.ToString();
            if (pNumber.ToString().Length > 0)
            {
                strNumber = String.Format("{0:#,##0.00}", decimal.Parse(pNumber.ToString()));
            }
            return strNumber;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            lblError.Text = "";
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/button/save_add2.png'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/button/save_add.png'");

                imgCancel.Attributes.Add("onMouseOver", "src='../../images/button/cancel2.png'");
                imgCancel.Attributes.Add("onMouseOut", "src='../../images/button/cancel.png'");

                imgImport.Attributes.Add("onMouseOver", "src='../../images/button/import2.png'");
                imgImport.Attributes.Add("onMouseOut", "src='../../images/button/import.png'");

                string strYear = ((DataSet)Application["xmlconfig"]).Tables["default"].Rows[0]["yearnow"].ToString();

                imgList_item.Attributes.Add("onclick", "OpenPopUp('750px','400px','93%','ค้นหาข้อมูลรายการค่าดำเนินงาน' ,'../lov/item_lov.aspx?year='+document.forms[0]." + strPrefixCtr +
                              "cboYear.options[document.forms[0]." + strPrefixCtr + "cboYear.selectedIndex].value+" +
                              "'&item_code='+document.forms[0]." + strPrefixCtr + "txtitem_code.value+" +
                              "'&item_name='+document.forms[0]." + strPrefixCtr + "txtitem_name.value+" +
                              "'&ctrl1=" + txtitem_code.ClientID + "&ctrl2=" + txtitem_name.ClientID + "&item_type=D&from=payment_special&is_special=1', '1');return false;");

                imgClear_item.Attributes.Add("onclick", "document.forms[0]." + strPrefixCtr + "txtitem_code.value='';" +
                                        "document.forms[0]." + strPrefixCtr + "txtitem_name.value=''; return false;");

                ViewState["sort"] = "sp_person_code";
                ViewState["direction"] = "ASC";
                InitcboRound();
                GridView1.Visible = true;
                imgSaveOnly.Visible = false;
                imgCancel.Visible = false;
                imgImport.Visible = true;

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
            //InitcboDirector();
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

        private void InitcboRound()
        {
            var oPayment_special_round = new cPayment_special_round();
            var ds = new DataSet();
            string strMessage = string.Empty, strCriteria = string.Empty;
            string strPay_Year = string.Empty;
            string strPay_Semeter = string.Empty;
            string strPay_Item = string.Empty;
            string strYear = cboYear.SelectedValue;
            string strSpRoundId = hddsp_round_id.Value;
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
                        strSpRoundId = ds.Tables[0].Rows[0]["sp_round_id"].ToString();
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

                    hddsp_round_id.Value = strSpRoundId;
                    InitcboYear();
                    if (cboPay_Year.Items.FindByValue(strYear) != null)
                    {
                        cboPay_Year.SelectedIndex = -1;
                        cboPay_Year.Items.FindByValue(strPay_Year).Selected = true;
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
            //  this.imgSaveOnly.Click += new System.Web.UI.ImageClickEventHandler(this.imgSaveOnly_Click);
        }
        #endregion

        private bool saveData()
        {
            bool blnResult = false;
            string strMessage = string.Empty;
            string strActive = string.Empty, strCreatedBy = string.Empty;
            string pitem_code = string.Empty;
            string pcomments_sub = string.Empty;
            int i;
            var oPayment_special = new cPayment_special();
            try
            {
                strActive = "Y";
                strCreatedBy = Session["username"].ToString();
                if (RadioButtonList1.SelectedValue == "A")
                {
                    pitem_code = txtitem_code.Text;
                }
                else
                {
                    pitem_code = txtitem_code.Text;
                }

                GridViewRow gviewRow;

                for (i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    gviewRow = GridView1.Rows[i];
                    var hddunit_code = (HiddenField)gviewRow.FindControl("hddunit_code");
                    var hddwork_code = (HiddenField)gviewRow.FindControl("hddwork_code");
                    var txtitem_qty = (AwNumeric)gviewRow.FindControl("txtitem_qty");
                    var txtmoney_credit = (AwNumeric)gviewRow.FindControl("txtmoney_credit");
                    var txtperson_id = (TextBox)gviewRow.FindControl("txtperson_id");
                    var CheckBox1 = (CheckBox)gviewRow.FindControl("CheckBox1");

                    if (CheckBox1.Checked)
                    {
                        if (!oPayment_special.SP_IMPORT_PAYMENT_SPECIAL_SAVE(hddsp_round_id.Value, txtperson_id.Text, hddunit_code.Value,
                            hddwork_code.Value, pitem_code, txtitem_qty.Value.ToString(), txtmoney_credit.Value.ToString(), strCreatedBy, ref strMessage))
                        {
                            lblError.Text = strMessage + " : " + txtperson_id.Text;
                            return false;
                        }

                    }
                }


                blnResult = true;
                MsgBox("บันทึกข้อมูลสมบูรณ์");
            }
            catch (Exception ex)
            {
                blnResult = false;
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                oPayment_special.Dispose();
            }
            return blnResult;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.Header))
            {
                //Find the checkbox control in header and add an attribute
                ((CheckBox)e.Row.FindControl("cbSelectAll")).Attributes.Add("onclick", "javascript:SelectAll('" +
                        ((CheckBox)e.Row.FindControl("cbSelectAll")).ClientID + "')");

                for (int iCol = 0; iCol < e.Row.Cells.Count; iCol++)
                {
                    e.Row.Cells[iCol].Attributes.Add("class", "table_h");
                    e.Row.Cells[iCol].Wrap = false;
                    ViewState["sumall"] = "0.00";
                }
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

                ((CheckBox)e.Row.FindControl("CheckBox1")).Attributes.Add("onclick", "ToggleValidator(this);");
                
                Label lblNo = (Label)e.Row.FindControl("lblNo");
                int nNo = (GridView1.PageSize * GridView1.PageIndex) + e.Row.RowIndex + 1;
                lblNo.Text = nNo.ToString();
                AwNumeric txtmoney_credit = (AwNumeric)e.Row.FindControl("txtmoney_credit");
                txtmoney_credit.Attributes.Add("onchange", "funcsum();");
                
                RequiredFieldValidator reqperson_id = (RequiredFieldValidator)e.Row.FindControl("reqperson_id");
                reqperson_id.ErrorMessage = "กรุณาเลือกเลขที่ประจำตัวประชาชน#" + (e.Row.RowIndex + 1);
                


                ViewState["sumall"] = String.Format("{0:#,##0.00}", decimal.Parse(ViewState["sumall"].ToString()) + decimal.Parse(txtmoney_credit.Text));
            }
            else if (e.Row.RowType.Equals(DataControlRowType.Footer))
            {
                AwNumeric txtsummoney_credit = (AwNumeric)e.Row.FindControl("txtsummoney_credit");
                txtsummoney_credit.Value = ViewState["sumall"].ToString();
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
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }

        protected void ClearData()
        {


            imgCancel.Visible = true;
            txtitem_code.Text = string.Empty;
            txtitem_name.Text = string.Empty;

            txtitem_code.Enabled = true;
            txtitem_name.Enabled = true;
            imgList_item.Enabled = true;
            imgClear_item.Enabled = true;

            imgImport.Visible = true;
            GridView1.Visible = false;
            imgSaveOnly.Visible = false;

        }

        protected void imgCancel_Click(object sender, ImageClickEventArgs e)
        {
            ClearData();
        }

        protected void cboYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void imgImport_Click(object sender, ImageClickEventArgs e)
        {
            UpdatePanel oUpdatePanel;
            string strScript = string.Empty;
            strScript = "OpenPopUp('500px','200px','80%','อัพโหลด Excel File ค่าดำเนินงาน' ,'payment_special_excel_upload.aspx?" +
                                                    "&ctrl1=" + hddGUID.ClientID +
                                                    "&item_code='+document.forms[0]." + strPrefixCtr + "txtitem_code.value+'" +
                                                    "&from=payment_special" + cboYear.SelectedValue +
                                                    "&sp_round_id='+document.forms[0]." + strPrefixCtr + "hddsp_round_id.value+'" +
                                                    "&is_special=1&show=1', '1');";
            oUpdatePanel = (UpdatePanel)this.Master.FindControl("updatePanel1");
            ScriptManager.RegisterClientScriptBlock(oUpdatePanel, oUpdatePanel.GetType(), "MessageBox", strScript, true);
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            BindGridView();
        }


        private void BindGridView()
        {
            var oPayment_special = new cPayment_special();
            DataSet ds = new DataSet();
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            int i;
            string strRoundId = hddsp_round_id.Value;
            string stritem_code = txtitem_code.Text;
            string pc_created_by = Session["username"].ToString();
            try
            {
                strCriteria = " and  item_code= '" + stritem_code + "' " +
                                        " and sp_round_id=" + strRoundId + " " +
                                        " and c_created_by='" + pc_created_by + "' ";

                if (!oPayment_special.SP_IMPORT_PAYMENT_SPECIAL_SEL(strCriteria, ref ds, ref strMessage))
                {
                    lblError.Text = strMessage;
                }
                else
                {
                    ds.Tables[0].DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                    ds.Tables[0].Columns.Add("item_has");
                    for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                    {
                        ds.Tables[0].Rows[i]["item_has"] = "N";
                    }
                    ds.Tables[0].AcceptChanges();
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                    imgSaveOnly.Visible = true;
                    imgCancel.Visible = true;
                    imgImport.Visible = false;

                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                oPayment_special.Dispose();
                ds.Dispose();
            }
        }


        protected void imgSaveOnly_Click(object sender, ImageClickEventArgs e)
        {
            if (saveData())
            {
                ClearData();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RegisterScript", "RegisterScript();", true);

        }


    }
}