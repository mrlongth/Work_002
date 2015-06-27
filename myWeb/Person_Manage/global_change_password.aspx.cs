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

namespace myWeb.Person_Manage
{
    public partial class global_change_password : GlobalPageBase
    {


        protected void Page_Load(object sender, System.EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    string strScript = "<script language=\"javascript\">\n self.opener.document.location.href=\"../../index.aspx\";\n self.close();\n</script>\n";
            //    this.RegisterStartupScript("close", strScript);
            //    return;
            //}
            lblError.Text = "";
            if (!IsPostBack)
            {
                imgSaveOnly.Attributes.Add("onMouseOver", "src='../../images/controls/save2.jpg'");
                imgSaveOnly.Attributes.Add("onMouseOut", "src='../../images/controls/save.jpg'");
                imgSaveOnly.Attributes.Add("title", ((DataSet)Application["xmlconfig"]).Tables["imgSaveOnly"].Rows[0]["title"].ToString());


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

        private void InitializeComponent()
        {
            this.imgSaveOnly.Click += new System.Web.UI.ImageClickEventHandler(this.imgSaveOnly_OnClick);
        }
        #endregion

        private bool saveData()
        {
            bool blnResult = false;
            string strMessage = string.Empty;
            string strpassword = string.Empty;
            string strconfirm_password = string.Empty;
            string strUpdatedBy = string.Empty;
            var oPerson = new cPerson();
            try
            {
                #region set Data
                strpassword = txtpassword.Text.Trim();
                strconfirm_password = txtconfirm_password.Text;
                strUpdatedBy = Session["username"].ToString();
                if (strpassword != strconfirm_password)
                {
                    MsgBox("รหัสผ่านไม่ตรงกับยืนยันรหัสผ่านโปรดตรวจสอบ");
                    return false;
                }
                #endregion
                if (oPerson.SP_PERSON_HIS_PASS_UPD(this.PersonCode, strpassword, strUpdatedBy, ref strMessage))
                {
                    blnResult = true;
                }
                else
                {
                    lblError.Text = strMessage;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                oPerson.Dispose();
            }
            return blnResult;
        }

        protected void imgSaveOnly_OnClick(object sender, ImageClickEventArgs e)
        {
            if (saveData())
            {
                string strScript1 = "ClosePopUp('1');";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ClosePage", strScript1, true);
                MsgBox("บันทึกข้อมูลสมบูรณ์");
            }
        }
    }
}