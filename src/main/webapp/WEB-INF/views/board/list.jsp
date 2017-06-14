<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<body>
<div style="padding: 50px"></div>
<div style="width:100%">
<div style="margin: 0 auto; text-align:center; width: 700px">
	<table id="board_list" class="table table-hover"> 
		<%-- <tr>
			<td colspan="5">총 게시글 수 : ${requestScope.count}건</td>
		</tr> --%>
		<tr>
			<td>Seq</td>
			<td>사용자 ID</td>
			<td>제목</td>
			<td>작성일</td>
			<td>카운트</td>
		</tr>
		
	</table>
</div>
</div>
</body>
</html>