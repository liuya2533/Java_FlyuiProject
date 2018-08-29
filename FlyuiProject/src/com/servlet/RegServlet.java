package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Userinfo;
import com.service.UserInfoService;
import com.service.UserInfoServiceImpl;
import com.util.MD5;
import com.util.MailUtil;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/reg")
public class RegServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//通过ajax请求查邮箱
		String email=request.getParameter("email");
		//System.out.println(email);
		UserInfoService us=new UserInfoServiceImpl();
		int num=us.checkEmail(email);
		response.getWriter().println(num);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		
		String name=request.getParameter("nickname");
		String password =request.getParameter("password");
		//获取邮箱，并发送时间戳到对应邮箱
		//将long型转换为String
		String emailcode=String.valueOf(new Date().getTime());
	    try {
	        // date.getTime()+""是用时间戳作为校验码发送给对方邮箱
	        MailUtil.sendActiveMail(email, emailcode);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		//存入一个用户对象中
		Userinfo user=new Userinfo();
		user.setEmail(email);
		user.setNickname(name);
		user.setPassword(MD5.MD5(password));
		user.setActivecode(emailcode);
		System.out.println("邮箱验证码:"+emailcode);
		//System.out.println(user.getNickname()+","+user.getEmail());
		
		UserInfoService us=new UserInfoServiceImpl();
		us.addUserInfo(user);
		response.sendRedirect(request.getContextPath()+"/jsp/loginpage.jsp");
	}
}
