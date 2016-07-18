<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<!-- 이미지 확대 처리 위해 jquery.magnifier.js를 다운로드 받는다.
http://dynamicdrive.com/dynamicindex4/imagemagnify.htm
 -->
<script type="text/javascript" src="../js/jquery.magnifier.js">
</script>

</head>
<body>
<!-- 클래스:maginify 필수
	 data-magnifyby : 확대 배수. 디폴트는 3.
	 data-magnifyto : 확대 최대 크기를 픽셀 단위로 지정할 때 
	 data-magnifyduration: 확대 지속 시간 밀리세컨 단위. 디폴트:500
	  -->
<img src="../images/shirts1.jpg"  class="magnify" data-magnifyby="1.5"  data-magnifyduration="1000"/>

 <img src="../images/shirts2.jpg"  data-magnifyto="900" class="magnify" border="0" />
</body>
</html>