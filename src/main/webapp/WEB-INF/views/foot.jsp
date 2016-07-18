<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String myctx=request.getContextPath();// /MyWeb 컨텍스트명 얻기
%>
</article>
	<!--aside: 사이드 메뉴 -------- -->
	<aside>
	<!-- 로그인 페이지 포함------------ -->

	<!-- ------------------------------ -->
	<!-- 카테고리 목록 리스트 포함 -->
	<c:import url="/shop/categoryList.do"/>
	<!-- ------------------------------ -->
	<!-- <div id="cal"  style="margin-left:5px;padding:0;clear:both;"></div> -->
		<nav>
			<ul>
		<li><a href="<%=myctx%>/fileForm.do"><span class="a">파일업로드1</span></a></li>
		<li><a href="<%=myctx%>/fileForm2.do"><span class="a">파일업로드2</span></a></li>
		<li><a href="<%=myctx%>/board.list.do"><span class="a">MVC게시판</span></a></li>
		<li><a href="<%=myctx%>/user/myPage.do">회원인증페이지</a></li>
		<li><a href="<%=myctx%>/book.do"></a></li>
			</ul>
			
		</nav>
	</aside>
	<div class="clear"></div>
	<!-- footer--------------------------------- -->
	<footer>
		Copyright
	</footer>
</div>
</body>
</html>    