using InnerLibs;
using InnerLibs.LINQ;
using InnerLibs.HtmlParser;
using InnerLibs.TimeMachine;
using System;
using System.Linq;
using System.Collections.Generic;

namespace TravelShare.Modules
{
    partial class AcessaBanco
    {
    }

    partial class Usuario
    {
        public string USU_NOME_COMPLETO => USU_NOME + " " + USU_SOBRENOME;

        public string USU_NOME_CURTO => USU_NOME + " " + USU_SOBRENOME.Split(' ').LastOrDefault();

        public DateTime? UltimoOnline => Utils.LogadoAgora[this].LastOnline;

        public bool Online => Utils.LogadoAgora[this].IsOnline;
    }

    partial class Post
    {
        public string PublicadoA => this.PST_DH_CRIACAO.Value.GetDifference(DateTime.Now).ToTimeElapsedString();
        public IEnumerable<Curtida> Likes => this.Interacoes.Where(x => x.CRT_LIKE_DISLIKE == true);
        public IEnumerable<Curtida> Dislikes => this.Interacoes.Where(x => x == null || x.CRT_LIKE_DISLIKE == false);
    }
}