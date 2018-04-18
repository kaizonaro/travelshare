using InnerLibs.LINQ;
using System;
using System.Diagnostics;
using System.Reflection;
using InnerLibs;
using System.Linq.Expressions;
using System.Linq;

namespace TravelShare.Modules
{
    public static class Utils
    {
        public static Triforce<AcessaBanco> Engine = new Triforce<AcessaBanco>(Assembly.GetExecutingAssembly());
    }

    // A classe pagebase será usada como base em todas as paginas web, para fazer validação de usuarios online, cookies, sessao etc
    public class PageBase : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Debug.WriteLine("PreIniciado");
        }

        public Usuario UsuarioLogado
        {
            get
            {
                return (Usuario)Session["UsuarioLogado"];
            }
            set
            {
                Session["UsuarioLogado"] = value;
            }
        }

        public string Logar(string Email, string Senha, string usuID)
        {
            using (AcessaBanco xxx = new AcessaBanco())
            {
                if (usuID.IsNotBlank())
                {
                    int ID = usuID.ChangeType<int, string>();
                    UsuarioLogado = xxx.GetByPrimaryKey<Usuario>(ID);
                }
                else
                {
                    UsuarioLogado = xxx.Usuarios.Where(x => x.USU_EMAIL == Email && x.USU_SENHA == Senha).FirstOrDefault();
                }
            }

            if (UsuarioLogado != null)
            {
                //TODO Escrever cookie
                return "OK";
            }
            else
            {
                return "Usuário ou senha incorretos";
            }
        }
    }
}