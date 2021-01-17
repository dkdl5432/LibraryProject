<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
      <h1>내 예약</h1>
      <div class="scrollable">
        <table class="table">
          <thead>
			<tr>
				<th>시간</th>
				<th>장소</th>
				<th>좌석번호</th>
				<th>비고</th>
			</tr>
		</thead>
		<tr>
			<th>9:00 ~ 12:00</th>
			<c:if test="${t1_seat.seat_idx eq -1 }">
			  <td colspan="2">예약없음</td>
			  <td></td>
			</c:if>
			<c:if test="${t1_seat.seat_idx ne -1 }">
				<c:if test="${ t1_seat.seat_idx<25 }">
					<td>멀티미디어실</td>
				</c:if>
				<c:if test="${t1_seat.seat_idx>24 }">
					<td>열람실</td>
				</c:if>
				<td>${ t1_seat.seat_idx}번 </td>
				<td> <button type="button"  class="btn btn-outline-dark btn-lg" onclick="location.href='cancel_book.do?num=1&m_idx=${user.m_idx}'">예약 취소</button></td>
			</c:if>
		</tr>
		<tr>
			<th>12:00 ~ 15:00</th>
			<c:if test="${t2_seat.seat_idx eq -1}">
			  <td colspan="2">예약없음</td>
			  <td></td>
			</c:if>
			<c:if test="${t2_seat.seat_idx ne -1}">
				<c:if test="${ t2_seat.seat_idx<25 }">
					<td>멀티미디어실</td>
				</c:if>
				<c:if test="${t2_seat.seat_idx>24 }">
					<td>열람실</td>
				</c:if>
				<td>${ t2_seat.seat_idx}번 </td>
				<td> <button type="button"  class="btn btn-outline-dark btn-lg"onclick="location.href='cancel_book.do?num=2&m_idx=${user.m_idx}'">예약 취소</button></td>
			</c:if>
		</tr>
		<tr>
			<th>15:00 ~ 18:00</th>
			<c:if test="${t3_seat.seat_idx eq -1 }">
			  <td colspan="2">예약없음</td>
			  <td></td>
			</c:if>
			<c:if test="${t3_seat.seat_idx ne -1}">
				<c:if test="${ t3_seat.seat_idx<25 }">
					<td>멀티미디어실</td>
				</c:if>
				<c:if test="${t3_seat.seat_idx>24 }">
					<td>열람실</td>
				</c:if>
				<td>${ t3_seat.seat_idx}번 </td>
				<td> <button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='cancel_book.do?num=3&m_idx=${user.m_idx}';">예약 취소</button></td>
			</c:if>
		</tr>
        </table>
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