<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="wrapper">
<div style="padding: 50px"></div>
<div style="width:100%">
	<div style="margin: 0 auto; text-align:center; width: 700px">
		<table id="board_list" class="table table-hover"> 
			<tr>
				<td colspan="5">총 게시글 수 : <b>${theNumberOfRows}</b>건</td>
			</tr>
			<tr>
				<td>Seq</td>
				<td>사용자 ID</td>
				<td>제목</td>
				<td>작성일</td>
				<td>카운트</td>
			</tr>
			<c:forEach var="article" items="${list}" >
				<tr>
					<td><span>${article.seq}</span></td>
					<td><span><a id="link" href="#">${article.title}</a></span></td>
					<td><span>${article.id}</span></td>
					<td><span>${article.regdate}</span></td>
					<td><span>${article.readCount}</span></td>
				</tr>
			</c:forEach>
		</table>
		<form id="page">
		<nav aria-label="Page navigation">
		  <ul id="pagination" class="pagination">
		     <c:if test="${prevBlock gt 0}">
		     <li id="previous">
		      <a href="${context}/list/${prevBlock}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    </c:if>
		    <c:forEach varStatus="i" begin="${startPage}" end="${endPage}" step="1">
		    	<c:choose>
					<c:when test="${i.index eq pageNo}">
						<li><a href="#">${i.index}</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="goPage" href="${context}/list/${i.index}">${i.index}</a></li>
					</c:otherwise>
				</c:choose>
		    </c:forEach>
		    <c:if test="${nextBlock le theNumberOfPages}">
			<li id="next">
		      <a href="${context}/list/${nextBlock}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		   	</li>
			</c:if>
		  </ul>
		</nav>
		
		</form>
		<div style="text-align: right">
			<a id="write" href="${context}/write"><input type="button" value="글쓰기" style="background: white;  margin-bottom: 70px;"/></a>
			<c:if test="${sessionScope.permission ne null}">
				<a id="logout" href="${context}/logout"><input type="button" value="로그아웃" style="background: white;  margin-bottom: 70px; margin-left: 20px"/></a>
			</c:if>
			<c:if test="${sessionScope.permission eq null}">
				<a id="home" href="${context}"><input type="button" value="홈으로" style="background: white;  margin-bottom: 70px; margin-left: 20px"/></a>
			</c:if>
		</div>
	</div>
</div>
</div>
<script>
$(function(){
     $('.goPage').on('click',function(){
		 var goPage = $(this);
		 var index = $(this).attr('href').split('/')[3];
		 alert(index);
		 goPage.attr('method','post');
		 goPage.attr('action','${context}/list/'+index);
		 goPage.submit();
    });
});
</script>
