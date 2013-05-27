
<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-15
  Time: 下午4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/resource/js/jquery.js"></script>
<!--使用版-->
<style type="text/css">
    *{margin:0;padding:0;}
    .box{margin-bottom:12px;overflow-x:hidden;overflow-y:hidden;
        padding:3px;background:#212d33;border:solid 1px #999;color: wheat}
    .box h1{text-align: left;
        font-size: 12px;
        color: wheat;margin: 0px;
        text-decoration:none; /*下划线效果：无下划线*/
        border-bottom: 1px wheat solid /*加一个只有下边的框 边框为虚线*/}
    .box p{
        font-size: 18px;
        color: wheat;
        padding: 3px;
        border-bottom: 0px;
    }
    .clear {
        clear: both;
    }
</style>
<html>

<head>
    <title></title>
</head>
<body>

    <div id='feedBackContent'>
    </div>
     <div style="text-align: center;">
         <input type="button" onclick="window.open('../ueditor/dialog.jsp')" value="发表反馈" style="font-size: 20px;">
     </div>


</body>
<script type="text/javascript">
    function setRtnContent(){

    }
</script>
</html>