package com.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.*;
import com.service.ArticleService;
import com.service.ArticleServiceImpl;
import com.service.UserInfoService;
import com.service.UserInfoServiceImpl;
import com.util.TimeUtil;

/**
 * Servlet implementation class MyinfoServlet
 */
@WebServlet("/MyinfoServlet")
public class MyinfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int userid=((Userinfo)request.getSession().getAttribute("userinfo")).getId();
		String id=request.getParameter("userid");
		int userid=Integer.parseInt(id);
		//获取用户信息
		UserInfoService us=new UserInfoServiceImpl();
		Userinfo user=us.getUserinfoById(userid);
		request.setAttribute("user", user);
		ArticleService as=new ArticleServiceImpl();
		List<Map<String,Object>> articlelist =as.getMyArticleById(userid);
		for(Map<String,Object> map:articlelist) {
			map.put("releasetime", TimeUtil.calculateTime((Date)map.get("releasetime")));
		}
		request.setAttribute("myArticle", articlelist);
		List<Map<String,Object>> remarklist=as.getMyremarkArticleById(userid);
		for(Map<String,Object> map:remarklist) {
			map.put("remarktime", TimeUtil.calculateTime((Date)map.get("remarktime")));
		}
		request.setAttribute("ramarklist", remarklist);
		request.getRequestDispatcher("/jsp/myinfopage.jsp").forward(request, response);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
