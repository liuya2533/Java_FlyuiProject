<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/emailpage.css"/>
	</head>
	<body>
		<div id="title">
			<ul>
				<li id="logimg"><a href=""><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li class="option op nologin-user"><img  src="${pageContext.request.contextPath }/img/tou.PNG"/>
				<a href="" class="title-li-a">&nbsp;&nbsp;登入</a>
				<a href="" class="title-li-a">&nbsp;&nbsp;注册</a>
				</li>
			</ul>
		</div>
		<div class="content">
				<div class="content-text">
				  <c:if test="${msg!= null}">
					<p style="color: #999999;">邮箱已注册成功请到您的邮箱点击激活链接，激活您的账号。如果您已经激活，点击登录</p>
					<div class="content-a">
						<a href="${pageContext.request.contextPath }/jsp/loginpage.jsp" style="color: #fff;">去登录</a>
					</div>
					</c:if>
					<c:if test="${msg==null}">
					<p style="color: red;">对不起你操作时间过长，此验证已失效，请重新注册</p>
					</c:if>
					
				</div>
		</div>
	</body>
</html>
