using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InnerLibs;
using InnerLibs.HtmlParser;
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
                    var el1 = new HtmlElement("span", Inscrever(Request["USU_EMAIL"], Request["USU_SENHA"].ToString(), Request["USU_NOME"]));
                    el1.Style.color = Color.Red.ToHexadecimal();
                    mensagem_inscrever.InnerHtml = el1.ToString();
                    break;
                case "login":
                    var el2 = new HtmlElement("span", Logar(Request["USU_EMAIL"], Request["USU_SENHA"].ToString().ToMD5String()));
                    el2.Style.color = Color.Red.ToHexadecimal();
                    mensagem_logar.InnerHtml = el2.ToString();
                    break;
                case "sair":                  
                    UsuarioLogado = null;              
                    Response.Redirect("/");
                    break;
                case "confirmar":
                    Confirmar(Request["USU_ID"]);
                    break;
                default:
                    break;
            }

            if (UsuarioLogado != null)
            {
                Response.Redirect(RedirectUrl);
            }

            //a partir daqui carregas os detalhes da pagina
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