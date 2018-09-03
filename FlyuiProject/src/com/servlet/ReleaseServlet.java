package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Articleinfo;
import com.bean.Userinfo;
import com.service.ArticleService;
import com.service.ArticleServiceImpl;

/**
 * Servlet implementation class ReleaseServlet
 */
@WebServlet("/releasearticle")
public class ReleaseServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Userinfo user =(Userinfo)request.getSession().getAttribute("userinfo");
		if(user!=null) {
			response.sendRedirect(request.getContextPath()+"/jsp/releasepage.jsp");
		}else {
			response.sendRedirect(request.getContextPath()+"/jsp/loginpage.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获得当前登录者信息
		Userinfo user =(Userinfo)request.getSession().getAttribute("userinfo");
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/jsp/loginpage.jsp");
		}
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		//获得消耗的飞吻数
		String kiss_num=request.getParameter("kiss_num");
		String content_type=request.getParameter("content_type");
		Articleinfo article=new Articleinfo();
		article.setTitle(title);
		article.setContent(content);
		article.setPaykiss(Integer.valueOf(kiss_num));
		article.setType(Integer.valueOf(content_type));
		
		int userid=user.getId();
		article.setUserid(userid);
		ArticleService as=new ArticleServiceImpl();
		//算出用户剩余的飞吻数
		System.out.println(user.getKissnum()-Integer.valueOf(kiss_num));
		user.setKissnum(user.getKissnum()-Integer.valueOf(kiss_num));
		//将帖子和用户一起传给service层
		as.addNewArticle(article,user);
		response.sendRedirect(request.getContextPath()+"/IndexServlet");
		
	}

}
