package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Userinfo;
import com.service.UserInfoService;
import com.service.UserInfoServiceImpl;
import com.util.MD5;

/**
 * Servlet implementation class ModiflyServlet
 */
@WebServlet("/ModiflyServlet")
public class ModiflyServlet extends HttpServlet {
	
	UserInfoService us=new UserInfoServiceImpl();		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname=request.getParameter("username");
		System.out.println(nickname);
		String city=request.getParameter("cityname");
		String sign=request.getParameter("sign");
		String sex=request.getParameter("sex");
		Userinfo user=(Userinfo)request.getSession().getAttribute("userinfo");
		user.setNickname(nickname);
		user.setCity(city);
		user.setSign(sign);
		request.getSession().setAttribute("userinfo", user);
		us.updateUserinfo(user);
		
		response.sendRedirect(request.getContextPath()+"/jsp/setpage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password=request.getParameter("password");
		System.out.println(password);
		Userinfo user=(Userinfo)request.getSession().getAttribute("userinfo");
	    user.setPassword(MD5.MD5(password));
	    System.out.println(user.getId());
		int num=us.modifyPassword(user);
		response.getWriter().print(num);
	}

}
