<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-24
  Time: 下午3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="/resource/js/jquery.js"></script>
<script type="text/javascript" src="/resource/js/easySlider1.5.js"></script>
<script type="text/javascript" src="/resource/js/Comms.js" />
<html>
<head>
    <title></title>
</head>
<body>
<p>sadfasdfas</p>
    <input type="hidden" name="result" id="result" value="<c:out value="${result}"/>">
</body>
<script type="text/javascript">
    var result=$("#result").val();
    alert(result);
    if(result=="done"){
        alert("文件上传成功");
    }else{
        alert("文件上传失败，请稍后重新上传");
    }
</script>
</html>