<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/sistema.Master" CodeBehind="usuario-timeline.aspx.cs" Inherits="TravelShare.usuario_timeline" %>

<%@ Register Src="~/includes/BarraAtividades.ascx" TagPrefix="uc1" TagName="BarraAtividades" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <%--adicionar aqui scripts especificos desta pagina--%>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ConteudoPagina" runat="server">

    <!-- Timeline
      ================================================= -->
    <div class="timeline">
        <div class="timeline-cover">

            <!--MENU DO TIMELINE DO USUÁRIO-->
            <div class="timeline-nav-bar hidden-sm hidden-xs" id="menu_timeline_desk" runat="server">
                <div class="row">
                    <div class="col-md-3">
                        <div class="profile-info">
                            <img src="images/users/user-1.jpg" alt="" class="img-responsive profile-photo" />
                            <h3>Sarah Cruiz</h3>
                            <p class="text-muted">Creative Director</p>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <ul class="list-inline profile-menu">
                            <li><a href="timeline.html" class="active">Timeline</a></li>
                            <li><a href="timeline-about.html">Sobre</a></li>
                            <li><a href="timeline-album.html">Álbum</a></li>
                            <li><a href="timeline-friends.html">Amigos</a></li>
                        </ul>
                        <ul class="follow-me list-inline">
                            <li>1,299 pessoas que me seguem</li>
                            <li>
                                <button class="btn-primary">Adicionar amigos</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--Timeline Menu for Large Screens End-->

            <!--Timeline Menu for Small Screens-->
            <div class="navbar-mobile hidden-lg hidden-md" id="menu_timeline_mobile" runat="server">
                <div class="profile-info">
                    <img src="images/users/user-1.jpg" alt="" class="img-responsive profile-photo" />
                    <h4 id="nome_usuario" runat="server">Sarah Cruiz</h4>
                    <p class="text-muted" id="ocupacao" runat="server">Creative Director</p>
                </div>
                <div class="mobile-menu">
                    <ul class="list-inline">
                        <li><a href="timline.html" class="active">Timeline</a></li>
                        <li><a href="timeline-about.html">Sobre</a></li>
                        <li><a href="timeline-album.html">Álbum</a></li>
                        <li><a href="timeline-friends.html">Amigos</a></li>
                    </ul>
                    <button class="btn-primary">Adicionar amigos</button>
                </div>
            </div>
            <!--Timeline Menu for Small Screens End-->
        </div>
        <div id="page-contents">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-7">
                    <!-- Post Create Box -->
                    <div class="create-post">
                        <div class="row">
                            <div class="col-md-7 col-sm-7">
                                <div class="form-group">
                                    <img src="images/users/user-1.jpg" alt="" class="profile-photo-md" />
                                    <textarea name="texts" id="exampleTextarea" cols="30" rows="1" class="form-control" placeholder="Escreva sua mensagem"></textarea>
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-5">
                                <div class="tools">
                                    <ul class="publishing-tools list-inline">
                                        <li><a href="#"><i class="ion-compose"></i></a></li>
                                        <li><a href="#"><i class="ion-images"></i></a></li>
                                        <li><a href="#"><i class="ion-ios-videocam"></i></a></li>
                                        <li><a href="#"><i class="ion-map"></i></a></li>
                                    </ul>
                                    <button class="btn btn-primary pull-right">Publicar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Post Create Box End-->

                    <div id="posts_usuario" runat="server"></div>
                </div>
                <%--aqui vem o include da barra de atividades--%>
                <uc1:BarraAtividades runat="server" ID="BarraAtividades" />
            </div>
        </div>
    </div>
</asp:Content>