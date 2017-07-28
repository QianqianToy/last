<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/13 0013
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的共享</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="css/templatemo-style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <!-- external styles -->
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/style2.css">

    <!-- google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Lato|Lobster' rel='stylesheet' type='text/css'>

    <!-- local styles -->
    <link rel="stylesheet" href="main.css">

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
<body onload="systemTime()">
<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar"  style="width: 300px;">
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
                <li><a href="selectCollectionAll?userID=${user.userID}"><i class="fa fa-map-marker fa-fw"></i>收藏与关注</a></li>
                <li><a href="selectShareByUserID?userID=${user.userID}" class="active"><i class="fa fa-users fa-fw"></i>我的共享</a></li>
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
                        <%--<li><a href="" class="active">首页</a></li>--%>
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
                            <li class="active"><a onclick="window.location.href='selectShareByUserID?userID=${user.userID}'"  data-toggle="tab">收获共享</a></li>
                            <li id="share"><a href="#tab_2" data-toggle="tab">发布共享</a></li>
                            <li id="myshare"><a data-toggle="tab">我的共享</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1">
                                <div class="col-1">
                                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                                        <div class="table-responsive">
                                            <!--<i class="fa fa-times"></i>-->
                                            <table class="table table-striped table-bordered" style="border: 0;">
                                                <thead>
                                                <tr class="green-bg">
                                                    <td id="No">No.</td>
                                                    <td id="pic">图片</td>
                                                    <td id="bookname">书名</td>
                                                    <td id="bookintro">简介</td>
                                                    <td id="bookauthor">作者</td>
                                                    <td id="booktype">类型</td>
                                                </tr>
                                                </thead>
                                                <c:forEach items="${Share}" var="share" varStatus="status">
                                                <tbody>
                                                <tr>
                                                    <td>${status.index+1}.</td>
                                                    <td width="100px"><img src="images/${share.picture}" width="80px" height="50px"/></td>
                                                    <td>${share.bookName}</td>
                                                    <td>${share.bookIntroduction}</td>
                                                    <td>${share.bookAuthor}</td>
                                                    <td>${share.articleBigType}</td>
                                                </tr>
                                                </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab_2">
                                <div class="col-1" id="table_2">
                                    <div style="text-align:center;clear:both">
                                        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
                                        <script src="/follow.js" type="text/javascript"></script>
                                    </div>
                                    <!-- Contact form -->
                                    <form action="insertByUserID" id="contact" method="post" enctype="multipart/form-data">
                                        <div class="templatemo-content-widget white-bg" id="zong" >
                                            <div class="media">
                                                <div class="media-left">
                                                        <img class="media-object img-circle" width="80px" height="80px">
                                                </div>
                                                图书图片：<input type="file" name="file" />
                                                <div id="wrapper" class="clearfix">
                                                    <%--共享人ID：<input type="text" class="has_icon" name="userID" placeholder="userID" required>--%>
                                                    图书名字：<input type="text" class="has_icon" name="bookName" placeholder="bookName" required><br/>
                                                    作者名字：<input type="text" class="has_icon" name="bookAuthor" placeholder="authorName" required><br />
                                                    图书类型：
                                                    <select class="form-control" name="articleBigType">
                                                        <option value="">言情</option>
                                                        <option value="">购物指南</option>
                                                        <option value="">玄幻</option>
                                                        <option value="">恐怖</option>
                                                        <option value="">诗集</option>
                                                    </select><br />
                                                    图书简介：<textarea  name="bookIntroduction"  placeholder="Enter your message" required></textarea><br />
                                                    <button id="submit" type="submit" onclick="share()">发布共享
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane active">
                                <div class="col-1">
                                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                                        <div class="table-responsive" id="tab_3">
                                            <%--<table class="table table-striped table-bordered" style="border: 0;">--%>
                                                <%--<thead>--%>
                                                <%--<tr class="green-bg">--%>
                                                    <%--<td>No.</td>--%>
                                                    <%--<td>图片</td>--%>
                                                    <%--<td>书名</td>--%>
                                                    <%--<td>简介</td>--%>
                                                    <%--<td>作者</td>--%>
                                                    <%--<td>类型</td>--%>
                                                <%--</tr>--%>
                                                <%--</thead>--%>
                                                <%--<c:forEach items="${Share}" var="share" varStatus="status">--%>
                                                    <%--<tbody>--%>
                                                    <%--<tr>--%>
                                                        <%--<td>${status.index+1}.</td>--%>
                                                        <%--<td width="100px"><img src="images/${share.picture}" width="80px" height="50px"/></td>--%>
                                                        <%--<td>${share.bookName}</td>--%>
                                                        <%--<td>${share.bookIntroduction}</td>--%>
                                                        <%--<td>${share.bookAuthor}</td>--%>
                                                        <%--<td>${share.articleBigType}</td>--%>
                                                    <%--</tr>--%>
                                                    <%--</tbody>--%>
                                                <%--</c:forEach>--%>
                                            <%--</table>--%>
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
    <script type="text/javascript" src="js/templatemo-script.js"></script>
    <!-- jQuery 2.2.3 -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="js/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/demo.js"></script>
    <script src="js/index1.js"></script>
    <script>
        $(document).ready(function(){
            // Content widget with background image
            var imageUrl = $('img.content-bg-img').attr('src');
            $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
            $('img.content-bg-img').hide();
        });

        function systemTime(){
            var dateTime = new Date();
            var hh = dateTime.getHours();
            console.log(hh);
            if ( hh>0 && hh<=12){
                $("#sysTime").html("上午好。。。");
            }else if(hh>12 && hh<=18){
                $("#sysTime").html("下午好。。。");
            }else if(hh>18 && hh<=24){
                $("#sysTime").html("晚上好。。。");
            }
        }

        //        $("#share").click(function () {
//
//        })
        function share() {
            alert(123);
            var form = new FormData(document.getElementById("contact"));
            $.ajax({
                    url:"/insertByUserID",
                    type:"post",
                    data:form,
                    datatype:"json",
                    processData:false,
                    contentType:false,
                    success:function(data){
                        alert(111111)
                      /*  $("#contact").empty();*/
                        var str ="";
                        str +="<form id='contact' method='post' enctype='multipart/form-data'>"
                        str +="<div class='templatemo-content-widget white-bg' id='zong' >"
                        str +="<div class='media'>"
                        str +="<div class='media-left'>"
                        str +="<img class='media-object img-circle' src='images/"+data.picture+"' width='80px' height='80px'>"
                        str +="</div>"
                        str +="图书图片："+"<input type='file' name='file' />"
                        str +="<div id='wrapper' class='clearfix'>"

//                        str +="共享人ID："+"<input type='text' class='has_icon' name='userID' placeholder='userID' value='"+data.userID+"' required>"

                        str +="图书名字："+"<input type='text' class='has_icon' name='bookName' placeholder='bookName' value='"+data.bookName+"' required> <br />"
                        str +="作者名字："+"<input type='text' class='has_icon' name='bookAuthor' placeholder='authorName' value='"+data.bookAuthor+"' required><br/>"
                        str +="图书类型："+"<select class='form-control' name='articleBigType'>"
                        str +="<option value=''>言情</option>"
                        str +="<option value=''>购物指南</option>"
                        str +="<option value=''>玄幻</option>"
                        str +="<option value=''>恐怖</option>"
                        str +="<option value=''>诗集</option>"
                        str +="</select><br/>"
                        str +="图书简介："+"<textarea  name='bookIntroduction'  placeholder='Enter your message' required>"+data.bookIntroduction+"</textarea> <br/>"
                        str +="<button id='submit' type='submit' >" + 发布共享
                        str +="</button>"
                        str +="</div>"
                        str +="</div>"
                        str +="</div>"
                        str +="</form>"
                        alert(789);

                        $("#contact").html(str);
                    },
                    error: function () {
                    alert("错误！");
                    }
            })
        }

        $("#myshare").click(function () {
            $("#No").text("No.");
            $("#pic").text("图书图片");
            $("#bookname").text("图书名字");
            $("#bookintro").text("图书简介");
            $("#bookauthor").text("图书作者");
            $("#booktype").text("图书类型");
            var tab = $("tbody");
            tab.empty();
            var str="";
            $.getJSON("selectMyShareByUserID",user.userID,function(data){
                str +="<table>"
                $.each(data,function (index,myshare) {
                    str += "<tr>"
                    str += "<td><i class=‘fa fa-book'></i></td>"
                    str += "<td><img width='80px' height='80px' src="+"images/"+myshare.picture+">"+"</td>"
                    str += "<td>" + myshare.bookName +"</td>"
                    str += "<td>" + myshare.bookIntroduction + "</td>"
                    str += "<td>" + myshare.bookAuthor + "</td>"
                    str += "<td>" + myshare.articleBigType +"</td>"
                    str += "</tr>"
                });
                str=str+"</table>";
                tab.html(str);
            })
        })
    </script>
</body>
</html>
