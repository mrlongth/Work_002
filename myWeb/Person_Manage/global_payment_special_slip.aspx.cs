using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Threading;
using System.Text;
using myDLL;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace myWeb.Person_Manage
{
    public partial class global_payment_special_slip : GlobalPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitcboPay_Year();
            }
        }

        #region private function

        private void InitcboPay_Year()
        {
            var oCommon = new cCommon();
            var ds = new DataSet();
            string strSQL = " SELECT pay_year FROM payment_round_special where [round_status]='C' Group by pay_year order by pay_year";
            oCommon.SEL_SQL(strSQL, ref ds, ref _strMessage);
            string strYear = string.Empty;
            strYear = cboPay_Year.SelectedValue;
            if (ds.Tables[0].Rows.Count > 0)
            {
                strYear = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["pay_year"].ToString();
            }
            DataTable odt;
            int i;
            cboPay_Year.Items.Clear();
            odt = ds.Tables[0];
            for (i = 0; i <= odt.Rows.Count - 1; i++)
            {
                cboPay_Year.Items.Add(new ListItem(odt.Rows[i]["pay_year"].ToString(), odt.Rows[i]["pay_year"].ToString()));
            }
            if (cboPay_Year.Items.FindByValue(strYear) != null)
            {
                cboPay_Year.SelectedIndex = -1;
                cboPay_Year.Items.FindByValue(strYear).Selected = true;
            }
            InitcboPay_Semeter();
        }

        private void InitcboPay_Semeter()
        {
            var oCommon = new cCommon();
            var ds = new DataSet();
            string strYear = string.Empty;
            strYear = cboPay_Year.SelectedValue;

            string strSQL = " SELECT pay_semeter FROM [payment_round_special] Where [round_status]='C' and pay_year = '" + strYear + "' Group by pay_semeter order by pay_semeter";
            oCommon.SEL_SQL(strSQL, ref ds, ref _strMessage);

            string strSemeter = string.Empty;
            if (ds.Tables[0].Rows.Count > 0)
            {
                strSemeter = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["pay_semeter"].ToString();
            }
          
            cboPay_Semeter.Items.Clear();
            for (var i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                cboPay_Semeter.Items.Add(new ListItem(ds.Tables[0].Rows[i]["pay_semeter"].ToString(), ds.Tables[0].Rows[i]["pay_semeter"].ToString()));
            }
            if (cboPay_Semeter.Items.FindByValue(strSemeter) != null)
            {
                cboPay_Semeter.SelectedIndex = -1;
                cboPay_Semeter.Items.FindByValue(strSemeter).Selected = true;
            }
            InitcboPay_Item();
        }


        private void InitcboPay_Item()
        {
            var oCommon = new cCommon();
            var ds = new DataSet();
            string strYear = string.Empty;
            string strSemeter = string.Empty;
            string strPayItem = string.Empty;
            strYear = cboPay_Year.SelectedValue;
            strSemeter = cboPay_Semeter.SelectedValue;
            strPayItem = string.Empty;
            string strSQL = " SELECT pay_item FROM [payment_round_special] Where [round_status]='C' and pay_year = '" + strYear + "'  and pay_semeter = '" + strSemeter + "'  Group by pay_item order by pay_item";
            oCommon.SEL_SQL(strSQL, ref ds, ref _strMessage);

            if (ds.Tables[0].Rows.Count > 0)
            {
                strPayItem = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["pay_item"].ToString();
            }
            cboPay_Item.Items.Clear();
            for (var i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                cboPay_Item.Items.Add(new ListItem(ds.Tables[0].Rows[i]["pay_item"].ToString(), ds.Tables[0].Rows[i]["pay_item"].ToString()));
            }
            if (cboPay_Item.Items.FindByValue(strPayItem) != null)
            {
                cboPay_Item.SelectedIndex = -1;
                cboPay_Item.Items.FindByValue(strPayItem).Selected = true;
            }
        }



        #endregion

        protected void imgPrint_Click(object sender, ImageClickEventArgs e)
        {
            //divIframeShow.Height = Unit.Pixel(10);
            PrintData();
         }

        protected void PrintData()
        {
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            string strPay_Year = string.Empty;
            string strPay_Semeter = string.Empty;
            string strPay_Item = string.Empty;
            string strPerson_code = string.Empty;
            string strReport_code = string.Empty;
            string strScript = string.Empty;
            strPay_Year = cboPay_Year.SelectedValue;
            strPay_Semeter = cboPay_Semeter.SelectedValue;
            strPay_Item = cboPay_Item.SelectedValue;
            strPerson_code = base.PersonCode;

          
            if (!strPay_Year.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_year='" + strPay_Year + "') ";
            }

            if (!strPay_Semeter.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_semeter='" + strPay_Semeter + "') ";
            }

            if (!strPay_Item.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_item='" + strPay_Item + "') ";
            }

            if (!strPerson_code.Equals(""))
            {
                strCriteria = strCriteria + "  And sp_person_code='" + strPerson_code + "' ";
            }

            Session["criteria"] = strCriteria;

            var oPayment_special = new cPayment_special();
            var ds = new DataSet();
            if (!oPayment_special.SP_PAYMENT_SPECIAL_HEAD_SEL(strCriteria, ref ds, ref strMessage))
            {
                lblError.Text = strMessage;
            }
            else
            {

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["myds"] = null;
                    Session["mydsC"] = null;
                    Session["mydsD"] = null;

                    strReport_code = "Rep_payment_special_slip";


                    strScript = "window.open(\"global_payment_special_report_slip.aspx?report_code=" + strReport_code +  "\", \"_blank\");\n";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript, true);

                }
                else
                {
                    strScript = "alert('ไม่พบข้อมูล โปรดตรวจสอบเงื่อนไขในการแสดงผล');";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript, true);
                    return;
                }

            }

        }

        protected void PrintIframe()
        {
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            string strPay_Year = string.Empty;
            string strPay_Semeter = string.Empty;
            string strPay_Item = string.Empty;
            string strPerson_code = string.Empty;
            string strReport_code = string.Empty;
            string strScript = string.Empty;
            strPay_Year = cboPay_Year.SelectedValue;
            strPay_Semeter = cboPay_Semeter.SelectedValue;
            strPay_Item = cboPay_Item.SelectedValue;
            strPerson_code = base.PersonCode;


            if (!strPay_Year.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_year='" + strPay_Year + "') ";
            }

            if (!strPay_Semeter.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_semeter='" + strPay_Semeter + "') ";
            }

            if (!strPay_Item.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_item='" + strPay_Item + "') ";
            }

            if (!strPerson_code.Equals(""))
            {
                strCriteria = strCriteria + "  And sp_person_code='" + strPerson_code + "' ";
            }

            Session["criteria"] = strCriteria;
           
            var oPayment_special = new cPayment_special();
            var ds = new DataSet();
            if (!oPayment_special.SP_PAYMENT_SPECIAL_HEAD_SEL(strCriteria, ref ds, ref strMessage))
            {
                lblError.Text = strMessage;
            }
            else
            {

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["myds"] = null;
                    Session["mydsC"] = null;
                    Session["mydsD"] = null;


                    strReport_code = "Rep_payment_special_slip";
                    string strUrl = "global_payment_special_report_slip.aspx?report_code=" + strReport_code;

                    strScript += "var url = \"" + strUrl + "&\";";
                    strScript += "url = url + new Date().getTime();";
                    strScript += "var ctrIframeShow = document.getElementById('IframeShow');";
                    strScript += "$('#IframeShow').attr('src' , url );";
                   
                    strScript += "$('#divLoad').show();";
                    strScript += "if (ctrIframeShow.onload == null) {";
                    strScript += "ctrIframeShow.onload = function () { $('#divLoad').hide(); $('#divIframeShow').show(); };";
                    strScript += "if (window.attachEvent) {ctrIframeShow.attachEvent('onload', ctrIframeShow.onload);}} ";
                 
                    //strScript = "window.open(\"global_payment_report_slip.aspx?report_code=" + strReport_code +
                    //                                   "&months=" + cboPay_Month.Text + "&year=" + cboPay_Year.Text + "\", \"_blank\");\n";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript, true);
                }
                else
                {
                    strScript = "alert('ไม่พบข้อมูล โปรดตรวจสอบเงื่อนไขในการแสดงผล');";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenPage", strScript, true);
                    return;
                }

            }

        }


        protected void cboPay_Year_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.InitcboPay_Semeter();
        }

        protected void cboPay_Semeter_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.InitcboPay_Item();
        }

      





    }
}
