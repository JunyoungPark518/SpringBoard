<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="wrapper">
<div style="padding: 50px"></div>
<div style="width:100%">
	<div style="margin: 0 auto; width: 339px">
	<form id="writeForm">
		<ul class="list-group">
  			<li class="list-group-item list-group-item-success"><input id="title" name="title" type="text" placeholder="제목"/></li>
  			<li class="list-group-item list-group-item-success"><textarea name="content" id="content" cols="40" rows="10" placeholder="내용"></textarea></li>
  			<li class="list-group-item list-group-item-success">
	  			<input id="cancel" type="button" value="취소"/>
	  			<input type="submit" value="글쓰기"/>
  			</li>
		</ul>
	</form>
	</div>
</div>
</div>
<script>
$(function(){
   var form = $('#writeForm');
   $('form input[type=submit]').on('click',function(){
       var title = $('#title').val();
       var content = $('#content').val();
       if(title=='' || content==''){
	   	alert('필수 항목이 빠져 있습니다.');
       } else {
	   	form.attr('method','post');
	   	form.attr('action','write/finished');
	   	alert('글쓰기 완료!');
	   	form.submit();
       }
   });
   
   $('#cancel').on('click',function(){
       // method = post 추가
      var cancel = $(this);
       cancel.attr('method','post');
       cancel.attr('action','/web/login/1');
      location.href = '/web/login/1';
   });
});
</script>