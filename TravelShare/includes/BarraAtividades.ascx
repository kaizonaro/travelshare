<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BarraAtividades.ascx.cs" Inherits="TravelShare.includes.BarraAtividades" %>

<script>

    var data_feed = []
    var vm_feed = new Vue({
        el: "#feed",
        data: data_feed
    })

    function atualizaFeed() {
        fetch("/api;api.asmx/Atividades").then(function (response) {
            return response.json()
        }).then(function (response) {
            data_feed = response
        })
    }

    $(document).ready(function () {
        setInterval(function () {
            atualizaFeed();
        }, 1000 * 60) //atualizar de 1 min em 1 min
    }
</script>

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