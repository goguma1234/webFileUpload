<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"  %>
<!-- fileList.jsp -->

<div align="center">
<hgroup>
	<h1>:::File List:::</h1>
	<h2>업로드된 서버 디렉토리의 파일목록을 출력해보자.</h2>
</hgroup>

<table style="width:90%" class="cssfrm">
	<tr>
		<th width="10%">FILE/DIR</th>
		<th width="30%">파일명</th>
		<th width="20%">파일크기</th>
		<th width="20%">올린날짜</th>
		<th width="20%">다운로드</th>
	</tr>
	<!-- -------------------------- -->
	<%
	//업로드 디렉토리의 절대 경로 얻어오기
	String upDir=application.getRealPath("/fileup/Upload");
	File dir=new File(upDir);
	if(dir==null||!dir.exists()){
	out.println("<tr><td colspan='5'>"+upDir+"이 없어요</td></tr></table>");
		return;
	}
	File[] flist=dir.listFiles();
	if(flist==null){
		%>
	<tr><td colspan="5">파일 목록 없음</td></tr>	
		<%
	}else{
		for(File f:flist){
	java.util.Date date=new java.util.Date(f.lastModified());
java.text.SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	%>
	<tr>
		<td>
		<%if(f.isFile()){ %>
			<img src="../images/file.PNG">
		<%}else{ %>
			<img src="../images/dir.PNG">
		<%} %>
		</td>
		<td>
			<a href="./Upload/<%=f.getName()%>"><%=f.getName()%></a>
		</td>
		<td><%=f.length()%> bytes</td>
		<td><%=sd.format(date) %></td>
		<td><a><button onclick="fileDown('<%=f.getName()%>')">다운로드</button></a></td>
	</tr>
	<% 
		}//for----------
	}//else---------------------
	%>	
	<!-- -------------------------- -->
</table>
</div>
<script type="text/javascript">
	function fileDown(fname){
		//alert(fname);
	location.href="<%=request.getContextPath()%>/FileDown?fname="+fname;
	//FileDown은 서블릿으로 작성할 예정
	}
</script>




