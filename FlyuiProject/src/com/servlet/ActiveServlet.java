package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserInfoService;
import com.service.UserInfoServiceImpl;

/**
 * Servlet implementation class ActiveServlet
 */
@WebServlet("/activeServlet")
public class ActiveServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailcode=request.getParameter("mailcode");
		System.out.println("ÑéÖ¤Âë"+emailcode);
		long nowtime=new Date().getTime();
		long codetime=Long.valueOf(emailcode);
		long time=60*1000;
		Boolean msg=null;
		UserInfoService us=new UserInfoServiceImpl();
		if((nowtime-codetime) > time) {
			us.DeleteOneUser(emailcode);
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/jsp/emailpage.jsp").forward(request, response);
		}else {
			us.ActiveUserinfo(emailcode);
			msg=true;
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/jsp/emailpage.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
