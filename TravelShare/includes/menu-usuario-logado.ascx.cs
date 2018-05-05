using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InnerLibs;
using TravelShare.Modules;

namespace TravelShare.includes
{
    public partial class menu_usuario_logado : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // seta o parametro visible de cada menu.
            //visible = false nao envia o HTML pro cliente (não é display:none)
            menu_timeline_desk.Visible = Request.IsDesktop();
            menu_timeline_mobile.Visible = Request.IsMobile();
            //Request.IsIpad(); ?????? o que fazer ??????


          //  USU_NOME.InnerHtml = UsuarioLogado.USU_NOME_COMPLETO.ToProper();
        }
    }
}