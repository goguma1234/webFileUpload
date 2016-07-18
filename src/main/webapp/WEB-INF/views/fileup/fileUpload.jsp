<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div align="center">
<hgroup>
	<h1>파일 업로드 테스트1</h1>
</hgroup>
<%-- 
	파일 업로드시 주의 사항
	[1] form의 method속성은 반드시 POST로 준다.
	[2] POST 방식일 경우 인코딩 방식이 2가지가 있는데
		이 중 multipart/form-data를 주어야 한다.
	
		#enctype
		<1> application/x-www-form-urlencoded : 디폴트.
						이 경우 파일 이름만 전송됨
		<2> multipart/form-data : 이 경우 파일 이름은 물론,
						파일 데이터가 함께 전송된다.
	[3] 첨부된 파일 내용을 뽑아내기 위해 업로드 컴포넌트를
		사용하자.=> 우리는 cos.jar의 MultipartRequest를 
					사용할 예정												
	
--%>
<script type="text/javascript">
	function Upload(){
		if(!f.writer.value){
			alert('올린이를 입력하세요');
			f.writer.focus();
			return;
		}
		f.submit();
	}
</script>

<form  name="f" id="f" action="/webApp/fileUp"
 method="POST"  enctype="multipart/form-data" >
<table width="90%" border="1" class="cssfrm">
<tr>
	<th colspan="2">:::File Upload1:::</th>
</tr>
<tr>
	<td width="20%"><b>올린이</b></td>
	<td width="80%">
		<input type="text" name="writer" class="box">
	</td>
</tr>
<tr>
	<td width="20%"><b>파일선택1</b></td>
	<td width="80%">
		<input type="file" name="fileone" class="box">
	</td>
</tr>
<tr>
	<td width="20%"><b>파일선택2</b></td>
	<td width="80%">
		<input type="file" name="filetwo" class="box">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" value="파일올리기" onclick="Upload()">
	</td>
</tr>
</table>
</form>
</div>


