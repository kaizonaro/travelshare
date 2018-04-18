using InnerLibs.LINQ;
using System;
using System.Diagnostics;
using System.Reflection;

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
            Debug.Writeline("PreIniciado")
        }
    }
}