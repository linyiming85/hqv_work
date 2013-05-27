<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-15
  Time: 下午2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title></title>
</head>
<body>
        <div style="text-align: center;">
            <p style="font-size: 20px;color: wheat">标题</p>
            <p style="font-size: 16px;color: wheat">正文，内容是21diea地sajdfiwoejfk打上房揭瓦i企鹅藕粉开房间快速减肥我耳机藕粉就是打飞机看撒交房i味儿哦交房开始的你发快完二姐夫i哦味儿交房开始呢到付款杰威尔起哦房价的看法未哦房价奥斯卡发你未哦去福建i阿三哦好孤儿个黑人就打个你就人不；开发能取我开房呢呢呢 发啥地方我去饿福克斯大姐夫i哦沃尔夫看你说的开机后i哦沃尔夫jh</p>
            <br><br>

            <c:if test="${staffRole=='PROVINCE_INTERF'}">
            <p><input type="button" id="downloadDesign" style="padding: 3px;color: black;" value="方案下载" onclick="acceptDesign();"></p>
            <p><input type="button" id="acceptDesignButton" style="padding: 3px;color: black;" value="接受该方案" onclick="acceptDesign();"></p>
            </c:if>
            <input type="hidden" id="dsnUse" name="dsnUse" value="<c:out value="${dsnUse}"/>">
        </div>
</body>
<script type="text/javascript">
    function acceptDesign(){
        var requireNo=$("#task").val();
        var roleBranch=$("#roleBranch").val();
        var param="<%=request.getContextPath()%>/mainFrame/accept.do?requireNo="+requireNo+"&roleBranch="+roleBranch;
        var result= $.trim(getXmlHttpString(param));
        if(result=="done"){
            alert("方案已接受，请下载具体实现代码");
            $("#dsnUse").val("1");
            $('#acceptDesignButton').attr("disabled",true);
        }else{
            alert("系统错误,请重试");
        }
    }

</script>
</html>