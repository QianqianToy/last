<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/12
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        function removeChilds(id){
            var childs = document.getElementById(id).childNodes;//这一行代码和紧跟的下面的for循环用于清除原来日的下拉列表的select中的对节点
            for(var i=childs.length-1;i>=0;i--) {
                document.getElementById(id).removeChild(childs[i]);
            }
        }
        function setDay(){
            var yearToDate=document.getElementById("year").value;
            var monthToDate=document.getElementById("month").value;
            //alert(yearToDate+":"+monthToDate);
            var days=new Array(28,29,30,31);
            if(yearToDate==0||monthToDate==0){//如果是当前系统时间则设置默认的日
                var newOption = document.createElement("option");newOption.setAttribute("value",0);newOption.setAttribute("selected","selected");
                var textToNewOption=document.createTextNode("请选择日");newOption.appendChild(textToNewOption);
                document.getElementById("day").appendChild(newOption);
            }else{
                if(monthToDate==1||monthToDate==3||monthToDate==5||monthToDate==7||monthToDate==8||monthToDate==10||monthToDate==12){
                    removeChilds("day");
                    for( i=1; i<=days[3]; i++ ){
                        var newOption = document.createElement("option");newOption.setAttribute("value",i);
                        var textToNewOption=document.createTextNode(i);newOption.appendChild(textToNewOption);
                        document.getElementById("day").appendChild(newOption);
                    }
                }
                if(monthToDate==4||monthToDate==6||monthToDate==9||monthToDate==11){
                    removeChilds("day");
                    for( i=1; i<=days[2]; i++ ){
                        var newOption = document.createElement("option");newOption.setAttribute("value",i);
                        var textToNewOption=document.createTextNode(i);newOption.appendChild(textToNewOption);
                        document.getElementById("day").appendChild(newOption);
                    }
                }
                if(monthToDate==2){
                    removeChilds("day");
                    if(yearToDate%400==0||yearToDate%100!=0&&yearToDate%4==0){//闰年
                        for( i=1; i<=days[1]; i++ ){
                            var newOption = document.createElement("option");newOption.setAttribute("value",i);
                            var textToNewOption=document.createTextNode(i);newOption.appendChild(textToNewOption);
                            document.getElementById("day").appendChild(newOption);
                        }
                    }else{
                        for( i=1; i<=days[0]; i++ ){
                            var newOption = document.createElement("option");newOption.setAttribute("value",i);
                            var textToNewOption=document.createTextNode(i);newOption.appendChild(textToNewOption);
                            document.getElementById("day").appendChild(newOption);
                        }
                    }
                }
            }
        }
        function getMonth(){
            var m;
            document.write("<option value=0 selected=\"selected\">请选择月</option>");
            for(m=1;m<=12;m++) {
                document.write("<option value="+m+">"+m+"</option>");
            }
        }

        function getYear(){
            var y;
            var date=new Date();
            var fullYear=date.getFullYear();
            document.write("<option value=0 selected=\"selected\">请选择年</option>");
            for(y=fullYear-60;y<=fullYear;y++){
                document.write("<option value="+y+" >"+y+"</option>");
            }
        }
        function checkDay(){
            var yearToDate=document.getElementById("year").value;
            var monthToDate=document.getElementById("month").value;
            if(yearToDate==0||monthToDate==0){
                alert("请先选择年和日");
            }
        }
        function StrDate(){
            var strDate="";
            var year=$("#year").val();
            var month=$("#month").val();
            var day=$("#day").val();
            strDate=year+"-"+month+"-"+day;
                // alert(strDate);
            $("#birthday").val(strDate);
        }
    </script>
</head>
<body>

        <select name="year"  id="year" onmouseout="StrDate()" onChange="setDay();"><script type="text/javascript">getYear();</script>
            <option selected="selected">2000</option>
        </select>
        <select name="month" id="month" onmouseout="StrDate()" onChange="setDay()"><script type="text/javascript">getMonth();</script>
            <option selected="selected">1</option>
        </select>
        <select name="day" id="day" onclick="checkDay()" onmouseout="StrDate()" >
            <option selected="selected">1</option>
        </select><script type="text/javascript">setDay();<!--起到初始化日的作用。--></script>
</body>
</html>
