using InnerLibs;
using InnerLibs.LINQ;
using InnerLibs.HtmlParser;
using InnerLibs.TimeMachine;


namespace TravelShare.Modules
{
    partial class AcessaBanco
    {
    }

    [TriforceDefaultTemplate("template_usuario")]
    partial class Usuario
    {
        public string USU_NOME_COMPLETO
        {
            get
            {
                return USU_NOME + " " + USU_SOBRENOME;
            }
        }
    }
}