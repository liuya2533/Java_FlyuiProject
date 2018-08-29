<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/releasepage.css"/>
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
	     <script src="${pageContext.request.contextPath }/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
	    <!-- 引一个渲染模板的包template-web.js -->
	    <script src="${pageContext.request.contextPath }/js/template-web.js" type="text/javascript" charset="utf-8"></script>
	    <script type="text/javascript">
		$(function(){
			$.ajax({
				url:'${pageContext.request.contextPath}/article/type',
				type:'get',
				dataType:'json',
				success:function(data){
					var list={"artlist":data};
					console.log(list);
					var html=template("arttest",list);
					$('#arttype').html(html);
				}
			});
			$('#kissnum').change(function(){
				alert($('#kissnum').val());
				$('#kissmsg').html('发表后不能修改飞吻').css('color','#999999');
				if(parseInt($('#userkiss').val()) < parseInt($('#kissnum').val())){
					$('#kissmsg').html('你太穷了，只有'+$('#userkiss').val()+'飞吻数不够').css('color','red');
				}
				
			});
			$('#addform').submit(function(){
				
				if(parseInt($('#userkiss').val()) < parseInt($('#kissnum').val())){
					return false;
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
				<a id="item" href="${pageContext.request.contextPath }/jsp/setpage.jsp"><span style="color:#fff;">${userinfo.nickname}</span><img  class="title-img" src="${pageContext.request.contextPath }/upload/${userinfo.head_url}"/>
				    <ul class="title-item">
					<li><a href="">用户中心</a></li>
					<li class="title-item-li"><a href="">基本设置</a></li>
					<li><a href="">我的消息</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/MyinfoServlet" >我的主页</a></li>
					<li><a href="">退出</a> </li>
		            </ul>
				</a>
				</li>
			</ul>
			<div class="fly-panel">
				<div class="publish-box">
					<div class="publish-title">
						<div class="publish-title-text">
							发表新帖
						</div>
						
					</div>
					<div class="publish-form">
					     <!-- 此处为渲染模板，在页面不会显示 -->
							<script type="text/html" id="arttest">
							<option>请选择</option>
							{{each artlist as value i}}
							<option value={{value.id}}>{{value.typename}}</option>
							{{/each}}
							</script>
						<form id=" addform"  action="${pageContext.request.contextPath }/releasearticle" method="post">
							<div class="form-div">
								<label class="form-label">所在专栏</label>
								<select id="arttype" name="content_type">
									<!-- 此处用id引入渲染模板 -->
								</select>
								<label class="form-label">标题</label>
								<input  class="form-text" type="text" name="title"/>
							</div>
							<div class="form-div">
								<textarea value="" placeholder="详细描述..." name="content"></textarea>
							</div>
							
							<div class="form-div">
								<label class="form-label">悬赏飞吻</label>
								
								<select name="kiss_num" id="kissnum">
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="50">50</option>
									<option value="60">60</option>
									<option value="70">80</option>
								</select>
								<div class="form-text2" id="kissmsg">发表后不能修改飞吻</div>
								<input id="userkiss" type="hidden" name="userkissnum" value="${userinfo.kissnum}"/>
							</div>
							<div class="form-div">
								<input  id="publish-button" type="submit" value="立即发布" />
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
