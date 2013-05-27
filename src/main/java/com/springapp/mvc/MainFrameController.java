package com.springapp.mvc;

import frame.VO.FeedBack;
import frame.comm.CommUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-14
 * Time: ����5:30
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/mainFrame")
public class MainFrameController {
    @Autowired
    public JdbcTemplate jdbcTemplate;

	/**
	 *
	 * @param task
	 * @param staffRole
	 * @param request
	 * @param roleBranch
	 * @return
	 */
    @RequestMapping("getTask")
    public String getTask(@RequestParam("task")String task,@RequestParam("staffRole")String staffRole,HttpServletRequest request,@RequestParam("roleBranch")String roleBranch){
        request.setAttribute("task", task);
        request.setAttribute("staffRole",staffRole);
        request.setAttribute("roleBranch",roleBranch);
        String sql="select design_useful from hqv_require_branch where require_no = ? and branch_no = ?";
        Object[] param=new String[] {task,roleBranch};
        int dsnUse=0;
        try{
            dsnUse=jdbcTemplate.queryForInt(sql,param);
			System.out.println("hqv_require_branch done");
        }catch (EmptyResultDataAccessException e){
			System.out.println("hqv_require_branch fail");
			dsnUse=0;
        }
        request.setAttribute("dsnUse",dsnUse);
        sql="select require_no,staff_id,content,add_time from hqv_require_feedback where require_no =? order by add_time ";
        param=new String[] {task};
        final List feedBackList=new ArrayList();
        try {
            jdbcTemplate.query(sql,param,new RowCallbackHandler(){
                public void processRow(ResultSet rs) throws SQLException{
                    FeedBack feedBack=new FeedBack();
                    feedBack.setRequireNo(rs.getString("require_no"));
                    feedBack.setContent(rs.getString("content"));
                    feedBack.setStaffId(rs.getString("staff_id"));
                    feedBack.setDate(rs.getDate("add_time"));
                    feedBackList.add(feedBack);
                }
            });
        }catch (EmptyResultDataAccessException e){

        }
        String content=new String();
        if(feedBackList.size()>0){
            for(int i=0;i<feedBackList.size();i++){
                FeedBack feedBack=(FeedBack)feedBackList.get(i);
                content="<div class='box'>"+content+"<h1>"+feedBack.getStaffId()+"      "+feedBack.getDate()+"</h1><h2>"+feedBack.getContent()+"</h2></div>" ;
            }
        }
        request.setAttribute("content",content);
        return "mainFunc/func/task";
    }

    @RequestMapping("upload")
    public String upload(@RequestParam("file")MultipartFile file,@RequestParam("task")String task,HttpServletResponse response,HttpServletRequest request)throws Exception{
        if(!file.isEmpty()){
            task=task.trim();
			String dir= "\\User\\linyiming\\hq_work\\"+task+"\\";
            File filedir=new File(dir);
            if(filedir.isDirectory()){
                System.out.println("path is already exist!");
            }else {
                if(filedir.mkdir()){
                    System.out.println("create path" + filedir.getPath() + " succeed");
                }else   {
                    System.out.println("sorry,created path "+filedir.getPath()+"  failed:(");
                }
            }
			try{
            	file.transferTo(new File(dir,file.getOriginalFilename()));
				request.setAttribute("result", "done");
			}catch (Exception e){
				System.out.println(e.getMessage());
				request.setAttribute("result","fail");
			}
        }else {
			request.setAttribute("result","fail");
        }
		return "mainFunc/func/upload" ;
    }

    @RequestMapping("/accept")
    public void accept(@RequestParam("requireNo")String requireNo,@RequestParam("roleBranch")String roleBranch,HttpServletResponse response){
        requireNo=requireNo.trim();
        String sql="insert into hqv_require_branch (require_no,branch_no,design_useful,code_useful) values("+requireNo+",'"+roleBranch+"',1,0)";
        try{
            jdbcTemplate.update(sql);
            CommUtil.outputXMLHTTP(response,"done");
        }catch (Exception e){
            CommUtil.outputXMLHTTP(response,"false");
        }

    }

    @RequestMapping("/storeFeedBackContent")
    public void storeFeedBackContent(HttpServletRequest request,HttpServletResponse response){
		String feedBackContent=request.getParameter("feedBackContentInput");
		String staffId=request.getParameter("staffIdFeedBack");
		String requireNo=request.getParameter("requireNoFeedBack");
		Date date=new Date();
        String sql="insert into hqv_require_feedback values (?,?,?,?)" ;
        Object[] param=new Object[]{requireNo,staffId,feedBackContent,date};
        try{
            jdbcTemplate.update(sql,param);
			System.out.println("succeed");
        }catch (Exception e){
            System.out.println(e.toString());
			System.out.println("fail");
        }
    }

	@RequestMapping("acceptCode")
	public void acceptCode(@RequestParam("requireNo")String requireNo,@RequestParam("roleBranch")String roleBranch,HttpServletResponse response) {
		String sql="update hqv_require_branch set code_useful=1 where require_no = ? and branch_no = ?";
		Object[] param=new Object[]{requireNo,roleBranch};
		try {
			jdbcTemplate.update(sql,param);
			CommUtil.outputXMLHTTP(response,"done");
		}catch (Exception e){
			System.out.println(e.getMessage());
			CommUtil.outputXMLHTTP(response,"fail");
		}

	}
}
