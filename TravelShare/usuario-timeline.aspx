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
                    <div id="posts_usuario" runat="server">

                        <div class="post-content">

                            <!--Post Date-->
                            <div class="post-date hidden-xs hidden-sm">
                                <h5>##Usuario.USU_NOME##</h5>
                                <p class="text-grey">##Usuario.UltimoOnline##</p>
                            </div>
                            <!--Post Date End-->

                            <img src="/images/post-images/12.jpg" alt="post-image" class="img-responsive post-image" />
                            <div class="post-container">
                                <img src="##Usuario.FotoPerfil##" alt="user" class="profile-photo-md pull-left" />
                                <div class="post-detail">
                                    <div class="user-info">
                                        <h5><a href="##Usuario.FotoPerfil##" class="profile-link">##Usuario.USU_NOME_CURTO##</a> <span class="following">following</span></h5>
                                        <p class="text-muted">públicado a ##Publicado##</p>
                                    </div>
                                    <div class="reaction">
                                        <a class="btn text-green"><i class="icon ion-thumbsup"></i>&nbsp;##TotalLikes##</a>
                                        <a class="btn text-red"><i class="fa fa-thumbs-down"></i>&nbsp;##TotalDislikes##</a>
                                    </div>
                                    <div class="line-divider"></div>
                                    <div class="post-text">
                                        ##PST_CONTEUDO##
                                    </div>
                                    <div class="line-divider"></div>
                                    <template>
                    <property name="Comentarios" />
                    <content>
                        <div class="post-comment">
                            <img src="##Usuario.FotoPerfil##" alt="" class="profile-photo-sm" />
                            <p>
                                <a href="##Usuario.URLPerfil##" class="profile-link">##Usuario.USU_NOME_CURTO##</a>
                                ##COM_TEXTO##
                            </p>
                        </div>
                        <div class="line-divider"></div>
                    </content>
                </template>

                                    <div class="post-comment">
                                        <img src="##Usuario.FotoPerfil##" alt="" class="profile-photo-sm" />
                                        <input type="text" class="form-control" placeholder="Comentar" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--BARRA DE ATIVIDADES--%>
                <uc1:BarraAtividades runat="server" ID="BarraAtividades" />
            </div>
        </div>
    </div>
</asp:Content>