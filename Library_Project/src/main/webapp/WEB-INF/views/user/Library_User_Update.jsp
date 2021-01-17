<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="login_form.do";
	</script>
</c:if>
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

var b_authKeyCheck = true;

//다음에서 주소검삭하는 기능
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

//이메일 변경 이벤트
function email_change(email) {
	
	//alert(email.value + "/" + '${user.email}');
	if(email.value != '${user.email}'){
		alert("이메일이 변경되었습니다. 이메일 인증을 해주세요.");
		b_authKeyCheck = false;
		document.getElementById("email").value = email.value;
	}
	
}
//이메일 복구
function email_reset() {
	document.getElementById("email").value = '${user.email}';
	b_authKeyCheck = true;
}

//수정
function update(f) {
	//파라미터 받기
	var pwd = f.pwd.value.trim();
	var pwd_re = f.pwd_re.value.trim();
	var email = f.email.value.trim();
	var tel = f.tel.value.trim();
	var gen = f.gen.value;
	var postcode = f.postcode.value;
	var addr = f.addr.value;
	var extraaddr = f.extraaddr.value.trim();
	
	//정규식
    var pwdReg = /^[a-zA-Z0-9]{10,15}$/;
    var telReg = /^\d{3}-\d{3,4}-\d{4}$/;
    var emailReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;

    //유효성 검사
	//비밀번호
	if(pwd != ""){
		if(!pwdReg.test(pwd)){
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
	}else{
		f.pwd.value = "no_change";
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
	f.action = "user_update.do";
	f.submit();
	
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
      <h6>내서재</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="user_lent_search_form.do?m_id=${user.id}">대출이력 조회</a></li>
          <li><a href="hope_table.do">희망 도서예약 신청내역</a></li>
          <li><a href="user_update_form.do">개인정보변경</a></li>
          <li><a href="user_del_form.do">회원탈퇴</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>개인정보 변경</h1>
      <div>
	      <span class="point-red fwb text-lg">*</span> 표시 항목은 반드시 입력하셔야 합니다.
      </div>
      <form>
      	  <input type="hidden" id="m_idx" name="m_idx" value="${user.m_idx}">
		  <input type="hidden" id="id" name="id" value="${user.id}">
		  <input type="hidden" id="name" name="name" value="${user.name}">
	      <div class="scrollable">
	        <table>
	          <tbody>
	            <tr>
	              <th>아이디</th>
	              <td>${user.id}</td>
	            </tr>
	            <tr>
	              <th>비밀번호</th>
	              <td>
				  	<input type="password" name="pwd" id="pwd" placeholder="※ 비밀번호 변경시에만 입력하세요.">
				  	<p>※ 비밀번호는 10~15자리의 영문자와 숫자조합으로만 작성하실 수 있습니다</p>
				  </td>
	            </tr>
	            <tr>
	              <th>비밀번호 확인</th>
	              <td>
	              	<input type="password" name="pwd_re" id="pwd_re" placeholder="※ 비밀번호 변경시에만 입력하세요.">
	              </td>
	            </tr>
	            <tr>
	              <th>이름</th>
				  <td>${user.name}</td>
	            </tr>
	            <tr>
	              <th>이메일</th>
				  <td>
				   	<input name="email" id="email" size="20" class="form-control w300 __ck" autocomplete="off" value="${user.email}" onchange="email_change(this);">
					<input type="button" id="btnEmailCheck" value="인증번호 보내기" onclick="email_check();" style="cursor:pointer">
					<input type="button" id="btnEmail2Check" style="display: none;" value="인증번호 다시 보내기" onclick="email_check();" style="cursor:pointer">
					<input type="button" id="btnEmailReset" value="되돌리기" onclick="email_reset();" style="cursor:pointer"><br>
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
				   	<input name="tel" id="tel" value="${user.tel}">
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
				   	<input name="postcode" id="postcode" placeholder="우편번호" value="${user.postcode}" onclick="execDaumPostcode();" readonly>
				   	<input type="button" value="검색" onclick="execDaumPostcode();" style="cursor:pointer">
				  </td>
	            </tr>
	            <tr>
	              <th>주소<span class="point-red fwb text-lg">*</span></th>
				  <td>
				   	<input name="addr" id="addr" placeholder="주소" value="${user.addr}" onclick="execDaumPostcode();" readonly>
				  </td>
	            </tr>
	            <tr>
	              <th>상세주소</th>
				  <td>
				   	<input name="extraaddr" id="extraaddr" value="${user.extraaddr}" placeholder="상세 주소를 입력해주세요.">
				  </td>
	            </tr>
	          </tbody>
	        </table>
	        <p><input type="button" value="수정" onclick="update(this.form);" style="cursor:pointer"></p>
	        <p><input type="button" value="취소" onclick="location.href='main.do'" style="cursor:pointer"></p>
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