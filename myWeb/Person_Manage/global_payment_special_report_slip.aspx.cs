﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using myDLL;
using System.Net;

namespace myWeb.Person_Manage
{

    public partial class global_payment_special_report_slip : GlobalPageBase
    {

        protected CrystalDecisions.CrystalReports.Engine.ReportDocument rptSource = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
        protected CrystalDecisions.CrystalReports.Engine.Tables crTables;
        protected CrystalDecisions.Shared.TableLogOnInfo crTableLogOnInfo;
        protected CrystalDecisions.Shared.ConnectionInfo crConnectionInfo = new CrystalDecisions.Shared.ConnectionInfo();
        protected CrystalDecisions.Shared.ParameterValues crParameterValues;
        protected CrystalDecisions.Shared.ParameterDiscreteValue crParameterDiscreteValue;
        protected CrystalDecisions.CrystalReports.Engine.ParameterFieldDefinitions crParameterFieldDefinitions;
        protected CrystalDecisions.CrystalReports.Engine.ParameterFieldDefinition crParameterFieldDefinition;

        string strServername = System.Configuration.ConfigurationSettings.AppSettings["servername"];
        string strDbname = System.Configuration.ConfigurationSettings.AppSettings["dbname"];
        string strDbuser = System.Configuration.ConfigurationSettings.AppSettings["dbuser"];
        string strDbpassword = System.Configuration.ConfigurationSettings.AppSettings["dbpassword"];

        public int myCount
        {
            get
            {
                if (Session["myCount"] != null)
                {
                    return (int)(Session["myCount"]);
                }
                else
                {
                    return 0;
                }
            }
            set { Session["myCount"] = value; }
        }

        public DataSet myds
        {
            get
            {
                return (DataSet)(Session["myds"]);
            }
            set { Session["myds"] = value; }
        }

        public DataSet mydsC
        {
            get
            {
                return (DataSet)(Session["mydsC"]);
            }
            set { Session["mydsC"] = value; }
        }

        public DataSet mydsD
        {
            get
            {
                return (DataSet)(Session["mydsD"]);
            }
            set { Session["mydsD"] = value; }
        }


        public string ReportDirectoryTemp
        {
            get
            {
                if (ViewState["ReportDirectoryTemp"] == null)
                {
                    try
                    {
                        ViewState["ReportDirectoryTemp"] = System.Configuration.ConfigurationManager.AppSettings["ReportDirectoryTemp"];

                    }
                    catch
                    {
                        ViewState["ReportDirectoryTemp"] = string.Empty;
                    }
                }
                return ViewState["ReportDirectoryTemp"].ToString();
            }
            set { ViewState["ReportDirectoryTemp"] = value; }
        }

        public short ReportAliveTime
        {
            get
            {
                if (ViewState["ReportAliveTime"] == null)
                {
                    try
                    {
                        ViewState["ReportAliveTime"] = System.Configuration.ConfigurationManager.AppSettings["ReportAliveTime"];
                    }
                    catch
                    {
                        ViewState["ReportAliveTime"] = string.Empty;
                    }
                }
                return short.Parse(ViewState["ReportAliveTime"].ToString(), System.Globalization.NumberStyles.Integer, null);
            }
            set { ViewState["ReportAliveTime"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                getQueryString();
                Retive_Rep_payment_slip();
                crConnectionInfo.DatabaseName = strDbname;
                crConnectionInfo.ServerName = strServername;
                crConnectionInfo.UserID = strDbuser;
                crConnectionInfo.Password = strDbpassword;
                crTables = rptSource.Database.Tables;

                //apply logon info
                foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in rptSource.Database.Tables)
                {
                    crTableLogOnInfo = crTable.LogOnInfo;
                    crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                    crTable.ApplyLogOnInfo(crTableLogOnInfo);
                }

                string strReportDirectoryTempPhysicalPath = Server.MapPath(this.ReportDirectoryTemp);
                Helper.DeleteUnusedFile(strReportDirectoryTempPhysicalPath, ReportAliveTime);

                //string strFilename;
                //strFilename = "report_" + DateTime.Now.ToString("yyyyMMddHH-mm-ss-fff");
                //rptSource.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~/temp/") + strFilename + ".pdf");
                //lnkPdfFile.NavigateUrl = "~/temp/" + strFilename + ".pdf";
                //imgPdf.Src = "~/images/icon_pdf.gif";
                //lnkPdfFile.Visible = true;
                //CrystalReportViewer1.ReportSource = rptSource;

                string strFilename = "report_" + DateTime.Now.ToString("yyyyMMddHH-mm-ss-fff");
                string path = "~/temp/" + strFilename + ".pdf";
                rptSource.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath(path));
                //Response.Redirect(path);
                downloadOpenFile(Server.MapPath(path));

            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
            //getQueryString();
            //Retive_Rep_payment_slip();
            //CrystalReportViewer1.ReportSource = rptSource;

            if (IsPostBack)
            {

                getQueryString();
                Retive_Rep_payment_slip();
                crConnectionInfo.DatabaseName = strDbname;
                crConnectionInfo.ServerName = strServername;
                crConnectionInfo.UserID = strDbuser;
                crConnectionInfo.Password = strDbpassword;
                crTables = rptSource.Database.Tables;

                //apply logon info
                foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in rptSource.Database.Tables)
                {
                    crTableLogOnInfo = crTable.LogOnInfo;
                    crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                    crTable.ApplyLogOnInfo(crTableLogOnInfo);
                }

                //////apply logon info for sub report
                //foreach (Section crSection in rptSource.ReportDefinition.Sections)
                //{
                //    foreach (ReportObject crReportObject in crSection.ReportObjects)
                //    {
                //        if (crReportObject.Kind == ReportObjectKind.SubreportObject)
                //        {
                //            SubreportObject crSubReportObj = (SubreportObject)(crReportObject);

                //            foreach (CrystalDecisions.CrystalReports.Engine.Table oTable in crSubReportObj.OpenSubreport(crSubReportObj.SubreportName).Database.Tables)
                //            {
                //                crTableLogOnInfo = oTable.LogOnInfo;
                //                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                //                oTable.ApplyLogOnInfo(crTableLogOnInfo);
                //            }

                //        }

                //    }
                //}

                //string strReportDirectoryTempPhysicalPath = Server.MapPath(this.ReportDirectoryTemp);
                //Helper.DeleteUnusedFile(strReportDirectoryTempPhysicalPath, ReportAliveTime);

                //string strFilename;
                //strFilename = "report_" + DateTime.Now.ToString("yyyyMMddHH-mm-ss-fff");
                //rptSource.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("~/temp/") + strFilename + ".pdf");
                //lnkPdfFile.NavigateUrl = "~/temp/" + strFilename + ".pdf";
                //imgPdf.Src = "~/images/icon_pdf.gif";
                imgPdf.Visible = false;
                CrystalReportViewer1.ReportSource = rptSource;

            }

        }

        private string getMonth()
        {
            string strMonth = string.Empty;
            if (ViewState["months"].ToString().Equals("01"))
            {
                strMonth = "มกราคม";
            }
            else if (ViewState["months"].ToString().Equals("02"))
            {
                strMonth = "กุมภาพันธ์";
            }
            else if (ViewState["months"].ToString().Equals("03"))
            {
                strMonth = "มีนาคม";
            }
            else if (ViewState["months"].ToString().Equals("04"))
            {
                strMonth = "เมษายน";
            }
            else if (ViewState["months"].ToString().Equals("05"))
            {
                strMonth = "พฤษภาคม";
            }
            else if (ViewState["months"].ToString().Equals("06"))
            {
                strMonth = "มิถุนายน";
            }
            else if (ViewState["months"].ToString().Equals("07"))
            {
                strMonth = "กรกฎาคม";
            }
            else if (ViewState["months"].ToString().Equals("08"))
            {
                strMonth = "สิงหาคม";
            }
            else if (ViewState["months"].ToString().Equals("09"))
            {
                strMonth = "กันยายน";
            }
            else if (ViewState["months"].ToString().Equals("10"))
            {
                strMonth = "ตุลาคม";
            }
            else if (ViewState["months"].ToString().Equals("11"))
            {
                strMonth = "พฤศจิกายน";
            }
            else if (ViewState["months"].ToString().Equals("12"))
            {
                strMonth = "ธันวาคม";
            }
            return strMonth;
        }

        private void getQueryString()
        {

            if (Request.QueryString["report_code"] != null)
            {
                ViewState["report_code"] = Request.QueryString["report_code"].ToString();
            }
            else
            {
                ViewState["report_code"] = string.Empty;
            }

            if (Request.QueryString["criteria"] != null)
            {
                ViewState["criteria"] = HttpUtility.HtmlDecode(Request.QueryString["criteria"].ToString());
            }
            else
            {
                ViewState["criteria"] = string.Empty;
            }

            if (Request.QueryString["item_des"] != null)
            {
                ViewState["item_des"] = Request.QueryString["item_des"].ToString();
            }
            else
            {
                ViewState["item_des"] = "0";
            }

            if (Request.QueryString["persongroup"] != null)
            {
                ViewState["persongroup"] = Request.QueryString["persongroup"].ToString();
            }
            else
            {
                ViewState["persongroup"] = "";
            }


        }

        private void Retive_Rep_payment_slip()
        {
            try
            {
                string strPath = "~/reports/" + ViewState["report_code"].ToString() + ".rpt";
                rptSource.Load(Server.MapPath(strPath));
                TableLogOnInfo logOnInfo = new TableLogOnInfo();
                TableLogOnInfos tableLogOnInfos = new TableLogOnInfos();
                string strUsername = base.PersonFullName;
                string strCompanyname = ((DataSet)Application["xmlconfig"]).Tables["default"].Rows[0]["companyname"].ToString();
                string strServername = System.Configuration.ConfigurationSettings.AppSettings["servername"];
                string strDbname = System.Configuration.ConfigurationSettings.AppSettings["dbname"];
                string strDbuser = System.Configuration.ConfigurationSettings.AppSettings["dbuser"];
                string strDbpassword = System.Configuration.ConfigurationSettings.AppSettings["dbpassword"];
                logOnInfo.ConnectionInfo.ServerName = strServername;
                logOnInfo.ConnectionInfo.DatabaseName = strDbname;
                logOnInfo.ConnectionInfo.UserID = strDbuser;
                logOnInfo.ConnectionInfo.Password = strDbpassword;
                tableLogOnInfos.Add(logOnInfo);
                ViewState["criteriaC"] = " And (Item_type='C') " + Session["criteria"].ToString();
                ViewState["criteriaD"] = " And (Item_type='D') " + Session["criteria"].ToString();
                //rptSource.SetParameterValue("@vc_criteria", " and 1=1 ");
                //rptSource.SetParameterValue("@vc_criteria", " and 1=1 ", "sub_debit");
                //rptSource.SetParameterValue("@vc_criteria", " and 1=1 ", "sub_credit");

                var oPayment_special = new cPayment_special();
                var ds = new DataSet();
                var dsC = new DataSet();
                var dsD = new DataSet();

                string strMessage = string.Empty;
                string strCriteria = string.Empty;
                if (this.mydsC == null)
                {
                    if (!oPayment_special.SP_PAYMENT_SPECIAL_DETAIL_SEL(ViewState["criteriaC"].ToString(), ref dsC, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        this.mydsC = dsC;
                    }
                }

                if (this.mydsD == null)
                {
                    if (!oPayment_special.SP_PAYMENT_SPECIAL_DETAIL_SEL(ViewState["criteriaD"].ToString(), ref dsD, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        this.mydsD = dsD;
                    }
                }

                if (this.myds == null)
                {
                    if (!oPayment_special.SP_PAYMENT_SPECIAL_HEAD_SEL(Session["criteria"].ToString(), ref ds, ref strMessage))
                    {
                        lblError.Text = strMessage;
                    }
                    else
                    {
                        this.myds = ds;
                    }
                }

                rptSource.SetDataSource(this.myds.Tables[0]);
                rptSource.OpenSubreport("sub_debit").SetDataSource(this.mydsD.Tables[0]);
                rptSource.OpenSubreport("sub_credit").SetDataSource(this.mydsC.Tables[0]);

                rptSource.SetParameterValue("UserName", strUsername);
                rptSource.SetParameterValue("CompanyName", strCompanyname);

                CrystalReportViewer1.LogOnInfo = tableLogOnInfos;

                oPayment_special.Dispose();
                ds.Dispose();
                dsC.Dispose();
                dsD.Dispose();


            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
        }

        private void downloadOpenFile(string filePath)
        {
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=cmru-pay-slip.pdf");
            Response.TransmitFile(filePath);
            Response.End();
        }

    }
}
