<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/12 0012
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的钱包</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <link rel="stylesheet" href="css/_all-skins.min.css">
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="css/templatemo-style.css" rel="stylesheet">
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="systemTime()">
<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar" style="width:300px;">
        <header class="templatemo-site-header" style="margin-bottom: -25px;">
            <div class="square"></div>
            <h1>${user.username}</h1><br/>
            <h1><div id="sysTime"></div></h1>
        </header>

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
            <!-- Main content -->
            <section class="content">

                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <%--<c:forEach items="${WalletInfro }" var="walletinfro">--%>
                        <div class="box box-primary">
                            <div class="box-body box-profile">
                                <img class="profile-user-img img-responsive img-circle" src="images/${user.photo}" alt="User profile picture">

                                <h3 class="profile-username text-center"></h3>

                                <p class="text-muted text-center"></p>

                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>Name</b><a class="pull-right" id="name">${user.username}</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Fans</b><a class="pull-right" id="flowers">${user.fansNum}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div id="yu-e">
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">交易记录</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body" id="tab">
                                    <%--<table class="table table-bordered">--%>
                                        <%--<tr>--%>
                                            <%--<th style="width: 10px">#</th>--%>
                                            <%--<th>交易详情</th>--%>
                                            <%--<th>交易时间</th>--%>
                                            <%--<th style="width: 40px">交易数量</th>--%>
                                        <%--</tr>--%>
                                        <%--<c:forEach items="${Trade}" var="trade" varStatus="status">--%>
                                            <%--<tr>--%>
                                            <%--<td>${status.index+1}.</td>--%>
                                            <%--<td>${trade.username}打赏了${trade.authorName}</td>--%>
                                            <%--<td>--%>
                                                <%--${trade.tradeTime}--%>
                                            <%--</td>--%>
                                            <%--<td>--%>
                                                <%--<c:if test = "${trade.username == user.username }">--%>
                                                    <%--<span class="badge bg-green"> -${trade.tradeFlowers}</span>--%>
                                                <%--</c:if>--%>
                                                <%--<c:if test = "${trade.username!= user.username }">--%>
                                                   <%--<span class="badge bg-red">+${trade.tradeFlowers}</span>--%>
                                                <%--</c:if>--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
                                        <%--</c:forEach>--%>
                                    <%--</table>--%>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer clearfix" id="page">
                                    <ul class="pagination pagination-sm no-margin pull-right">
                                        <li><a href="#">&laquo;</a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">&raquo;</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <footer class="text-right">
                <p>Copyright &copy; 基地15班 Company Name
                    |<a href="http://www.baidu.com/" target="_blank" title="百度">共享书房</a></p>
            </footer>
        </div>
    </div>
</div>

        <!-- jQuery 2.2.3 -->
        <script src="js/jquery-3.2.1.js"></script>
        <!-- JS -->
        <script type="text/javascript" src="js/templatemo-script.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="js/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="js/demo.js"></script><!-- Templatemo Script -->
        <script type="text/javascript">
            $(document).ready(function () {
                $.getJSON("selectWalletInfroAll",function (data) {
                    $(".profile-username").text(data[0].username);
                    $(".text-muted").text(data[0].signature);
                    $("#fan").text(data[0].fansNum);
                    $("#follow").text(data[0].articleNum);
                    $("#flowers").text(data[0].flowers);
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

            function selectPageInfor(pageIndex) {
                $.getJSON("selectTradePage",{"pageIndex":pageIndex},function (data) {
                    var tab = $("#tab");
                    tab.empty()
                    var str = "";
                    var count = 1;
                    str +="<table class='table table-bordered'>"
                    str +="<tr> " +
                        "<th 'width=10px'>#</th> " +
                        "<th>交易详情</th> " +
                        "<th>交易时间</th> " +
                        "<th 'width= 10px'>交易数量</th> " +
                        "</tr>"
                    $.each(data,function (index,trade) {
                        str +="<tr> " +
                            "<td>"+count+".</td> " +
                            "<td>"+trade.username+"打赏了"+trade.authorName+"</td> " +
                            "<td>"+trade.tradeTime2+"</td> " +
                            "<td>";
                        var u=$("#name").text();
                        if(trade.username==u){
                            str+="<span class='badge bg-green'>" + -trade.tradeFlowers +"</span></td></tr>";
                        }else{
                            str+="<span class='badge bg-red'>" + "+" +trade.tradeFlowers+"</span></td></tr>";
                        }
                        count++;
                    })
                    str += "</table>";
                    tab.html(str);
                    selectPageNum(pageIndex);
                })
            }

            function selectPageNum(pageIndex) {
                var page = $("#page")
                page.empty()
                var str = "<ul class='pagination pagination-sm no-margin pull-right'>"
                $.getJSON("selectCountAll",function (data) {
                    if(pageIndex > 0){
                        str += "<li><a href='javascript:selectPageInfor("+(pageIndex-1)+")'>&laquo;</a></li>"
                    }
                    for(var i = 0;i < data;i++){
                        str += "<li><a href='javascript:selectPageInfor("+i+")'>"+(i+1)+"</a></li>"
                    }
                    if(pageIndex < data-1){
                        str += "<li><a href='javascript:selectPageInfor("+(pageIndex+1)+")'>&raquo;</a></li>"
                    }
                    str += "</ul>"
                    page.html(str)
                })
            }

            $(function () {
                selectPageInfor(0);
            })
        </script>

</body>
</html>
