<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<!--
Template Name: Bistup
Author: <a href="https://www.os-templates.com/">OS Templates</a>
Author URI: https://www.os-templates.com/
Copyright: OS-Templates.com
Licence: Free to use under our free template licence terms
Licence URI: https://www.os-templates.com/template-terms
-->
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>두루미 도서관</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

var b_idCheck = false;
var b_authKeyCheck = false;

//다음에서 주소검색하는 기능
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            
            var addr = ''; 
            var extraAddr = ''; 
            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }    
            
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addr").value = addr;            
            document.getElementById("extraaddr").focus();
        }
    }).open();
}

//아이디 중복체크
function id_check() {
	var id = document.getElementById('id').value.trim();
	
	if( id == '' ){
		alert("아이디를 입력하세요");
		return;
	}
	
	//정규식
	var idReg = /^[a-z]+[a-z0-9]{3,11}$/;
	if( !idReg.test( id ) ) {
         alert("아이디는 영문자로 시작하는 4~12자 영문자 또는 숫자이어야 합니다.");
         document.getElementById('id').value = "";
         document.getElementById('id').focus();
         return;
     }

	//Ajax를 통해 id를 서버로 전송
	var url = "id_check.do";
	
	//encodeURIComponent : 파라미터로 전송하고자 하는 값에
	//@, #등 특수문자가 포함되어 있어도 정상전달하기 위한 인코딩 메서드
	var param = "id=" + encodeURIComponent(id);
	
	sendRequest(url, param, id_resultFn, "POST");
	
}

function id_resultFn() {
	
	if( xhr.readyState == 4 && xhr.status == 200 ){
		//서버로부터 도착한 데이터
		var data = xhr.responseText;
		
		var json = eval(data);
		
		if( json[0].result == 'no' ){
			alert(json[1].id + "은(는) 이미 사용중입니다.");
			return;
		}
		
		alert(json[1].id + "은(는) 사용 가능합니다.");
		b_idCheck = true;
		
		//사용가능한 아이디라면 readOnly 처리
		document.getElementById("id").readOnly = true;
		
	}
	
}

//회원가입
function send(f) {
	//파라미터 받기
	var id = f.id.value.trim();
	var pwd = f.pwd.value.trim();
	var pwd_re = f.pwd_re.value.trim();
	var name = f.name.value.trim();
	var email = f.email.value.trim();
	var tel = f.tel.value.trim();
	var gen = f.gen.value;
	var postcode = f.postcode.value;
	var addr = f.addr.value;
	var extraaddr = f.extraaddr.value.trim();
	
	//정규식
    var pwdReg = /^[a-zA-Z0-9]{10,15}$/;
    var nameReg = /^[가-힣]{2,4}$/;
	var emailReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
    var telReg = /^\d{3}-\d{3,4}-\d{4}$/;

    //유효성 검사
    //중복체크
    if(b_idCheck == false){
    	alert("아이디 중복체크를 안하셨습니다.");
    	return;
    }
	//비밀번호
	if(!pwdReg.test(pwd) || pwd == "" || pwd_re == "" ){
		alert('비밀번호를 숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
		f.pwd.value = "";
		f.pwd_re.value = "";
		f.pwd.focus();
		return;
	}
	
	if( pwd != pwd_re ){
		alert('비밀번호와 비밀번호 확인의 값이 다릅니다.');
		f.pwd.value = "";
		f.pwd_re.value = "";
		f.pwd.focus();
		return;
	}
	
	//이름
	if(!nameReg.test(name) || name == ""){
		alert('한글 이름으로 2~4자리를 사용해야합니다.');
		f.name.value = "";
		f.name.focus();
		return;
	}
	
	//이메일
	if(!emailReg.test(email) || email == ""){
		alert('이메일을 정확히 입력해주세요.');
		f.email.value = "";
		f.email.focus();
		return;
	}
    if(b_authKeyCheck == false){
    	alert("이메일 인증을 안하셨습니다.");
    	return;
    }
	
	//우편번호
	if(postcode == ""){
		alert("우편번호를 검색하세요.");
		return;
	}
	
	f.method = "post";
	f.action = "register.do";
	f.submit();
	
}

//이메일 인증메일 보내기
var authKey;
//로그인후 이메일 인증을 안할시 활동에 제한을 둔다.
//var limit = 0;
function email_check() {
	
	var email = document.getElementById('email').value;
	var emailReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
	
	//이메일
	if(!emailReg.test(email) || email == ""){
		alert('이메일을 정확히 입력해주세요.');
		f.email.value = "";
		f.email.focus();
		return;
	}
	
	
	//Ajax를 통해 id를 서버로 전송
	var url = "sendmail.do";
	
	//encodeURIComponent : 파라미터로 전송하고자 하는 값에
	//@, #등 특수문자가 포함되어 있어도 정상전달하기 위한 인코딩 메서드
	var param = "email=" + encodeURIComponent(email);
	
	sendRequest(url, param, email_resultFn, "POST");
	
}

function email_resultFn() {
	
	if( xhr.readyState == 4 && xhr.status == 200 ){
		//서버로부터 도착한 데이터
		authKey = xhr.responseText;
		
		alert("인증번호가 메일로 발송되었습니다.");
		document.getElementById('btnEmailCheck').style = "display:none";
		document.getElementById('btnEmail2Check').style = "display:";
		document.getElementById('keyfrom').style = "display:";
		
	}
	
}

//이메일 인증번호 인증
function key_check() {
	var key = document.getElementById('key').value;
	
	if( key != authKey ){
		alert("인증번호 6자리를 잘못 입력하셨습니다.");
		document.getElementById('key').value = "";
		document.getElementById('key').focus();
		return;
	}
	
	alert("인증이 완료되었습니다.");
	b_authKeyCheck = true;
	
	//사용가능한 아이디라면 readOnly 처리
	document.getElementById("email").readOnly = true;
}

</script>
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<jsp:include page="../Library_Menu_Top.jsp"/>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('${pageContext.request.contextPath}/resources/images/demo/backgrounds/background.jpg');">
  <div id="breadcrumb" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <h6 class="heading">두루미 도서관</h6>
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="main.do">Home</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h6>회원 공간</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="login_form.do">로그인</a></li>
          <li><a href="register_join.do">회원가입</a></li>
          <li><a href="idpwd_find_form.do">아이디/비밀번호 찾기</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>회원가입</h1>
      <div>
	      <span class="point-red fwb text-lg">*</span> 표시 항목은 반드시 입력하셔야 합니다.
      </div>
      <form>
	      <div class="scrollable">
	        <table>
	          <tbody>
	            <tr>
	              <th>아이디<span class="point-red fwb text-lg">*</span></th>
	              <td>
	              	<input name="id" id="id" placeholder="아이디를 입력해주세요.">
	                <input type="button" id="btnIdCheck" value="아이디 중복 체크" onclick="id_check();" style="cursor:pointer">
	                <p>※ 회원아이디는 4~12자리의 영문자와 숫자조합으로만 작성하실 수 있습니다</p>
	              </td>
	            </tr>
	            <tr>
	              <th>비밀번호<span class="point-red fwb text-lg">*</span></th>
	              <td>
				  	<input type="password" name="pwd" id="pwd">
				  	<p>※ 비밀번호는 10~15자리의 영문자와 숫자조합으로만 작성하실 수 있습니다</p>
				  </td>
	            </tr>
	            <tr>
	              <th>비밀번호 확인<span class="point-red fwb text-lg">*</span></th>
	              <td>
	              	<input type="password" name="pwd_re" id="pwd_re">
	              	<p>※ 비밀번호와 동일하게 작성해야 합니다</p>
	              </td>
	            </tr>
	            <tr>
	              <th>이름<span class="point-red fwb text-lg">*</span></th>
				  <td>
				   	<input name="name" id="name" placeholder="이름을 입력해주세요.">
				  </td>
	            </tr>
	            <tr>
	              <th>이메일<span class="point-red fwb text-lg">*</span></th>
				  <td>
				   	<input name="email" id="email" placeholder="이메일을 반드시 입력해주세요.">
				   	<input type="button" id="btnEmailCheck" value="인증번호 보내기" onclick="email_check();" style="cursor:pointer">
					<input type="button" id="btnEmail2Check" style="display: none;" value="인증번호 다시 보내기" onclick="email_check();" style="cursor:pointer">
					<p>※ 이메일을 인증을 해야 합니다</p>
				  </td>
	            </tr>
	            <tr id="keyfrom" style="display:none">
	              <th>인증번호</th>
				  <td>
				   	<input name="key" id="key" placeholder="인증번호 6자리를 입력해주세요.">
				   	<input type="button" id="btnKeyCheck" value="인증" onclick="key_check();" style="cursor:pointer">
				  </td>
	            </tr>
	            <tr>
	              <th>휴대폰 번호</th>
				  <td>
				   	<input name="tel" id="tel" placeholder="전화번호를 입력해주세요.">
				  </td>
	            </tr>
	            <tr>
	              <th>성별<span class="point-red fwb text-lg">*</span></th>
				  <td>
				   	<input type="radio" id="mmm_lbl" name="gen" checked value="남"><i class="fa-male fa-fw fas"></i>
					<input type="radio" id="www_lbl" name="gen" value="여"><i class="fa-female fa-fw fas"></i>
				  </td>
	            </tr>
	            <tr>
	              <th>우편번호<span class="point-red fwb text-lg">*</span></th>
				  <td>
				   	<input name="postcode" id="postcode" placeholder="우편번호" onclick="execDaumPostcode();" readonly>
				   	<input type="button" value="검색" onclick="execDaumPostcode();" style="cursor:pointer">
				  </td>
	            </tr>
	            <tr>
	              <th>주소<span class="point-red fwb text-lg">*</span></th>
				  <td>
				   	<input name="addr" id="addr" placeholder="주소" onclick="execDaumPostcode();" readonly>
				  </td>
	            </tr>
	            <tr>
	              <th>상세주소</th>
				  <td>
				   	<input name="extraaddr" id="extraaddr" placeholder="상세 주소를 입력해주세요.">
				  </td>
	            </tr>
	          </tbody>
	        </table>
	        <p><input type="button" value="회원가입" onclick="send(this.form);" style="cursor:pointer"></p>
	      </div>
      </form>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<jsp:include page="../Library_Menu_Footer.jsp"/>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>