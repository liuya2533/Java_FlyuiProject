package com.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.bean.PageLimitNum;
import com.bean.PageNumInfo;
import com.service.ArticleService;
import com.service.ArticleServiceImpl;
import com.util.TimeUtil;

@WebServlet("/pagetest")
public class PagePartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageSizeStr=request.getParameter("pageSize");
		String pageIndexStr=request.getParameter("pageIndex");
		int pageSize=Integer.valueOf(pageSizeStr);
		int pageIndex=Integer.valueOf(pageIndexStr);
		PageLimitNum pagelimtnum=new PageLimitNum();
		pagelimtnum.setPageSize(pageSize);
		pagelimtnum.setPageindex(pageIndex*pageSize);
		
		ArticleService as=new ArticleServiceImpl();
		//获取分页信息
		List<Map<String,Object>> list=as.getAllArticle(pagelimtnum);
		//更改时间格式
		for(Map<String,Object> map:list) {
					String s=TimeUtil.calculateTime((Date)map.get("releasetime")); 
					map.put("releasetime",s);
				}
		//获取帖子总数
		int num=as.getArticleTotal();
		PageNumInfo pageNuminfo=new PageNumInfo();
		pageNuminfo.setList(list);
		pageNuminfo.setTotal(num);
		response.getWriter().println(JSON.toJSONString(pageNuminfo));
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
