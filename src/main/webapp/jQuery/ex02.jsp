<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선택자</title>
<!-- CDN : Contents Delivery Network 
(서버에 라이브러리를 올려놓고 참조하도록 하는 방식) 
경로
- JQuery에서 제공하는 라이브러리 경로
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
- MS에서 제공하는 라이브러리 경로
http://ajax.aspnetcdn.com/ajax/jQuery/jquery_1.2.1.min.js
- 구글에서 제공하는 라이브러리 경로
http://ajax.googleapis.com/ajax/libs/jquery/1.2.1/jquery.min.js
 -->
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$('*').css('color','navy');
		$('h1').css('color','green');
		$('h2, h3').css('color','red');
		$('#item1').css('background-color','gold');//아이디 선택자: #아이디
		$('.target1').css('background-color','skyblue');
		//클래스 선택자 : .클래스명
		//target2클래스를 선택해서 글자색(blue) 변경하고,  밑줄이 가도록
		$('.target2').css('color','blue')
					 .css('text-decoration','underline');
	});
</script> 
 
</head>
<body>
<h1>jQuery 기본 선택자, 태그 선택자, 아이디 선택자, 클래스 선택자</h1>
<h1>안녕하세요. jQuery1</h1>
<h2>안녕하세요. jQuery2</h2>
<h3>안녕하세요. jQuery3</h3>
<p id="item1">안녕하세요 jQuery ID: item1</p>
<p class="target1">안녕하세요 jQuery4 Class: target1</p>
<p class="target2">안녕하세요 jQuery4 Class: target2</p>
</body>
</html>