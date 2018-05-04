using InnerLibs;
using InnerLibs.LINQ;
using System;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.Web;

namespace TravelShare.Modules
{
    public static class Utils
    {
        public static OnlineList<Usuario, int> LogadoAgora = new OnlineList<Usuario, int>(x => x.USU_ID);
        public static Triforce<AcessaBanco> Engine = new Triforce<AcessaBanco>(Assembly.GetExecutingAssembly());

        public static AJAX.Response EnviaEmail(string emailDestinatario, string Assunto, string Mensagem)
        {
            AJAX.Response msg = new AJAX.Response();
            string nomeRemetente = "Travel Share";
            string emailRemetente = "nao-responda@travelshare.com.br";
            string senha = "Tr@v&l125*";
            MailMessage objEmail = new MailMessage();
            objEmail.From = new MailAddress(nomeRemetente + "<" + emailRemetente + ">");
            objEmail.To.Add(emailDestinatario);
            objEmail.Priority = MailPriority.Normal;
            objEmail.IsBodyHtml = true;
            objEmail.Subject = Assunto;
            objEmail.Body = Mensagem;
            objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            SmtpClient objSmtp = new SmtpClient();
            objSmtp.Credentials = new System.Net.NetworkCredential(emailRemetente, senha);
            objSmtp.Host = "smtp.travelshare.com.br";
            objSmtp.Port = 587;
            try
            {
                objSmtp.Send(objEmail);
                msg.message = "E-mail enviado com sucesso!";
                msg.status = "success";
                msg.response = null;
            }
            catch (Exception ex)
            {
                msg.message = "Ocorreram problemas no envio do e-mail";
                msg.response = ex;
                msg.status = "error";
            }
            finally
            {
                objEmail.Dispose();
            }
            return msg;
        }
    }

    // A classe pagebase será usada como base em todas as paginas web, para fazer validação de usuarios online, cookies, sessao etc
    public class PageBase : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            HttpCookie coo = Request.Cookies["USU_ID"];

            if (coo != null && coo.Value.IsNotBlank())
            {
                Logar(null, null, coo.Value.UnnCrypt());
            }

            if (UsuarioLogado == null && !(Page is default1))
            {
                RedirectUrl = Request.RawUrl;
                Response.Redirect("/default.aspx");
            }
        }

        public string RedirectUrl
        {
            get
            {
                HttpCookie coo = Request.Cookies["REDIRECT"];

                if (coo != null && coo.Value.IsNotBlank())
                {
                    return coo.Value;
                }
                else
                {
                    return "/usuario-timeline.aspx";
                }
            }
            set
            {
                HttpCookie coo = new HttpCookie("REDIRECT", value) { Expires = DateTime.Now.AddMonths(1) };
                Response.AppendCookie(coo);
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
                Utils.LogadoAgora[UsuarioLogado].IsOnline = true;

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