<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/11 0011
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的文章</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
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
                <li><a href="selectById?userID=${user.userID}"><i class="fa fa-home fa-fw"></i>个人信息</a></li>
                <li><a href="selectAllByUsername?userID=${user.userID}"><i class="fa fa-bar-chart fa-fw"></i>文章列表</a></li>
                <li><a href="selectDraftsInfro?userID=${user.userID}" class="active"><i class="fa fa-database fa-fw"></i>草稿箱</a></li>
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
                        <%--<li><a href="" class="active">首页</a></li>--%>
                        <li><a href="share.jsp?${username}">共享书籍</a></li>
                        <li><a href="writearticle.jsp?${username}">写文章</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="z">
            <div class="templatemo-content-widget white-bg col-1 text-center">
                <i class="fa fa-times"></i>
                <h2 class="text-uppercase">${user.username}</h2>
                <h5 class="text-uppercase margin-bottom-10">${user.signature}</h5>
                <img width="90px" height="90px" src="images/${user.photo}" alt="Bicycle" class="img-circle img-thumbnail">
            </div>
        </div>
        <!--表格-->
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td class="white-text templatemo-sort-by"># <span class="caret"></span></td>
                            <td class="white-text templatemo-sort-by">文章名字</td>
                            <td class="white-text templatemo-sort-by">发表时间 <span class="caret"></span></td>
                            <td class="white-text templatemo-sort-by">点赞数量</td>
                            <td class="white-text templatemo-sort-by">不喜欢数量</td>
                            <td class="white-text templatemo-sort-by">红花数量</td>
                            <td>Delete</td>
                        </tr>
                        </thead>
                        <c:forEach items="${Article}" var="article" varStatus="status">
                            <tbody>
                            <tr>
                                <td>${status.index+1}</td>
                                <td><a href="">${article.title}</a></td>
                                <td>${article.writeTime}</td>
                                <td>${article.upNum}</td>
                                <td>${article.downNum}</td>
                                <td>✿${article.flowers}</td>
                                <td><a href="deleteByArticleID?articleID=${article.articleID}&userID=${user.userID}" class="templatemo-link">Delete</a></td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
                <%--<input type="button" value="阅读更多" class="more"/>--%>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>      <!-- jQuery -->
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
<script>

    var gaugeChart;
    var gaugeData;
    var gaugeOptions;
    var timelineChart;
    var timelineDataTable;
    var timelineOptions;
    var areaData;
    var areaOptions;
    var areaChart;

    /* Gauage
     --------------------------------------------------*/
    google.load("visualization", "1", {packages:["gauge"]});
    google.setOnLoadCallback(drawGauge);
    google.load("visualization", "1", {packages:["timeline"]});
    google.setOnLoadCallback(drawTimeline);
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);

    $(document).ready(function(){
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
                drawCharts();
            });
        }
    });

    function drawGauge() {

        gaugeData = google.visualization.arrayToDataTable([
            ['Label', 'Value'],
            ['Memory', 80],
            ['CPU', 55],
            ['Network', 68]
        ]);

        gaugeOptions = {
            redFrom: 90, redTo: 100,
            yellowFrom:75, yellowTo: 90,
            minorTicks: 5
        };

        gaugeChart = new google.visualization.Gauge(document.getElementById('gauge_div'));
        gaugeChart.draw(gaugeData, gaugeOptions);

        setInterval(function() {
            gaugeData.setValue(0, 1, 40 + Math.round(60 * Math.random()));
            gaugeChart.draw(gaugeData, gaugeOptions);
        }, 13000);
        setInterval(function() {
            gaugeData.setValue(1, 1, 40 + Math.round(60 * Math.random()));
            gaugeChart.draw(gaugeData, gaugeOptions);
        }, 5000);
        setInterval(function() {
            gaugeData.setValue(2, 1, 60 + Math.round(20 * Math.random()));
            gaugeChart.draw(gaugeData, gaugeOptions);
        }, 26000);
    } // End function drawGauage

    /* Timeline
     --------------------------------------------------*/
    function drawTimeline() {
        var container = document.getElementById('timeline_div');
        timelineChart = new google.visualization.Timeline(container);
        timelineDataTable = new google.visualization.DataTable();
        timelineDataTable.addColumn({ type: 'string', id: 'Room' });
        timelineDataTable.addColumn({ type: 'string', id: 'Name' });
        timelineDataTable.addColumn({ type: 'date', id: 'Start' });
        timelineDataTable.addColumn({ type: 'date', id: 'End' });
        timelineDataTable.addRows([
            [ 'Magnolia Room',  'CSS Fundamentals',    new Date(0,0,0,12,0,0),  new Date(0,0,0,14,0,0) ],
            [ 'Magnolia Room',  'Intro JavaScript',    new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
            [ 'Magnolia Room',  'Advanced JavaScript', new Date(0,0,0,16,30,0), new Date(0,0,0,19,0,0) ],
            [ 'Gladiolus Room', 'Intermediate Perl',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],
            [ 'Gladiolus Room', 'Advanced Perl',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
            [ 'Gladiolus Room', 'Applied Perl',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],
            [ 'Petunia Room',   'Google Charts',       new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],
            [ 'Petunia Room',   'Closure',             new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
            [ 'Petunia Room',   'App Engine',          new Date(0,0,0,16,30,0), new Date(0,0,0,18,30,0) ]]);

        timelineOptions = {
            timeline: { colorByRowLabel: true },
            backgroundColor: '#ffd'
        };

        timelineChart.draw(timelineDataTable, timelineOptions);
    } // End function drawTimeline

    /* Area Chart
     --------------------------------------------------*/
    function drawChart() {
        areaData = google.visualization.arrayToDataTable([
            ['Year', 'Sales', 'Expenses'],
            ['2013',  1000,      400],
            ['2014',  1170,      460],
            ['2015',  660,       1120],
            ['2016',  1030,      540]
        ]);

        areaOptions = {
            title: 'Company Performance',
            hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
            vAxis: {minValue: 0}
        };

        areaChart = new google.visualization.AreaChart(document.getElementById('area_chart_div'));
        areaChart.draw(areaData, areaOptions);
    } // End function drawChart

    function drawCharts () {
        gaugeChart.draw(gaugeData, gaugeOptions);
        timelineChart.draw(timelineDataTable, timelineOptions);
        areaChart.draw(areaData, areaOptions);
    }
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

</body>
</html>
