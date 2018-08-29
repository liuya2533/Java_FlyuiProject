<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/myinfopage.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<script src="js/loginsuccess-myinfo.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div id="title">
			<ul>
			    <c:if test="${userinfo == null}">
			    <li id="logimg"><a href="${ pageContext.request.contextPath }/IndexServlet"><img id="logimg" src="${ pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li class="option op nologin-user"><img  style="" src="${ pageContext.request.contextPath }/img/tou.PNG"/>
				<a href="${ pageContext.request.contextPath }/jsp/loginpage.jsp" class="title-li-a">&nbsp;&nbsp;登入</a>
				<a href="${ pageContext.request.contextPath }/jsp/regpage.jsp" class="title-li-a">&nbsp;&nbsp;注册</a>
				</li>
				</c:if>
			    <c:if test="${userinfo!=null}">
				<li id="logimg"><a href="${ pageContext.request.contextPath }/IndexServlet"><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li class="title-user">
				<a id="item" href="${pageContext.request.contextPath }/jsp/setpage.jsp"><span style="color:#fff;">${userinfo.nickname}</span><img  class="title-img" src="${pageContext.request.contextPath }/upload/${userinfo.head_url}"/>
				    <ul class="title-item">
					<li><a href="#">用户中心</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/jsp/setpage.jsp">基本设置</a></li>
					<li><a href="#">我的消息</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/MyinfoServlet?userid=${userinfo.id}" >我的主页</a></li>
					<li><a href="${pageContext.request.contextPath }/loginout">退出</a> </li>
		            </ul>
				</a>
				</li>
				</c:if>
			</ul>
		</div>
		<div id="div1" >
			<div style="margin: 0 auto;width:120px;background: white;margin-bottom:10px;"><img src="${pageContext.request.contextPath }/upload/${user.head_url}" style="height:120px;width:120px;border-radius:100%;"></div>
			<div style="text-align:center;margin-bottom:10px;font-size:16px;font-weight: bold;">${userinfo.nickname}</div>
			<div style="text-align:center; width: 100%;margin-bottom:10px;"><span ><img src="${pageContext.request.contextPath }/img/kiss.jpg"><span>${user.kissnum}</span>飞吻<img src="${pageContext.request.contextPath }/img/timephoto.png"><span><fmt:formatDate value="${user.regtime}" pattern="yyyy-MM-dd" /></span>加入<img src="${pageContext.request.contextPath }/img/locationphoto.png"/>来自<span>${user.city}</span></span></div>
			<div style="text-align:center;margin-bottom:10px;"><span>(${user.sign})</span></div>
		</div>
		<div style="width:1170px;margin:0 auto;height: 100px;">
			<div style="width:578px;float: left;background: white;height: 500px;">
				<div style="line-height:50px;border-bottom: 1px solid #F2F2F2;padding:0px 18px;">${user.nickname} 最近的提问</div>
				<div style="width:538px;margin: 0 auto;">
				
				   <c:forEach items="${myArticle }" var="article">
					<div style="width: 100%;border-bottom:1px solid #F2F2F2;height: 40px;line-height:40px ;">
						<a style="margin-right: 20px;" href="${pageContext.request.contextPath }/articleinfo?artid=${article.id}">${article.title }</a><span>${article.releasetime }</span><span style="float: right;"><span>${article.visitnum }</span>阅/<span>${article.remarknum }</span>答</span>
					</div>
					</c:forEach>
					
				</div>
			</div>
			<div style="width:578px;float: right;background: white;">
				<div style="line-height:50px;border-bottom: 1px solid #F2F2F2;padding:0px 18px;">${userinfo.nickname} 最近的回答</div>
				
				<div style="width:538px;margin: 0 auto; height: 500px;">
				<c:forEach items="${ramarklist }" var="remarkArticle">
					<span>${remarkArticle.remarktime } 在 <a href="${pageContext.request.contextPath }/articleinfo?artid=${remarkArticle.id}" style="color: dodgerblue;">${remarkArticle.title }</a> 中回答：</span>
					<div style="background: #F2F2F2;border-radius:5px;padding:10px;word-wrap:break-word;margin:10px 0px;">
						${remarkArticle.content }
					</div>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</body>
</html>
