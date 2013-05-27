<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../../resource/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../resource/js/jquery.js"></script>
<script type="text/javascript" src="../../resource/js/easySlider1.5.js"></script>
<script type="text/javascript" src="../../resource/js/Comms.js"/>
<script type="text/javascript" charset="utf-8">
// <![CDATA[
$(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});
    if(screen.height==768)     {
        $('.slider').height(400);
    } else if(screen.height==1050){
        $('.slider').height(530);
    } else if(screen.height== 800) {
        $('.slider').height(570);
    }
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
#prevBtn a { display:block; width:44px; height:44px; background:url(../../resource/images/l_arrow.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:44px; height:44px; background:url(../../resource/images/r_arrow.gif) no-repeat 0 0; }
</style>
</head>
<body>
<script type="text/javascript">
    function validate(){
        var userId=document.getElementById("userId").value;
        var userPwd=document.getElementById("psword").value;
        if(userId==""||userPwd==""){
            alert("用户名或者密码不能为空!");
            return false;
        }
        var url="<%=request.getContextPath()%>/welcome/validate.do";
        var param=url+ "?userId="+userId+"&userPwd="+userPwd+"&host=10.1.1.10&port=389";
        var isTrue= getXmlHttpString(param);
        isTrue= $.trim(isTrue);
        if(isTrue=="false"){
            alert("用户名或密码不正确，请重新输入！");
            return false;
        }
    }

</script>

<form name="mainForm" method="POST" action="<%=request.getContextPath()%>/welcome/submit.do" onsubmit="return validate();">
<div class="main">
  <div class="header">
    <div class="block_header">
      <div class="logo"><a href="/pages/logon/index.jsp"><img src="/resource/images/logo.gif" width="401" height="72" border="0" alt="logo" /></a></div>
      <div class="menu">
        <ul>
          <li>
              总部版本控制系统
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="slider">
    <div class="slice1">
      <div id="slider">
            <div class="top" style="background:url(../../resource/images/sliser_bg_img_1.jpg) top no-repeat;">
              <h2>用户登录</h2>
              <p>用户名   <input type="text" name="userId" id="userId"></p>
              <p>密码  <input type="password" name="psword" id="psword"></p>
              <br><br>
              <p><input type="submit" value="登录"> </p>
            </div>
      </div>
    </div>
  </div>

  <%--<div class="body">--%>
    <%--<div class="body_resize">--%>
      <%--<div class="Author">--%>
        <%--<h2>About the Author</h2>--%>
        <%--<img src="/resource/images/img_1.gif" alt="picture" width="97" height="89" hspace="20" vspace="5" />--%>
        <%--<p>Lorem Ipsum has been the industry's standard dummy text ever since thes, when an unknown printer.<a href="#"> Simply dummy text</a> of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since thes, when an unknown printer.</p>--%>
        <%--<p><a href="#"><img src="/resource/images/read_more.gif" alt="picture" width="68" height="20" border="0" /></a></p>--%>
      <%--</div>--%>
      <%--<div class="animator">--%>
        <%--<p><img src="/resource/images/img_4.gif" alt="picture" width="169" height="126" /> <img src="/resource/images/img_3.gif" alt="picture" width="169" height="126" /><img src="/resourceimages/img_2.gif" alt="picture" width="170" height="126" /></p>--%>
        <%--<h2>Dummy text of the printing and typesetting industry.</h2>--%>
        <%--<p>Lorem Ipsum has been the industry's standard dummy text ever since thes,<a href="#"> when an unknown printer. Simply dummy text</a> of the printing and typesetting industry. </p>--%>
      <%--</div>--%>
      <%--<div class="clr"></div>--%>
    <%--</div>--%>
    <%--<div class="clr"></div>--%>
  <%--</div>--%>
  <div class="FBG">
    <div class="Fbg_resize">
      <div class="Twitter">
        <p><img src="../../resource/images/Twitter.gif" alt="picture" width="129" height="96" /></p>
        <p><strong>Lorem Ipsum has been</strong> The industry's standard dummy text ever since thes. <a href="#"><img src="/resource/images/read_more.gif" alt="picture" width="68" height="20" border="0" /></a></p>
      </div>
      <div class="con">
        <h2>Contact us</h2>
        <ul>
          <li>Name of the Company</li>
          <li> 2901 Marmora Road, Glassgow, D04 59GR</li>
          <li> Telephone: +1 234 567 8910</li>
        </ul>
        <ul>
          <li>FAX: +1 234 567 8910</li>
          <li>E-mail: <a href="#">mail@yoursitename.com</a></li>
        </ul>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="footer">
    <div class="resize">
      <div>Copyright © Sitename.com. <a href="http://www.divcss5.com/">DIV+CSS</a>. All Rights Reserved<br />
        <a href="../../resource/logon/index.jsp">Home</a> | <a href="../../resource/contact.html">Contact</a> | <a href="/resource/blog.html">RSS</a></div>
    </div>
    <p class="clr"></p>
  </div>
</div>
</form>

</body>
</html>