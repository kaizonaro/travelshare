<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BoxPostagem.ascx.cs" Inherits="TravelShare.includes.BoxPostagem" %>
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