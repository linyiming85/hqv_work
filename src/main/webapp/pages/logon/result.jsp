<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-20
  Time: 下午2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>投票结果</title>
</head>
<body>
      <div style="text-align: center">
      <p style="font-size: 20px">共有<c:out value="${male}"/>人投给男孩</p>
      <p style="font-size: 20px">共有<c:out value="${female}"/>人投给女孩</p>
      </div>
      <div style="text-align: center">
          <img src="/resource/images/blackBaby.jpg">
      </div>

</body>
</html>