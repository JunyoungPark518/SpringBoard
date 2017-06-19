<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container" style="margin-top: 50px">
          <div class="card card-container" style="width: 192px">
              <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
              <p id="profile-name" class="profile-name-card"></p>
              <form class="form-signin">
                  <span id="reauth-email" class="reauth-email"></span>
                  <input type="text" id="userId" class="form-control" placeholder="ID" required autofocus>
                  <input type="password" id="pass" class="form-control" placeholder="Password" required>
                  <div id="remember" class="checkbox">
                      <label>
                          <input type="checkbox" value="remember-me"> Remember me
                      </label>
                  </div>
                  <a href="${context}/login"><button id="login" class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button></a>
                  <a href="${context}/register"><input id="register" class="btn btn-lg btn-primary btn-block btn-signin" type="button" value="Register"/></a>
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
});
</script>