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
	$('#board').on('click',function(){
	    board(1);
	});
    };
    
    var board = function(pageNo){
	alert('ajax');
        $.ajax({
        url : $.context() + '/board/pagination',
        method : 'POST',
        data : JSON.stringify({
            pageNo : pageNo
        }),
        dataType : 'json',
        contentType : 'application/json',
        success : function(data){
            alert('ajax Enter');
        },
        error : function(x,s,m){
            alert(m);
        }
        });
        $('#board_list').append(boardListContent());
    };
    
    return {
        onCreate: onCreate
    }
})();