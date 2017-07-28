<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/13
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写文章页面</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
        #bc{
            background: url(images/newlogin.jpg);
        }
        #he{
            color: goldenrod;
        }
    </style>
    <script>
        window.onload = function(){
            var oBtn = document.getElementById('kongbu');
            oBtn.onclick = function(){
                document.getElementById('bc').style.backgroundImage="url(images/kongbulei.jpg)";
            };
            var oBtn01 =document.getElementById('qihuan');
            oBtn01.onclick =function(){
                document.getElementById('bc').style.backgroundImage="url(images/qihuan.jpg)";
            };
            var oBtn02 =document.getElementById('yanqing');
            oBtn02.onclick =function(){
                document.getElementById('bc').style.backgroundImage="url(images/yanqing.jpg)"
            };
            var oBtn03 =document.getElementById('moren');
            oBtn03.onclick= function(){
                document.getElementById('bc').style.backgroundImage="url(images/newlogin.jpg)"
            };
        };
    </script>
    <script type="text/javascript">
        // 对Date的扩展，将 Date 转化为指定格式的String
        // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
        // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
        // 例子：
        // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
        // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
        Date.prototype.Format = function(fmt)
        { //author: meizz
            var o = {
                "M+" : this.getMonth()+1,                 //月份
                "d+" : this.getDate(),                    //日
                "h+" : this.getHours(),                   //小时
                "m+" : this.getMinutes(),                 //分
                "s+" : this.getSeconds(),                 //秒
                "q+" : Math.floor((this.getMonth()+3)/3), //季度
                "S"  : this.getMilliseconds()             //毫秒
            };
            if(/(y+)/.test(fmt))
                fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            for(var k in o)
                if(new RegExp("("+ k +")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            return fmt;
        }
        var myTime = new Date().Format("yyyy-MM-dd hh:mm:ss");
//        var myDate=new Date();
//        var myTime=myDate.toLocaleString();
            function getTime() {
                document.getElementById("mytime").value=myTime;
            }
        function save() {
            document.form1.action="drafts";
            document.getElementById("mytime").value=myTime;
            document.form1.submit();
        }

    </script>
            <!--文章类型选项 -->
<script type="text/javascript">
    // 创建一个二维数组
    var arr = new Array(5);
    arr[0] = ["言情","小说","散文"];
    arr[1] = ["购物指南","化妆品","时装"];
    arr[2] = ["玄幻","小说"];
    arr[3] = ["恐怖","短篇","长篇"];
    arr[4] = ["诗集","三行情诗","以景抒情"];
    function choose(val){
        // 获取city的select
        var city = document.getElementById("city");
        // 获取option
        var cityOp = city.getElementsByTagName("option");
        // 设置可操作
        city.disabled = false;
        // 先删除，后添加
        for (var i = 0; i < cityOp.length; i++) {
            var op = cityOp[i];
            // 删除option
            city.removeChild(op);
            //数组长度发生变化，需处理
            i--;
        }

        // 遍历
        for (var i = 0; i < arr.length; i++) {
            //取一维数组
            var arr1 = arr[i];
            //取一维数组的第一个值
            var firstVal = arr1[0];
            //判断
            if(firstVal == val){
                //遍历
                for (var j = 1; j < arr1.length; j++) {
                    // 获取城市名
                    var value = arr1[j];
                    // 创建option
                    var optionl = document.createElement("option");
                    // 创建文本
                    var textl = document.createTextNode(value);
                    // 把文本添加到标签
                    optionl.appendChild(textl);
                    //添加到city里面
                    city.appendChild(optionl);
                }
            }
        }
    }
</script>

</head>
<body id="bc">
<form action="article" method="post" name="form1">
    <div id="he">
        <h1>欢迎<%=session.getAttribute("username")%>进入创作的世界！</h1><br>
        <input hidden="hidden" type="text" name="username" value="<%=session.getAttribute("username")%>">
        文章名：<input type="text" name="title">
        背景风格：
        <input type="button"value="恐怖" id="kongbu"/><input type="button" value="奇幻"id="qihuan"><input type="button" value="言情"id="yanqing">
        <input type="button"value="默认风格" id="moren"/>
        <input type="submit" value="保存至草稿箱" onclick="save();">
        <%--<input type="button" value="发布作品">--%>
        <input type="submit" name="submit" value="发布作品" onclick="getTime();">
        文章类型：
        <select id="province" onchange="choose(this.value)" name="articleBigType">
            <option value="0">--请选择大类--</option>
            <option value="言情">言情</option>
            <option value="购物指南">购物指南</option>
            <option value="玄幻">玄幻</option>
            <option value="恐怖">恐怖</option>
            <option value="诗集">诗集</option>
        </select>

        <select id="city" disabled="disabled" name="articleSmallType">
            <option value="0">--请选择小类--</option>
        </select>
    </div>
    <!--
    	作者：offline
    	时间：2017-07-08
    	描述：文章书写模块
    	时间触发时间交给提交按钮，当点击提交之后立即获得当前时间
    -->

        <div>
        <script name="content" id="editor" type="text/plain" style="width:1024px;height:500px;">
        </script></div>
        <input type="text" name="writeTime" id="mytime" hidden >

        </form>

            <div id="btns" hidden>
            <div>
            <button onclick="getAllHtml()">获得整个html的内容</button>
            <button onclick="getContent()">获得内容</button>
            <button onclick="setContent()">写入内容</button>
            <button onclick="setContent(true)">追加内容</button>
            <button onclick="getContentTxt()">获得纯文本</button>
            <button onclick="getPlainTxt()">获得带格式的纯文本</button>
            <button onclick="hasContent()">判断是否有内容</button>
            <button onclick="setFocus()">使编辑器获得焦点</button>
            <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
            <button onmousedown="setblur(event)" >编辑器失去焦点</button>

            </div>
            <div>
            <button onclick="getText()">获得当前选中的文本</button>
            <button onclick="insertHtml()">插入给定的内容</button>
            <button id="enable" onclick="setEnabled()">可以编辑</button>
            <button onclick="setDisabled()">不可编辑</button>
            <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
            <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
            <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
            </div>

            <div>
            <button onclick="getLocalData()" >获取草稿箱内容</button>
            <button onclick="clearLocalData()" >清空草稿箱</button>
            </div>

            </div>
            <div hidden>
            <button onclick="createEditor()">
            创建编辑器</button>
            <button onclick="deleteEditor()">
            删除编辑器</button>
            </div>

            <script type="text/javascript">

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');


        function isFocus(e){
            alert(UE.getEditor('editor').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }
        function setblur(e){
            UE.getEditor('editor').blur();
            UE.dom.domUtils.preventDefault(e)
        }
        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('editor').execCommand('insertHtml', value)
        }
        function createEditor() {
            enableBtn();
            UE.getEditor('editor');
        }
        function getAllHtml() {
            alert(UE.getEditor('editor').getAllHtml())
        }
        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }
        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getPlainTxt());
            alert(arr.join('\n'))
        }
        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }
        function setDisabled() {
            UE.getEditor('editor').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('editor').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('editor').selection.getRange();
            range.select();
            var txt = UE.getEditor('editor').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('editor').getContentTxt());
            alert(arr.join("\n"));
        }
        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('editor').hasContents());
            alert(arr.join("\n"));
        }
        function setFocus() {
            UE.getEditor('editor').focus();
        }
        function deleteEditor() {
            disableBtn();
            UE.getEditor('editor').destroy();
        }
        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }
        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            }
        }

        function getLocalData () {
            alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
        }

        function clearLocalData () {
            UE.getEditor('editor').execCommand( "clearlocaldata" );
            alert("已清空草稿箱")
        }
        </script>
</body>
</html>
