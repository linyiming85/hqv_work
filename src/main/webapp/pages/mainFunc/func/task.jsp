<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-14
  Time: 下午5:40
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
<form method="post" action="<%=request.getContextPath()%>/mainFrame/upload.do"  enctype="multipart/form-data" target="uploadFrame">
    <div class="menu2">
        <ul>
        <li> <a href="#taskFrame1" onclick="getDiv(1);" id="first"><p style="color: wheat">方案介绍</p> </a> </li>
        <li> <a href="#taskFrame2" onclick="getDiv(2);"><p style="color: wheat">文件操作</p> </a> </li>
        <li> <a href="#taskFrame3" onclick="getDiv(3);"><p style="color: wheat">问题反馈</p></a> </li>

    </ul></div>
 <div id="taskFrame1" class="taskContentDiv" style="text-align: center">
     <jsp:include page="design.jsp"/></div>
 </div>
 <div id="taskFrame2" class="taskContentDiv" style="text-align: center">
     
     <input type="hidden" name="task" value="<c:out value="${task}"/> " id="task">
     <input type="hidden" name="roleBranch" value="<c:out value="${roleBranch}"/> " id="roleBranch">
     <input type="hidden" name="staffRole" value="<c:out value="${staffRole}"/> " id="staffRole">
     <input type="hidden" name="feekBackAlreadyContent" value="<c:out value="${content}"/>"id="feekBackAlreadyContent">
 <c:if test="${staffRole=='PRODUCT_MANAGER'}">
     <input type="file" name="file" id="file">
     <input type="submit" value="文件上传">
     </c:if>
     <c:if test="${staffRole=='PROVINCE_INTERF'}">
             <p style="color: wheat;padding: 5px;font-weight: bold"> <a id="codeDownLoad" style="text-decoration:underline;" onclick="downLoadSourceCode();">代码下载</a></p>
     </c:if>
 </div>
 <div id="taskFrame3" class="taskContentDiv">
     <jsp:include page="../../../ueditor/feedBack.jsp"/>
 </div>
</form>
<iframe name="uploadFrame" hidden="hidden"></iframe>
<script type="text/javascript">
    $("#first").click();
    function getDiv(id){
        $(".taskContentDiv").each(function(){
            if (this.id == "taskFrame" + id) {
                $("#taskFrame"+id).show();
            } else {
                $("#"+this.id).hide();
            }

        })
    }
    $().ready(function(){
        var dsnUse=$('#dsnUse').val();
        var content=$("#feekBackAlreadyContent").val();
        if(dsnUse==1){
            $('#acceptDesignButton').attr("disabled",true);
            $('#acceptDesignButton').val("已接受该方案");

        }
        $('#feedBackContent').html(content);
    })   ;

    function downLoadSourceCode(){
        var dsnUse=$('#dsnUse').val();
        if (dsnUse==1){
            var requireNo=$("#task").val();
            var roleBranch=$("#roleBranch").val();
            var param="<%=request.getContextPath()%>/mainFrame/acceptCode.do?requireNo="+requireNo+"&roleBranch="+roleBranch;
            var result= $.trim(getXmlHttpString(param));
            if(result=="done"){
                window.open('../../upload/temp/invitation letter .doc','', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');

            }else{
                alert("系统错误,请重试");
            }
        }  else{
            alert("未确认设计方案前不能下载代码");
        }
    }

</script>
</body>

</html>