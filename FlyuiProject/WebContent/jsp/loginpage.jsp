
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/loginpage.css"/>
        <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/title.css"/>
	</head>
	<body>
		<div id="title">
			<ul>
				<li id="logimg"><a href="${ pageContext.request.contextPath }/IndexServlet"><img id="logimg" src="${ pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li style="padding-top:15px;"><a href=""><img  src="${ pageContext.request.contextPath }/img/tou.PNG"/></a></li>
				<li class="option op"><a href="#" class="title-li-a">&nbsp;&nbsp;登入</a></li>
				<li class="option op"><a href="${ pageContext.request.contextPath }/jsp/regpage.jsp" class="title-li-a">&nbsp;&nbsp;注册</a></li>
			</ul>
		</div>
		<div class="layui-container ">
			<div class="fly-panel fly-panel-user">
				<ul class="layui-tab-title">
					<li class="layui-this">登入</li>
					<li class="layui-zuche"><a href="${ pageContext.request.contextPath }/jsp/regpage.jsp">注册</a></li>
				</ul>
				<div>
							<form action="${ pageContext.request.contextPath }/login " method="post">
								<div class="layui-form-item">
									<label for="L_email" class="layui-form-label">
										手机/邮箱
									</label>
									<div class="layui-input-inline">
										<input type="text" name="email"/>
									</div>
									<div class="layui-form-mid">使用手机或者邮箱中的任何一个均可(若采用手机，请确保你的账号已绑定过该手机)</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div>
										<input type="password"  name="password"/>&nbsp<span style="color:red;">${msg}</span>
									</div>
								</div>
								<div class="layui-form-item">
									<button >立即登录</button>
									<span style="padding-left:20px ;">忘记密码？</span>
								</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
