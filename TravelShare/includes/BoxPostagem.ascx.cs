using InnerLibs;
using InnerLibs.HtmlParser;
using InnerLibs.LINQ;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelShare.Modules;

namespace TravelShare.includes
{
    public partial class BoxPostagem : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var xxx = new AcessaBanco())
            {
                if (Request["acao"].IfBlank("") == "SalvarPost")
                {
                    var post = new Post();
                    if (Request["PST_CONTEUDO"].IsNotBlank())
                    {
                        var doc = new HtmlDocument(Request["PST_CONTEUDO"].IfBlank("").RemoveHTML());
                        doc.Body.ParseURL();

                        post.PST_DH_CRIACAO = DateTime.Now;
                        post.Usuario = xxx.GetByPrimaryKey<Usuario>(((Usuario)Session["UsuarioLogado"]).USU_ID);
                        post.PST_CONTEUDO = doc.XHTML;
                        xxx.Posts.InsertOnSubmit(post);
                        xxx.SubmitChanges();
                    }
                }
            }
        }
    }
}