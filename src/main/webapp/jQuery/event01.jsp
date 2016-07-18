<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery의 이벤트 처리</title>
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	//아이디 b1인 버튼 클릭시
	$(function(){
		$('#b1').click(function(){
			//이번튼의 val()
			//alert($(this).text());
			// text(), val(), html() : 매개변수가 있으면 setter가 됨
			 //text(), val(), html() : 매개변수가 없으면 getter가 됨
			$('#test').html("<b>"+$(this).text()+"를 눌렀군!</b>"); 
			 
		});
		
		//모든 버튼 클릭시 '~를 눌렀군요'가 나오게 하려면
		$('button').each(function(){
			$(this).click(function(){
				var txt=$(this).text();
				$('#test').html("<font color='red'><b>"+txt+" 눌렀군요~</b></font>");	
			});
		});
		
	});

</script>
</head>
<body>
<button id="b1">로그인</button>
<button id="b2">회원가입</button>
<button id="b3">게시판</button>
<button id="b4">마이페이지</button>
<div id="test"></div>

</body>
</html>