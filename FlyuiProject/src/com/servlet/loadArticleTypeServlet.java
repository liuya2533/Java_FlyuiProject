package com.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.bean.Articletype;
import com.service.ArticleService;
import com.service.ArticleServiceImpl;

/**
 * Servlet implementation class loadArticleTypeServlet
 */
@WebServlet("/article/type")
public class loadArticleTypeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleService as=new ArticleServiceImpl();
		List<Articletype> list=as.getArticleType();
		response.getWriter().println(JSON.toJSONString(list));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
