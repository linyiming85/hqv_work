package com.springapp.mvc;

import frame.VO.GuessSexVO;
import frame.VO.RequireMentsVO;
import frame.VO.RequireStaff;
import frame.jdbc.GuessSexOODao;
import frame.jdbc.RequireMentsDao;
import frame.jdbc.RequireStaffDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.Context;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import static frame.comm.CommUtil.outputXMLHTTP;

@Controller
@RequestMapping("/welcome")
public class HelloController {
    @Autowired
    public JdbcTemplate jdbcTemplate;

    /**
     * log page
     * @param model
     * @param request
     * @return
     */
	@RequestMapping("/index")
	public String printWelcome(ModelMap model,HttpServletRequest request) {
		model.addAttribute("message", "Hello world!");
        return "logon/index";
	}

    /**
     * main page
     * @param userName
     * @param pwd
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/submit")
    public String checkUser(@RequestParam("userId")String userName,@RequestParam("psword")String pwd,HttpServletRequest request)throws  Exception{
//        boolean isUser=this.validateUser(userName,pwd,"10.1.1.10","389");
//
//        if(!isUser){
//            throw  new Exception("��¼������벻��!");
//        }
        request.setAttribute("userId",userName);
        request.setAttribute("pwd",pwd);
        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

        RequireStaffDao rsDao= (RequireStaffDao) context.getBean("requireStaffDao");
        RequireMentsDao rmDao= (RequireMentsDao) context.getBean("requireMentsDao");
        List<RequireMentsVO> list=new ArrayList<RequireMentsVO>();
        List<RequireStaff> res=rsDao.getRequireStaff(userName);
        for (RequireStaff ref:res){
            RequireMentsVO rmVO=rmDao.getRequireMents(ref.getRequireNo());
            if(rmVO!=null){
                rmVO.setStaffRole(ref.getStaffRole());
                rmVO.setRoleBranch(ref.getProvinceBranch());
                list.add(rmVO);
            }
        }
        request.setAttribute("RequireMentsVOList",list);
        /**
         * wangzhen baby vote
         */
//        String sql="select count(*) from guess_sex";
//        int cot=jdbcTemplate.queryForInt(sql) ;
//        String count=Integer.toString(cot);
//        request.setAttribute("count",count);
        /*
        vote end
         */
        //System.out.println("isUser:"+isUser);
        //return "logon/mainFunc/main";
        return "mainFunc/main";
    }
    @RequestMapping("/validate")

    public void validateUser(@RequestParam("userId")String username, @RequestParam("userPwd")String password, @RequestParam("host")String host, @RequestParam("port")String port,HttpServletRequest request,HttpServletResponse response)
    {
        Hashtable env = new Hashtable();
        DirContext ctx;
        String user = "ailk\\"+username;
        String isTrue;
        String passwd = password;
        env.put(Context.SECURITY_AUTHENTICATION,"simple");
        env.put(Context.SECURITY_PRINCIPAL, user);
        env.put(Context.SECURITY_CREDENTIALS, passwd);
        String url = new String("ldap://"+host+":"+port);
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL,url);
        try {
            ctx = new InitialDirContext(env);
            if (null == ctx)
            {
                ctx.close();
                isTrue= "false";
            }
            else
            {
                ctx.close();
                isTrue= "true";
            }
        }
        catch(NamingException err)
        {
            isTrue= "false";
        }
        outputXMLHTTP(response,isTrue);
    }


    /**
     * for wangzhen baby vote ,will delete after the baby born
     * @param userName
     * @param sex
     * @return
     * @throws Exception
     */
//    @RequestMapping("/guess")
//    public String letsGuess(@RequestParam("userName")String userName,@RequestParam("guessSex") String sex)throws Exception{
//        String sql="select * from guess_sex where user_name = ?";
//        if(!(sex.equals("1")||sex.equals("2"))){
//            throw new Exception("�Բ������ͶƱ��Ч!");
//        }
//        System.out.println("sex=================="+sex);
//        Object[] objs=new String[]{userName};
//        List list=jdbcTemplate.queryForList(sql,objs);
//        if(list.size()>0){
//            throw  new Exception("���Ѿ�Ͷ��Ʊ�ˣ�");
//
//        }else {
//            sql="insert into guess_sex values ('"+userName+"','"+sex+"')";
//            jdbcTemplate.update(sql);
//
//        }
//        return "logon/success";
//
//    }

    /**
     * for wangzhen baby vote,will delete after the baby born
     * @param request
     * @return
     * @throws Exception
     */
//    @RequestMapping("result")
//    public String getResult(HttpServletRequest request)throws Exception{
//        String sql="select count(*) from guess_sex";
//        int allCount=jdbcTemplate.queryForInt(sql);
//        sql="select count(*) from guess_sex where sex='1'";
//        int male=jdbcTemplate.queryForInt(sql);
//        int female=allCount-male;
//        request.setAttribute("male",male);
//        request.setAttribute("female",female);
//        return "logon/result";
//    }


}