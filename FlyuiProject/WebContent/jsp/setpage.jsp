<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/setpage.css"/>
		<script src="${pageContext.request.contextPath }/js/setpage.js" type="text/javascript" charset="utf-8"></script>
	    <!-- 一个页面只能有一个window.onload -->
	    <script src="${pageContext.request.contextPath }/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
	    <script type="text/javascript">
	    $(function(){
	    	//记住这个地方下标[0]
	    	//var formdata=new FormData($('#photo-form')[0]);
	    	
	    	$('#fly-file').change(function(){
	    		var formdata=new FormData(document.getElementById('photo-form'));
	    		$.ajax({
	    			url:'${pageContext.request.contextPath}/setservlet',
	    			data:formdata,
	    			type:'post',
	    			cache:false,
	    			contentType:false,
	    			processData:false,
	    			success:function(data){
	    				alert(data);
	    				$('#photoimg').attr('src',data);
	    				$('#userphoto').attr('src',data);
	    			},
	    			async:true,
	    		});
	    	});
	    	$('#passbut').click(function(){
	    		$('#errpassmsg').html('');
	    		if($('#pass').val()!=$('#pass2').val()){
	    			$('#errpassmsg').html('密码不一致');
	    			return false;
	    		}else{
	    			$.ajax({
	    				url:'${ pageContext.request.contextPath }/ModiflyServlet',
	    				type:'post',
	    				data:{'password':$('#pass').val()},
	    				success:function(data){
	    					if(data==1){
	    						alert("修改成功！");
	    						$('#pass').val('');
	    						$('#pass2').val('');
	    					}else{
	    						alert("修改失败！");
	    					}
	    				}
	    			})
	    		}
	    		
	    	});
	    })
	    </script>
	</head>
	<body>
		<div id="title">
			<ul>
				<li id="logimg"><a href="${ pageContext.request.contextPath }/IndexServlet"><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li class="title-user">
				<a id="item" href="${pageContext.request.contextPath }/jsp/setpage.jsp"><span style="color:#fff;">${userinfo.nickname}</span><img id="userphoto" class="title-img" src="${pageContext.request.contextPath }/upload/${userinfo.head_url}"/>
				    <ul class="title-item">
					<li><a href="">用户中心</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/jsp/setpage.jsp">基本设置</a></li>
					<li><a href="">我的消息</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/jsp/myinfopage.jsp" >我的主页</a></li>
					<li><a href="${pageContext.request.contextPath }/loginout">退出</a> </li>
		            </ul>
				</a>
				</li>
			</ul>
		</div>
		<div id="content">
			<div class="content-item">
				<ul class="content-item-ul">
					<li class="content-item-li">
						<a><img class="content-item-img" src=""/>个人主页</a>
					</li>
					<li class="content-item-li">
						<a><img src=""/>用户中心</a>
					</li>
					<li class="content-item-li-set">
						<a><img src=""/>基本设置</a>
					</li>
					<li class="content-item-li">
						<a><img src=""/>我的帖子</a>
					</li>
					<li class="content-item-li">
						<a><img src=""/>我的消息</a>
					</li>
					<li class="content-item-li">
						<a><img src=""/>我的产品</a>
					</li>
				</ul>
			</div>
			<div class="content-text">
				<div class="content-text-panel">
					<ul class="content-text-ul">
						<li class="content-text-li" style="color: #009688; border-bottom: 3px solid #009688;" id="data1">我的资料</li>
						<li class="content-text-li" id="data2">头像</li>
						<li class="content-text-li" id="data3">密码</li>
						<li class="content-text-li" >账号绑定</li>
					</ul>
				</div>
				<div style=" padding: 0px 20px;">
					<div id="myMessage">
						<form action="${pageContext.request.contextPath}/ModiflyServlet" method="get">
							<div class="text-form-tab">
								<label>邮箱</label>
								<input class="text-form-text" type="text" readonly="readonly" value="" placeholder="${userinfo.email }"/>
								<span  style="color: #999999;">
									邮箱也可以作为登入名，推荐设置
								</span>
							</div>
							<div class="text-form-tab">
								<label>昵称</label>
								<input class="text-form-text" type="text" name="username"  value="" />
								<input class="text-form-radio" type="radio" name="sex" checked value="" />男
								<input class="text-form-radio" type="radio" name="sex"  value="" />女
								
							</div>
							<div class="text-form-tab">
								<label>城市</label>
								<input class="text-form-text" type="text" name="cityname" />
								
							</div>
							<div class="text-form-tab">
								<label style="width: 100%; text-indent: 10px;">签名</label>
								<textarea name="sign" rows="" cols="" placeholder="随便写些什么刷一下存在感"></textarea>
								
							</div>
							<div class="text-form-tab">
								<input class="text-form-button" type="submit" value="确认修改"/>
							</div>
							
						</form>
					</div> 
							   
					<div id="photo" class="text-photo">
						<button type="button" class="text-photo-button">上传头像</button>
						<form id="photo-form" action="#"  method="post" enctype="multipart/form-data">
						<input  id="fly-file" class="text-photo-file " type="file" name="file" />
						</form>
						<p class="text-photo-p">建议尺寸168*168，支持jpg,png,gif,最大不能超过50KB</p>
						<img id="photoimg" class="text-photo-img" src="${pageContext.request.contextPath }/upload/${userinfo.head_url}"/>
					</div>
			
					<div id="password">
						<form action="" method="post">
							<div class="text-pass-div">
								<label>新密码</label><input id="pass" type="password" name="password" class="text-form-text"/><span style="color: #999999; margin-left: 10px;">6到16个字符</span>
							</div>
							<div class="text-pass-div">
								<label>确认密码</label><input id="pass2" type="password" name="passord2" class="text-form-text"/><span id="errpassmsg" style="color: red; margin-left: 10px;"></span>
							</div>
							<div class="text-pass-div">
								<input id="passbut" class="text-form-button" type="button" value="确认修改"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

