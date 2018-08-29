<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/replypage.css"/>
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
	    <script src="${pageContext.request.contextPath }/js/template-web.js" type="text/javascript" charset="utf-8"></script>
	    <link href="${pageContext.request.contextPath }/js/mricode.pagination.css" rel="stylesheet" />
	    <script src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script>
	    <script src="${pageContext.request.contextPath }/js/mricode.pagination.js"></script>
	    <script src="js/loginsuccess-myinfo.js" type="text/javascript" charset="utf-8"></script>
	    <script type="text/javascript">
	    $(function(){
	    	$('#replyBt').click(function(){
	    		if(${userinfo==null}){
	    			alert("未登录");
	    			return false;
	    		}
	    		$.ajax({
	    			url:'${pageContext.request.contextPath }/articleinfo',
	    			type:'post',
	    			data:{
	    				'userid':'${userinfo.id}',
	    				'artid':'${detail_map.id}',
	    				'replycontent':$('#replycontent').val(),
	    			},
	    			success:function(data){
	    				if(data==1){
	    					alert("评论成功！");
	    				}else{
	    					alert("评论失败！");
	    				}
	    			},
	    			async:true,
	    		});
	    		var json={
	    			"head_url":'${userinfo.head_url}',
	    			"nickname":'${userinfo.nickname}',
	    			"replytime":"刚刚",
	    			"content":$('#replycontent').val()
	    	};
	    		$('#replycontent').val('');
	    		var html=template("replymodel",json);
	    		$('#reply_ul').html(html);
	    	});
	    	
	    })
	    </script>
	</head>
	<body style="height: 2000px;">
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
				<li id="logimg"><a href="${pageContext.request.contextPath }/IndexServlet"><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li class="title-user">
				<a id="item" href="${pageContext.request.contextPath }/jsp/setpage.jsp"><span style="color:#fff;">${userinfo.nickname}</span><img  class="title-img" src="${pageContext.request.contextPath }/upload/${userinfo.head_url}"/>
				    <ul class="title-item">
					<li><a href="">用户中心</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/jsp/setpage.jsp">基本设置</a></li>
					<li><a href="">我的消息</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/MyinfoServlet" >我的主页</a></li>
					<li><a href="${pageContext.request.contextPath }/loginout">退出</a> </li>
		            </ul>
				</a>
				</li>
				</c:if>
			</ul>
		</div>
		<div id="nav">
			<ul>
				<li id="indx"><a id="aindex" href="">首页</li>
				<li><a href="">&nbsp;&nbsp;提问</li>
				<li><a href="">&nbsp;&nbsp;分享</li>
				<li><a href="">&nbsp;&nbsp;讨论</li>
				<li><a href="">&nbsp;&nbsp;建议</li>
				<li><a href="">&nbsp;&nbsp;公告</li>
				<li><a href="">&nbsp;&nbsp;动态</li>
				
				<c:if test="${userinfo!=null }">	
				<li class="nav-line">|</li>
				<li class="nav-my"><a>我发表的贴</a></li>
				<li class="nav-my"><a>我收藏的贴</a></li>
				<li id="rart"><a href="${pageContext.request.contextPath }/releasearticle" class="rarta">发表动态</a></li>
				</c:if>
			</ul>
		</div>
		<div id="content">
			<div class="content-left-top">
				<div class="content-panel">
					<h1 class="content-div-padding" style="font-weight: 400; font-size: 24px;">${detail_map.title }</h1>
					<div class="content-view content-div-padding">
						<span class=" view-1 view-t">${detail_map.typename }</span> <c:if test="${detail.isdone==1 }"><span class="view-1 view-w">未结</span></c:if>
						<span class="view-2">
							<a href="" ><img src="${pageContext.request.contextPath }/img/huida.PNG" style=""/></a><span style="  margin-bottom :20px; line-height: 30px; padding:5px;">${detail_map.remarknum }</span>
							<img src="${pageContext.request.contextPath }/img/eye.PNG"/><span style="  margin-bottom :10px; line-height: 30px; padding:5px;">${detail_map.visitnum }</span>
						</span>
					</div>
					<div class="content-user content-div-padding">
						<a href="" class="content-user-a">
							<img src="${pageContext.request.contextPath }/upload/${detail_map.head_url }" class="content-user-img"/>
						</a>
						<div class="content-user-div1">
							<a href="" style="color: #9BB4ED;">${detail_map.nickname }</a>
							<span style="color: #999999;">${detail_map.releasetime }</span>
						</div>
						<div class="content-user-div2">
							<span id="" style="color: #FF5762;">
								悬赏：${detail_map.paykiss }飞吻
							</span>
							<span class="content-user-span">
								收藏
							</span>
						</div>
					</div>
					<div class="content-div-padding">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr><td>版本：layui</td><td>浏览器：Chrome</td></tr>
						</table>
					</div>
					<div class="content-div-padding">
						${detail_map.content }
					</div>
				</div>
			</div>
			<div class="content-right-top">
				<div class="thisweek">
					<div class="thisweek-this">本周热议</div>
					<div>
						<ul>
							<c:forEach items="${thisweek }" var="thismap">
								<li class="thisweek-li">
									<a href="${pageContext.request.contextPath }/articleinfo?artid=${thismap.artorcommid}" style="color:black;">${thismap.title}</a>
									<img src="${pageContext.request.contextPath }/img/xiaoxi-2.jpg" alt="" />${thismap.remarknum}
								</li>
								</c:forEach>
						</ul>
					</div>
		        </div>
			</div>
			<div id="reply">
				<div class="content-panel">
					<ul class="reply-ul" style="height: 50px;" >
						<li class="reply-ul-line"></li>
						<li class="reply-ul-text">回帖</li>
						<li class="reply-ul-line"></li>
					</ul>
					<!-- 渲染模板 -->
					<script type="text/html" id="replymodel">
					
						<li class="reply-ul-user" style="height:100px;">
							<a href="" class="content-user-a">
							<img src="${pageContext.request.contextPath }/upload/{{head_url}}" class="content-user-img"/>
						     </a>
						    <div class="content-user-div1">
							<a href="" style="color: #9BB4ED;">{{nickname }}</a>
							
						    </div>
						    <div class="content-user-div2">
							<span  style="color: #999999;">
								{{replytime }}
							</span>
						</li>
						<li class="reply-li-text " >
							<div>{{content }}</div>
						</li>
						<li class="" style="top: 20px;">
							<img src="${pageContext.request.contextPath }/img/dianzan.PNG"/><span>0</span>
							<img src="${pageContext.request.contextPath }/img/huifu.PNG"/>回复
						</li>

                    </script>
					<c:forEach items="${ remarkinfo}" var="remap">
					<ul class="reply-ul"  >
						<li class="reply-ul-user" style="height:100px;">
							<a href="" class="content-user-a">
							<img src="${pageContext.request.contextPath }/upload/${remap.head_url}" class="content-user-img"/>
						     </a>
						    <div class="content-user-div1">
							<a href="" style="color: #9BB4ED;">${remap.nickname }</a>
							
						    </div>
						    <div class="content-user-div2">
							<span  style="color: #999999;">
								${remap.remarktime }
							</span>
						</li>
						<li class="reply-li-text " >
							<div>${remap.content }</div>
						</li>
						<li class="" style="top: 20px;">
							<img src="${pageContext.request.contextPath }/img/dianzan.PNG"/><span>${remap.goodnum}</span>
							<img src="${pageContext.request.contextPath }/img/huifu.PNG"/>回复
						</li>
					</ul>
					</c:forEach>
					
					<ul class="reply-ul" id="reply_ul">
					
					</ul>
					<div class="reply-text">
						<form action="#" method="post">
						    <input type="hidden" name="artid" value="${detail_map.id}"/>
						    <input type="hidden" name="userid" value="${id }"/>
							<textarea id="replycontent" name="recontent" placeholder="请输入内容" style="height: 200px ; width: 100%; font-size: 14px;"></textarea>
							<input id="replyBt" type="button" value="提交回复" class="reply-button"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
