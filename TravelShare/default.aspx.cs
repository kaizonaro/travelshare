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
    public partial class default1 : Modules.PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string acao = Request["acao"].IfBlank("");

            switch (acao.ToLower())
            {
                case "inscrever":
                //TODO inscrever e dar redirect pro editar perfil. Disparar email de confirmacao
                case "login":
                    string msg = "";
                    msg = Logar(Request["USU_EMAIL"], Request["USU_SENHA"].ToString().ToMD5String());
                    break;

                case "sair":
                    Utils.LogadoAgora[UsuarioLogado].IsOnline = false;
                    UsuarioLogado = null;
                    Web.DestroySessionAndCookies(Context.ApplicationInstance);
                    Response.Redirect("/");
                    break;

                default:
                    break;
            }

            if (UsuarioLogado != null)
            {
                Response.WriteEnd(UsuarioLogado.USU_NOME_COMPLETO);
                //TODO Redirect para interna
            }

            ListarUsuarios();
        }

        public void ListarUsuarios()
        {
            using (AcessaBanco xxx = new AcessaBanco())
            {
                IQueryable<Usuario> usus = xxx.Usuarios.OrderByRandom();

                pessoas_online.InnerHtml = Utils.LogadoAgora.OnlineUsers().Count().ToString();

                total_pessoas.InnerHtml = usus.Count().ToString();
                incremental_counter.Attributes["data-value"] = usus.Count().ToString();
                //TODO falta postagens

                usuarios.InnerHtml = Utils.Engine.ApplyTemplate<Usuario>(usus.Take(10), 1, 6, "LINQTemplates.template_usuario_home.html");
            }
        }
    }
}