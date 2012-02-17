<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>JQuery Test</title>

<%@ include file="/jsp/common/include/head.jspf" %>

<script>
function checkLogin(){
    
    if( $.trim($("#userId").val()) == '' ){
        alert("아이디를 입력해 주세요.");
        $("#userId").focus();
        return;
    }
    if( $.trim($("#userPw").val()) == '' ){
        alert("비밀번호를 입력해 주세요.");
        $("#userPw").focus();
        return;
    }
    // 로그인 프로세스 호출
    $.ajax({
        type: 'post'
        , async: true
        , url: '/member.do?cmd=login'
        , data: $("#frm").serialize() 
        , beforeSend: function() {
             $('#ajax_load_indicator').show().fadeIn('fast'); 
          }
        , success: function(data) {
            var response = data.trim();
            console.log("success forward : "+response);
            // 메세지 할당
            switch(response) {
                case "nomatch": 
                    msg = "아이디 또는 비밀번호가 일치하지 않습니다."; break;
                case "fail": 
                    msg = "로그인에 실패 했습니다."; break;
                default : 
                    msg = "존재하지 않는 사용자입니다."; break;
            }
            // 분기 처리
            if(response=="success"){
                window.location.href = "${targetUrl}";
            } else {
                alert(msg);
            }
          }
        , error: function(data, status, err) {
        	console.log("error forward : "+data);
            alert('서버와의 통신이 실패했습니다.');
          }
        , complete: function() { 
        	$('#ajax_load_indicator').fadeOut();
          }
    });
}
</script>
</head>
<body>
<form id="frm" name="frm" method="post" action="" onSubmit="checkLogin();return false;">
    <fieldset>
        <legend>login</legend>
        <div class="login_item mg_top34"> 
            <label>id</label> 
            <input id="userId" name="memberVo.xcWebMbrId" type="text" class="i_login" />
        </div>

        <div class="login_item mg_top10"> 
            <label>password</label> 
            <input id="userPw" name="memberVo.xcPswd" type="password" class="i_login" />
        </div>
        
        <div id="ajax_load_indicator" style="display:none">
            <p style="text-align:center; padding:16px 0 0 0"><img src="/images/ajax-loader_big.gif" /></p>
        </div>

        <p class="keeping mg_left89">
            <input id="keepidpw" class="rd_box22" value="1" type="checkbox" name="idPswdSave" > 
            <label for="keepidpw">ID/PW 저장</label> 
        </p>

        <p class="keeping mg_left20">
            <input id="keepid" class="rd_box22" value="1" type="checkbox" name="idSave" > 
            <label for="keepid">ID 저장</label> 
        </p>

        <span class="btn_login">
            <input type="image" src="/btn/btn_login.jpg" title="로그인" onclick="checkLogin();return false;">
        </span>

        <p class="btn_register"><a href="/member.do?cmd=memberJoin"><img src="/btn/btn_join.jpg" alt="회원가입" /></a>
        <a href="/member.do?cmd=goIdPwFind" class="mg_left5"><img src="/btn/btn_sch.jpg" alt="아이디/비밀번호 찾기" /></a></p>
    </fieldset>
</form>
</body>
</html>