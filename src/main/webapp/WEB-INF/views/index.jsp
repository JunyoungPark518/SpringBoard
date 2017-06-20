<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container" style="margin-top: 50px">
          <div class="card card-container" style="width: 192px">
              <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
              <p id="profile-name" class="profile-name-card"></p>
              <form id="loginForm" class="form-signin">
                  <span id="reauth-email" class="reauth-email"></span>
                  <input type="text" name="userId" class="form-control" placeholder="ID" required autofocus>
                  <input type="password" name="pass" class="form-control" placeholder="Password" required>
                  <div id="remember" class="checkbox">
                      <label>
                          <input type="checkbox" value="remember-me"> Remember me
                      </label>
                  </div>
                  <input id="login" class="btn btn-lg btn-primary btn-block btn-signin" type="submit" value="Sign in">
                  <a href="${context}/register"><input id="register" class="btn btn-lg btn-primary btn-block btn-signin" type="button" value="Register" style="margin-top: 20px"/></a>
              </form>
              <a href="#" class="forgot-password">
                  Forgot the password?
              </a>
              <form action="${context}/list/1" id="board">
				<input class="btn btn-lg btn-primary btn-block btn-signin" type="submit" value="Go Board" style="margin-top: 30px;"/>
				<input type="hidden" name="pageNo" value="1" />              
              </form>
          </div>
      </div>
</div>
<script>
$(function(){
    var board = $('#board');
	$('#board input[type=submit]').click(function() {
		board.attr('method','post');
		board.submit();
	});
	
	var loginForm = $('#loginForm');
	$('#loginForm input[type=submit]').click(function() {
		loginForm.attr('method','post');
		loginForm.attr('action','login');
		var userId = $('input[name=userId]').val();
		var pass = $('input[name=pass]').val();
		if(userId=='' || pass=='') {
			alert('아이디 및 비밀번호를 입력해주세요.');
		} else {
			alert('로그인하기 위해 입력한 ID 값: '+userId + '\n비밀번호:' + pass);
			loginForm.submit();
		}
	});
});
</script>