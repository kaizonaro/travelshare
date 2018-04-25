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
    public partial class _default1 : Modules.PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string acao = Request["acao"].IfBlank("");

            switch (acao.ToLower())
            {
                case "inscrever":

                case "login":
                    string msg = "";
                    msg = Logar(Request["USU_EMAIL"], Request["USU_SENHA"]);
                    break;

                default:

                    if (UsuarioLogado != null)
                    {
                        Response.WriteEnd(UsuarioLogado.USU_NOME);
                    }

                    //ListarUsuarios()

                    break;
            }
        }

        public void ListarUsuarios()
        {
            using (AcessaBanco xxx = new AcessaBanco())
            {
                IEnumerable<Usuario> usus = xxx.Usuarios.OrderBy(x => Guid.NewGuid()).Take(20).AsEnumerable().Where(x => Utils.LogadoAgora[x].IsOnline).Take(6);

               // usuarios.InnerHtml = Utils.Engine.ApplyTemplate<Usuario>(usus, 0, 0, "template_usuario_home");
            }
        }
    }
}