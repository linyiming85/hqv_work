<%@ page import="frame.VO.RequireMentsVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>home</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="/resource/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/js/jquery.js"></script>
    <script type="text/javascript" src="/resource/js/easySlider1.5.js"></script>
    <script type="text/javascript" charset="utf-8">
        // <![CDATA[
        $(document).ready(function(){
            $("#slider").easySlider({
                controlsBefore:	'<p id="controls">',
                controlsAfter:	'</p>',
                auto: true,
                continuous: true
            });
        });
        // ]]>
    </script>
    <style type="text/css">
        #slider { margin:0; padding:0; list-style:none; }
        #slider ul,
        #slider li { margin:0; padding:0; list-style:none; }
            /*
                define width and height of list item (slide)
                entire slider area will adjust according to the parameters provided here
            */
        #slider li { width:906px; overflow:hidden; }
        p#controls { margin:0; position:relative; }
        #prevBtn,
        #nextBtn { display:block; margin:0; overflow:hidden; width:44px; height:44px; position:absolute; left:0; top:-250px; }
        #nextBtn { left:862px; }
        #prevBtn a { display:block; width:44px; height:44px; background:url(/resource/images/l_arrow.gif) no-repeat 0 0; }
        #nextBtn a { display:block; width:44px; height:44px; background:url(/resource/images/r_arrow.gif) no-repeat 0 0; }
    </style>
</head>
<body>
<script type="text/javascript">
    $().ready(function(){
        if(screen.height==768)     {
            $('.slider').height(400);
        } else if(screen.height==1050){
            $('.slider').height(680);
        }
    })            ;


</script>

<form name="mainForm" method="POST" action="<%=request.getContextPath()%>/welcome/submit.do" >
    <div class="main">
        <div class="header">
            <div class="block_header">
                <div class="logo"><a href="/pages/logon/index.jsp"><img src="/resource/images/logo.gif" width="401"  border="0" alt="logo" /></a></div>
                <div class="menu">
                    <ul>
                        <li>
                            总部版本控制系统
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="slider" >
            <div class="top2" >
                <div class="roleInfo">
                    <p>欢迎<c:out value="${userId}"/></p>
                    <input type="hidden" value="<c:out value="${userId}"/>" id="staffId" name="staffId">
                <br><br>
                <ui>

                 <%List<RequireMentsVO> list=(List)request.getAttribute("RequireMentsVOList") ;
                    if(list.size()>0){
                        for (int i=0;i<list.size();i++)  {
                            RequireMentsVO rmVo=list.get(i);
                 %>
                    <li style="color: wheat"><a onclick="getMenu('<%=i%>')">
                        <%=rmVo.getName()%>
                        <input type="hidden" value="<%=rmVo.getRequireNo()%>" name="task<%=i%>" id="task<%=i%>">
                        <input type="hidden" value="<%=rmVo.getStaffRole()%>" name="staffRole<%=i%>" id="staffRole<%=i%>">
                        <input type="hidden" value="<%=rmVo.getRoleBranch()%>" name="roleBranch<%=i%>" id="roleBranch<%=i%>">

                    </a></li>

                    <%
                        }
                    }

                %>

                </ui>
                </div>
            </div>
            <div class="slice2" id="resultcontent">

            </div>
        </div>

        <div class="footer">
            <div class="resize">
                <div>Copyright © AL.com. <a href="">CUSRD2</a>. All Rights Reserved<br />
                    <a href="/resource/logon/index.jsp">Home</a></div>
            </div>
            <p class="clr"></p>
        </div>
    </div>
</form>

<!-- 这个iframe是为了下面的form进行无刷新提交用的 -->
 <iframe name="hideIframe" hidden="hidden"></iframe>

<!-- 此form是为了将富文本写入数据表中来存放一下参数的值-->
<form target="hideIframe" action="<%=request.getContextPath()%>/mainFrame/storeFeedBackContent.do" method="post" id="feedBackContentForm" name="feedBackContentForm">
    <input type="hidden" id="feedBackContentInput" name="feedBackContentInput">
    <input type="hidden" id="staffIdFeedBack" name="staffIdFeedBack">
    <input type="hidden" id="requireNoFeedBack" name="requireNoFeedBack">
</form>

<script type="text/javascript">
    function getMenu(task){
        var staffRole=$("#staffRole"+task).val();
        var roleBranch=$("#roleBranch"+task).val();
        task=document.getElementById('task'+task).value;
                var url="<%=request.getContextPath()%>/mainFrame/getTask.do";
        $.ajax({
            url: "<%=request.getContextPath()%>/mainFrame/getTask.do",
            type: "POST",
            data: "task="+task+"&staffRole="+staffRole+"&roleBranch="+roleBranch,
            async: false,
            cache: false,
            success: function(html){
                //alert( $.trim(html) );
                $("#resultcontent").html($.trim(html));

            },
            beforeSend: function(XMLHttpRequest){
            },
            complete: function(XMLHttpRequest, textStatus){
            },
            error: function(){
                alert("系统错误");
            }
        });
    }

</script>
</body>
</html>