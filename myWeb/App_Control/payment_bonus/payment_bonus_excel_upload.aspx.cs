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

namespace myWeb.App_Control.payment_bonus
{
    public partial class payment_bonus_excel_upload : PageBase
    {

        private string UserGUID
        {
            get
            {
                if (ViewState["UserGUID"] == null)
                {
                    ViewState["UserGUID"] = System.Guid.NewGuid().ToString();
                }
                return ViewState["UserGUID"].ToString();
            }
            set
            {
                ViewState["UserGUID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/Upload2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/Upload.jpg'");
                if (Request.QueryString["ctrl1"] != null)
                {
                    ViewState["ctrl1"] = Request.QueryString["ctrl1"].ToString();
                }
                if (Request.QueryString["item_code"] != null)
                {
                    ViewState["item_code"] = Request.QueryString["item_code"].ToString();
                }
                if (Request.QueryString["year"] != null)
                {
                    ViewState["year"] = Request.QueryString["year"].ToString();
                }
                if (Request.QueryString["pay_year"] != null)
                {
                    ViewState["pay_year"] = Request.QueryString["pay_year"].ToString();
                }
                if (Request.QueryString["pay_month"] != null)
                {
                    ViewState["pay_month"] = Request.QueryString["pay_month"].ToString();
                }
                if (Request.QueryString["pay_item"] != null)
                {
                    ViewState["pay_item"] = Request.QueryString["pay_item"].ToString();
                }
            }
        }

        protected void imgSaveOnly_Click(object sender, ImageClickEventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string strFilename = "~/excel_import/excel_paymen_special_" + DateTime.Now.ToString("yyyyMMddHH-mm-ss") + ".xls";
                FileUpload1.SaveAs(MapPath(strFilename));
                if (SaveData(strFilename))
                {
                    string strScript1 = "window.parent.document.getElementById('" + ViewState["ctrl1"].ToString() + "').value='" + UserGUID + "';" +
                                                       "window.parent.__doPostBack('ctl00$ASPxRoundPanel1$ASPxRoundPanel2$ContentPlaceHolder1$LinkButton1','');ClosePopUp('1');";
                    //string strScript1 = "ClosePopUp('1');";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript1, true);
                }
            }
        }

        private bool SaveData(string strFilename)
        {
            bool boolResult = false;
            var oExcelReader = new cExcelReader();
            var odtExcelAll = new DataTable();
            var objPayment_bonus = new cPayment_bonus();
            try
            {
                InitExcel(ref oExcelReader, Server.MapPath(strFilename));
                oExcelReader.SheetName = "data";
                odtExcelAll = oExcelReader.GetTable("data", "");
                string ppayment_year;
                string ppay_year;
                string ppay_month;
                string ppay_item;
                string pbn_person_id;
                string pbn_person_code;
                string pbn_person_name ;
                string pbn_person_surname ;
                string pitem_code ;
                string pitem_qty  ;
                string pitem_amt ;

                string str_person_id = System.Configuration.ConfigurationSettings.AppSettings["bonus:person_id"];
                string str_person_code = System.Configuration.ConfigurationSettings.AppSettings["bonus:person_code"];
                string str_person_name = System.Configuration.ConfigurationSettings.AppSettings["bonus:person_name"];
                string str_person_surname = System.Configuration.ConfigurationSettings.AppSettings["bonus:person_surname"];
                string str_item_qty = System.Configuration.ConfigurationSettings.AppSettings["bonus:qty"];
                string str_item_amt = System.Configuration.ConfigurationSettings.AppSettings["bonus:amount"];
                
                string pc_created_by;
                string strMassege = string.Empty;
                pc_created_by = Session["username"].ToString();
                objPayment_bonus.SP_IMPORT_PAYMENT_BONUS_DEL(pc_created_by, ref strMassege);
                for (int i = 0; i < odtExcelAll.Rows.Count; i++)
                {
                    ppayment_year = ViewState["year"].ToString();
                    ppay_year = ViewState["pay_year"].ToString();
                    ppay_month = ViewState["pay_month"].ToString();
                    ppay_item = ViewState["pay_item"].ToString();
                    pbn_person_id = Helper.CStr(odtExcelAll.Rows[i][int.Parse(str_person_id)]);
                    pbn_person_code = str_person_code != "null" ? Helper.CStr(odtExcelAll.Rows[i][int.Parse(str_person_code)]) : "";
                    pbn_person_name = str_person_name != "null" ? Helper.CStr(odtExcelAll.Rows[i][int.Parse(str_person_name)]) : "";
                    pbn_person_surname = Helper.CStr(odtExcelAll.Rows[i][int.Parse(str_person_surname)]);
                    pitem_qty =  str_item_qty != "null" ? Helper.CStr(odtExcelAll.Rows[i][int.Parse(str_item_qty)]) : "1";
                    pitem_amt = Helper.CStr(odtExcelAll.Rows[i][int.Parse(str_item_amt)]);
                    pitem_code = ViewState["item_code"].ToString();
                    if (!string.IsNullOrEmpty(pbn_person_name) && !string.IsNullOrEmpty(pbn_person_surname))
                    {
                        objPayment_bonus.SP_IMPORT_PAYMENT_BONUS_INS(ppayment_year,ppay_year ,ppay_month, ppay_item, pbn_person_id, pbn_person_code, pbn_person_name, pbn_person_surname, 
                            pitem_code, pitem_qty, pitem_amt, pc_created_by, ref strMassege);
                    }
                }
                boolResult = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
            finally
            {
                objPayment_bonus.Dispose();
                oExcelReader.Dispose();
                odtExcelAll.Dispose();
            }
            return boolResult;
        }

        private void InitExcel(ref cExcelReader exr, string pPath)
        {
            exr.ExcelFilename = pPath;
            exr.Headers = true;
            exr.MixedData = true;
            exr.KeepConnectionOpen = true;
            //exr.Open()
        }

    }
}
