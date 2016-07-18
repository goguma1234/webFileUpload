<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!--  -->

<div align="center">
<hgroup>
	<h1>파일 업로드 결과</h1>
	<h2>c:/mysrce/Upload 폴더에서 확인하세요</h2>
</hgroup>
<ul>
<li>첨부파일1:<a href="/webApp/FileDown?filename=${filename0}">${filename0}, 파일크기1: ${fsize0}</a></li>
<li>첨부파일2:<a href="/webApp/FileDown?filename=${filename1}">${filename1}, 파일크기1: ${fsize1}</a></li>
</ul>
</div>
