<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ !empty sessionScope.user }">
	<script>
		alert("로그아웃 후 이용해주세요.");
		location.href="main.do";
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
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/layout.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/font.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" media="all">	
<script type="text/javascript">
	function enterkey() {
		if( window.event.keyCode == 13 ){
			//엔터키 눌렀을때 실행할 내용
			login_Go();
		}
	}

	function login_Go() {
		var f = document.getElementById("login_frm");
		var id = f.id.value.trim();
		var pwd = f.pwd.value.trim();
		
		if( id == "" ){
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return;
		}
		
		if( pwd == "" ){
			alert("비밀번호를 입력해주세요.");
			f.pwd.focus();
			return;
		}
		
		f.method = "post";
		f.action = "login_check_form.do";
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
      <div class="body_head_login"><h1>로그인</h1></div>
      <div class="body_content_login">
	      <form id="login_frm">
		      <div class="login-wrap">
                    <div class="logincCon">
					<div class="login-area">
						<h3>LOGIN</h3>

						<input type="text" id="id" name="id" placeholder="아이디" title="아이디 입력">
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호" title="비밀번호 입력" autocomplete="off"
						onkeyup="enterkey();" required>
						<input type="button" class="login-btn" value="로그인" onclick="login_Go();">

						<p>아직 두루미 도서관의 회원이 아니신가요? &emsp; <a class="btn-find-id" href="register_join.do">회원가입</a></p>
						<p>아이디/비밀번호를 잊으셨나요? &emsp; <a class="btn-find-id" href="idpwd_find_form.do">아이디/비밀번호 찾기</a></p>
					</div>
                    </div>
				</div>
	      </form>
      </div>
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