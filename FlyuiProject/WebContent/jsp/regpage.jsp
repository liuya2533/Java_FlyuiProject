<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/regpage.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		$(function(){
			
			 //验证邮箱格式的js正则表达式
			 var isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			$('#lemail').blur(function(){
				if($('#lemail').val().length !=0 && (isEmail.test($('#lemail').val()))){
				$.ajax({
				    url:'${pageContext.request.contextPath}/reg',
					type:'get',
					data:{'email':$('#lemail').val()},
					//dataType:'json',
					success:function(data){
						if(data==0){
							$('#lmsg').html('该邮箱可以被注册').css('color','blue');
						}else if(data==1){
							$('#lmsg').html('该邮箱已被注册').css('color','red');
						}
					},
					async:true
				})
				}else{
					$('#lmsg').html('该邮箱格式不正确').css('color','red');
				}
			});
			$('#lrepass').blur(function(){
				
				if($('#lrepass').val() != $('#lpass').val() ){
					
					$('#lpmsg').html('密码不一致请重新输入').css('color','red');
				}else{
					$('#lpmsg').html('');
				}
			});
			$('#lform').submit(function(){
				//最终判断信息是否正确
				if($('#lpmsg').html() == "密码不一致请重新输入" || $('#lmsg').html() == '该邮箱已被注册'){
					alert('请检查输入是否正确');
					return false;
				}
			});
		})
		
		</script>
	</head>
	<body>
		<div id="title">
			<ul>
				<li id="logimg"><a href="${pageContext.request.contextPath }/IndexServlet"><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li style="padding-top:15px;"><a href=""><img  src="${pageContext.request.contextPath }/img/tou.PNG"/ class="title-li-a"></a></li>
				<li class="option op"><a href="${pageContext.request.contextPath }/jsp/loginpage.jsp" class="title-li-a">&nbsp;&nbsp;登入</a></li>
				<li class="option op"><a href="" class="title-li-a">&nbsp;&nbsp;注册</a></li>
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
							<form id="lform" action="${pageContext.request.contextPath }/reg" method="post">
								<div class="layui-form-item">
									<label for="L_email" class="layui-form-label" >
										邮箱
									</label>
									<div class="layui-input-inline">
										<input type="email" name="email" id="lemail"/> <span id="lmsg" style="line-height:30px;position: absolute;
										top: 30px;left: 320px;width: 300px;"> </span>
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
										<input type="password" name="password" id="lpass"/>
									</div>
									<div class="layui-form-mid2">6到16个字符</div>
								</div>
								<div class="layui-form-item">
								    <label class="layui-form-label">确认密码</label>
								    <input type="password"  id="lrepass" /> <span id="lpmsg"></span>
								    
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
