var jyp = jyp || {};

/*========= jyp-context =========
@AUTHOR : Junyoung Park
@CREATE DATE : 2017-06-13
@UPDATE DATE : 2017-06-13
@DESC : context
=================================*/
jyp.context = (function() {
    var onCreate = function(context) {
        $.getScript(context + '/resources/js/board.domain.js', function() {
            $.extend(new Session(context));
            setContentView();
        });
    };
    var setContentView = function() {
        jyp.controller.onCreate();
    };
    return {
        onCreate: onCreate
    };
})();

/*========= jyp-cookie =========
@AUTHOR : Junyoung Park
@CREATE DATE : 2017-06-13
@UPDATE DATE : 2017-06-13
@DESC : controller
=================================*/
jyp.cookie = {
    setCookie: function(name, value) {
        document.cookie = name + "=" + encodeURIComponent(value);
    },
    getCookie: function(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
        }
        return null;
    },
    removeCookie: function(name) {
        jyp.cookie.setCookie(name, '', -1);
    }
}

/*========= jyp-controller =========
@AUTHOR : Junyoung Park
@CREATE DATE : 2017-06-13
@UPDATE DATE : 2017-06-13
@DESC : controller
=================================*/
jyp.controller = (function() {
    var service, view, css, cookie;

    var onCreate = function() {
        service = $.javascript() + '/board.service.js';
        view = $.javascript() + '/board.view.js';
        css = $.javascript() + '/board.css.js';
        cookie = $.javascript() + '/util.cookie.js'
        setContentView();
    };

    var setContentView = function() {
        $.when(
            $.getScript(service),
            $.getScript(view),
            $.getScript(css),
            $.getScript(cookie),
            $.Deferred(function(deferred) {
                $(deferred.resolve);
            })
        ).done(function() {
            index();
        });
    };

    var index = function(){
	$('#wrapper').html(indexView());
	$('#board').on('click',function(){
	    boardMain(1);
	});
	$('#login').on('click',function(){
	    var userId = $('#userId').val();
	    var pass = $('#pass').val();
	    $.ajax({
		      url : $.context() + '/user/login',
		      method : 'POST',
		      data : JSON.stringify({
		          userId : userId, pass : pass
		      }),
		      dataType : 'json',
		      contentType : 'application/json',
		      success : function(data){
			  console.log(data.success);
			  console.log(data.user);
			  if(data.success==1){
			      alert('로그인 성공!!');
			      /*jyp.cookie.setCookie("login","Y");
			      jyp.cookie.setCookie("id",data.user.id);
			      console.log(jyp.cookie.getCookie("login"));
			      console.log(jyp.cookie.getCookie("id"));*/
			      boardMain(1);
			  } else {
			      alert('로그인 실패');
			  }
		      },
		      error : function(x,s,m){
		          alert(m);
		      }
		    });
	});
	$('#register').on('click',function(){
	    $('#wrapper').html(registerView());
	    $('#user_register').on('click',function(){
		var userId = $('#userId').val();
		var age = $('#age').val();
		var phone = $('#phone').val();
		var pass = $('#password').val();
		$.ajax({
		    url : $.context() + '/user/register',
		    method : 'POST',
		    data : JSON.stringify({
			userId : userId, pass : pass, age : age, phone : phone
		    }),
		    dataType : 'json',
		    contentType : 'application/json',
		    success : function(data){
			console.log(data.success);
			if(data.success==1){
			    alert('회원가입 성공!!');
			    index();
			} else {
			    alert('회원가입 실패');
			}
		    },
		    error : function(x,s,m){
			alert(m);
		    }
		});
	    });
	});
    };
    
    var boardMain = function(pageNo){
	$('#wrapper').html(boardView());
	    $.ajax({
		    url : $.context() + '/board/pagination/' + pageNo,
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
		            $('#prevBlock').on('click',function(){
		        	boardMain(data.prevBlock);
		            });
		        }
		        for(var i=data.startPage; i<=data.endPage; i++){
		            if(i==data.pageNumber){
		        		$('#pagination').append('<li><a href="javascript:void(0)">'+i+'</a></li>');
		            } else {
		        		$('#pagination').append('<li><a id="page'+i+'" class="goPage" href="javascript:void(0)">'+i+'</a></li>');
		            }
		        }
		        if(data.nextBlock<=data.theNumberOfPages){
		            $('#pagination').append(nextBlock());
		            $('#nextBlock').on('click',function(){
		        	boardMain(data.nextBlock);
		            });
		        }
		        
		        $('.goPage').on('click',function(){
		           boardMain($(this).attr('id').split('page')[1]); 
		        });
		    },
		    error : function(x,s,m){
		        alert(m);
		    }
	    });
	    $('#write').on('click',function(){
		if(jyp.cookie.getCookie("login")=='Y'){
		    write();
		} else {
		    alert('로그인 후 이용가능');
		    index();
		}
	    });
	};
	
	var write = function(){
	    $('#wrapper').html(writeView());
	    $('#cancel').on('click',function(){
		boardMain(1);
	    });
	    $('#write').on('click',function(){
		var id = jyp.cookie.getCookie('id');
		var title = $('#title').val();
		var content = $('#content').val();
		$.ajax({
		      url : $.context() + '/board/write',
		      method : 'POST',
		      data : JSON.stringify({
		          id : id, title : title, content : content
		      }),
		      dataType : 'json',
		      contentType : 'application/json',
		      success : function(data){
			  alert('성공!!');
			  boardMain(1);
		      },
		      error : function(x,s,m){
		          alert(m);
		      }
		    });
	    });
	};
    
    return {
        onCreate: onCreate
    }
})();