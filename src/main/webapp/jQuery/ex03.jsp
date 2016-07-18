<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery 속성 선택자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	//li 태그 아래 a  태그 중 href 속성값이 #page2인 객체를 선택해서
	//글자색 변경
	$('li a[href="#page2"]').css('color','#abc')
							.css('text-decoration','none');
	//요소[속성=값] : 특정 속성 값이 특정값과 같은 객체 선택
	//요소[속성^=값] : 속성안의 값이 특정 값으로 시작하는 객체를 선택
	//요소[속성~=값] : 속성 안의 값이 특정 값을 단어로 포함하는 객체를 선택
	//요소[속성$=값] : 속성 안의 값이 특정 값으로 끝나는 객체를 선택
	//요소[속성*=값] : 속성 안의 값이 특정 값을 포함하는 객체를 선택
	
	//[1] href속성값이 http로 시작하는 a 요소  객체의 글자색을 red로 변경하세요.
	$('li a[href^=http]').css('color','red');
	
	//[2] href속성값에 com으로 끝나는 객체를 선택해서 배경색을 노랑색으로
	$('li a[href$=com]').css('background-color','yellow');
	
	//[3] img태그 속성 중 src와 alt를 갖는 객체에 대해
	//	  border 1px dotted blue
	$('img[src][alt]').css('border','2px dotted blue');
	
	//[4] yes라는 단어가 포함된 객체 선택 밑줄 없도록
	$('li a[title~=yes24]').css('text-decoration','none');
	
	//[5]input name속성값에 p라는 글자가 포함된 객체를 선택해서
	//  val('연락처 입력')함수를 이용해서 '전화번호 입력'이 텍스트박스에 출력되도록
	$('input[name*=p]').val('전화번호 입력');
	
	//p로 시작하는 객체를 클릭했을 때 value값 비워주기 
	$('input[name*=p]').click(function(){
		$(this).val('');
	});
});
</script>

</head>
<body>
<ul>
	<li><a href="http://www.google.com" id="g" title="구글">구글</a></li>
	<li><a href="http://www.daum.net" class="daum" title="다음">다음</a></li>
	<li><a href="http://www.yes24.com" title="yes24">Yes24</a></li>
	<li><a href="#page2"  title="page2">페이지 2로 이동</a></li>
</ul>
<div id="gallery">
	<img src="../images/shirts1.jpg" alt="사진1">
	<img src="../images/shirts2.jpg">
</div>
<form>
연락처 : <input type="text" name="phone1">-
		<input type="text" name="phone2">
</form>

</body>
</html>

