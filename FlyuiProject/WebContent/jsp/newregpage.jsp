<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/regpage.css"/>
		
	</head>
	<body>
		<div id="title">
			<ul>
				<li id="logimg"><a href=""><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href=""><img  src="${pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href=""><img  src="${pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href=""><img  src="${pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li><a href=""><img  src="${pageContext.request.contextPath }/img/tou.PNG"/></a></li>
				<li class="option op"><a href="${pageContext.request.contextPath }/jsp/loginpage.jsp">&nbsp;&nbsp;登入</a></li>
				<li class="option op"><a href="">&nbsp;&nbsp;注册</a></li>
			</ul>
			
		</div>
		<div class="layui-container ">
			<div class="fly-panel fly-panel-user">
				<ul class="layui-tab-title">
					<li class="layui-this"><a href="${pageContext.request.contextPath }/jsp/loginpage.jsp">登入</a></li>
					<li class="layui-zuche">注册</li>
				</ul>
				<div class="layui-form-title">
						<div>
							<form action="reg" method="post">
								<div class="layui-form-item">
									<label for="L_email" class="layui-form-label">
										邮箱
									</label>
									<div class="layui-input-inline">
										<input type="email" name="email"/> <span style="color:red; line-height:30px;'">邮箱已被占用请重新注册 </span>
									</div>
									
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label"> 昵称</label>
									<div>
										<input type="text" name="nickname"/>
										<div class="layui-form-mid1">
											你在社区的名字
										</div>
									</div>
									
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div>
										<input type="password" name="password"/>
									</div>
									<div class="layui-form-mid2">6到16个字符</div>
								</div>
								<div class="layui-form-item">
								    <label class="layui-form-label">确认密码</label>
								    <input type="text" />
								    
								</div>
								<div class="layui-form-item">
									<input  id="radio" type="checkbox" />同意用户服务条款
								</div>
								<div class="layui-form-item">
									<button >立即注册</button>
									<span style="padding-left:20px ;">忘记密码？</span>
								</div>
								
							</form>
						</div>
					
				</div>
			</div>
		</div>
	</body>
</html>
