using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InnerLibs;
using TravelShare.Modules;

namespace TravelShare
{
    public partial class usuario_album : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Perfil de " + UsuarioLogado.USU_NOME_COMPLETO.ToProper();
        }
    }
}