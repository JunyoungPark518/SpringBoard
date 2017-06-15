function boardView(){
    return '<div style="padding: 50px"></div>'
    +'<div style="width:100%">'
    +'<div style="margin: 0 auto; text-align:center; width: 700px">'
    +'	<table id="board_list" class="table table-hover">'
    +'		<tr>'
    +'			<td colspan="5">총 게시글 수 : <b id="count"></b>건</td>'
    +'		</tr>'
    +'		<tr>'
    +'			<td>Seq</td>'
    +'			<td>사용자 ID</td>'
    +'			<td>제목</td>'
    +'			<td>작성일</td>'
    +'			<td>카운트</td>'
    +'		</tr>'		
    +'	</table>'
    +'	<nav aria-label="Page navigation">'
    +'	  <ul id="pagination" class="pagination">'
    +'	  </ul>'
    +'	</nav>'
    +'</div>'
    +'</div>';
}

function boardListContent(i){
    return '<tr>'
    +'			<td id="seq'+i+'" class="seq">1</td>'
    +'			<td id="userid'+i+'" class="userid">babungv</td>'
    +'			<td><a id="title'+i+'" class="title" href="javascript:void(0)">title1</a></td>'
    +'			<td id="date'+i+'" class="regdate">2017-06-05</td>'
    +'			<td id="count'+i+'" class="readcount">0</td>'
    +'		</tr>';
}
function prevBlock(){
    return '<li id="previous">'
    +'	      <a href="#" aria-label="Previous">'
    +'	        <span aria-hidden="true">&laquo;</span>'
    +'	      </a>'
    +'	    </li>';
}
function nextBlock(){
    return '<li id="next">'
    +'	      <a href="#" aria-label="Next">'
    +'	        <span aria-hidden="true">&raquo;</span>'
    +'	      </a>'
    +'	    </li>';
}