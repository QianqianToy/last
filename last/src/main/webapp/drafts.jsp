<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/13 0013
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的草稿</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/ionicons.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/all.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <link rel="stylesheet" href="css/AdminLTE-bootstrap-social.css">
    <link rel="stylesheet" href="css/AdminLTE-bootstrap-social.min.css">
    <link rel="stylesheet" href="css/AdminLTE-select2.css">
    <link rel="stylesheet" href="css/AdminLTE-select2.min.css">
    <link rel="stylesheet" href="css/AdminLTE-without-plugins.css">
    <link rel="stylesheet" href="css/AdminLTE-without-plugins.min.css">
    <!--<link rel="stylesheet" href="css/blue.css">-->
    <link rel="stylesheet" href="css/_all-skins.min.css">
    <title></title>


    <script src="js/jquery-3.2.1.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Slimscroll -->
    <script src="js/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="js/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="js/app.min.js"></script>
    <!-- iCheck -->
    <script src="js/icheck.min.js"></script>
    <!-- Page Script -->
    <script>
        $(function () {
            //Enable iCheck plugin for checkboxes
            //iCheck for checkbox and radio inputs
            $('.mailbox-messages input[type="checkbox"]').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-blue'
            });

            //Enable check and uncheck all functionality
            $(".checkbox-toggle").click(function () {
                var clicks = $(this).data('clicks');
                if (clicks) {
                    //Uncheck all checkboxes
                    $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
                    $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
                } else {
                    //Check all checkboxes
                    $(".mailbox-messages input[type='checkbox']").iCheck("check");
                    $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
                }
                $(this).data("clicks", !clicks);
            });

            //Handle starring for glyphicon and font awesome
            $(".mailbox-star").click(function (e) {
                e.preventDefault();
                //detect type
                var $this = $(this).find("a > i");
                var glyph = $this.hasClass("glyphicon");
                var fa = $this.hasClass("fa");

                //Switch states
                if (glyph) {
                    $this.toggleClass("glyphicon-star");
                    $this.toggleClass("glyphicon-star-empty");
                }

                if (fa) {
                    $this.toggleClass("fa-star");
                    $this.toggleClass("fa-star-o");
                }
            });

        });
        function systemTime(){
            var dateTime = new Date();
            var hh = dateTime.getHours();
            console.log(hh);
            if ( hh>0 && hh<=12){
                $("#sysTime").html("上午好...");
            }else if(hh>12 && hh<=18){
                $("#sysTime").html("下午好...");
            }else if(hh>18 && hh<=24){
                $("#sysTime").html("晚上好...");
            }
        }

    </script>
    <script src="js/demo.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="systemTime()">
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar" style="width: 300px;">
        <header class="templatemo-site-header" style="margin-bottom: -25px;">
            <div class="square"></div>
            <h1>${user.username}</h1><br/>
            <h1><div id="sysTime"></div></h1>
        </header>

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
                        <%--<li><a href="" class="active">首页</a></li>--%>
                        <li><a href="share.jsp?${username}">共享书籍</a></li>
                        <li><a href="writearticle.jsp?${username}">写文章</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content col-1 light-gray-bg">
            <div class="b">
                <div class="content-wrapper">
                    <section class="content">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="box box-solid">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Folders</h3>
                                        <div class="box-tools">
                                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="box-body no-padding">
                                        <ul class="nav nav-pills nav-stacked">
                                            <li><a href="#"><i class="fa fa-file-text-o"></i> Drafts</a></li>
                                            <%--<li><a href="#"><i class="fa fa-trash-o"></i> Trash</a></li>--%>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Drafts</h3>
                                        <div class="box-tools pull-right">
                                        </div>
                                    </div>
                                    <div class="box-body no-padding">
                                        <div class="mailbox-controls">
                                            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                                            </button>
                                            <div class="btn-group">
                                                <%--<button type="button" class="btn btn-default btn-sm" id="delete" ><i class="fa fa-trash-o"></i></button>--%>
                                                <%--<button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>--%>
                                                <%--<button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>--%>
                                            </div>
                                            <%--<button type="button" onclick="window.location.href='selectDraftsInfro'" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>--%>
                                            <div class="pull-right">
                                                <%--&lt;%&ndash;1-50/200&ndash;%&gt;onclick="window.location.href='deleteByDraftsID?draftsID=3'"--%>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table-responsive mailbox-messages">
                                            <table class="table table-hover table-striped">
                                                <c:forEach items="${Drafts }" var="drafts">
                                                <tbody>
                                                <tr class="aaa">
                                                    <td><input type="checkbox"></td>
                                                    <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                                                    <td class="mailbox-name"><a href="">${drafts.title}</a></td>
                                                    <td class="mailbox-subject">
                                                        ${fn:substring(drafts.draftsContent,0,15 )}...
                                                    </td>
                                                    <td class="mailbox-attachment"><b>${drafts.articleBigType}</b> - ${drafts.articleSmallType}</td>
                                                    <td class="mailbox-date">${drafts.writeTime}</td>
                                                </tr>
                                                </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="box-footer no-padding">
                                        <div class="mailbox-controls">
                                            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                                            </button>
                                            <div class="btn-group">
                                                <%--<button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>--%>
                                                <%--<button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>--%>
                                                <%--<button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>--%>
                                            </div>
                                            <%--<button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>--%>
                                            <div class="pull-right">
                                                <%--1-50/200--%>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <footer class="text-right">
                        <p>Copyright &copy; 基地15班 Company Name
                            |<a href="http://www.baidu.com/" target="_blank" title="百度">共享书房</a></p>
                    </footer>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

