<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/12
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册临时跳转</title>
    <style>
        #show{
            font-size: 25px;
            color:gold;
            font-family:"楷体";
        }
        #mage{
            margin-top: 200px;
            margin-left: 500px;
            width: 500px;
            height: 500px;
            background-repeat:no-repeat;
        }

    </style>
</head>
<body id="bb">
<script type="text/javascript">
    var t=3;//设定跳转的时间
    setInterval("refer()",1000); //启动1秒定时
    function refer(){
        if(t==0){
            location="http://localhost:8080/last/writearticle.jsp"; //设定跳转的链接地址
        }

        document.getElementById('show').innerHTML=""+t+"秒后将回到写文章页面"; //显示倒计时
        t--; //计数器递减

    }
</script>
<div id="mage" style="background-image: url(images/tiaozhuan.jpg)"><span id="show" ></span></div>
</body>
</html>
