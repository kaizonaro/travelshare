using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using TravelShare.Modules;
using InnerLibs;
using System.Web;
using InnerLibs.LINQ;

namespace TravelShare.API
{
    /// <summary>
    /// Summary description for api
    /// </summary>
    [WebService(Namespace = "http://travelshare.com.br/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class api : System.Web.Services.WebService
    {
        public HttpRequest Request => Context.Request;

        public void WJSON(object obj)
        {
            Context.Response.WriteJSON(obj);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true, XmlSerializeString = false)]
        public void Usuarios()
        {
            using (var xxx = new AcessaBanco())
            {
                var u = xxx.Usuarios.OrderByRandom().Select(x => new { x.USU_ID, x.USU_NOME, x.USU_SOBRENOME, x.USU_NOME_CURTO, x.USU_NOME_COMPLETO, x.USU_EMAIL, x.USU_USUARIO, x.USU_FOTO_PERFIL, x.Online }).ToList();
                WJSON(u);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true, XmlSerializeString = false)]
        public void Posts(int USU_ID)
        {
            using (var xxx = new AcessaBanco())
            {
                var p = xxx.Posts.Where(x => x.USU_ID == USU_ID).ToList();
                WJSON(p);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true, XmlSerializeString = false)]
        public void Feed(int USU_ID)
        {
            using (var xxx = new AcessaBanco())
            {
                var p = xxx.Posts.ToList(); //TODO aqui deve haver filtro de amigos/paginas
                WJSON(p);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true, XmlSerializeString = false)]
        public void Atividades(int USU_ID)
        {
            using (var xxx = new AcessaBanco())
            {
                //TODO trazer posts,fotos etc, apenas data e quem postou (dos amigos)
                WJSON(null);
            }
        }
    }
}