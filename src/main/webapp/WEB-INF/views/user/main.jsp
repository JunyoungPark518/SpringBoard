<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="wrapper">
	<div class="container" style="margin-top: 50px">
          <div class="card card-container" style="width: 192px">
              <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
              <p id="profile-name" class="profile-name-card"></p>
                  <span id="reauth-email" class="reauth-email"></span>
                  <span>${sessionScope.permission.id}님 환영합니다!</span>
             	<form action="${context}/list/1" id="board">
				<a href="${context}/list/1">
					<input class="btn btn-lg btn-primary btn-block btn-signin" type="submit" value="Go Board" style="margin-top: 30px;"/>
				</a>
              </form>
          </div>
      </div>
</div>
