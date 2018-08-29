<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/loginsuccesspage.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
		<script src="js/loginsuccess-myinfo.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">
		$(function(){
			if(${userinfo!=null}){
				if(${userinfo.signflg}==1){
					$('#jiriq').attr('disabled',true).css('background','#d5d5d5').css('cursor','not-allowed').html('已签到');
				}
				$('#jiriq').click(function(){
					alert(1);
					$.ajax({
						url:'${pageContext.request.contextPath }/IndexServlet',
						type:'post',
						data:{'userid':'${userinfo.id}'},
						success:function(data){
							if(data==1){
								$('#jiriq').attr('disabled',true).css('background','#d5d5d5').css('cursor','not-allowed').html('已签到');
							}
						}
					})
				});
			}else{
				$('#jiriq').click(function(){
					alert("请先登录！");
				});
			}
		})
		</script>
		
	</head>
	<body>
		<div id="title">
			<ul>
			    <c:if test="${userinfo == null}">
			    <li id="logimg"><a href=""><img id="logimg" src="${ pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href="" class="title-li-a"><img  src="${ pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li class="option op nologin-user"><img  style="" src="${ pageContext.request.contextPath }/img/tou.PNG"/>
				<a href="${ pageContext.request.contextPath }/jsp/loginpage.jsp" class="title-li-a">&nbsp;&nbsp;登入</a>
				<a href="${ pageContext.request.contextPath }/jsp/regpage.jsp" class="title-li-a">&nbsp;&nbsp;注册</a>
				</li>
				</c:if>
			    <c:if test="${userinfo!=null}">
				<li id="logimg"><a href=""><img id="logimg" src="${pageContext.request.contextPath }/img/logo.png"/></a></li>
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
				<li id="rart"><a href="${pageContext.request.contextPath }/releasearticle" class="rarta">发表动态</li>
				</c:if>
			</ul>
		</div>
		<div id="top">
			<div id="tleft">
				<ul>
				<li id="zhiding">置顶</li>
				
				  <c:if test="${goodlist!=null }">
				    <c:forEach items="${goodlist }" var="map">
					<li class="artlist">
						<div ><a href="${pageContext.request.contextPath }/MyinfoServlet?userid=${map.userid}"><img src="${pageContext.request.contextPath }/upload/${map.head_url}"></a>
					    </div>
					    <p class="arttitle">
					    	<span>${map.typename }</span>
					    	<a href="${pageContext.request.contextPath }/articleinfo?artid=${map.id}">${map.title }</a>
					    </p>
					    <p class="artinfo">
					    	<a href="${pageContext.request.contextPath }/MyinfoServlet?userid=${map.userid}">${map.nickname }</a>
					    	
					    	<sapn>${map.releasetime }</sapn>
					    	
					    	<span class="kissnum">
					    	<img src="${pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	${map.paykiss }
					    </span>
					    </p>
					    <p class="artjingtie">
					    	<c:if test="${map.isgood==1 }"><span>精帖</span></c:if>
					    </p>
					    <p>
					    	<span class="xiaoxinum">
					    		<img src="${pageContext.request.contextPath }/img/xiaoxi-2.jpg"></img>
					    		${map.remarknum }
					    	</span>
					    </p>
					</li>
					</c:forEach>
					</c:if>
					
				</ul>
			</div>
			<div id="trtop">
				<div class="trtop-title">
					温馨通道
				</div>
				<div class="trtop-table">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr><td>layui案例</td><td>Git仓库</td></tr>
						<tr><td>精帖集锦</td><td>关于飞吻</td></tr>
						<tr><td>Fly社区模板</td><td>赞赏者名册</td></tr>
					</table>
				</div>
			</div>
			<div id="trbttom">
				<ul>
					<li id="qiandaoli"><span class="trbottomq">签到</span><span class="q">说明</span><span class="q">活跃榜</span></li>
					<li id="jinrili"><button id="jiriq">今日签到</button></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="zonghe">
				<ul>
					<li id="zongheli"><span id="zonghes">综合</span><span class="zq zq1">未结</span><span class="zq zq2">已结</span><span class="zq zq3">精华</span></li>
					<c:if test="${commentlist !=null}">
					<c:forEach items="${commentlist }" var="map">
					<li  id="zongb" class="artlist">
						<div ><a href="${pageContext.request.contextPath }/MyinfoServlet?userid=${map.userid}"><img src="${ pageContext.request.contextPath }/upload/${map.head_url}"></a>
					    </div>
					    <p class="arttitle">
					    	<span class="share">${map.typename}</span>
					    	<a href="${pageContext.request.contextPath }/articleinfo?artid=${map.id}">${map.title }</a>
					    </p>
					    <p class="artinfo">
					    	<a href="${pageContext.request.contextPath }/MyinfoServlet?userid=${map.userid}">${map.nickname }</a>
					    	<sapn>${map.releasetime}</sapn>
					    	<span class="kissnum">
					    	<img src="${ pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	${map.paykiss}
					    </span>
					    </p>
					    <p>
					    	<span class="xiaoxinum">
					    		<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg"></img>
					    		${map.remarknum }
					    	</span>
					    </p>
					</li>
					</c:forEach>
					</c:if>
					
				</ul>
				<div class="more-solve">
					<a class="more-solve-a" href="${ pageContext.request.contextPath }/jsp/pagepart.jsp">更多求解</a>
				</div>
			</div>
			<div id="week">
			<span id="weeksp">回帖周榜</span>
			<p id="line"></p>
			<ul>
			<c:forEach items="${userlist }" var="user">
				<li><a href="${pageContext.request.contextPath }/MyinfoServlet?userid=${user.userid}">
					<img src="${pageContext.request.contextPath}/upload/${user.head_url}"/>
					<p class="bg"></p>
					<p id="wtext">${user.nickname }</p>
					<p id="wtext2">${user.replynum}次回答</p>
				</a></li>
				</c:forEach>
				
			</ul>
		</div>
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

	</body>
</html>
