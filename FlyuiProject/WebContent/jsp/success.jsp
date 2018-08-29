<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>success</h1>
  <%
    Object name =  session.getAttribute("name");
    if(name!=null){
    	out.println("欢迎您："+name);
    }
    else{
    	out.println("未登录");
    }
  %>
      欢迎您：${ requestscrop.name }
      
      <c:if test="${age>18 }">
                       成年人
      </c:if>
      <c:if test="${age<=18 }">
                       未成年人
      </c:if>
     请求的name: ${ param.name }
      欢迎ID ${ param.id }
  <hr>
  <%
    List<String> list=(List<String>)request.getAttribute("info");
   if(list!=null && list.size()!=0){
	  for(String i : list){
		  out.println(i);
	  }
   }
  %>
  <hr>
  <c:forEach items="${ info }" var="s">
  ${ s }
  </c:forEach>
  <hr>
  <c:forEach items="${ per }" var="person">
    ${ person.name },${ person.age }<br>
  </c:forEach>
  <hr>
      遍历List中的map
    <c:forEach items="${ listmap }" var="map">
       直接从key获取value：<br>
       ${ map.java1 }
    遍历每一个map，然后取key和map
      <c:forEach items="${ map }" var="entry">
         ${ entry.key },${ entry.value }
      </c:forEach>
    </c:forEach>
</body>
</html>