<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>필터 선택자</title>
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
/* filter선택자
 * : 사용 형식은 필터 선택자 앞에 : (클론)을 붙여 표현한다.
 */
 $(test);
 
 function test(){
	 $('li').css('color','blue');
	 //필터로 접근. li의 인덱스 3번째에 배경색을 gold로
	 $('li:eq(3)').css('backgroundColor','gold');
	 
	 $('.navi2 li:eq(3)').css('backgroundColor','skyblue');
	 
	 //li의 인덱스가 5보다 큰 요소만 선택해서 테두리 주기
	 $('li:gt(5)').css('border','1px dashed red');
	 // gt : greater than, lt: less than
	$('li:lt(5)').css('border','1px dashed green');
	 
	 //li의 첫번째 요소만. 배경색을 노랑 :first
	 $('li:first').css('backgroundColor','yellow');
	 //li의 마지막 요소만 적용. 글자색 변경 :last
 	 $('li:last').css('color','maroon');
	 
	 
	 //tr요소 짝수번째에 배경색 주기
	 $('tr:even').css('backgroundColor','pink');
	 
	//tr요소 첫번째에 배경색 주기. font-weight: bold
	 $('tr:first').css('backgroundColor','silver');
	 
	 /*요소:odd : 홀수번째 위치한 객체 선택
	   요소:even: 짝수번째 위치한 객체 선택
	   요소:first : 전체 li 노드들 중에 첫번째
	   요소:first-child: 각각의 소속된 li중에 첫번째
	   
	   요소:last
	   요소:last-child	   
	 */
	 $('li:first-child').css('width','200px').css('height','40px');
	 $('li:last-child').css('width','300px').css('height','40px');
	 
 }

</script>

</head>
<body>
<div id="panel">
	<ul class="navi">
		<li>index 0</li>
		<li>index 1</li>
		<li>index 2</li>
		<li>index 3</li>
	</ul>
	
	<ul class="navi2">
		<li>index 0</li>
		<li>index 1</li>
		<li>index 2</li>
		<li>index 3</li>
		<li>index 4</li>
	</ul>
<table width="400" border="1">
	<tr>
		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td>
	</tr>
	<tr>
		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td>
	</tr>
	<tr>
		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td>
	</tr>
	<tr>
		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td>
	</tr>
	<tr>
		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td>
	</tr>
</table>
</div>


</body>
</html>