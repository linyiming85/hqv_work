<%--
  Created by IntelliJ IDEA.
  User: linyiming
  Date: 13-5-15
  Time: 下午5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>内容回复</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="editor_config.js"></script>
    <script type="text/javascript" src="../resource/js/jquery.js"></script>
    <!--使用版-->
    <!--<script type="text/javascript" charset="utf-8" src="../editor_all.js"></script>-->

    <!--开发版-->
    <script type="text/javascript" charset="utf-8" src="editor_all.js">
    </script>
    <style type="text/css">
        .clear {
            clear: both;
        }
    </style>
</head>
<body>
<div>
    <script  id="editor" type="text/plain">
    </script>

</div>
<div class="clear"></div>
<div id="btns">
    <%--<div >--%>
        <%--<button  onclick="getAllHtml()">获得整个html的内容</button>--%>
        <%--<button  onclick="getContent()">获得内容</button>--%>
        <%--<button onclick="setContent()">写入内容</button>--%>
        <%--<button onclick="setContent(true)">追加内容</button>--%>
        <%--<button onclick="getContentTxt()">获得纯文本</button>--%>
        <%--<button  onclick="getPlainTxt()">获得带格式的纯文本</button>--%>
        <%--<button  onclick="hasContent()">判断是否有内容</button>--%>
        <%--<button  onclick="setFocus()">使编辑器获得焦点</button>--%>
    <%--</div>--%>
    <%--<div >--%>
        <%--<button  onclick="getText()">获得当前选中的文本</button>--%>
        <%--<button  onclick="insertHtml()">插入给定的内容</button>--%>
        <%--<button  id="enable" onclick="setEnabled()">可以编辑</button>--%>
        <%--<button onclick="setDisabled()">不可编辑</button>--%>
        <%--<button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>--%>
        <%--<button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>--%>
    <%--</div>--%>

<%--</div>--%>
<%--<div >--%>
    <%--<button onclick="createEditor()"/>创建编辑器</button>--%>
    <%--<button onclick="deleteEditor()"/>删除编辑器</button>--%>
    <input type="button" onclick="rtnTomain()" value="确定"/>
    <%--<input type="button" onclick="rep()" value="替换">--%>
</div>



</body>
<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor');

    ue.addListener('ready',function(){
        this.focus()
    });

    function insertHtml(){
        var value = prompt('插入html代码','');
        ue.execCommand('insertHtml',value)
    }
    function createEditor(){
        enableBtn();
        UE.getEditor('editor')
    }
    function getAllHtml() {
        alert( UE.getEditor('editor').getAllHtml() )
    }
    function getContent() {
        var arr = [];
        arr.push( "使用editor.getContent()方法可以获得编辑器的内容" );
        arr.push( "内容为：" );
        arr.push(  UE.getEditor('editor').getContent() );
        alert( arr.join( "\n" ) );
    }
    function getPlainTxt() {
        var arr = [];
        arr.push( "使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容" );
        arr.push( "内容为：" );
        arr.push(  UE.getEditor('editor').getPlainTxt() );
        alert( arr.join( '\n' ) )
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push( "使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容" );
        UE.getEditor('editor').setContent( '欢迎使用ueditor',isAppendTo );
        alert( arr.join( "\n" ) );
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled( 'fullscreen' );
        disableBtn( "enable" );
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range =  UE.getEditor('editor').selection.getRange();
        range.select();
        var txt =  UE.getEditor('editor').selection.getText();
        alert( txt )
    }

    function getContentTxt() {
        var arr = [];
        arr.push( "使用editor.getContentTxt()方法可以获得编辑器的纯文本内容" );
        arr.push( "编辑器的纯文本内容为：" );
        arr.push(  UE.getEditor('editor').getContentTxt() );
        alert( arr.join( "\n" ) );
    }
    function hasContent() {
        var arr = [];
        arr.push( "使用editor.hasContents()方法判断编辑器里是否有内容" );
        arr.push( "判断结果为：" );
        arr.push(  UE.getEditor('editor').hasContents() );
        alert( arr.join( "\n" ) );
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn( str ) {
        var div = document.getElementById( 'btns' );
        var btns = domUtils.getElementsByTagName( div, "button" );
        for ( var i = 0, btn; btn = btns[i++]; ) {
            if ( btn.id == str ) {
                domUtils.removeAttributes( btn, ["disabled"] );
            } else {
                btn.setAttribute( "disabled", "true" );
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById( 'btns' );
        var btns = domUtils.getElementsByTagName( div, "button" );
        for ( var i = 0, btn; btn = btns[i++]; ) {
            domUtils.removeAttributes( btn, ["disabled"] );
        }
    }
    function rtnTomain(){
        var  contentUndo=UE.getEditor('editor').getContent().replace("/ueditor","../../ueditor");
        var content=contentUndo.replace(/title=".*?"/,"");
        window.opener.$("#feedBackContentInput").val(content);
        var currentDate=new Date();
        var date=currentDate.getFullYear()+"-"+currentDate.getMonth()+"-"+currentDate.getDay();
        var  staffId=window.opener.$("#staffId").val();
        window.opener.$("#staffIdFeedBack").val(staffId);
        var requireNo=window.opener.$("#task").val();
        window.opener.$("#requireNoFeedBack").val(requireNo);
        window.opener.$('#feedBackContent').html('<div class="box">'+window.opener.$('#feedBackContent').html()+'<h1>'+staffId+'</h1><h2>'+content+"</h2></div>");
        $("#feedBackContentForm",window.opener.document).submit();
        window.close();
    }
    function rep(){
        var  content=UE.getEditor('editor').getContent().replace("/ueditor","../../ueditor");
        var str=content.replace(/title=".*"/g,"");
        alert(str);
    }
</script>
</html>