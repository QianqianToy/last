<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>共享书房</title>
	
    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	<link rel="stylesheet" href="css/styleindex.css">
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="css/coda-slider.css" >
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/stylebutton.css" rel="stylesheet" />

    <!-- Owl Carousel  -->
    <link href="owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="owl-carousel/owl.theme.css" rel="stylesheet">

	<!-- Fonts -->
    <link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">
	
	<!-- jQuery -->
	<script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body id="slider" >
    <div >   	
        <div id="header_wrapper"><!--共享书房周围图片-->
            <div id="header">            
            </div>
		</div>
        
        <div id="menu_wrapper"><!--菜单栏设置-->
            <div id="menu">
                <ul class="navigation">
                    <li><a href="" >主页</a></li>
                    <li><a data-toggle="modal" data-target="#login" href="">登录</a></li>
                    <li><a href="regist.jsp">注册</a></li>
                    <li><a href="share.jsp">共享书籍</a></li>
                    <li><c:choose>
                            <c:when test="${empty username}">
                                <a data-toggle="modal" data-target="#login" href="">写文章</a>
                            </c:when>
                            <c:otherwise>
                                <a href="writearticle.jsp" target="_blank">写文章</a>
                            </c:otherwise>
                       </c:choose>
                    </li>
                    <c:if test="${username!=null}">
                    <li ><a href="selectById?userID=${user.userID}" target="_blank"><c:out value="个人中心"/></a></li>
                    </c:if>
                </ul>
            </div>
		</div>		
    </div>

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

    
	<!-- /////////////////////////////////////////实时文章-->
<div id="page-content" class="index-page container" >
	<div class="row">
			<div id="main-content">
				<div class="col-md-6">
                    <div class="box wrap-vid">
                        <ul class="demo-btns">
                            <li><a href="indexType?type=言情" class="btn btn-default-alt">言情</a></li>
                            <li><a href="indexType?type=玄幻" class="btn btn-primary-alt">玄幻</a></li>
                            <li><a href="indexType?type=购物指南" class="btn btn-success-alt">购物指南</a></li>
                            <li><a href="indexType?type=恐怖" class="btn btn-info-alt">恐怖</a></li>
                            <li><a href="indexType?type=诗集" class="btn btn-warning-alt">诗集</a></li>
                        </ul>
                    </div>
                    <c:forEach items="${timeArticles}"  var="art">
                        <div class="box wrap-vid">
                            <div class="zoom-container" >
                                <div class="zoom-caption" >
                                    <p id="title">${art.articleBigType}</p>
                                </div>
                                <img src="images/${art.photo}"/>
                            </div>
                            <h3 class="vid-name"><a href="#">${art.title}</a></h3>
                            <div class="info">
                                <h5>By <a href="viewAuthor?username=${art.username}&userlog=${username}&fansID=${user.userID}">${art.username}</a></h5>

                                <span><i class="fa fa-calendar"></i>${art.writeTime}</span>
                                <span><i class="fa fa-heart"></i>${art.upNum}</span>
                                <span><i class="fa fa-thumbs-down"></i>${art.downNum}</span>
                            </div>
                           <a href="goArticleUI?articleID=${art.articleID}&username=${art.username}"><p class="more">${fn:substring(art.content,0 ,200)}...</p></a>
                        </div>
                    </c:forEach>
                    <c:forEach items="${moreArticles}"  var="more">
                        <div class="box wrap-vid" id="focusOnHere">
                            <div class="zoom-container" >
                                <div class="zoom-caption" >
                                    <p >${more.articleBigType}</p>
                                </div>
                                <img src="images/${more.photo}"/>
                            </div>
                            <h3 class="vid-name"><a href="#">${more.title}</a></h3>
                            <div class="info">
                                <h5>By <a href="viewAuthor?username=${more.username}&userlog=${username}">${more.username}</a></h5>
                                <span><i class="fa fa-calendar"></i>${more.writeTime}</span>
                                <span><i class="fa fa-heart"></i>${more.upNum}</span>
                                <span><i class="fa fa-thumbs-down"></i>${more.downNum}</span>
                            </div>
                            <p class="more">${fn:substring(more.content,0 ,200)}...</p>
                        </div>
                    </c:forEach>
                    <input type="text" id="top" hidden="hidden" value=${top} />
                    <a  class="readmore"><input id="readmore" onload="setScroll()" onclick="readmore()" type="button"  value="阅读更多" ></a>

					<div class="box">
						<div class="box-header header-vimeo">
							<h2>零分文章</h2>
						</div>
                        <input type="text" id="flag" hidden="hidden" value="${flag}" />
                        <input type="text" id="down" hidden="hidden" value=${down} />
                        <h6 style="float: right"><a ><i class="fa fa-refresh" onload="setScroll2()" onclick="changedown()">换一批</i></a></h6>
                        <div class="box-content" style="margin-top: 60px">
                            <div class="row">
                                <c:forEach items="${downArticles}" var="down" begin="0" end="0">
                                    <div class="col-md-6">
                                        <div class="wrap-vid">
                                            <div class="zoom-container">
                                                <div class="zoom-caption">
                                                    <span class="vimeo">神作</span>">
                                                    <p>${down.title}</p>
                                                </div>
                                                <img src="images/${down.photo}" />
                                            </div>
                                            <div class="info">
                                                <h5>By <a href="viewAuthor?username=${down.username}&userlog=${username}">${down.username}</a></h5>
                                                <span><i class="fa fa-calendar"></i>${down.writeTime}</span>
                                                <span><i class="fa fa-heart"></i>${down.upNum}</span>
                                                <span><i class="fa fa-thumbs-down"></i>${down.downNum}</span>
                                            </div>
                                        </div>
                                        <p class="more">${fn:substring(down.content,0 ,200)}...</p>
                                    </div>
                                </c:forEach>
                                <c:forEach items="${downArticles}" var="down" begin="1" end="1">
                                    <div class="col-md-6">
                                        <div class="wrap-vid">
                                            <div class="zoom-container">
                                                <div class="zoom-caption">
                                                    <span class="vimeo">神作</span>">
                                                    <p>${down.title}</p>
                                                </div>
                                                <img src="images/${down.photo}" />
                                            </div>
                                            <div class="info">
                                                <h5>By <a href="viewAuthor?username=${down.username}&userlog=${username}">${down.username}</a></h5>
                                                <span><i class="fa fa-calendar"></i>${down.writeTime}</span>
                                                <span><i class="fa fa-heart"></i>${down.upNum}</span>
                                                <span><i class="fa fa-thumbs-down"></i>${down.downNum}</span>
                                            </div>
                                        </div>
                                        <p class="more">${fn:substring(down.content,0 ,200)}...</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
					</div>
					
					<div class="box">
						<div class="box-header header-natural">
							<h2>猜你喜欢</h2>
						</div>
                        <input type="text" id="up" hidden="hidden" value=${up} />
                        <h6 style="float: right"><a ><i class="fa fa-refresh" onload="setScroll3()" onclick="changeup()">换一批</i></a></h6>
						<div class="box-content" style="margin-top: 60px">
							<div class="row">
                                <c:forEach items="${upArticles}"  var="up" begin="0" end="0">
                                    <div class="col-md-6">
                                        <div class="wrap-vid">
                                            <div class="zoom-container">
                                                <div class="zoom-caption">
                                                    <span class="vimeo">推荐</span>">
                                                    <p>${up.title}</p>
                                                </div>
                                                <img src="images/${up.photo}" />
                                            </div>
                                            <div class="info">
                                                <h5>By <a href="viewAuthor?username=${up.username}&userlog=${username}">${up.username}</a></h5>
                                                <span><i class="fa fa-calendar"></i>${up.writeTime}</span>
                                                <span><i class="fa fa-heart"></i>${up.upNum}</span>
                                                <span><i class="fa fa-thumbs-down"></i>${up.downNum}</span>
                                            </div>
                                        </div>
                                        <p class="more">${fn:substring(up.content,0 ,200)}...</p>
                                    </div>
                                </c:forEach>
                                <c:forEach items="${upArticles}" var="up" begin="1" end="1" varStatus="s">
                                    <div class="col-md-6">
                                        <div class="wrap-vid">
                                            <div class="zoom-container">
                                                <div class="zoom-caption">
                                                    <span class="vimeo">推荐</span>">
                                                    <p>${up.title}</p>
                                                </div>
                                                <img src="images/${up.photo}" />
                                            </div>
                                            <div class="info">
                                                <h5>By <a href="viewAuthor?username=${up.username}&userlog=${username}">${up.username}</a></h5>
                                                <span><i class="fa fa-calendar"></i>${up.writeTime}</span>
                                                <span><i class="fa fa-heart"></i>${up.upNum}</span>
                                                <span><i class="fa fa-thumbs-down"></i>${up.downNum}</span>
                                            </div>
                                        </div>
                                        <p class="more">${fn:substring(up.content,0 ,200)}...</p>
                                    </div>
                                </c:forEach>
							</div>
						</div>
					</div>
			    </div>
			</div>
			
		<div id="sidebar">
			<div class="col-md-3">
				<!---- 热门榜单和作者---->
				<div class="widget wid-vid">
					<div class="heading">
						<h4>热门榜单</h4>
					</div>
					<a href="fivedaylist.html" target="_blank" style="margin-left: 20px;"><input type="button" value="五天榜" /></a>
					<a href="monthranklist.html" target="_blank" style="margin-left: 20px;"><input type="button" value="月榜单" /></a>
					<a href="classifylist.html" target="_blank" style="margin-left: 20px;"><input type="button" value="分类榜" /></a>
					<div class="heading">
						<h4>热门作者</h4>
					</div>
                <c:forEach items="${hotAuthors}" var="auth" begin="0" end="0">
                    <div class="tab-content">
						<div id="most" class="tab-pane fade in active">
							<div class="post wrap-vid" >
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="youtube">热门</span>										
									</div>
									<img src="images/${auth.photo}" />
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a  target="_blank" href="viewAuthor?username=${auth.username}&userlog=${user.userID}">${auth.username}</a></h5>
									<div class="info">
                                        <span><i class="fa fa-heart"></i>${auth.fansNum}<br /></span>
									</div>
								</div>
                 </c:forEach>
                 <c:forEach items="${hotAuthors}" var="auth" begin="1" end="1">
								<div class="wrapper" style="float: right;">
									<h5 class="vid-name"><a target="_blank" href="viewAuthor?username=${auth.username}&userlog=${user.userID}">${auth.username}</a></h5>
										<div class="info">
                                            <span><i class="fa fa-heart"></i>${auth.fansNum}<br /></span>

										</div>										
								</div>
								<div class="zoom-container" style="float: right;padding-right: 10px;" >
									<div class="zoom-caption">
										<span class="youtube">热门</span>
									</div>
									<img src="images/${auth.photo}" />
								</div>
							</div>
                        </div>
                    </div>
                </c:forEach>
		        <c:forEach items="${hotAuthors}" var="auth" begin="2" end="2">
                    <div class="post wrap-vid">
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span class="vimeo">推荐</span>
                            </div>
                            <img src="images/${auth.photo}" />
                        </div>
                        <div class="wrapper">
                            <h5 class="vid-name"><a target="_blank" href="viewAuthor?username=${auth.username}&userlog=${user.userID}">${auth.username}</a></h5>
                            <div class="info">
                                <span><i class="fa fa-heart"></i>${auth.fansNum}<br /></span>
                            </div>
                        </div>
                </c:forEach>
                <c:forEach items="${hotAuthors}" var="auth" begin="3" end="3">
                        <div class="wrapper" style="float: right;">
                            <h5 class="vid-name"><a target="_blank" href="viewAuthor?username=${auth.username}&userlog=${user.userID}">${auth.username}</a></h5>
                            <div class="info">
                                <span><i class="fa fa-heart"></i>${auth.fansNum}<br /></span>
                            </div>
                        </div>
                        <div class="zoom-container" style="float: right;padding-right: 20px;">
                            <div class="zoom-caption">
                                <span class="vimeo">推荐</span>
                            </div>
                            <img src="images/${auth.photo}" />
                        </div>
                    </div>
                </c:forEach>
                <c:forEach items="${hotAuthors}" var="auth" begin="4" end="4">
                    <div class="post wrap-vid" >
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span class="vimeo">推荐</span>
                            </div>
                            <img src="images/${auth.photo}" />
                        </div>
                        <div class="wrapper">
                            <h5 class="vid-name"><a target="_blank" href="viewAuthor?username=${auth.username}&userlog=${user.userID}">${auth.username}</a></h5>
                            <div class="info">
                                <span><i class="fa fa-heart"></i>${auth.fansNum}<br /></span>
                            </div>
                        </div>
                </c:forEach>
                <c:forEach items="${hotAuthors}" var="auth" begin="5" end="5">
                            <div class="wrapper" style="float: right;">
                                <h5 class="vid-name"><a target="_blank" href="viewAuthor?username=${auth.username}&userlog=${user.userID}">${auth.username}</a></h5>
                                <div class="info">
                                    <span><i class="fa fa-heart"></i>${auth.fansNum}<br /></span>
                                </div>
                            </div>
                            <div class="zoom-container" style="float: right;padding-right: 10px;">
                                <div class="zoom-caption">
                                        <span class="vimeo">推荐</span>
                                </div>
                                <img src="images/${auth.photo}" />
                            </div>
                        </div>
                    </div>
                </c:forEach>

				 <div class="widget wid-gallery" >
					<div class="heading">
						<h4>今日事件</h4>
					</div>
					<div class="row" style="width: 680px;">
						<div class="col-sm-8" >
								<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
								<!-- 轮播图原点 -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
										<li data-target="#carousel-example-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example-generic" data-slide-to="2"></li>
									</ol>
									<!-- 轮播图 -->
									<div class="carousel-inner" >
										<div class="item active" >
											<a href="indexType?type=恐怖" target="_blank"><img src="images/1.jpg" alt="First slide" ></a>
											<div class="header-text hidden-xs" >
												<div class="col-md-12 text-center" >
													<h2>今日话题 </h2>
													<br>
													<h3>记忆中的恐怖故事</h3>
													<br>
											</div>
										</div>
									</div>
										<div class="item">
                                            <c:choose>
                                                <c:when test="${empty username}">
                                                    <a data-toggle="modal" data-target="#login" ><img src="images/2.jpg" alt="Second slide"></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="writearticle.jsp" target="_blank"><img src="images/2.jpg" alt="Second slide"></a>
                                                </c:otherwise>
                                            </c:choose>
											<div class="header-text hidden-xs">
												<div class="col-md-12 text-center">
													<h2>三行情书大赛</h2>
													<br>
													<h3>7月8日正式开赛</h3>
													<br>
												</div>
											</div>
										</div>
										<div class="item">
											<a href="indexType?type=购物指南" target="_blank"><img src="images/3.jpg" alt="Third slide"></a>
											<div class="header-text hidden-xs">
												<div class="col-md-12 text-center">
													<h2>喜羊羊的快乐生活</h2>
													<br>
													<h3>写给孩子的 心灵故事</h3>
													<br>
												</div>
											</div><!-- /header-text -->
										</div>
									</div>
									<!-- 轮播图方向键 -->
									<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
										<span class="glyphicon glyphicon-chevron-left"></span>
									</a>
									<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>
							</div>
						</div>	
						
					</div>
				</div>
			</div>
    </div>
</div>
	
	<!-- JS -->
	<script src="owl-carousel/owl.carousel.js"></script>
    <script>
    $(document).ready(function() {
      $("#owl-demo-1").owlCarousel({
        autoPlay: 3000,
        items : 1,
        itemsDesktop : [1199,1],
        itemsDesktopSmall : [400,1]
      });
	  $("#owl-demo-2").owlCarousel({
        autoPlay: 3000,
        items : 3,
        
      });
        var top = document.getElementById("top").value;
        var down = document.getElementById("down").value;
        var up = document.getElementById("up").value;
        var flag=document.getElementById("flag").value;
        if(flag=="1"){
            if(top != 0) {
                window.scrollTo(0, top);
            }
        }if(flag=="2"){
            if(down != 0) {
                window.scrollTo(0, down);
            }
        }
        if(flag=="3"){
            if(up != 0) {
                window.scrollTo(0, up);
            }
        }

        });
    function readmore(){
        var top;
        if (document.documentElement &&
            document.documentElement.scrollTop)
        {
            top = document.documentElement.scrollTop;
        } else if (document.body)
        {
            top = document.body.scrollTop;
        }
        window.location.href="readMore?top="+top;
    }

    function changedown(){
        var down;
        if (document.documentElement &&
            document.documentElement.scrollTop)
        {
            down = document.documentElement.scrollTop;
        } else if (document.body)
        {
            down = document.body.scrollTop;
        }
        window.location.href="change1?down="+down;
    }

    function changeup(){
        var up;
        if (document.documentElement &&
            document.documentElement.scrollTop)
        {
            up = document.documentElement.scrollTop;
        } else if (document.body)
        {
            up = document.body.scrollTop;
        }
        window.location.href="change2?up="+up;
    }
    </script>
	
	
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
</body>
</html>
