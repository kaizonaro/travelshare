<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/sistema.Master" CodeBehind="usuario-timeline.aspx.cs" Inherits="TravelShare.usuario_timeline" %>

<%@ Register Src="~/includes/BarraAtividades.ascx" TagPrefix="uc1" TagName="BarraAtividades" %>
<%@ Register Src="~/includes/menu-usuario-logado.ascx" TagPrefix="uc2" TagName="menuUsuarioLogado" %>
<%@ Register Src="~/includes/BoxPostagem.ascx" TagPrefix="uc3" TagName="BoxPostagem" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <%--adicionar aqui scripts especificos desta pagina--%>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ConteudoPagina" runat="server">

    <!-- TIME LINE DO USÁRIO -->
    <div class="timeline">
        <div class="timeline-cover">
            <!--MENU DO TIMELINE DO USUÁRIO-->
            <uc2:menuUsuarioLogado runat="server" ID="menuUsuarioLogado" />
        </div>
        <div id="page-contents">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-7">
                    
                    <!-- BOX PARA POSTAGEM -->
                    <uc3:BoxPostagem runat="server" ID="BoxPostagem" />
                    
                    <!-- ÚLTIMAS POSTAGENS DO USUÁRIO-->
                    <div id="posts_usuario" runat="server"></div>
                
                </div>
                
                <%--BARRA DE ATIVIDADES--%>
                <uc1:BarraAtividades runat="server" ID="BarraAtividades" />

            </div>
        </div>
    </div>
</asp:Content>