﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace myDLL
{
    public class cTitle : IDisposable
    {
        private string _strConn = string.Empty;
        public string ConnectionString
        {
            get
            {
                return _strConn;
            }
            set
            {
                if (value == string.Empty)
                {
                    _strConn = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
                }
                else
                {
                    _strConn = value;
                }
            }
        }

    public cTitle()
	{
	//
	// TODO: Add constructor logic here
	//
        _strConn = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
	}

    public void Dispose()
    {
        GC.SuppressFinalize(this);
    }

    #region SP_SEL_TITLE
    public bool SP_SEL_TITLE(string strCriteria, ref DataSet ds,ref string strMessage)
    {
        bool blnResult = false;
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCommand = new SqlCommand();
        SqlDataAdapter oAdapter = new SqlDataAdapter();
        try
        {
            oConn.ConnectionString = _strConn;
            oConn.Open();
            oCommand.Connection = oConn;
            oCommand.CommandType = CommandType.StoredProcedure;
            oCommand.CommandText = "sp_TITLE_SEL";
            SqlParameter oParamI_vc_criteria = new SqlParameter("vc_criteria", SqlDbType.NVarChar);
            oParamI_vc_criteria.Direction = ParameterDirection.Input;
            oParamI_vc_criteria.Value = strCriteria;
            oCommand.Parameters.Add(oParamI_vc_criteria);
            oAdapter = new SqlDataAdapter(oCommand) ;
            ds = new DataSet();
            oAdapter.Fill(ds, "sp_TITLE_SEL");
            blnResult = true;
        }
        catch (Exception ex)
        {
           strMessage = ex.Message.ToString();
        }
        finally
        {
            oConn.Close();
            oCommand.Dispose();
            oConn.Dispose();
        }
        return blnResult;
    }
    #endregion

    #region SP_INS_TITLE
    public bool SP_INS_TITLE(string pTitle_code, string pTitle_name, string pActive, string pC_created_by, ref string strMessage)
    {
        bool blnResult = false;
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCommand = new SqlCommand();
        SqlDataAdapter oAdapter = new SqlDataAdapter();
        try
        {
            oConn.ConnectionString = _strConn;
            oConn.Open();
            oCommand.Connection = oConn;
            oCommand.CommandType = CommandType.StoredProcedure;
            oCommand.CommandText = "sp_TITLE_INS";
            // - - - - - - - - - - - -             
            SqlParameter oParam_Title_code = new SqlParameter("title_code", SqlDbType.NVarChar);
            oParam_Title_code.Direction = ParameterDirection.Input;
            oParam_Title_code.Value = pTitle_code;
            oCommand.Parameters.Add(oParam_Title_code);
            // - - - - - - - - - - - -             
            SqlParameter oParam_Title_name = new SqlParameter("title_name", SqlDbType.NVarChar);
            oParam_Title_name.Direction = ParameterDirection.Input;
            oParam_Title_name.Value = pTitle_name;
            oCommand.Parameters.Add(oParam_Title_name);
            // - - - - - - - - - - - -             
            SqlParameter oParam_Active = new SqlParameter("c_active", SqlDbType.NVarChar);
            oParam_Active.Direction = ParameterDirection.Input;
            oParam_Active.Value = pActive;
            oCommand.Parameters.Add(oParam_Active);
            // - - - - - - - - - - - -             
            SqlParameter oParam_c_created_by = new SqlParameter("c_created_by", SqlDbType.NVarChar);
            oParam_c_created_by.Direction = ParameterDirection.Input;
            oParam_c_created_by.Value = pC_created_by;
            oCommand.Parameters.Add(oParam_c_created_by);
            // - - - - - - - - - - - -             
            oCommand.ExecuteNonQuery();
            blnResult = true;
        }
        catch (Exception ex)
        {
            strMessage = ex.Message.ToString();
        }
        finally
        {
            oConn.Close();
            oCommand.Dispose();
            oConn.Dispose();
        }
        return blnResult;
    }
    #endregion

    #region SP_UPD_TITLE
    public bool SP_UPD_TITLE(string pTitle_code, string pTitle_name, string pActive, string pC_updated_by, ref string strMessage)
    {
        bool blnResult = false;
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCommand = new SqlCommand();
        SqlDataAdapter oAdapter = new SqlDataAdapter();
        try
        {
            oConn.ConnectionString = _strConn;
            oConn.Open();
            oCommand.Connection = oConn;
            oCommand.CommandType = CommandType.StoredProcedure;
            oCommand.CommandText = "sp_TITLE_UPD";
            // - - - - - - - - - - - -             
            SqlParameter oParam_Title_code = new SqlParameter("Title_code", SqlDbType.NVarChar);
            oParam_Title_code.Direction = ParameterDirection.Input;
            oParam_Title_code.Value = pTitle_code;
            oCommand.Parameters.Add(oParam_Title_code);
            // - - - - - - - - - - - -             
            SqlParameter oParam_Title_name = new SqlParameter("Title_name", SqlDbType.NVarChar);
            oParam_Title_name.Direction = ParameterDirection.Input;
            oParam_Title_name.Value = pTitle_name;
            oCommand.Parameters.Add(oParam_Title_name);
            // - - - - - - - - - - - -             
            SqlParameter oParam_Active = new SqlParameter("C_active", SqlDbType.NVarChar);
            oParam_Active.Direction = ParameterDirection.Input;
            oParam_Active.Value = pActive;
            oCommand.Parameters.Add(oParam_Active);
            // - - - - - - - - - - - -             
            SqlParameter oParam_c_updated_by = new SqlParameter("c_updated_by", SqlDbType.NVarChar);
            oParam_c_updated_by.Direction = ParameterDirection.Input;
            oParam_c_updated_by.Value = pC_updated_by;
            oCommand.Parameters.Add(oParam_c_updated_by);
            // - - - - - - - - - - - -             
            oCommand.ExecuteNonQuery();
            blnResult = true;
        }
        catch (Exception ex)
        {
            strMessage = ex.Message.ToString();
        }
        finally
        {
            oConn.Close();
            oCommand.Dispose();
            oConn.Dispose();
        }
        return blnResult;
    }
    #endregion

    #region SP_DEL_TITLE
    public bool SP_DEL_TITLE(string pTitle_code, string pActive, string pC_updated_by, ref string strMessage)
    {
        bool blnResult = false;
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCommand = new SqlCommand();
        SqlDataAdapter oAdapter = new SqlDataAdapter();
        try
        {
            oConn.ConnectionString = _strConn;
            oConn.Open();
            oCommand.Connection = oConn;
            oCommand.CommandType = CommandType.StoredProcedure;
            oCommand.CommandText = "sp_TITLE_DEL";
            // - - - - - - - - - - - -             
            SqlParameter oParam_Title_code = new SqlParameter("Title_code", SqlDbType.NVarChar);
            oParam_Title_code.Direction = ParameterDirection.Input;
            oParam_Title_code.Value = pTitle_code;
            oCommand.Parameters.Add(oParam_Title_code);
            // - - - - - - - - - - - -             
            SqlParameter oParam_Active = new SqlParameter("C_active", SqlDbType.NVarChar);
            oParam_Active.Direction = ParameterDirection.Input;
            oParam_Active.Value = pActive;
            oCommand.Parameters.Add(oParam_Active);
            // - - - - - - - - - - - -             
            SqlParameter oParam_c_updated_by = new SqlParameter("c_updated_by", SqlDbType.NVarChar);
            oParam_c_updated_by.Direction = ParameterDirection.Input;
            oParam_c_updated_by.Value = pC_updated_by;
            oCommand.Parameters.Add(oParam_c_updated_by);
            // - - - - - - - - - - - -             
            oCommand.ExecuteNonQuery();
            blnResult = true;
        }
        catch (Exception ex)
        {
            strMessage = ex.Message.ToString();
        }
        finally
        {
            oConn.Close();
            oCommand.Dispose();
            oConn.Dispose();
        }
        return blnResult;
    }
    #endregion

    #region IDisposable Members

    void IDisposable.Dispose()
    {
        throw new NotImplementedException();
    }

    #endregion

    }
}
