<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/12 0012
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>收藏与关注</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="css/templatemo-style.css" rel="stylesheet">

    <style>
        .color-palette {
            height: 35px;
            line-height: 35px;
            text-align: center;
        }

        .color-palette-set {
            margin-bottom: 15px;
        }

        .color-palette span {
            display: none;
            font-size: 12px;
        }

        .color-palette:hover span {
            display: block;
        }

        .color-palette-box h4 {
            position: absolute;
            top: 100%;
            left: 25px;
            margin-top: -40px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 12px;
            display: block;
            z-index: 7;
        }
        .row{
            margin-top: 15px;
            margin-left: 5px;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="systemTime()">
<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar" style="width: 300px;">
        <header class="templatemo-site-header" style="margin-bottom: -25px;">
            <div class="square"></div>
            <h1>${user.username}</h1><br/>
            <h1><div id="sysTime"></div></h1>
        </header>


        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="selectById?userID=${user.userID}"><i class="fa fa-home fa-fw"></i>个人信息</a></li>
                <li><a href="selectAllByUsername?userID=${user.userID}"><i class="fa fa-bar-chart fa-fw"></i>文章列表</a></li>
                <li><a href="selectDraftsInfro?userID=${user.userID}"><i class="fa fa-database fa-fw"></i>草稿箱</a></li>
                <li><a href="selectCollectionAll?userID=${user.userID}" class="active"><i class="fa fa-map-marker fa-fw"></i>收藏与关注</a></li>
                <li><a href="selectShareByUserID?userID=${user.userID}"><i class="fa fa-users fa-fw"></i>我的共享</a></li>
                <li><a href="selectComplainAll?userID=${user.userID}"><i class="fa fa-sliders fa-fw"></i>投诉</a></li>
                <li><a href="selectTradeInfroAll?userID=${user.userID}"><i class="fa fa-eject fa-fw"></i>我的钱包</a></li>
            </ul>
        </nav>
    </div>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">首页</a></li>
                        <!-- <li><a href="">2 Dashboard</a></li>-->
                        <li><a href="share.jsp?${username}">共享书籍</a></li>
                        <li><a href="writearticle.jsp?${username}">写文章</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="row">
                <div class="col-md-6" id="i">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a onclick="window.location.href='selectCollectionAll?articleID=6'" data-toggle="tab">我的收藏</a></li>
                            <li id="fans"><a href="" data-toggle="tab">我的关注</a></li>
                        </ul>
                        <%--<c:if test="${not empty ArticleAndCollectarticle}">--%>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1">
                                <div class="col-1">
                                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                                        <div class="table-responsive">
                                            <!--<i class="fa fa-times"></i>-->
                                            <table class="table table-striped table-bordered" style="border: 0;">
                                                <thead>
                                                <tr class="green-bg" id="tr1">
                                                    <td id="No">No.</td>
                                                    <td id="title" width="150px">文章题目</td>
                                                    <td id="name">作者名字</td>
                                                    <td id="count">点数量</td>
                                                    <td id="nlike">不喜欢数量</td>
                                                    <td id="rednum">红花数量</td>
                                                </tr>
                                                </thead>
                                                <c:forEach items="${ArticleAndCollectarticle}" var="collectarticle">
                                                <tbody>
                                                <tr>
                                                    <td><i class="fa fa-hand-o-right"></i></td>
                                                    <td width="100px">
                                                            ${collectarticle.title }
                                                    </td>
                                                    <td>${collectarticle.username }</td>
                                                    <td>${collectarticle.upNum }</td>
                                                    <td>${collectarticle.downNum }</td>
                                                    <td>✿${collectarticle.flowers }</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="text-right">
                <p>Copyright &copy; 基地15班 Company Name
                    |<a href="http://www.baidu.com/" target="_blank" title="百度">共享书房</a></p>
            </footer>
        </div>
    </div>
</div>

<!-- JS -->
<!--<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>-->      <!-- jQuery -->
<!-- jQuery 2.2.3 -->
<script src="js/jquery-3.2.1.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        if($.browser.mozilla) {
            //refresh page on browser resize
            // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
            $(window).bind('resize', function(e)
            {
                if (window.RT) clearTimeout(window.RT);
                window.RT = setTimeout(function()
                {
                    this.location.reload(false); /* false to get page from cache */
                }, 200);
            });
        } else {
            $(window).resize(function(){
                drawMaps();
            });
        }

        drawMaps();

    });
    $("#fans").click(function () {
        $("#No").text("No.");
        $("#title").text("作者头像");
        $("#name").text("作者名字");
        $("#count").text("文章数目");
        $("#nlike").text("粉丝数目");
        $("#rednum").remove("#rednum");
        var tab = $("tbody");
        tab.empty();
        var str="";
        $.getJSON("selectFansAll",function(data){
            $.each(data,function (index,post) {
                str += "<tr>"
                str += "<td><i class='fa fa-street-view'></i></td>"
                str += "<td><img width='80px' height='80px' src="+"images/"+post.photo+">"+"</td>"
                str += "<td>" + post.username + "</td>"
                str += "<td>" + post.articleNum + "</td>"
                str += "<td>" + post.fansNum + "</td>"
                str += "</tr>"
            });
            str=str+"</table>";
            tab.html(str);
        })
    })
    function systemTime(){
        var dateTime = new Date();
        var hh = dateTime.getHours();
        console.log(hh);
        if ( hh>0 && hh<=12){
            $("#sysTime").html("上午好");
        }else if(hh>12 && hh<=18){
            $("#sysTime").html("下午好");
        }else if(hh>18 && hh<=24){
            $("#sysTime").html("晚上好");
        }
    }
</script>
</body>
</html>

