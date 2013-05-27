<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>contact</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
// <![CDATA[
jQuery(document).ready(function(){
	$('#contactform').submit(function(){				  
		var action = $(this).attr('action');
		$.post(action, { 
			name: $('#name').val(),
			email: $('#email').val(),
			company: $('#company').val(),
			subject: $('#subject').val(),
			message: $('#message').val()
		},
			function(data){
				$('#contactform #submit').attr('disabled','');
				$('.response').remove();
				$('#contactform').before('<p class="response">'+data+'</p>');
				$('.response').slideDown();
				if(data=='Message sent!') $('#contactform').slideUp();
			}
		); 
		return false;
	});
});
// ]]>
</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="block_header">
      <div class="logo"><a href="../logon/index.jsp"><img src="../images/logo.gif" width="401" height="145" border="0" alt="logo" /></a></div>
      <div class="menu">
        <ul>
          <li><a href="../logon/index.jsp" class="active">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="services.html">About us</a></li>
          <li><a href="portfolio.html">Portfolio</a></li>
          <li><a href="contact.jsp">Contact</a></li>
        </ul>
      </div>
      <div class="clr"> </div>
    </div>
  </div>
  <div class="slider2">
    <div class="slider4_resize">
      <h2>Contact us</h2>
    </div>
    <div class="clr"> </div>
  </div>
  <div class="clr"> </div>
  <div class="body">
    <div class="body_resize2">
      <p><strong>Lorem Ipsum has been</strong><br />
        The industry's standard dummy text ever since thes when an unknown printer. <a href="#">Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since thes</a>, when an unknown printer.Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since thes, when an unknown printer.</p>
		<p><script type="text/javascript"><!--
google_ad_client = "pub-6268730837991367";
/* 468x60, 创建于 11-4-28 */
google_ad_slot = "3779833694";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></p>
      <form action="contact.php" method="post" id="contactform">
        <ol>
          <li>
            <label for="name">your name <span class="red">*</span></label>
            <input id="name" name="name" class="text" />
          </li>
          <li>
            <label for="email">Your email <span class="red">*</span></label>
            <input id="email" name="email" class="text" />
          </li>
          <li>
            <label for="company">Company Name</label>
            <input id="company" name="company" class="text" />
          </li>
          <li>
            <label for="subject">Subject</label>
            <input id="subject" name="subject" class="text" />
          </li>
          <li>
            <label for="message">Message <span class="red">*</span></label>
            <textarea id="message" name="message" rows="6" cols="50"></textarea>
          </li>
          <li class="buttons">
            <input type="image" name="imageField" id="imageField" src="../images/send.gif" />
          </li>
        </ol>
      </form>
    </div>
    <div class="clr"></div>
  </div>
  <div class="FBG">
    <div class="Fbg_resize">
      <div class="Twitter">
        <p><img src="../images/Twitter.gif" alt="picture" width="129" height="96" /></p>
        <p><strong>Lorem Ipsum has been</strong><br />
          The industry's standard dummy text ever since thes.</p>
        <p><a href="#"><img src="../images/read_more.gif" alt="picture" width="68" height="20" border="0" /></a></p>
      </div>
      <div class="con">
        <h2>Contact us</h2>
        <ul>
          <li>Name of the Company</li>
          <li>2901 Marmora Road, Glassgow, D04 59GR</li>
          <li>Telephone: +1 234 567 8910</li>
        </ul>
        <ul>
          <li>FAX: +1 234 567 8910</li>
          <li><a href="#">E-mail: mail@yoursitename.com</a></li>
        </ul>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="footer">
    <div class="resize">
      <p class="footer_logo">&nbsp;</p>
      <div>© Copyright 2009. <a href="http://www.divcss5.com/">CSS</a>. All Rights Reserved<br />
        <a href="../logon/index.jsp">Home</a>| <a href="http://www.divcss5.com/">DIV+CSS</a> | <a href="contact.jsp">Contact</a> | <a href="blog.html">RSS</a></div>
    </div>
    <p class="clr"></p>
  </div>
</div>
</body>
</html>