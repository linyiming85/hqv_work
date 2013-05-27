<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-20
  Time: 下午1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>性别竞猜</title>
</head>
<body>
     <form action="/welcome/guess.do" onsubmit="return validate();">
     <div style="text-align: center;font-size: 25px;>">
     <p>您的姓名是<c:out value="${userId}"/>，您现在要为王振孩子的性别投票</p>
     <input type="hidden" value="<c:out value="${userId}"/>" name="userName">
     <input type="radio" name="guessSex" value="1" id="guessSex"> 男</input>
     <input type="radio" name="guessSex" value="2" id="guessSex"> 女</input>
     <input type="submit" value="确定">
     <p style="font-size: 18" >目前已有<c:out value="${count}"/>人参与投票</p>
     <p style="font-size: 10" >参与投票的人需缴纳200元保证金</p>
     <u style="font-size: 18" ><a onclick="window.open('/pages/logon/baby.jsp')">游戏规则</a> </u>
     <c:if test="${userId=='linym'}">
         <u style="font-size: 18px"><a onclick="window.open('result.do')">查看结果</a> </u>
     </c:if>
     </div>
     <div style="text-align: center">
         <img src="/resource/images/baby.jpg">
     </div>
     </form>
</body>
<script type="text/javascript">
    function validate(){
        var vote=document.getElementById("guessSex").checked;
        if(!vote){
            alert("对不起，我们不支持您选择不男不女！") ;
            return false;
        }
    }
</script>
</html>