package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.Userinfo;
import com.service.UserInfoService;
import com.service.UserInfoServiceImpl;

/**
 * Servlet implementation class SetServlet
 */
@WebServlet("/setservlet")
@MultipartConfig
public class SetServlet extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取存储路径
		String savepath = request.getServletContext().getRealPath("/upload");
		// 因为我们的服务器上不确定是否有upload，所以
		File file = new File(savepath);
		if (!file.exists()) {
			file.mkdirs();
		}
		// 获取上传文件集合
		Collection<Part> parts = request.getParts();
		String filepath="";
		if (file != null) {	
			for (Part part : parts) {
				System.out.println(part);
				if(part.getContentType()!=null) {
					// 以为这里part获取的包括username，password，但是他们的类型为空，所以需要排除它们
					if (part.getContentType() != null) {
					// Servlet3.0将multipart/form-data的post的请求封装成Part，通过Part对文件上传操作。
					// Servlet3没有提供直接获取文件名的方法，需要从请求头中解析出来
					// 获取请求头，请求头的格式：form-data;name="file";filenme="*******.zip"
					String header = part.getHeader("content-disposition");
					
					// 从请求头里获取文件名
					String filename = getFileName(header);
					
					// 把文件写到指定路径
					// File.separator系统兼容写法/或\\
					filepath=(new Date().getTime()+filename);
					part.write(savepath + File.separator + filepath );
				}
			 }
		}
			//更新session
			Userinfo user=(Userinfo)request.getSession().getAttribute("userinfo");
			user.setHead_url(filepath);
			request.getSession().setAttribute("userinfo", user);
			//更新数据库
			UserInfoService us=new UserInfoServiceImpl();
			us.updateUserinfo(user);
			PrintWriter out = response.getWriter();
			out.println(request.getContextPath()+"/upload/"+filepath);
			out.flush();
			out.close();
		}
	}
	private String getFileName(String header) {
				/**
				 * String[] tempArr1 = header.split(";");代码执行完之后，在不同的浏览器下，tempArr1数组里面的内容稍有区别
				 * 火狐或者google浏览器下：tempArr1={form-data,name="file",filename="snmp4j--api.zip"}
				 * IE浏览器下：tempArr1={form-data,name="file",filename="E:\snmp4j--api.zip"}
				 */
				String[] tempArr1=header.split(";");
				for(String str:tempArr1) {
					System.out.println(str);
				}
				/**
				 * 火狐或者google浏览器下：tempArr2={filename,"snmp4j--api.zip"}
				 * IE浏览器下：tempArr2={filename,"E:\snmp4j--api.zip"}
				 */
				String[] tempArr2=tempArr1[2].split("=");
				// 获取文件名，兼容各种浏览器的写法
				String filename=tempArr2[1].substring(tempArr2[1].lastIndexOf("\\")+1).replaceAll("\"","");
				return filename;
			}
}
