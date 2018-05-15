using InnerLibs;
using InnerLibs.HtmlParser;
using InnerLibs.LINQ;
using System;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.Web;

namespace TravelShare.Modules
{
    public static class Utils
    {
        public static OnlineList<Usuario, int> LogadoAgora = new OnlineList<Usuario, int>(x => x.USU_ID);

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

    // A classe pagebase será usada como base em todas as paginas web, para fazer validação de
    // usuarios online, cookies, sessao etc
    public class PageBase : System.Web.UI.Page
    {
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
                if (value == null)
                {
                    try
                    {
                        Utils.LogadoAgora[UsuarioLogado].IsOnline = false;
                    }
                    catch (Exception)
                    {
                    }

                    Web.DestroySessionAndCookies(Context.ApplicationInstance);
                }
                Session["UsuarioLogado"] = value;
            }
        }

        public string Confirmar(string IDEncriptado)
        {
            using (var xxx = new AcessaBanco())
            {
                IDEncriptado = IDEncriptado.UnnCrypt();
                var usu = xxx.GetByPrimaryKey<Usuario>(IDEncriptado);
                usu.USU_ATIVO = true;
                xxx.SubmitChanges();
                return Logar(null, null, IDEncriptado);
            }
        }

        public void EmailConfirmacao(Usuario usu)
        {
            var doc = new HtmlDocument();
            var center = new HtmlElement("center");
            doc.Nodes.Add(center);

            var boas = new HtmlElement("h2", DateTime.Now.ToGreeting() + " " + usu.USU_NOME);
            var texto = new HtmlElement("h3", "Estamos muito felizes que você se juntou a nós! Precisamos agora apenas confirmar seu email. Você pode fazer isso clicando no link abaixo.");
            var quebra = new HtmlElement("br") { IsTerminated = true };
            var link = new HtmlAnchorElement(Dominio + "default.aspx?acao=confirmar&USU_ID=" + usu.USU_ID.ToString().InnCrypt(), Emoji.Smile + "Confirmar Email" + Emoji.Smile);

            center.Nodes.AddRange(boas, texto, quebra, link);

            Utils.EnviaEmail(usu.USU_EMAIL, "Bem Vindo ao Travel Share", doc.ToString());
            UsuarioLogado = null;
        }

        public string Inscrever(string Email, string Senha, string Nome)
        {
            using (AcessaBanco xxx = new AcessaBanco())
            {
                Email = Email.ToLower();
                if (!Email.IsEmail())
                {
                    return "Email inválido!" + Emoji.Worried;
                }

                if (Senha.IsBlank() || Senha.Length < 8)
                {
                    return "Senha deve ter no mínimo 8 caracteres!" + Emoji.Worried;
                }

                if (Nome.IsBlank())
                {
                    return "Você esqueceu de digitar o nome!" + Emoji.Worried;
                }

                int c = xxx.Usuarios.Count(x => x.USU_EMAIL == Email);

                if (c == 0)
                {
                    var usu = new Usuario();

                    var fullnome = Nome.AdjustBlankSpaces().ToProper().Split(new char[] { ' ' }, 2, StringSplitOptions.RemoveEmptyEntries);
                    usu.USU_NOME = fullnome.First();
                    usu.USU_SOBRENOME = fullnome.Last();
                    usu.USU_EMAIL = Email;
                    usu.USU_SENHA = Senha.ToMD5String();
                    usu.USU_ATIVO = false;
                    xxx.Usuarios.InsertOnSubmit(usu);
                    xxx.SubmitChanges();

                    EmailConfirmacao(usu);

                    return "Quase pronto! Enviamos um link de confirmação para seu email.";
                }
                else
                {
                    if (Logar(Email, Senha.ToMD5String()) != "OK")
                    {
                        return "Este email já está sendo utilizado. Você esqueceu sua senha?";
                    }
                    else
                    {
                        return "OK";
                    }
                }
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
                        return "Email Inválido " + Emoji.Worried;
                    }

                    if (Senha.IsBlank())
                    {
                        return "Senha Inválida " + Emoji.Worried;
                    }

                    UsuarioLogado = xxx.Usuarios.FirstOrDefault(x => x.USU_EMAIL == Email && x.USU_SENHA == Senha);
                }
            }

            if (UsuarioLogado != null)
            {
                if (!UsuarioLogado.USU_ATIVO)
                {
                    EmailConfirmacao(UsuarioLogado);
                    return "Você ainda precisa confirmar seu email.";
                }
                else
                {
                    Utils.LogadoAgora[UsuarioLogado].IsOnline = true;

                    HttpCookie coo = new HttpCookie("USU_ID", UsuarioLogado.USU_ID.ToString().InnCrypt());
                    coo.Expires = DateTime.Now.AddMonths(1);
                    Response.AppendCookie(coo);
                    return "OK";
                }
            }
            else
            {
                return "Email ou senha incorretos " + Emoji.Worried;
            }
        }

        public string Dominio
        {
            get
            {
                return "http://" + Request.Url.GetDomain() + "/";
            }
        }

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
    }
}