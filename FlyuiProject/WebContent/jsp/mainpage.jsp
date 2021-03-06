<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/mainpage.css"/>
	</head>
	<body style="height: 2000px;">
		<div id="title">
			<ul>
				<li id="logimg"><a href=""><img id="logimg" src="${ pageContext.request.contextPath }/img/logo.png"/></a></li>
				<li class="lmar"><a href=""><img  src="${ pageContext.request.contextPath }/img/jiaoliu.PNG"/>&nbsp;&nbsp;交流</a></li>
				<li class="lmar"><a href=""><img  src="${ pageContext.request.contextPath }/img/zhuanqu.PNG"/>&nbsp;&nbsp;专区</a></li>
				<li class="kuang"><a href=""><img  src="${ pageContext.request.contextPath }/img/ui.jpg"/>&nbsp;&nbsp;框架</a></li>
				<li><a href=""><img  src="${ pageContext.request.contextPath }/img/tou.PNG"/></a></li>
				<li class="option op"><a href="${ pageContext.request.contextPath }/jsp/loginpage.jsp">&nbsp;&nbsp;登入</a></li>
				<li class="option op"><a href="${ pageContext.request.contextPath }/jsp/regpage.jsp">&nbsp;&nbsp;注册</a></li>
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
				<li id="rart"><a  id="rarta">发表动态</li>
			</ul>
		</div>
		
		<div id="top">
			<div id="tleft">
				<ul>
					<li id="zhiding">置顶</li>
					<li class="artlist">
						<div ><a href=""><img src="${ pageContext.request.contextPath }/img/head_url.jpg"></a>
					    </div>
					    <p class="arttitle">
					    	<span>分享</span>
					    	<a href="">layui树形表格treeTable</a>
					    </p>
					    <p class="artinfo">
					    	<a href="">纸飞机</a>
					    	<sapn>15小时前</sapn>
					    	<span class="kissnum">
					    	<img src="${ pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	20
					    </span>
					    </p>
					    <p class="artjingtie">
					    	<span>精帖</span>
					    </p>
					    <p>
					    	<span class="xiaoxinum">
					    		<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg"></img>
					    		17
					    	</span>
					    </p>
					</li>
					<li class="artlist">
						<div ><a href=""><img src="${ pageContext.request.contextPath }/img/head_url.jpg"></a>
					    </div>
					    <p class="arttitle">
					    	<span>分享</span>
					    	<a href="">layui树形表格treeTable</a>
					    </p>
					    <p class="artinfo">
					    	<a href="">纸飞机</a>
					    	<sapn>15小时前</sapn>
					    	<span class="kissnum">
					    	<img src="${ pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	20
					    </span>
					    </p>
					</li>
					<li class="artlist">
						<div ><a href=""><img src="${ pageContext.request.contextPath }/img/head_url.jpg"></a>
					    </div>
					    <p class="arttitle">
					    	<span>分享</span>
					    	<a href="">layui树形表格treeTable</a>
					    </p>
					    <p class="artinfo">
					    	<a href="">纸飞机</a>
					    	<sapn>15小时前</sapn>
					    	<span class="kissnum">
					    	<img src="${ pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	20
					    </span>
					    </p>
					</li>
					<li class="artlist"><div ><a href=""><img src="${ pageContext.request.contextPath }/img/head_url.jpg"></a>
					    </div>
					    <p class="arttitle">
					    	<span>分享</span>
					    	<a href="">layui树形表格treeTable</a>
					    </p>
					    <p class="artinfo">
					    	<a href="">纸飞机</a>
					    	<sapn>15小时前</sapn>
					    	<span class="kissnum">
					    	<img src="${ pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	20
					    </span>
					    </p></li>
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
					<li id="jinrili"><span id="jiriq">今日签到</span></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="zonghe">
				<ul>
					<li id="zongheli"><span id="zonghes">综合</span><span class="zq zq1">未结</span><span class="zq zq2">已结</span><span class="zq zq3">精华</span></li>
					<c:forEach items="${index_list }" var="map">
					<li  id="zongb" class="artlist">
						<div ><a href=""><img src="${ pageContext.request.contextPath }/upload/${map.head_url}"></a>
					    </div>
					    <p class="arttitle">
					    	<span class="share">分享</span>
					    	<a href="${ pageContext.request.contextPath }/reply?id=${map.id}">${map.title }</a>
					    </p>
					    <p class="artinfo">
					    	<a href="">${map.nicname }</a>
					    	<sapn>${map.releasetime}</sapn>
					    	<span class="kissnum">
					    	<img src="${ pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	20
					    </span>
					    </p>
					    <p>
					    	<span class="xiaoxinum">
					    		<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg"></img>
					    		${map.remark }
					    	</span>
					    </p>
					</li>
					</c:forEach>
					
					
				</ul>
			</div>
			<div id="week">
			<span id="weeksp">回帖周榜</span>
			<p id="line"></p>
			<ul>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				<li><a>
					<img src="${ pageContext.request.contextPath }/img/hui.jpg"/>
					<p class="bg"></p>
					<p id="wtext">岁月小偷</p>
					<p id="wtext2">181次回答</p>
				</a></li>
				
			</ul>
		</div>
		<div class="thisweek">
			<div class="thisweek-this">本周热议</div>
			<div>
				<ul>
					<li class="thisweek-li">
						<a>layui树形表格TreeTale</a>
						<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg" alt="" />81
					</li>
					<li class="thisweek-li">
						<a>数据表格加载远程数据错误：n.rende</a>
						<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg" alt="" />81
					</li>
					<li class="thisweek-li">
						<a>闲心没有女朋友？</a>
						<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg" alt="" />81
					</li>
					<li class="thisweek-li">
						<a>layui树形表格TreeTale</a>
						<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg" alt="" />81
					</li>
					<li class="thisweek-li">
						<a>layui树形表格TreeTale</a>
						<img src="${ pageContext.request.contextPath }/img/xiaoxi-2.jpg" alt="" />81
					</li>
				</ul>
			</div>
		</div>
		</div>
	</body>
</html>
