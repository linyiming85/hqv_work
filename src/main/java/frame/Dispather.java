package frame;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-12
 * Time: 下午10:57
 * To change this template use File | Settings | File Templates.
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Dispather extends HttpServlet {

    /**
     *

    private static final long serialVersionUID = 1L;

    static String pubInit = "";
    static String selInit = "";

    @Override
    public void init() throws ServletException {
        // TODO Auto-generated method stub
        if (pubInit == "") {
            pubInit = this.getServletContext().getInitParameter("root");
        }
        if (selInit == "") {
            selInit = this.getInitParameter("child");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String spath=req.getServletPath();//servlet路径
        String cpath=req.getContextPath(); //Context路径.
        String url=req.getRequestURI();//url路径
        String path=pubInit+selInit+url.substring((cpath+spath).length());//拼接请求的真正路径
        System.out.println("spath:\t"+spath+"\ncpath:\t"+cpath+"\nurl:\t"+url+"\npath:"+path);
        req.getRequestDispatcher(path).forward(req, resp);
    }
     */
}