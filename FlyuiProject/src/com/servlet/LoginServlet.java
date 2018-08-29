package com.servlet;

import java.io.IOException;
import java.util.Calendar;
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
import com.util.TimeUtil;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		
		String password =request.getParameter("password");
		Userinfo user=new Userinfo();
		user.setEmail(email);
		user.setPassword(MD5.MD5(password));
		UserInfoService us=new UserInfoServiceImpl();
		user=us.checkUserLogin(user);
		
		if(user!=null) {
			//计算用户是否签到
			Calendar now=Calendar.getInstance();
			now.setTime(new Date());
			now.set(now.HOUR, 0);
			now.set(now.MINUTE, 0);
			now.set(now.SECOND, 0);
			now.set(now.MILLISECOND, 0);
			Calendar date=Calendar.getInstance();
			System.out.println(user.getRegtime());
			date.setTime(user.getSignintime());
			if(now.before(date)) {
				user.setSignflg(1);
			}
			request.getSession().setAttribute("userinfo",user);
			response.sendRedirect(request.getContextPath()+"/IndexServlet");
		}else {
			request.setAttribute("msg", "密码或者账号错误");
			request.getRequestDispatcher("/jsp/loginpage.jsp").forward(request, response);
		}
	}

}
