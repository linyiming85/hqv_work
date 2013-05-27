package frame.comm;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-21
 * Time: ����11:08
 * To change this template use File | Settings | File Templates.
 */
public class CommUtil {
    // �ֲ�ˢ�����
    public static void outputXMLHTTP(HttpServletResponse response, String str)
    {
        try
        {
            ServletOutputStream writer = response.getOutputStream();
            response.setContentType("text/plain;charset=GBK");
            writer.println(str);
        }
        catch (Exception e)
        {

        }
    }
}
