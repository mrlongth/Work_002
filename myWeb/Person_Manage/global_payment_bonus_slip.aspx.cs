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
    public partial class global_payment_bonus_slip : GlobalPageBase
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
            string strSQL = " SELECT pay_year FROM payment_round " +
                " Where [round_status] = 'C' and pay_year in (select pay_year from view_payment_back_head where person_code = '" + this.PersonCode + "' )" +
                " Group by pay_year order by pay_year";
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
            InitcboPay_Month();
        }

        private void InitcboPay_Month()
        {
            cCommon oCommon = new cCommon();
            DataSet ds = new DataSet();
            string strYear = string.Empty;
            strYear = cboPay_Year.SelectedValue;

            string strSQL = " SELECT pay_month FROM [payment_round] Where [round_status]='C' and pay_year = '" + strYear + "' " +
                " And pay_month in (select pay_month from view_payment_bonus_head where bn_person_code = '" + this.PersonCode + "'  and pay_year = '" + strYear + "')" +
                " Group by pay_month order by pay_month";
            oCommon.SEL_SQL(strSQL, ref ds, ref _strMessage);

            string strMonth = string.Empty;

            strMonth = ds.Tables[0].Rows.Count.ToString();
            if (int.Parse(strMonth) < 10)
            {
                strMonth = "0" + strMonth;
            }
            else
            {
                strMonth = ds.Tables[0].Rows.Count.ToString();
            }

            DataTable odt;
            int i;
            cboPay_Month.Items.Clear();
            odt = ((DataSet)Application["xmlconfig"]).Tables["cboMonth"];
            for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
            {
                for (i = 0; i <= 11; i++)
                {
                    if (i + 1 == int.Parse(ds.Tables[0].Rows[j]["pay_month"].ToString()))
                    {
                        cboPay_Month.Items.Add(new ListItem(odt.Rows[i]["Text"].ToString(), odt.Rows[i]["Value"].ToString()));
                        break;
                    }
                }
            }
            if (cboPay_Month.Items.FindByValue(strMonth) != null)
            {
                cboPay_Month.SelectedIndex = -1;
                cboPay_Month.Items.FindByValue(strMonth).Selected = true;
            }
        }


        #endregion

        protected void imgPrint_Click(object sender, ImageClickEventArgs e)
        {
            //divIframeShow.Height = Unit.Pixel(10);
            PrintIframe();
        }

        protected void PrintData()
        {
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            string strPay_Year = string.Empty;
            string strPay_Month = string.Empty;
            string strPerson_code = string.Empty;
            string strReport_code = string.Empty;
            string strScript = string.Empty;
            strPay_Year = cboPay_Year.SelectedValue;
            strPay_Month = cboPay_Month.SelectedValue;
            strPerson_code = base.PersonCode;

            if (!strPay_Year.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_year='" + strPay_Year + "') ";
            }

            if (!strPay_Month.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_month='" + strPay_Month + "') ";
            }

            if (!strPerson_code.Equals(""))
            {
                strCriteria = strCriteria + "  And bn_person_code='" + strPerson_code + "' ";
            }

            Session["criteria"] = strCriteria;

            var oPayment_bonus = new cPayment_bonus();
            var ds = new DataSet();
            if (!oPayment_bonus.SP_PAYMENT_BONUS_HEAD_SEL(strCriteria, ref ds, ref strMessage))
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

                    strReport_code = "Rep_payment_back_slip";


                    strScript = "window.open(\"global_payment_bonus_report_slip.aspx?report_code=" + strReport_code + "\", \"_blank\");\n";
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
            string strPay_Month = string.Empty;
            string strPerson_code = string.Empty;
            string strReport_code = string.Empty;
            string strScript = string.Empty;
            strPay_Year = cboPay_Year.SelectedValue;
            strPay_Month = cboPay_Month.SelectedValue;
            strPerson_code = base.PersonCode;


            if (!strPay_Year.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_year='" + strPay_Year + "') ";
            }

            if (!strPay_Month.Equals(""))
            {
                strCriteria = strCriteria + "  And  (pay_month='" + strPay_Month + "') ";
            }

            if (!strPerson_code.Equals(""))
            {
                strCriteria = strCriteria + "  And bn_person_code='" + strPerson_code + "' ";
            }

            Session["criteria"] = strCriteria;

            var oPayment_bonus = new cPayment_bonus();
            var ds = new DataSet();
            if (!oPayment_bonus.SP_PAYMENT_BONUS_HEAD_SEL(strCriteria, ref ds, ref strMessage))
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


                    strReport_code = "Rep_payment_bonus_slip";
                    string strUrl = "global_payment_bonus_report_slip.aspx?report_code=" + strReport_code + "&months="
                                    + cboPay_Month.Text + "&year=" + cboPay_Year.Text;

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
            this.InitcboPay_Month();
        }

      
    }
}
