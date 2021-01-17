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
	function enterkeydown() {
		if( event.keyCode == 13 ){
			//엔터키 눌렀을때 실행할 내용
			user_del();
		}
	}
	//회원탈퇴
	function user_del() {
		//파라미터 받기
		var f = document.getElementById("del_f");
		var m_idx = f.m_idx.value;
		var pwd = f.pwd.value.trim();
		
	    //유효성 검사
		//비밀번호
		if( pwd == "" ){
			alert("비밀번호를 입력해주세요.");
			f.pwd.value = "";
			f.pwd.focus();
			return;
		}
		
	    if( !confirm("회원 탈퇴를 하시겠습니까?") ){
			return;
	    }
	    
	    f.method = "post";
	    f.action = "user_del.do";
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
      <h1>회원탈퇴</h1>
      <form id="del_f">
      	  <input type="hidden" id="m_idx" name="m_idx" value="${user.m_idx}">
	      <div class="scrollable">
	        <table>
	          <tbody>
	            <tr>
	              <th><i class="fas fa-user rgtspace-5"></i>아이디</th>
	              <td>${user.id}</td>
	            </tr>
	            <tr>
	              <th><i class="fa-key fa-fw fas"></i>비밀번호</th>
	              <td>
				  	<input type="password" id="pwd" name="pwd"
			               class="text" title="비밀번호" onkeydown="enterkeydown();">
				  </td>
	            </tr>
	          </tbody>
	        </table>
	        <p><input type="button" value="회원탈퇴" onclick="user_del();" style="cursor:pointer"></p>
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