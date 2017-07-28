<%@ page import="domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/11 0011
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
</head>
<body onload="systemTime()">
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
                <li><a href="selectById?userID=${user.userID}" class="active"><i class="fa fa-home fa-fw"></i>个人信息</a></li>
                <li><a href="selectAllByUsername?userID=${user.userID}"><i class="fa fa-bar-chart fa-fw"></i>文章列表</a></li>
                <li><a href="selectDraftsInfro?userID=${user.userID}"><i class="fa fa-database fa-fw"></i>草稿箱</a></li>
                <li><a href="selectCollectionAll?userID=${user.userID}"><i class="fa fa-map-marker fa-fw"></i>收藏与关注</a></li>
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
                        <%--<li><a href="JavaScript:history.back(1)" class="active">首页</a></li>--%>
                        <%--<li><a href="selectById?userID=1" >个人中心</a></li>--%>
                        <li><a href="share.jsp?${username}">共享书籍</a></li>
                        <li><a href="writearticle.jsp?${username}">写文章</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <form action="updateAllById" method="post" enctype="multipart/form-data">
            <div class="templatemo-flex-row flex-content-row">
                <div class="z">
                    <div class="templatemo-content-widget white-bg col-2">
                        <div class="media margin-bottom-30">
                            <div class="media-left padding-right-25">
                                <img class="media-object img-circle templatemo-img-bordered" src="images/${user.photo}" width="90px" height="90px" />
                            </div>
                            <div class="media-body">
                                <h2 class="media-heading text-uppercase blue-text">完善个人信息</h2>
                                <div class="row form-group">
                                    <div class="col-lg-12">
                                        <input type="file" name="file" id="fileToUpload" class="margin-bottom-10">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td><div class="circle green-bg"></div></td>
                                    <td>ID<br /><input type="text" name="userID" value="${user.userID}" readonly="readonly" /></td>
                                    <td>姓名<br /><input type="text" value="${user.username}" name="username" /></td>
                                </tr>
                                <tr>
                                    <td><div class="circle pink-bg"></div></td>
                                    <td>密码<br />
                                        <input type="password" name="password" value="${user.password}"/></td>
                                    <td>性别<select class="form-control">
                                        <option value="girl">女</option>
                                        <option value="boy">男</option>
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div class="circle blue-bg"></div></td>
                                    <td>生日<br />
                                        <input type="date" id="j" name="birthday" value="${user.birthday}"/>
                                    </td>
                                    <td>星座<br />
                                        <input type="text" value="${user.sign}" name="sign"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div class="circle pink-bg"></div></td>
                                    <td>手机<br />
                                        <input type="text" value="${user.phone}" name="phone"/>
                                    </td>
                                    <td>邮箱<br />
                                        <input type="text" name="email" value="${user.email}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div class="circle green-bg"></div></td>
                                    <td>钱包数量<br />
                                        <input type="text" value="${user.wallet}" name="wallet" readonly="readonly"/>
                                    </td>
                                    <td>粉丝数量<br />
                                        <input type="text" value="${user.fansNum}" name="fansNum" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div class="circle yellow-bg"></div></td>
                                    <td>个性签名<br />
                                        <textarea class="form-control" id="inputNote" rows="3" name="signature">${user.signature}</textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="form-group text-right">
                                <button type="submit" class="templatemo-white-button">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <footer class="text-right">
            <p>Copyright &copy; 基地15班 Company Name
                |<a href="http://www.baidu.com/" target="_blank" title="百度">共享书房</a></p>
        </footer>
    </div>
</div>
</div>

<!-- JS -->
<script src="js/jquery-3.2.1.js"></script>      <!-- jQuery -->
<script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<%--<script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->--%>
<script type="text/javascript">
    //    $("#person").click(function() {
    //        alert("123123");
    //        $.ajax({
    //            url : "selectNameById",//请求地址
    //            dataType : "json",//数据格式                data:"userID=1",
    //            type : "post",//请求方式
    //            async : false,//是否异步请求
    //            success : function(data) { //如何发送成功
    //                alert("123");
    //                    alert("ok"+data.password+","+data.userID);
    //                $("#userID").text(data.userID);
    //            },
    //        })
    //    }
    google.load('visualization', '1.0', {'packages':['corechart']});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night'};

        // Instantiate and draw our chart, passing in some options.
        var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
        pieChart.draw(data, options);

        var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
        barChart.draw(data, options);
    }

    $(document).ready(function(){
        if($.browser.mozilla) {
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
                drawChart();
            });
        }
    });

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
<script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

</body>
</html>
