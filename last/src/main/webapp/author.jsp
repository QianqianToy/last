<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>查看作者</title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400"> 
    <link rel="stylesheet" href="font-awesome-4.6.3/css/font-awesome.min.css">           
    <link rel="stylesheet" href="css/bootstrap.min.css">                                 
    <link rel="stylesheet" href="css/magnific-popup.css">                                
    <link rel="stylesheet" href="css/author.css">
    <link rel="stylesheet" href="css/style.styleindex.css">

    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

</head>

      <body>
      <!-- 登录窗口 -->
      <div id="login" class="modal fade">
          <div class="modal-dialog" >
              <div class="modal-content"style="background:url(images/newlogin.jpg);">
                  <div class="modal-body">
                      <button class="close" data-dismiss="modal">
                          <span>&times;</span>
                      </button>
                  </div>
                  <div class="modal-title">
                      <h1 class="text-center" style="color: white;" id="button_login">登录</h1>
                  </div>
                  <div class="modal-body">
                      <form class="form-group" action="login">
                          <div class="form-group">
                              <label  style="color: white;">用户名</label>
                              <input class="form-control" id="username" name="username" type="text" placeholder="请输入您的账号">
                          </div>
                          <div class="form-group">
                              <label style="color: white;">密码</label>
                              <input class="form-control" id="password" name="password" type="password" placeholder="请输入您的密码">
                          </div>
                          <div class="text-right">
                              <button class="btn btn-primary" type="submit">登录</button>
                              <button class="btn btn-danger" data-dismiss="modal">取消</button>
                          </div>
                          <a href="regist.jsp">还没有账号？点我注册</a>
                      </form>
                  </div>
              </div>
          </div>
      </div>

        <div class="container-fluid">
            <div class="tm-body">
                <div class="tm-sidebar">
                    <%--<a href="javaScript.history.back(1)" ><p style="font-size: 20px;">返回上一页</p></a>--%>
                    <nav class="tm-main-nav">
                        <ul class="tm-main-nav-ul">
                            <li class="tm-nav-item"><a href="#mylife" class="tm-nav-item-link tm-button">
                                	<p style="font-size: 20px;">我的人生</p></a>
                            </li>
                            <li class="tm-nav-item"><a href="#gallery" class="tm-nav-item-link tm-button">
                                <p style="font-size: 20px;">我的共享</p></a>
                            </li>
                            <li class="tm-nav-item"><a href="#services" class="tm-nav-item-link tm-button">
                                	<p style="font-size: 20px;">我的故事</p></a>
                            </li> 
                        </ul>
                    </nav>
                </div>
                
                <div class="tm-main-content" >
                      <div id="mylife" class="tm-content-box tm-content-box-home" >
                          <img src="images/${viewAuthors.photo}" alt="头像" class="img-fluid tm-welcome-img">
                          <div class="tm-welcome-boxes-container">
                              <div class="tm-welcome-box" >
                                  <div class="tm-welcome-text">
                                      <p >姓名：${viewAuthors.username}
                                          <c:choose>
                                              <c:when test="${empty userlog}">
                                                  <a data-toggle="modal" data-target="#login" href=""><c:out value="登录关注"></c:out></a>
                                              </c:when>
                                              <c:when test="${i=='1'}">
                                                  <c:out value="已关注"></c:out>
                                              </c:when>
                                              <c:otherwise>
                                                  <a href="attention?username=${viewAuthors.username}&authorID=${viewAuthors.userID}&fansID=${userlog}&fansNum=${viewAuthors.fansNum}&userlog=${userlog}"><c:out value="关注"></c:out></a>
                                              </c:otherwise>
                                          </c:choose>
                                      </p>
                                      <p>粉丝数：${viewAuthors.fansNum}</p>
                                      <p>星座：${viewAuthors.sign}</p>
                                      <p>生日：${viewAuthors.birthday}</p>
                                  </div>
                              </div>
                              <div class="tm-welcome-box">
                                  <div class="tm-welcome-text">
                                      <p >个性签名：</p>
                                      <p>${viewAuthors.signature}</p>
                                  </div>
                              </div>
                          </div>
                      </div>

                    <div id="gallery" class="tm-content-box">
                        <div class="grid tm-gallery">
                            <c:forEach items="${myShareBooks}" var="share" begin="0" end="0">
                                <figure class="effect-bubba">
                                    <img  style="height:255px;" src="images/${share.picture}" alt="Image 8" class="img-fluid">
                                    <figcaption>
                                        <h2>${share.bookName}</h2>
                                        <p>${share.bookIntroduction}</p>
                                        <p>${share.email}</p>
                                        <a href="images/${share.picture}">View more</a>
                                    </figcaption>
                                </figure>
                            </c:forEach>
                            <c:forEach items="${myShareBooks}" var="share" begin="1" end="1">
                                <figure class="effect-bubba">
                                    <img style="height:255px;" src="images/${share.picture}" alt="Image 7" class="img-fluid">
                                    <figcaption>
                                        <h2>${share.bookName}</h2>
                                        <p>${share.bookIntroduction}</p>
                                        <p>${share.email}</p>
                                        <a href="images/${share.picture}">View more</a>
                                    </figcaption>
                                </figure>
                            </c:forEach>
                            <c:forEach items="${myShareBooks}" var="share" begin="2" end="2">
                                <figure class="effect-bubba">
                                    <img style="height:255px;" src="images/${share.picture}" alt="Image 5" class="img-fluid">
                                    <figcaption>
                                        <h2>${share.bookName}</h2>
                                        <p>${share.bookIntroduction}</p>
                                        <p>${share.email}</p>
                                        <a href="images/${share.picture}">View more</a>
                                    </figcaption>
                                </figure>
                            </c:forEach>
                            <c:forEach items="${myShareBooks}" var="share" begin="3" end="3">
                                <figure class="effect-bubba">
                                    <img style="height:255px;" src="images/${share.picture}" alt="Image 3" class="img-fluid">
                                    <figcaption>
                                        <h2>${share.bookName}</h2>
                                        <p>${share.bookIntroduction}</p>
                                        <p>${share.email}</p>
                                        <a href="images/${share.picture}">View more</a>
                                    </figcaption>
                                </figure>
                            </c:forEach>
                            <c:forEach items="${myShareBooks}" var="share" begin="4" end="4">
                                <figure class="effect-bubba">
                                    <img style="height:255px;" src="images/${share.picture}" alt="Image 2" class="img-fluid">
                                    <figcaption>
                                        <h2>${share.bookName}</h2>
                                        <p>${share.bookIntroduction}</p>
                                        <p>${share.email}</p>
                                        <a href="images/${share.picture}">View more</a>
                                    </figcaption>
                                </figure>
                            </c:forEach>
                            <c:forEach items="${myShareBooks}" var="share" begin="5" end="5">
                                <figure class="effect-bubba">
                                    <img style="height:255px;" src="images/${share.picture}" alt="Image 4" class="img-fluid">
                                    <figcaption>
                                        <h2>${share.bookName}</h2>
                                        <p>${share.bookIntroduction}</p>
                                        <p>${share.email}</p>
                                        <a href="images/${share.picture}">View more</a>
                                    </figcaption>
                                </figure>
                            </c:forEach>
                        </div>
                    </div>

                    <div id="services" >
						<c:forEach items="${viewArticles}" var="vArticle">
                            <div class="box wrap-vid">
								<h3 class="vid-name"><a href="#">${vArticle.title}</a></h3>
								<div class="info">
									<h5>By <a href="#">${vArticle.username}</a></h5>
									<span><i class="fa fa-calendar"></i>${vArticle.writeTime}</span>
									<span><i class="fa fa-heart"></i>${vArticle.upNum}</span>
                                    <span><i class="fa fa-heart"></i>${vArticle.downNum}</span>
								</div>
								<p class="more">${vArticle.content}</p>
                            </div>
                        </c:forEach>
                    </div>

                </div>
        <!-- load JS files -->
        
        <script src="js/jquery-1.11.3.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
        <script src="js/tether.min.js"></script> <!-- Tether for Bootstrap (http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h) -->
        <script src="js/jquery.magnific-popup.min.js"></script>     <!-- Magnific pop-up (http://dimsemenov.com/plugins/magnific-popup/) -->
        <script src="js/jquery.singlePageNav.min.js"></script>      <!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
        
        <!-- Templatemo scripts -->
        <script>  

        

        function setNavbar() {
            if ($(document).scrollTop() > 160) {
                $('.tm-sidebar').addClass('sticky');
            } else {
                $('.tm-sidebar').removeClass('sticky');
            }
        }                   
    
        $(document).ready(function(){
            
            // Single page nav
            $('.tm-main-nav').singlePageNav({
                'currentClass' : "active",
                offset : 20
            });

            // Detect window scroll and change navbar
            setNavbar();
            
            $(window).scroll(function() {
              setNavbar();
            });

            // Magnific pop up
            $('.tm-gallery').magnificPopup({
              delegate: 'a', // child items selector, by clicking on it popup will open
              type: 'image',
              gallery: {enabled:true}
              // other options
            });
         
        });
    
        </script>             

    </body>
    </html>