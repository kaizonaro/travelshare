using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InnerLibs;

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

                    break;
            }
        }
    }
}