﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TravelShare._default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="This is social network html5 template available in themeforest......" />
    <meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
    <meta name="robots" content="index, follow" />
    <title>Friend Finder | A Complete Social Network Template</title>

    <!-- Stylesheets
    ================================================= -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/ionicons.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />

    <!--Google Font-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i" rel="stylesheet">

    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="images/fav.png" />

    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.12&appId=307006266017428&autoLogAppEvents=1';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    
	<style>
		.camposForm {-webkit-transition: all 0.5s ease;-moz-transition: all 0.5s ease;-o-transition: all 0.5s ease;transition: all 0.5s ease;opacity: 1;}
		.camposForm.esconde {min-height: 0px;max-height: 0px;overflow: hidden;opacity: 0}
	</style>
	
</head>
<body>

    <!-- Header
    ================================================= -->
    <header id="header" class="lazy-load">
        <nav class="navbar navbar-default navbar-fixed-top menu">
            <div class="container">

                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index-register.html">
                        <img src="images/logo.png" alt="logo" /></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <%-- <ul class="nav navbar-nav navbar-right main-menu" style="display:none;">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Home <span>
                                <img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu newsfeed-home">
                                <li><a href="index.html">Landing Page 1</a></li>
                                <li><a href="index-register.html">Landing Page 2</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Newsfeed <span>
                                <img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu newsfeed-home">
                                <li><a href="newsfeed.html">Newsfeed</a></li>
                                <li><a href="newsfeed-people-nearby.html">Poeple Nearly</a></li>
                                <li><a href="newsfeed-friends.html">My friends</a></li>
                                <li><a href="newsfeed-messages.html">Chatroom</a></li>
                                <li><a href="newsfeed-images.html">Images</a></li>
                                <li><a href="newsfeed-videos.html">Videos</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Timeline <span>
                                <img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu login">
                                <li><a href="timeline.html">Timeline</a></li>
                                <li><a href="timeline-about.html">Timeline About</a></li>
                                <li><a href="timeline-album.html">Timeline Album</a></li>
                                <li><a href="timeline-friends.html">Timeline Friends</a></li>
                                <li><a href="edit-profile-basic.html">Edit: Basic Info</a></li>
                                <li><a href="edit-profile-work-edu.html">Edit: Work</a></li>
                                <li><a href="edit-profile-interests.html">Edit: Interests</a></li>
                                <li><a href="edit-profile-settings.html">Account Settings</a></li>
                                <li><a href="edit-profile-password.html">Change Password</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle pages" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">All Pages <span>
                                <img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu page-list">
                                <li><a href="index.html">Landing Page 1</a></li>
                                <li><a href="index-register.html">Landing Page 2</a></li>
                                <li><a href="newsfeed.html">Newsfeed</a></li>
                                <li><a href="newsfeed-people-nearby.html">Poeple Nearly</a></li>
                                <li><a href="newsfeed-friends.html">My friends</a></li>
                                <li><a href="newsfeed-messages.html">Chatroom</a></li>
                                <li><a href="newsfeed-images.html">Images</a></li>
                                <li><a href="newsfeed-videos.html">Videos</a></li>
                                <li><a href="timeline.html">Timeline</a></li>
                                <li><a href="timeline-about.html">Timeline About</a></li>
                                <li><a href="timeline-album.html">Timeline Album</a></li>
                                <li><a href="timeline-friends.html">Timeline Friends</a></li>
                                <li><a href="edit-profile-basic.html">Edit Profile</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                                <li><a href="faq.html">FAQ Page</a></li>
                                <li><a href="404.html">404 Not Found</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="contact.html">Contact</a></li>
                    </ul>
                    <form class="navbar-form navbar-right hidden-sm">
                        <div class="form-group">
                            <i class="icon ion-android-search"></i>
                            <input type="text" class="form-control" placeholder="Search friends, photos, videos">
                        </div>
                    </form>--%>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
    </header>
    <!--Header End-->

    <!-- Top Banner
    ================================================= -->
    <section id="banner">
        <div class="container">

            <!-- Sign Up Form
        ================================================= -->
            <form class="sign-up-form" action="" runat="server" method="post">
               	<a href="index.html" class="logo">
					<img src="images/logo.png" alt="Travel Share" />
				</a>
               	<div id="formRegistrar" class="camposForm">
					<input type="hidden" name="acao" value="inscrever" />
					<h2 class="text-white">Crie sua conta</h2>
					<div class="line-divider"></div>
					<div class="form-wrapper">
						<p class="signup-text">Inscreva-se agora e conheça pessoas incríveis ao redor do mundo!</p>
						<div>
							<fieldset class="form-group">
								<input type="text" class="form-control" id="USU_NOME" placeholder="Digite seu nome" />
							</fieldset>
							<fieldset class="form-group">
								<input type="email" class="form-control" id="USU_EMAIL" placeholder="Digite seu e-mail" />
							</fieldset>
							<fieldset class="form-group">
								<input type="password" class="form-control" id="USU_SENHA" placeholder="Digite uma senha" />
							</fieldset>
						</div>
						<p>Ao assinar você concorda com os <a href="javascript:void(0);">termos</a></p>
						<input type="submit" class="btn-secondary" value="Inscrever-se" />
					</div>
					<a href="javascript:void(0);" class="btnTemConta">Já tem uma conta?</a>
					<div class="cadastrar-face">
					   <div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
					</div>
               	</div>
               	<div id="formLogin" class="camposForm esconde">
               		<input type="hidden" name="acao" value="login" />
					<h2 class="text-white">Login</h2>
					<div class="line-divider"></div>
					<div class="form-wrapper">
						<p class="signup-text">Faça login na sua conta</p>
						<div>
							<fieldset class="form-group">
								<input type="email" class="form-control" id="USU_LOG_EMAIL" placeholder="Seu email" />
							</fieldset>
							<fieldset class="form-group">
								<input type="password" class="form-control" id="USU_LOG_SENHA" placeholder="Sua senha" />
							</fieldset>
						</div>
						<input type="submit" class="btn-secondary" value="Logar" />
					</div>
					<a href="javascript:void(0);" class="btnEsqueciSenha">Esqueceu sua senha?</a><br />
					<a href="javascript:void(0);" class="btnCriarConta">Não tem uma conta ainda?</a>
					<div class="logar-face">
						<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
					</div>
               	</div>
                <img class="form-shadow" src="images/bottom-shadow.png" alt="" />
            </form>
            <!-- Sign Up Form End -->

            <svg class="arrows hidden-xs hidden-sm">
                <path class="a1" d="M0 0 L30 32 L60 0"></path>
                <path class="a2" d="M0 20 L30 52 L60 20"></path>
                <path class="a3" d="M0 40 L30 72 L60 40"></path>
            </svg>
        </div>
    </section>

    <!-- Features Section
    ================================================= -->
    <section id="features">
        <div class="container wrapper">
            <h1 class="section-title slideDown">travel share</h1>
            <div class="row slideUp">
                <div class="feature-item col-md-2 col-sm-6 col-xs-6 col-md-offset-2">
                    <div class="feature-icon"><i class="icon ion-person-add"></i></div>
                    <h3>Ganhe amigos</h3>
                </div>
                <div class="feature-item col-md-2 col-sm-6 col-xs-6">
                    <div class="feature-icon"><i class="icon ion-images"></i></div>
                    <h3>Faça postagens</h3>
                </div>
                <div class="feature-item col-md-2 col-sm-6 col-xs-6">
                    <div class="feature-icon"><i class="icon ion-chatbox-working"></i></div>
                    <h3>Converse no Chat</h3>
                </div>
                <div class="feature-item col-md-2 col-sm-6 col-xs-6">
                    <div class="feature-icon"><i class="icon ion-compose"></i></div>
                    <h3>Divida os gastos</h3>
                </div>
            </div>
            <h2 class="sub-title">encontre pessoas incríveis iguais a você</h2>
            <div id="incremental-counter" data-value="101242"></div>
            <p>Pessoas que já se escreveram</p>
            <img src="images/face-map.png" alt="" class="img-responsive face-map slideUp hidden-sm hidden-xs" />
        </div>
    </section>

    <!-- Download Section
    ================================================= -->
    <section id="app-download">
        <div class="container wrapper">
            <h1 class="section-title slideDown">download</h1>
            <ul class="app-btn list-inline slideUp">
                <li>
                    <button class="btn-secondary">
                        <img src="images/app-store.png" alt="App Store" /></button></li>
                <li>
                    <button class="btn-secondary">
                        <img src="images/google-play.png" alt="Google Play" /></button></li>
            </ul>
            <h2 class="sub-title">Permaneça conectado a qualquer hora, em qualquer lugar.</h2>
            <img src="images/iPhone.png" alt="iPhone" class="img-responsive" />
        </div>
    </section>

    <!-- Image Divider
    ================================================= -->
    <div class="img-divider hidden-sm hidden-xs"></div>

    <!-- Facts Section
    ================================================= -->
    <section id="site-facts">
        <div class="container wrapper">
            <div class="circle">
                <ul class="facts-list">
                    <li>
                        <div class="fact-icon"><i class="icon ion-ios-people-outline"></i></div>
                        <h3 class="text-white">1,01,242</h3>
                        <p>Pessoas cadastradas</p>
                    </li>
                    <li>
                        <div class="fact-icon"><i class="icon ion-images"></i></div>
                        <h3 class="text-white">21,01,242</h3>
                        <p>Posts publicados</p>
                    </li>
                    <li>
                        <div class="fact-icon"><i class="icon ion-checkmark-round"></i></div>
                        <h3 class="text-white">41,242</h3>
                        <p>Pessoas online</p>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!-- veja o que as pessoas estão falando -->
    <section id="live-feed">
        <div class="container wrapper">
            <h1 class="section-title slideDown">online</h1>
            <ul class="online-users list-inline slideUp" id="usuarios" runat="server">
            </ul>
            <h2 class="sub-title">veja o que as pessoas estão falando</h2>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-md-offset-2">
                    <div class="feed-item">
                        <img src="images/users/user-1.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Sarah</a> just posted a photo from Moscow</p>
                            <p class="text-muted">20 Secs ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-4.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">John</a> Published a post from Sydney</p>
                            <p class="text-muted">1 min ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-10.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Julia</a> Updated her status from London</p>
                            <p class="text-muted">5 mins ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-3.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Sophia</a> Share a photo from Virginia</p>
                            <p class="text-muted">10 mins ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-2.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Linda</a> just posted a photo from Toronto</p>
                            <p class="text-muted">20 mins ago</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="feed-item">
                        <img src="images/users/user-17.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Nora</a> Shared an article from Ohio</p>
                            <p class="text-muted">22 mins ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-18.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Addison</a> Created a poll from Barcelona</p>
                            <p class="text-muted">23 mins ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-11.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Diana</a> Posted a video from Captown</p>
                            <p class="text-muted">27 mins ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-1.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Sarah</a> Shared friend's post from Moscow</p>
                            <p class="text-muted">30 mins ago</p>
                        </div>
                    </div>
                    <div class="feed-item">
                        <img src="images/users/user-16.jpg" alt="user" class="img-responsive profile-photo-sm" />
                        <div class="live-activity">
                            <p><a href="#" class="profile-link">Emma</a> Started a new job at Torronto</p>
                            <p class="text-muted">33 mins ago</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer
    ================================================= -->
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer-wrapper">
                    <div class="col-md-3 col-sm-3">
                        <a href="">
                            <img src="images/logo-black.png" alt="" class="footer-logo" /></a>
                        <ul class="list-inline social-icons">
                            <li><a href="#"><i class="icon ion-social-facebook"></i></a></li>
                            <li><a href="#"><i class="icon ion-social-twitter"></i></a></li>
                            <li><a href="#"><i class="icon ion-social-googleplus"></i></a></li>
                            <li><a href="#"><i class="icon ion-social-pinterest"></i></a></li>
                            <li><a href="#"><i class="icon ion-social-linkedin"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-2">
                        <h5>For individuals</h5>
                        <ul class="footer-links">
                            <li><a href="">Signup</a></li>
                            <li><a href="">login</a></li>
                            <li><a href="">Explore</a></li>
                            <li><a href="">Finder app</a></li>
                            <li><a href="">Features</a></li>
                            <li><a href="">Language settings</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-2">
                        <h5>For businesses</h5>
                        <ul class="footer-links">
                            <li><a href="">Business signup</a></li>
                            <li><a href="">Business login</a></li>
                            <li><a href="">Benefits</a></li>
                            <li><a href="">Resources</a></li>
                            <li><a href="">Advertise</a></li>
                            <li><a href="">Setup</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-2">
                        <h5>About</h5>
                        <ul class="footer-links">
                            <li><a href="">About us</a></li>
                            <li><a href="">Contact us</a></li>
                            <li><a href="">Privacy Policy</a></li>
                            <li><a href="">Terms</a></li>
                            <li><a href="">Help</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <h5>Contact Us</h5>
                        <ul class="contact">
                            <li><i class="icon ion-ios-telephone-outline"></i>+1 (234) 222 0754</li>
                            <li><i class="icon ion-ios-email-outline"></i>info@thunder-team.com</li>
                            <li><i class="icon ion-ios-location-outline"></i>228 Park Ave S NY, USA</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>copyright @thunder-team 2016. All rights reserved</p>
        </div>
    </footer>

    <!--preloader-->
    <div id="spinner-wrapper">
        <div class="spinner"></div>
    </div>

    <!-- Scripts
    ================================================= -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.appear.min.js"></script>
    <script src="js/jquery.incremental-counter.js"></script>
    <script src="js/script.js"></script>
    
    <script>
        $(document).ready(function () {
            $(".btnTemConta").click(function () {
                $("#formRegistrar").addClass("esconde");
                $("#formLogin").removeClass("esconde");
            });
            $(".btnCriarConta").click(function () {
                $("#formLogin").addClass("esconde");
                $("#formRegistrar").removeClass("esconde");
            });
        });
	</script>
</body>
</html>