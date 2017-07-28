<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%--<%--%>
    <%--String usern1= (String) request.getAttribute("username");--%>
<%--//    Integer articleid1= Integer.parseInt((String)request.getAttribute("articleID"));--%>
<%--%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>文章详情页</title>
    <link rel="stylesheet" href="css/coda-slider.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="css/common.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="css/tiao.css" type="text/css" charset="utf-8"/>
    <link rel="stylesheet" href="css/a.css" type="text/css" charset="utf-8"/>

    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <style type="text/css">
        /*弹框大小属性*/
        #dialog{
            width: 400px; height:370px;
            margin: 0 auto; display: none;
            background-color: #ffffff;
            position: fixed; top: 50%;
            left: 50%; margin: -120px 0 0 -150px;
            z-index: 10000; border: 1px solid #ccc;
            border-radius: 10px;
            -webkit-border-radius: 10px;
            box-shadow: 3px 2px 4px rgba(0,0,0,0.2);
            -webkit-box-shadow: 3px 2px 4px rgba(0,0,0,0.2);
        }
        *{margin:0px;padding:0px;}
        html,body{height:100%;font-size:16px;font-family:Verdana, Arial, Helvetica, sans-serif;}
        a{color:#999999;}
        a:hover{color:#FF6600;}
        .c{clear:both;}
        .shadow{display:none;background:#000000;width:100%;height:100%;left:0;top:0;filter:alpha(opacity=40);
            opacity:0.4;z-index:999;position:fixed;_position:absolute; /*_top:expression(eval(document.compatMode && document.compatMode=='CSS1Compat') ? documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 : document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2); */}
        .popbox{display:none;z-index:1001;width:400px;height:180px;background:#F7F7F7;border:1px #999999 solid;position:fixed;top:50%;left:50%;margin:-50px 0px 0px -200px;_margin-top:0px;_position:absolute;/*_top:expression(eval(document.compatMode && document.compatMode=='CSS1Compat') ? documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 : document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2); */}
        .popbox h5{height:30px;line-height:30px;padding:1px 1px 1px 10px;background:#FFFFFF;border-bottom:1px #999999 solid;font-size:16px;}
        .popbox h5 #title{float:left;color:black;font-size: 30px; }
        .popbox h5 #close{display:block;background:url(images/X.png) no-repeat;width:12px;height:12px;float:right;margin:8px;display:inline;}
        .popbox h5 #close:hover{background-position:-12px 0;}
        .popbox p{padding:15px;font-size:14px;text-align:center;}
    </style>
<script type="text/javascript">
    $(document).ready(function(){
        aa();
        setTimeout("comment()",2000);
    });

    function  aa() {
        $.getJSON("findAricleData",{username:$("#username111").val(),articleID:$("#articleid111").val()},function (data) {
            $(".articleID").text(data.article.articleID);
            $(".umNum").append(data.article.upNum);
            $(".downNum").append(data.article.downNum);
            $(".title").append(data.article.title);//显示题目
            $(".autor").append(data.article.username);//显示作者
            $(".time").append(data.timeWrite)
                .append("  ")
                .append("评论"+data.commentNum)
                .append("  ")
                .append("赞"+data.article.upNum);
            var url="images/"+data.user.photo;
            $(".touXiang").attr("src",url);
            $(".articleContent").append(data.article.content);
        });
    }
    function complain() {
        $.getJSON("complain",{
                    autor:$(".autor").text(),
                    complainArticle:$(".title").text(),
                    complainReason:$("#complainReason").val()
        },function (data2) {
            if ( data2.result==null){
                alert("投诉失败！");
            } else if( data2.result== "1"){
                alert("投诉成功！");
            }else {
               alert("系统正忙，请稍后。。。")
            }
        });
    }
    function zan() {
        $.getJSON("vote",{
            articleID:$(".articleID").text(),
            zanState:"赞"
            },
            function (data) {
            $(".umNum").text(null);
            $(".umNum").append(data.article.upNum);
            alert(data.result);
        })
    }
    function cai() {
        $.getJSON("vote",{
                articleID:$(".articleID").text(),
                zanState:"踩"
            },
            function (data) {
            $(".downNum").text(null);
            $(".downNum").append(data.article.downNum);
            alert(data.result);
            })
    }
    function getData(authorID,commentID){
        $.getJSON("zan1",{
            authorID:authorID,
            commentID:commentID,
            userID:$("#articleid111").val()
        },
            function (data) {
            $("#"+commentID+"zan").text(data.upNum)
            }
        )
    }
    function getReply(commentID) {
        if($("."+commentID+"reply").css("display")=="none"){
            $("."+commentID+"reply").css("display","block");
        }else {
            $("."+commentID+"reply").css("display","none");
        }

    }
    function postReply(commentID){
        $.getJSON("reply",{
            commentsReply:$("."+commentID+"Reply").val(),
            commentId:commentID,
            userID:$("#articleid111").val(),
        },function (data) {
            var date=new Date(data.date)
            if (data!=null){
                $("."+data.commentID+"hui").append("<div><a style='color: blue'>我</a>:@<a style='color: blue'>"+$("#"+data.commentID+"name").text()+"</a><span>"+data.reply+"</span><br/><div>"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</div><a onclick='getReply("+commentID+")'>"+"  "+"回复"+"</a>"+
                "<div class='"+commentID+"reply' style='display: none'>"+
                "<div style='margin-left: 20%'></div><img src='' class='userPhoto'/>"+
//                "<textarea class='"+commentID+"Reply' style='width: 60%;margin-left: 20%;height: 100px;'></textarea><br />"+
//                "<a onclick='postReply("+commentID+")' class='button button-primary button-pill button-small'style='margin-left: 65%;'>回复</a>"+ "</div>"+
                "<div class='"+commentID+"hui'></div><br/><br/><br/><hr style='width: 60%;margin-left: 20%/></div>");
                $("."+commentID+"reply").css("display","none");
            }else {
                alert("回复失败");
            }

        })
    }
    function comment() {
        $.getJSON("userComments",{
                articleID:$(".articleID").text()
            },
            function (data) {
            var value;
                $.each(data,function (i,value) {
                    var value1="";
                    var date=new Date(value.commentDate);
                    value1="<table   style='width: 60%;margin-left: 20%'><tr><td rowspan='2'style='width: 50px;height: 50px'>"+
                        "<img src='"+"images/"+value.photo +
                        "' class='userphoto' style='width: 50px;height: 50px'/></td>"+
                        "<td ><span class='username' id='"+value.commentID+"name'>"+
                        value.username+
                        "</span><span class='userID' style='display: none'>"+ value.userID+ "</span>"+
                        "</td></tr><tr><td style='font-size: 15px;'><span class='floor'>"+ value.floor+"楼"+
                        "</span><span class='commentTime'>"+
                        "  "+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+
                        "</span></td></tr><tr><td colspan='2'><p class='content'>"+
                        value.comment+
                        "</p></td></tr></table><br/>"+
                        "<a onclick='getData("+value.userID+","+value.commentID+")'style='margin-left: 20%'>"+"赞"+"</a>"+
                        "<span id='"+value.commentID+"zan'>"+value.upNum+"</span>"+
                        "<a onclick='getReply("+value.commentID+")'>"+"  "+"回复"+"</a>"+
                        "<div class='"+value.commentID+"reply' style='display: none'>"+
                        "<div style='margin-left: 20%'></div><img src='' class='userPhoto'/>"+
                        "<textarea class='"+value.commentID+"Reply' style='width: 60%;margin-left: 20%;height: 100px;'></textarea><br />"+
                        "<a onclick='postReply("+value.commentID+")' class='button button-primary button-pill button-small'style='margin-left: 65%;'>回复</a>"+ "</div>"+
                        "<div class='"+value.commentID+"hui'style='width: 60%;overflow: auto;margin-left: 20%'></div><br/><br/><br/><hr style='width: 60%;margin-left: 20%/>";
                    $("#comments").append(value1);
                })

            })
    }
    function tiJiaoComment() {
        $.getJSON("insertComment" ,{
            articleID:$(".articleID").text(),
            comment:$(".comments").val(),
            username:$("#username111").val()
        },
        function (data) {
            if(data!=null){
                $("#comments").html("");
                 comment();
            }else {
                alert("错误")
            }

        })
    }
    function daShang(){
        $.getJSON("flower",{
                articleID:$(".articleID").text(),
                username:$("#username111").val(),
                flowerNum:$(".flowerNum").val(),
                authorName:$(".autor").text(),
            },
            function (data) {
            alert(data.result);
                $("#p_shadow").css('display','none');
                $("#p_popbox").fadeOut('fast');
            })
    }


    var w,h,className;
    function getSrceenWH(){
        w = $(window).width();
        h = $(window).height();
        $('#dialogBg').width(w).height(h);
    }
    window.onresize = function(){
        getSrceenWH();
    }
    $(window).resize();
    $(function(){
        getSrceenWH();

        //显示弹框
        $('.box a').click(function(){
            className = $(this).attr('class');
            $('#dialogBg').fadeIn(300);
            $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
        });

        //关闭弹窗
        $('.claseDialogBtn').click(function(){
            $('#dialogBg').fadeOut(300,function(){
                $('#dialog').addClass('bounceOutUp').fadeOut();
            });
        });
    });
    $(function(){
        $("#show_box").click(function(){
            $("#p_shadow").css('display','block');
            $("#p_popbox").fadeIn('slow');
        });
        $("#close").click(function(){
            $("#p_shadow").css('display','none');
            $("#p_popbox").fadeOut('fast');
        });
    })
</script>
</head>
<body id="slider" style="background: url(images/bg2.jpg) repeat;">
<input type="text" id="username111"  value=${username} />
<input type="text" id="articleid111" value=${articleID} />
<div >
    <div id="header_wrapper"><!--共享书房周围图片-->
        <div id="header">
        </div>
    </div>

    <div id="menu_wrapper" style="margin-top: -30px"><!--菜单栏设置-->
        <div id="menu">
            <ul class="navigation">
                <li><a href="javascript:history.back(1)" >主页</a></li>
                <li><a data-toggle="modal" data-target="#login" href="">登录</a></li>
                <li><a href="regist.jsp">注册</a></li>
                <li><a href="share.jsp">共享书籍</a></li>
                <li><a href="">写文章</a></li>
            </ul>
        </div>
    </div>
</div>

<div id="body">
    <div id="content">
        <div id="aa">
            <br/>
            <p class="title"></p>
            <br/>
        </div>
        <div id="bb">
            <table  style="margin-left: 25%;" >
                <tr>
                    <td rowspan="2" >
                        <img src="" class="touXiang" style="width: 75px;height: 60px"/>
                    </td>
                    <td >
                        作者:<span class="autor"></span>
                        <span class="articleID" ></span>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 15px;">
                        <p class="time"></p>
                    </td>
                </tr>
            </table>
        </div>
        <br/><br/>
        <div class="articleContent"></div>
        <br/>

        <!--文章举报-->

        <div id="wrapper">
            <div class="box">
                <div class="demo">
                    <a href="javascript:;" class="bounceIn" style="font-size: 10px;color: gray" href="">文章举报</a>
                </div>
                <div id="dialogBg"></div>
                <div id="dialog" class="animated">
                    <img class="dialogIco" width="50px" height="50px" src="images/ico.png" alt="" />
                    <div class="dialogTop">
                        <a href="javascript:;" class="claseDialogBtn">关闭</a>
                    </div>
                    <div style="margin-left: 170px;font-size: 30px;">举报</div>
                    <hr size=1 style="color: blue;border-style:dotted;width:400px">
                    <form action="" method="post" id="editForm">
                        <ul class="editInfos">
                            <li><label><font color="#ff0000">* </font><input type="text" id="complainPeople" placeholder="请输入投诉的对象" required value="" class="ipt" style="width: 345px;margin-left: 3px;"/></label></li>
                            <li><label><font color="#ff0000">* </font><textarea id="complainReason"  placeholder="请输入投诉的原因" style="width: 350px;height: 100px;"></textarea></label></li>
                            <li><input type="submit" value="确认提交" onclick="complain()" class="submitBtn" /></li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>

        <!--打赏-->

        <span class="button-wrap" style="margin-left: 360px">
            <a  class="button button-pill button-raised button-primary" href="javascript:void(0);" id="show_box" title="弹出一下">打赏支持</a>
        </span>
        <div class="shadow" id="p_shadow"></div>
        <div class="popbox" id="p_popbox">
            <h5><span id="title">感谢您的打赏</span><a href="javascript:void(0);" id="close" title="Close" ></a><div class="c" ></div></h5>
            <div style="margin-left: 10%;margin-top: 5%;">
                打赏小红花：<img src="images/honghua.png"style="width: 50px;height: 50px;"/>x
                <input type="text"class="flowerNum" style="font-size: 20px;width: 50px;"/>朵<br /><br /> <br />
                <a  onclick="daShang()" class="button button-primary button-pill button-small" style="margin-left: 30%;">提交</a>
            </div>
        </div>
        <br/>

        <!--赞/踩-->
        <div style="margin-left: 200px">
            <button class="button button-raised button-action button-circle button-jumbo"style="background: paleturquoise;" onclick="zan()"><i class="fa fa-thumbs-up" >顶</i></button><span class="umNum"> </span>
            <button class="button button-raised button-action button-circle button-jumbo"style="background: wheat;" onclick="cai()"><i class="fa fa-thumbs-down">踩</i></button><span class="downNum"> </span>
        </div>
        <hr/><br/><br/>

        <!--//评论-->
        <div style="margin-left: 20%">
            <h3>评论</h3>
        </div>
        <img src="" class="userPhoto"/>
        <textarea class="comments" style="width: 60%;margin-left: 20%;height: 100px;"></textarea>
        <br />
        <a onclick="tiJiaoComment()" class="button button-primary button-pill button-small"style="margin-left: 65%;">评论</a>

        <h1>热门评论</h1><br/><br/><br/>
        <div id="comments">
        </div>
    </div>
</div>

</body>
</html>
