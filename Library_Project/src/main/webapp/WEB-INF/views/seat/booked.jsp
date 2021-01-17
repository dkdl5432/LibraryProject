<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="login_form.do";
	</script>
</c:if> --%>
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
      <h6>열람실</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="book.do?m_idx=${user.m_idx}">열람실 예약</a></li>
          <li><a href="my_cur_book.do?m_idx=${user.m_idx}">내 예약</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>현재 좌석 정보</h1>
      <br>
	    <c:choose>
		  <c:when test="${seat.seat_idx <25}">
		    	<p align="center">멀티미디어실 ${seat.seat_idx}번</p>
		  </c:when>
		
		  <c:when test="${seat.seat_idx >= 25}">
		      <p align="center">열람실 ${seat.seat_idx}번</p>
		  </c:when>
		</c:choose>
		<c:choose>
		    <c:when test="${9<=hour and hour<12}">
		      	<p align="center">9시 ~ 12시 사용중</p>
		    </c:when>
		
		    <c:when test="${12<=hour and hour<15}">
		        <p align="center">12시 ~ 15시 사용중</p>
		    </c:when>
		    
		    <c:when test="${15<=hour and hour<18}">
		        <p align="center">15시 ~ 18시 사용중</p>
		    </c:when>
		</c:choose>
		<input type="button" value="추가 예약" onclick="location.href='curr_booked.do';">
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