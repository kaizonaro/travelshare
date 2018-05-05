using InnerLibs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelShare.Modules;

namespace TravelShare.JS
{
    public partial class sistema : System.Web.UI.MasterPage
    {
        public Usuario UsuarioLogado
        {
            get
            {
                return (Usuario)Session["UsuarioLogado"];
            }
            set
            {
                if (value == null)
                {
                    Utils.LogadoAgora[UsuarioLogado].IsOnline = false;
                    Web.DestroySessionAndCookies(Context.ApplicationInstance);
                }
                Session["UsuarioLogado"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
                   
        }
    }
}