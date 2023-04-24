using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using ElectronicInvoice_BL;

namespace ElectronicInvoice_App
{
    public partial class ElectronicInvoice : System.Web.UI.Page
    {
        private List<Catalog_DA.IdentityType> lstIdentityType = null;

        const int idParent = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            //https://pricesmart-dev.outsystemsenterprise.com/POS_Wrapper_APP/Home?POSaccess=asdfghjkl&TransactionNumber=10&OperatorNumber=64023010&TeminalNumber=8&StoreNumber=6406&Training=No&LocationNumber=1
                if (Request.QueryString["POSaccess"] != null)
                {
                    string posAccess = Request.QueryString["POSaccess"];
                    string transactionNumber = Request.QueryString["TransactionNumber"];
                    string operatorNumber = Request.QueryString["OperatorNumber"];
                    string teminalNumber = Request.QueryString["TeminalNumber"];
                    lblValueClub.Text = Request.QueryString["StoreNumber"];
                    string training = Request.QueryString["Training"];
                    string locationNumber = Request.QueryString["LocationNumber"];
                }

                GetDocumentTypes();
                GetIdentityTypes();

                ddlDepartment.DataSource = GetAddress(idParent);
                ddlDepartment.DataBind();

                ddlMunicipality.DataSource = GetAddress(Convert.ToInt32(ddlDepartment.SelectedValue));
                ddlMunicipality.DataBind();
            }
        }

        protected void DdlDocumentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDocumentType.SelectedValue == "3")
            {
                lblDepartment.Visible = true;
                ddlDepartment.Visible = true;
                lblMunicipality.Visible = true;
                ddlMunicipality.Visible = true;
            }
            else {
                lblDepartment.Visible = false;
                ddlDepartment.Visible = false;
                lblMunicipality.Visible = false;
                ddlMunicipality.Visible = false;
            }
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlMunicipality.DataSource = GetAddress(Convert.ToInt32(ddlDepartment.SelectedValue));
                ddlMunicipality.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Prueba')</script>");
        }

        #region Methods

        private void GetDocumentTypes()
        {
            List<Catalog_DA.DocumentType> lstDocumentType = null;

            try
            {
                BDAccess bdAccess = new BDAccess();
                Catalog_DA catalog_DataAccess = new Catalog_DA(bdAccess.GetStringConnectionBD());

                lstDocumentType = catalog_DataAccess.GetDocumentType();

                ddlDocumentType.DataSource = lstDocumentType.Select(x => new { x.Document, x.Value });
                ddlDocumentType.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void GetIdentityTypes()
        {        
            try
            {
                BDAccess bdAccess = new BDAccess();
                Catalog_DA catalog_DataAccess = new Catalog_DA(bdAccess.GetStringConnectionBD());

                lstIdentityType = catalog_DataAccess.GetIdentityType();

                ddlIDType.DataSource = lstIdentityType.Select(x => new { x.Name, x.Value });
                ddlIDType.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private object GetAddress(int parent)
        {
            List<Catalog_DA.Address> lstAddress = null;

            try
            {
                BDAccess bdAccess = new BDAccess();
                Catalog_DA catalog_DataAccess = new Catalog_DA(bdAccess.GetStringConnectionBD());

                lstAddress = catalog_DataAccess.GetAddress(parent);

                //ddlIDType.DataSource = lstAddress.Select(x => new { x.Name, x.Id });
                //ddlIDType.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return lstAddress.Select(x => new { x.Name, x.Id });
        }

        #endregion

    }
}