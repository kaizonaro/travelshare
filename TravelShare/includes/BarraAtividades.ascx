<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BarraAtividades.ascx.cs" Inherits="TravelShare.includes.BarraAtividades" %>

<div class="col-md-2 static">
    <div id="sticky-sidebar">
        <h4 class="grey">Atividade de <span id="nome_usuario" runat="server"></span></h4>
        <div id="feed">
            <template v-for="usu in usuarios">
            <div class="feed-item">
                <div class="live-activity">
                    <p><a v-bind:href="usuario.USU_URL_PERFIL" class="profile-link">{{Usuario.USU_NOME}}</a> {{ATV_DESCRICAO}}</p>
                    <p class="text-muted">{{ATV_QUANDO}}</p>
                </div>
            </div>
            </template>
        </div>
    </div>
</div>