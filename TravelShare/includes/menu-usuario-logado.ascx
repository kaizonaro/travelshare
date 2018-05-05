<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu-usuario-logado.ascx.cs" Inherits="TravelShare.includes.menu_usuario_logado" %>
<div class="timeline-nav-bar hidden-sm hidden-xs" id="menu_timeline_desk" runat="server">
    <div class="row">
        <div class="col-md-3">
            <div class="profile-info">
                <img id="USU_FOTO_PERFIL" src="images/users/user-1.jpg" runat="server" alt="" class="img-responsive profile-photo" />
                <h3 id="USU_NOME" runat="server"></h3>
                <p class="text-muted" id="USU_OCUPACAO"></p>
            </div>
        </div>
        <div class="col-md-9">
            <ul class="list-inline profile-menu">
                <li><a href="/usuario-timeline.aspx" class="active">Timeline</a></li>
                <li><a href="/usuario-sobre.aspx">Sobre</a></li>
                <li><a href="javascript:void(0);">Álbum</a></li>
                <li><a href="javascript:void(0);">Amigos</a></li>
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
