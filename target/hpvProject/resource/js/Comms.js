/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-21
 * Time: ����11:06
 * To change this template use File | Settings | File Templates.
 */
function getXmlHttpString(param){
    var xml = getXMLHttpRequest();
    xml.open("POST", param, false);
    xml.send();
    var str = unescape(xml.responseText);
    return arrstr = str;
}

function getXMLHttpRequest()
{
    var xml;
    if (window.XMLHttpRequest)
    {
        //Mozilla �????
        xml = new XMLHttpRequest();
        if (xml.overrideMimeType)
        {
            //设置MiME类�?
            xml.overrideMimeType("text/xml");
        }
    }
    else
    {
        if (window.ActiveXObject)
        {
            // IE�????
            try
            {
                xml = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e)
            {
                try
                {
                    xml = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (e)
                {
                }
            }
        }
    }
    return xml;
}
