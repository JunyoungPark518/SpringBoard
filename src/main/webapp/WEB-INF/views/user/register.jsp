<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title">Register Form</h3>
			 			</div>
			 			<div class="panel-body">
			    		<form id="registerForm" role="form">
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                			<input type="text" name="userId" id="userId" class="form-control input-sm" placeholder="ID">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="text" name="age" id="age" class="form-control input-sm" placeholder="Age">
			    					</div>
			    				</div>
			    			</div>

			    			<div class="form-group">
			    				<input type="text" name="phone" id="phone" class="form-control input-sm" placeholder="Phone Number">
			    			</div>

			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="pass" id="pass" class="form-control input-sm" placeholder="Password">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password">
			    					</div>
			    				</div>
			    			</div>
			    			<input type="submit" value="Register" class="btn btn-info btn-block">
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
</div>
<script>
$(function(){
	var form = $('#registerForm');
	$('form input[type=submit]').click(function() {
		var userId = $('input[name=userId]').val();
		var age = $('input[name=age]').val();
		var phone = $('input[name=phone]').val();
		var pass = $('input[name=pass]').val();
		if(userId=='' || pass=='' || age=='' || phone=='') {
			alert('필수 항목이 빠져 있습니다.');
		} else {
			form.attr('method','post');
			form.attr('action','register/finished');
			form.submit();
		}
	});
});
</script>
