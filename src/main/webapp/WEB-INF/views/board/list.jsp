<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<body>
<div style="padding: 50px"></div>
<div style="width:100%">
<div style="margin: 0 auto; text-align:center; width: 700px">
	<table id="board_list" class="table table-hover"> 
		<tr>
			<td colspan="5">총 게시글 수 : <b id="count"></b>건</td>
		</tr>
		<tr>
			<td>Seq</td>
			<td>사용자 ID</td>
			<td>제목</td>
			<td>작성일</td>
			<td>카운트</td>
		</tr>
		
	</table>
	<nav aria-label="Page navigation">
	  <ul id="pagination" class="pagination">
	    <!-- <li id="previous">
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li> -->
	    <!-- <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li id="next">
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li> -->
	  </ul>
	</nav>
</div>
</div>
</body>
<script>
var board = function(pageNo){
    $.ajax({
	    url : '${context}/board/pagination/' + pageNo,
	    method : 'POST',
	    data : JSON.stringify({
	        pageNo : pageNo
	    }),
	    dataType : 'json',
	    contentType : 'application/json',
	    success : function(data){
	        console.log(data.list);
	        $('#count').text(data.theNumberOfRows);
	        $.each(data.list, function(i,o){
			    $('#board_list').append(boardListContent(i));
	            $('#seq'+i).text(o.seq);
	            $('#userid'+i).text(o.id);
	            $('#title'+i).text(o.title);
	            $('#date'+i).text(o.regdate);
	            $('#count'+i).text(o.readCount);
	        });
	        if(data.prevBlock>0){
	            $('#pagination').append(prevBlock());
	        }
	        for(var i=data.startPage; i<=data.endPage; i++){
	            if(i==data.pageNumber){
	        		$('#pagination').append('<li><a href="#">'+i+'</a></li>');
	            } else {
	        		$('#pagination').append('<li><a href="'+board(i)+'">'+i+'</a></li>');
	            }
	        }
	        if(data.nextBlock<=data.theNumberOfPages){
	            $('#pagination').append(nextBlock());
	        }
	    },
	    error : function(x,s,m){
	        alert(m);
	    }
    });
};

</script>
</html>