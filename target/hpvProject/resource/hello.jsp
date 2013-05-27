<html>
<style type="text/css">
    <!--
        /* www.divcss5.com之css form实例 */
    label{float: left;width: 80px;line-height:25px;}
    form{margin:0px}


    input{width: 180px;border:1px solid #808080;}
    textarea{width: 250px;height: 150px;}


    #sbutton{margin-left: 80px;margin-top: 5px;width:80px;}


    br{clear: left;}
    -->
</style>


<form action="" method="post">
    <label for="user">姓名:</label>
    <input type="text" id=user name="user" value="" /><br />


    <label for="email">邮件:</label>
    <input type="text" id=email name="email" value="" /><br />
    <label for="comment">备注:</label>
    <textarea id=comment name="comment">
    </textarea><br />
    <input type="submit" id="sbutton" value="确定" /><br />
</form>
</html>