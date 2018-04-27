using InnerLibs;
using InnerLibs.LINQ;
using System;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Web;

namespace TravelShare.Modules
{
    public static class Utils
    {
        public static OnlineList<Usuario, int> LogadoAgora = new OnlineList<Usuario, int>(x => x.USU_ID);
        public static Triforce<AcessaBanco> Engine = new Triforce<AcessaBanco>(Assembly.GetExecutingAssembly());
    }

    // A classe pagebase será usada como base em todas as paginas web, para fazer validação de usuarios online, cookies, sessao etc
    public class PageBase : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Debug.WriteLine("PreIniciado");

            HttpCookie coo = Request.Cookies["USU_ID"];

            if (coo != null && coo.Value.IsNotBlank())
            {
                Logar(null, null, coo.Value.UnnCrypt());
            }
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

        public string Logar(string Email, string Senha, string usuID = "")
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
                    if (!Email.IsEmail())
                    {
                        return "Email Inválido";
                    }

                    if (Senha.IsBlank())
                    {
                        return "Senha Inválida";
                    }

                    UsuarioLogado = xxx.Usuarios.FirstOrDefault(x => x.USU_EMAIL == Email && x.USU_SENHA == Senha);
                }
            }

            if (UsuarioLogado != null)
            {
                //TODO Escrever cookie
                HttpCookie coo = new HttpCookie("USU_ID", UsuarioLogado.USU_ID.ToString().InnCrypt());
                coo.Expires = DateTime.Now.AddMonths(1);
                Response.AppendCookie(coo);
                return "OK";
            }
            else
            {
                return "Email ou senha incorretos";
            }
        }
    }
}