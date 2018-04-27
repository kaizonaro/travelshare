namespace TravelShare.Modules
{
    partial class AcessaBanco
    {
    }

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