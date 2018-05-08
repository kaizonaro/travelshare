using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InnerLibs;
using InnerLibs.LINQ;
using TravelShare.Modules;

namespace TravelShare
{
    public partial class usuario_timeline : PageBase
    {
        public int USU_ID => Request.QueryString["USU_ID"].IfBlank(UsuarioLogado.USU_ID);

        protected void Page_Load(object sender, EventArgs e)
        {
            using (var xxx = new AcessaBanco())
            {
                Page.Title = "Perfil de " + xxx.GetByPrimaryKey<Usuario>(USU_ID).USU_NOME_COMPLETO.ToProper();

                var ps = Utils.Engine.ApplyTemplate<Post>(x => x.USU_ID == USU_ID, 0, 0);

                posts_usuario.InnerHtml = ps;
            }
        }
    }
}