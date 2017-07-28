<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="domain.ShareBook" %>
<%@ page import="java.util.List" %><%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2017/7/15
Time: 12:14
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>共享书籍</title>
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
<link rel="stylesheet" href="css/styleindex.css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="css/coda-slider.css" >
<link href="css/stylebutton.css" rel="stylesheet" />
<!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
   folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="css/_all-skins.min.css">
<!-- Owl Carousel  -->
<link href="owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="owl-carousel/owl.theme.css" rel="stylesheet">

<!-- Fonts -->
<link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">
<!-- jQuery -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="js/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="js/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>
<script>
    function getScroll(){
        var top;
        if (document.documentElement &&
            document.documentElement.scrollTop)
        {
            top = document.documentElement.scrollTop;
        } else if (document.body)
        {
            top = document.body.scrollTop;
        }
        return top;
    }
    function setScroll(){
        var top = document.getElementById("top").value;
        if(top != 0){
            window.scrollTo(0,top);
        }
    }
    $(function () {

        /* initialize the external events
         -----------------------------------------------------------------*/
        function ini_events(ele) {
            ele.each(function () {

                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };

                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 1070,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });

            });
        }

        ini_events($('#external-events div.external-event'));

        /* ADDING EVENTS */
        var currColor = "#3c8dbc"; //Red by default
        //Color chooser button
        var colorChooser = $("#color-chooser-btn");
        $("#color-chooser > li > a").click(function (e) {
            e.preventDefault();
            //Save color
            currColor = $(this).css("color");
            //Add color effect to button
            $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
        });
        $("#add-new-event").click(function (e) {
            e.preventDefault();
            //Get value and make sure it is not null
            var val = $("#new-event").val();
            if (val.length == 0) {
                return;
            }

            //Create events
            var event = $("<div />");
            event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
            event.html(val);
            $('#external-events').prepend(event);

            //Add draggable funtionality
            ini_events(event);

            //Remove event from text input
            $("#new-event").val("");
        });
    });
</script>
<style>
    #Re_border{
        position: relative;
        width: 250px;
        height: 100px;
        margin-left: 100px;
    }
    #sh_border{
        position: relative;
        margin-left: 430px;
        margin-top: -235px;
    }
    #readmore{
        position: relative;

    }
    #area{
        width: 800px;
        height: 800px;
    }
    .row{
        position: relative;
        width: 250px;
        height: 100px;
        margin-left: -60px;
    }
    .box{
        margin-left: 60px;
    }
</style>
</head>
<body id="slider" class="hold-transition skin-blue sidebar-mini">
<div >
<div id="header_wrapper"><!--共享书房周围图片-->
    <div id="header">
    </div>
</div>

<div id="menu_wrapper"><!--菜单栏设置-->
    <div id="menu">
        <ul class="navigation">
            <li><a href="javascript:history.back(1)" >主页</a></li>
            <li><a data-toggle="modal" data-target="#login" href="">登录</a></li>
            <li><a href="regist.jsp">注册</a></li>
            <li><a href="#">共享书籍</a></li>
            <li>
                <c:choose>
                    <c:when test="${empty username}">
                        <a data-toggle="modal" data-target="#login" href="">写文章</a>
                    </c:when>
                    <c:otherwise>
                        <a href="writearticle.jsp" target="_blank">写文章</a>
                    </c:otherwise>
                </c:choose>
            </li>
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


<!-- /////////////////////////////////////////中间部分-->

<!-- 搜索框部分 -->
<div id="Re_border">
    <form action="share" method="get">
        <table>
            <tr>
                <td>
                    <input type="text" name="ename" ><input type="submit" value="搜索" placeholder="请输入作者名或书名">
                </td>
            </tr>
        </table>
    </form>
</div>

<!-- /.content -->
<!--//////////////////////////////////////////共享书籍部分-->
<div id="sh_border">
<div class="row">
    <div class="col-md-6">
        <!-- Box Comment -->
        <div class="box box-widget" id="area">
            <div class="box-header with-border">
                <div class="user-block">
                    <img class="img-circle" src="images/1.jpg" alt="书籍图片">
                    <span class="username"><a href="#" >${shareBooks.bookName}</a></span>
                    <span class="description"><a href="" >作者：${shareBooks.bookAuthor}</a></span>
                </div>
                <!-- /.user-block -->
                <div class="box-tools">
                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                        <i class="fa fa-circle-o"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
                <!-- /.box-tools -->
            </div>
            <!-- /.图书简介 -->
            <div class="box-body">
                <div class="attachment-block clearfix">
                    <img class="attachment-img" src="images/9.jpg" alt="图片未显示">
                    <div class="attachment-pushed">
                        <div class="attachment-text">
                            <p>${shareBooks.bookIntroduction}</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.图书类型 -->
            <div class="box-footer box-comments">
                <div class="box-comment">
                    <div class="comment-text">
                  <span class="username">
                                                       图书类型
                  </span>
                        ${shareBooks.articleBigType}
                    </div>
                    <!-- /.comment-text -->
                </div>
                <!-- /.box-comment -->
            </div>
            <section class="content">
                <div class="row">
                    <!--<div class="col-md-3">-->

                    <!-- /////////////////////////////////////关于共享人部分 -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">About Me</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-user margin-r-5"></i>共享人名字</strong>

                            <p class="text-muted">
                                ${shareBooks.username}
                            </p>
                            <hr>
                            <strong><i class="fa fa-envelope-o margin-r-5"></i>邮箱</strong>
                            <p class="text-muted">${shareBooks.email}</p>
                            <hr>
                            <strong><i class="fa fa-calendar margin-r-5"></i> 共享时间</strong>

                            <p>${shareBooks.shareDate}</p>
                        </div>
                        <!-- /.box-body-->   <!--关于阅读更多-->
                        <div id="readmore">
                            <input type="hidden" VALUE="10" name="count" id="count">
                            <input type="hidden" id="top" name="name"/>
                            <a href="readMore" class="readmore"><input onload="setScroll()" type="button"  value="阅读更多" ></a>
                        </div>
                    </div>

                </div>
            </section>
        </div>
        <!-- /.box   fa-calendar-->
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->
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
});
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
