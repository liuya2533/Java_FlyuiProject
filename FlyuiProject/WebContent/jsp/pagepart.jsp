<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/title.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pagepart.css"/>
	    <link href="${pageContext.request.contextPath }/js/mricode.pagination.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/mricode.pagination.js"></script>
	<script src="${pageContext.request.contextPath }/js/template-web.js"></script>
	<script src="${pageContext.request.contextPath }/js/loginsuccess-myinfo.js"></script>
	<script type="text/javascript">
	   $(function(){
		   $("#page").pagination({
			    pageSize: 10,   //设置一页显示10条记录
			    pageIndex:1,   //默认从0开始显示
			    prevBtnText:'上一页',
			    nextBtnText:'下一页',
			    remote: {
			        url: '${pageContext.request.contextPath }/pagetest',
			        method:'get',
			        success: function (data) {
			            // data为ajax返回数据
			            var html=template("pageinfo",data);
			            $('#zoonghe-page').html(html);
			        },
			        totalName:'total',
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
				<a id="item" class="title-li-a"><span>${userinfo.nickname}</span><img  class="title-img" src="${pageContext.request.contextPath }/img/hui.jpg"/>
				    <ul class="title-item">
					<li><a href="">用户中心</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/jsp/setpage.jsp"">基本设置</a></li>
					<li><a href="">我的消息</a></li>
					<li class="title-item-li"><a href="${pageContext.request.contextPath }/MyinfoServlet" >我的主页</a></li>
					<li><a href="${pageContext.request.contextPath }/loginout">退出</a> </li>
		            </ul>
				</a>
				</li>
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
					
				<li class="nav-line">|</li>
				<li class="nav-my"><a>我发表的贴</a></li>
				<li class="nav-my"><a>我收藏的贴</a></li>
				<li id="rart" ><a  class="rarta" href="${pageContext.request.contextPath }/releasearticle">发表动态</a></li>
			</ul>
		</div>
		<script type="text/html" id="pageinfo">
         <li id="zongheli"><span id="zonghes">综合</span><span class="zq zq1">未结</span><span class="zq zq2">已结</span><span class="zq zq3">精华</span></li>
		{{each list as value i}}
          <li  id="zongb" class="artlist">
						<div ><a href=""><img src="${pageContext.request.contextPath }/upload/{{value.head_url}}"></a>
					    </div>
					    <p class="arttitle">
					    	<span class="share">{{value.typename}}</span>
					    	<a href="">{{value.title}}</a>
					    </p>
					    <p class="artinfo">
					    	<a href="">{{value.nickname}}</a>
					    	<sapn>{{value.releasetime}}</sapn>
					    	<span class="kissnum">
					    	<img src="${pageContext.request.contextPath }/img/kiss.jpg"></img>
					    	{{value.paykiss}}
					    </span>
					    </p>
					    
					    <p>
					    	<span class="xiaoxinum">
					    		<img src="${pageContext.request.contextPath }/img/xiaoxi-2.jpg"></img>
					    		{{value.remarknum}}
					    	</span>
					    </p>
					</li>
		 {{/each}}
		</script>
		
		<div id="content">
			<div id="zonghe">
				<ul id="zoonghe-page">
					
				</ul>
				<div class="more-solve">
					<div id="page" class="m-pagination"></div>
				</div>
			</div>
		</div>
	</body>
</html>
