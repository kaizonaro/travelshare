<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/sistema.Master" CodeBehind="usuario-album.aspx.cs" Inherits="TravelShare.usuario_timeline" %>

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
            <uc2:menuusuariologado runat="server" id="menuUsuarioLogado1" />
        </div>
        <div id="page-contents">
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">

              <!-- Photo Album -->
              <ul class="album-photos">
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-1">
                    <img src="images/album/1.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-1" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/1.jpg" alt="photo" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-2">
                    <img src="images/album/2.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-2" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/2.jpg" alt="photo" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-3">
                    <img src="images/album/3.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-3" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/3.jpg" alt="photo" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-4">
                    <img src="images/album/4.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-4" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/4.jpg" alt="photo" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-5">
                    <img src="images/album/5.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-5" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/5.jpg" alt="" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-6">
                    <img src="images/album/6.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-6" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/6.jpg" alt="" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-7">
                    <img src="images/album/7.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-7" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/7.jpg" alt="" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-8">
                    <img src="images/album/8.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-8" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/8.jpg" alt="" />
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="img-wrapper" data-toggle="modal" data-target=".photo-9">
                    <img src="images/album/9.jpg" alt="photo" />
                  </div>
                  <div class="modal fade photo-9" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <img src="images/album/9.jpg" alt="" />
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
           
              <%--BARRA DE ATIVIDADES--%>
                <uc1:BarraAtividades runat="server" ID="BarraAtividades" />
          </div>
        </div>
      </div>
</asp:Content>