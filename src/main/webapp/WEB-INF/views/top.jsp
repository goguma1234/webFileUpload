<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//컨텍스트명 알아내기
	String myctx=request.getContextPath();// "/SpringWeb"
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
<title>::홈페이지::</title>
<!--  media="screen and (min-width: 512px) and (max-width: 1024px)" -->
<link rel="stylesheet" type="text/css" href="<%=myctx%>/css/layout.css" >
<link rel="stylesheet" type="text/css" href="<%=myctx%>/css/calendar.css">
<script type="text/javascript" src="<%=myctx%>/js/calendar.js"></script>
</head>
<body onload="showToday()">
<div id="wrap">
	<!-- 헤더-------------------------- -->
	<header>
		<!--문서의 로고, 검색폼, 목차 등이 모여있는 곳  -->
		<img src="<%=myctx%>/images/logo.png">
	</header>
	<div class="clear"></div>
	<!-- 네비게이션 바 ---------------- -->
	<nav>
		<ul>
			<li><a href="<%=myctx%>/index.do">HOME</a></li>
			<li><a href="<%=myctx%>/">회원가입</a></li>
			<li><a href="<%=myctx%>/">회원목록</a></li>
			<li><a href="<%=myctx%>/user/cartList.do">장바구니</a></li>
			<li><a href="<%=myctx%>/user/shopMypage.do">MyPage</a></li>
			<!-- [관리자 모드] -->
			<li><a href="<%=myctx%>/admin/pdInput.do">상품등록</a></li>
			<li><a href="<%=myctx%>/admin/orderAdmin.do">월별주문목록</a></li>
			<li><a href="<%=myctx%>/admin/stat.do">매출통계</a></li>
		</ul>
	</nav>
	
	<!--article: 주 콘텐츠가 들어간다. ---------- -->
	<article>
	