<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ex01.jsp</title>
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
//jquery함수 : 이 함수는 DOM(Document Object Model)이 준비되면
//				실행하는 함수
/*			  $는 jQuery의 별칭으로 사용되는 기호
 * 			  $() 의 매개변수로 기술한 함수는 dom이 모든 브라우저에
 				로드될 때까지 실행을 지연시킨다.
------------------------------------------------------
 jQuery의 특징
 - 웹에서 자주 사용되는 자바스크립트 기능의 간편화
 - 자주 사용되지 않는 것들은 플러그인으로 제공됨
 - 크로스 브라우저 지원
 - Ajax를 쉽게 구현할 수 있다.
 
 http://jquery.com
 http://jqueryui.com [확장된 기능들 제공]
 */
//1. 방식
$(document).ready(function(){
	//alert('Hello JQuery');
});
//2. 방식
//아이디가 a인 객체 얻기
$(function(){
	var objB=document.getElementById('b');
	objB.innerHTML="<font color='red' size='5'>Bye JQuery!</font>";
	
	$('#a').html("<font color='red' size='5'>Bye JQuery!</font>");
	//$('#a').text("<font color='red' size='5'>Bye JQuery!</font>");
});

window.onload=function(){
	var obj=document.getElementById('a');
	obj.innerHTML+="<h2>Hi JQuery~~</h2>";
}
</script>

</head>
<body>
<h1>JQuery Test</h1>
<div id="a"></div>
<div id="b"></div>
<script type="text/javascript">
var obj=document.getElementById('a');
obj.innerHTML="<h2>Hello JQuery~~</h2>";
</script>


</body>
</html>


