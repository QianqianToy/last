<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" >
    <title>用户注册</title>
    <link rel="stylesheet" href="css/coda-slider.css" type="text/css" charset="utf-8" />
    <link rel="stylesheet" href="css/regist.css" type="text/css" charset="UTF-8">
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script>
        function xingzuo() {
            var birthday=$("#birthday").val();
            var month=birthday.split("-")[1];
            var date=birthday.split("-")[2];
//            var start = 1901, date=document.getElementById("txtDay").value, month=document.getElementById("txtMonth").value;
            with (document.getElementById("txtXZ")){
                if (month == 1 && date >=20 || month == 2 && date <=18) {value = "水瓶座";}
                if (month == 1 && date > 31) {value = "您输入的日期不存在";}
                if (month == 2 && date >=19 || month == 3 && date <=20) {value = "双鱼座";}
                if (month == 2 && date > 29) {value = "您输入的日期不存在";}
                if (month == 3 && date >=21 || month == 4 && date <=19) {value = "白羊座";}
                if (month == 3 && date > 31) {value = "您输入的日期不存在";}
                if (month == 4 && date >=20 || month == 5 && date <=20) {value = "金牛座";}
                if (month == 4 && date > 30) {value = "您输入的日期不存在";}
                if (month == 5 && date >=21 || month == 6 && date <=21) {value = "双子座";}
                if (month == 5 && date > 31) {value = "您输入的日期不存在";}
                if (month == 6 && date >=22 || month == 7 && date <=22) {value = "巨蟹座";}
                if (month == 6 && date > 30) {value = "您输入的日期不存在";}
                if (month == 7 && date >=23 || month == 8 && date <=22) {value = "狮子座";}
                if (month == 7 && date > 31) {value = "您输入的日期不存在";}
                if (month == 8 && date >=23 || month == 9 && date <=22) {value = "处女座";}
                if (month == 8 && date > 31) {value = "您输入的日期不存在";}
                if (month == 9 && date >=23 || month == 10 && date <=22) {value = "天秤座";}
                if (month == 9 && date > 30) {value = "您输入的日期不存在";}
                if (month == 10 && date >=23 || month == 11 && date <=21) {value = "天蝎座";}
                if (month == 10 && date > 31) {value = "您输入的日期不存在";}
                if (month == 11 && date >=22 || month == 12 && date <=21) {value = "人马座";}
                if (month == 11 && date > 30) {value = "您输入的日期不存在";}
                if (month == 12 && date >=22 || month == 1 && date <=19) {value = "摩羯座";}
                if (month == 12 && date > 31) {value = "您输入的日期不存在";}
            }
        }
    </script>
    <script type="text/javascript">
        function validate_email(field,alerttxt) {
            with (field)
            {
                apos=value.indexOf("@")
                dotpos=value.lastIndexOf(".")
                if (apos<1||dotpos-apos<2)
                {alert(alerttxt);return false}
                else {return true}
            }
        }

        function validate_form(thisform) {
            with (thisform)
            {
                if (validate_email(email,"邮箱地址错误，请重新输入!")==false)
                {email.focus();return false}
            }
        }
    </script>
    <script>
        function blurphone(id){
            var phone=id.value
            var phoneDiv=document.getElementById("phoneDiv")
            if(phone.length<11){
                phoneDiv.innerHTML="请输入正确的电话号码！"
                return false
            }
        }
    </script>
    <style>
        body{
            background-color: #C7EDCC;
            font-family: "microsoft yahei";
            /*min-width: 800px;*/
        }
        img{
            width: 100%;
            /*height: 462px;*/
        }
        .navbar{
            /*margin-bottom: -10px;*/
        }
        #myppt{
            margin-top: -20px;

        }
    </style>

</head>

<body id="slider">
<div>
    <div id="header_wrapper"><!--共享书房周围图片-->
        <div id="header">
        </div>
    </div>

    <div id="menu_wrapper"><!--菜单栏设置-->
        <div id="menu">
            <ul class="navigation">
                <li><a href="index.jsp" >主页</a></li>
                <li><a data-toggle="modal" data-target="#login" href="">登录</a></li>
                <li><a href="">注册</a></li>
                <li><a href="">共享书籍</a></li>
                <li><a href="">写文章</a></li>
                <%--<li><a id="result">登录状态：${username} </a></li>--%>
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
                    <a href="regist.jsp" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                </form>
            </div>
        </div>
    </div>
</div>


<div id="bigkuang">
    <form action="register" onsubmit="return validate_form(this);" method="post">
        <table style="color:white;">
            <tr>
                <td>账&nbsp;&nbsp;&nbsp;号：&nbsp;<input type="text" name="username"></td>
            </tr>
            <tr>
                <td>密&nbsp;&nbsp;&nbsp;码：&nbsp;<input type="password"name="password"></td>
            </tr>

            <tr>
                <td>出生日期:<jsp:include page="test.jsp"></jsp:include>
                </td>
            </tr>

                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日：<input type="text" name="day" id="txtDay"></td>--%>
                <%--<td>月：<input id="txtMonth" name="month"></td>--%>
                <%--<td>年：<input type="text" id="txtYear" ></td>--%>

            <tr>
                <td>星&nbsp;&nbsp;&nbsp;座：&nbsp;<input type="text" id="txtXZ" name="sign"/></td>
                <td><input type="button" onclick="xingzuo();" value="获取星座"/></td>
            </tr>
            <tr>
                <td>联系电话:&nbsp;<input type="text" onblur="blurphone(this)"id="phone"name="phone"></td>
                <td><div id="phoneDiv"></div></td>
            </tr>
            <tr>
                <td>电子邮件:&nbsp;<input type="text"name="email"></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center"><input type="submit" value="注册"></td>
            </tr>
        </table>
            <input  type="hidden" name="birthday" id="birthday" >
    </form>
</div>
</body>
</html>
