<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="wrapper">
<div style="padding: 50px"></div>
<div style="width:100%">
	<div style="margin: 0 auto; width: 339px">
		<ul class="list-group">
  			<li class="list-group-item list-group-item-success"><input type="text" placeholder="제목"/></li>
  			<li class="list-group-item list-group-item-success"><textarea name="" id="content" cols="40" rows="10" placeholder="내용"></textarea></li>
  			<li class="list-group-item list-group-item-success">
	  			<a id="cancel" href="${context}/board/list"><input type="button" value="취소"/></a>
	  			<a id="write" href="javascript:void(0)"><input type="button" value="글쓰기"/></a>
  			</li>
		</ul>
	</div>
</div>
</div>
