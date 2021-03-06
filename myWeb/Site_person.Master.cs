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
using System.Threading;
using myDLL;


namespace myWeb
{
    public partial class Site_person : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddJavaScriptInclude();
            //System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("th-TH");
            if (!IsPostBack)
            {
                try
                {
                    UserLabel.Text = Session["PersonFullName"].ToString();
                    bool ISRetire = false;
                    if (Session["ISRetire"] != null) {
                        ISRetire = (bool)Session["ISRetire"];
                    }
                    //if (!ISRetire)
                    //{
                    //    cPerson oPerson = new cPerson();
                    //    DataSet ds = new DataSet();
                    //    string strError = string.Empty;
                    //    string strScript = " And person_code='" + Session["PersonCode"].ToString() + "'";
                    //    strScript += " and substring(item_code,5,6) in ('09-032') ";
                    //    oPerson.SP_PERSON_ITEM_SEL(strScript, ref ds, ref strError);
                    //    ASPxMenu1.Items[5].Visible = false;
                    //    if (ds.Tables[0].Rows.Count > 0)
                    //    {
                    //        ASPxMenu1.Items[5].Visible = true;
                    //    }
                    //    else
                    //    {
                    //        ASPxMenu1.Items[5].Visible = false;
                    //    }
                    //    ASPxMenu1.Visible = true;
                    //    ASPxMenu1.Items[8].Visible = false;
                    //    //if (("00286,00001,00229,00135").Contains(Helper.CStr(Session["PersonCode"])))
                    //    //{
                    //    //    ASPxMenu1.Items[7].Visible = true;
                    //    //}
                    //}
                    //else 
                    //{
                    //    ASPxMenu1.Visible = false;
                    //}
                }
                catch
                {
                    Response.Redirect("~/Default.aspx");
                    ASPxMenu1.Items[3].Visible = false;
                }

                panelShow1.Style.Add("display", "none");
                btnShow.Style.Add("display", "none");
                imgClose1.Attributes.Add("onclick", "ClosePopUp('1');return false;");



            }
        }


        public void MsgBox(string strMessage)
        {
            string strScript = string.Empty;
            strScript = "alert('" + strMessage + "');";
            ScriptManager.RegisterClientScriptBlock(updatePanel1, updatePanel1.GetType(), "MessageBox", Helper.ReplaceScript(strScript), true);
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            //Session["person_username"] = "0";
            Response.Redirect("~/Default.aspx");
        }

        protected void AddJavaScriptInclude()
        {
            HtmlGenericControl script;


            script = new HtmlGenericControl("script");
            script.Attributes["type"] = "text/javascript";
            script.Attributes["src"] = (cCommon.AbsoluteWebRoot + "js/jquery-1.7.2.min.js");
            Page.Header.Controls.Add(script);

            script = new HtmlGenericControl("script");
            script.Attributes["type"] = "text/javascript";
            script.Attributes["src"] = (cCommon.AbsoluteWebRoot + "scripts/form.js");
            Page.Header.Controls.Add(script);

            script = new HtmlGenericControl("script");
            script.Attributes["type"] = "text/javascript";
            script.Attributes["src"] = (cCommon.AbsoluteWebRoot + "javascript/AwNumeric.js");
            Page.Header.Controls.Add(script);

            script = new HtmlGenericControl("script");
            script.Attributes["type"] = "text/javascript";
            script.Attributes["src"] = (cCommon.AbsoluteWebRoot + "javascript/AwTextBox.js");
            Page.Header.Controls.Add(script);

        }
    
    }
}
