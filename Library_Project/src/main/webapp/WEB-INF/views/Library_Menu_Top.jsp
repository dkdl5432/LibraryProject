<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="fl_left">
      <ul class="nospace">
       <li><a href="main.do"><i class="fas fa-home fa-lg"></i></a></li>
       	<li><a href="hi.do">About</a></li>
        <c:if test="${ empty sessionScope.user }">
        <li><a href="login_form.do">Login</a></li>
        <li><a href="register_join.do">Register</a></li>
        </c:if>
		<c:if test="${ !empty sessionScope.user }">
        <li><a href="logout_form.do">Logout</a></li>
        <c:if test="${ user.m_idx eq 0 }">
        <li><a href="admin_main.do">Admin</a></li>
        </c:if>
        </c:if>
      </ul>
    </div>
    <c:if test="${ empty sessionScope.user }">
	    <div class="fl_right">
	      <ul class="nospace">
	        <li><i class="fas fa-phone rgtspace-5"></i> +82 (010) 2660 6661</li>
	        <li><i class="fas fa-envelope rgtspace-5"></i> dkdl54321@naver.com</li>
	      </ul>
	    </div>
    </c:if>
    <c:if test="${ !empty sessionScope.user }">
	    <div class="fl_right">
	      <ul class="nospace">
	        <li><i class="fas fa-user rgtspace-5"></i> ${user.name}님</li>
	        <li><i class="fas fa-envelope rgtspace-5"></i> ${user.email}</li>
	      </ul>
	    </div>
    </c:if>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="one_quarter first">
      <h1><a href="main.do">두루미 도서관</a></h1>
      <p>행복과 기쁨을 함께하는 우리</p>
    </div>
    <div class="one_quarter"><strong><i class="fas fa-phone rgtspace-5"></i> Call Us:</strong> +82 (010) 2660 6661</div>
    <div class="one_quarter"><strong><i class="far fa-clock rgtspace-5"></i> Mon. - Sat.:</strong> 08.00am - 18.00pm</div>
    <div class="one_quarter">
      <form action="#" method="post">
        <label>
          <select>
            <option value="" selected="selected" disabled="disabled">Language</option>
            <option value="korean">Korean</option>
            <option value="korean">한국어</option>
          </select>
        </label>
      </form>
    </div>
    <!-- ################################################################################################ -->
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li><a class="drop" href="hi.do">도서관 안내</a>
        <ul>
          <li><a href="hi.do">인사말</a></li>
          <li><a href="come.do">오시는 길</a></li>
          <li><a href="familytree.do">조직도</a></li>
        </ul>
      </li>
      <li><a class="drop" href="search.do">자료검색</a>
        <ul>
          <li><a href="search.do">자료검색</a></li>
          <li><a href="newbook_week.do">신규 책</a></li>
          <li><a href="recommend_book.do">이달의 추천 도서</a></li>
        </ul>
      </li>
      <li><a class="drop" href="list.do">열린마당</a>
        <ul>
          <li><a href="list.do">공지사항</a></li>
          <li><a href="hope.do">희망도서신청</a></li>
          <li><a href="board.do">자유게시판</a></li>
        </ul>
      </li>
      <li><a class="drop" href="book.do?m_idx=${user.m_idx}">열람실</a>
        <ul>
          <li><a href="book.do?m_idx=${user.m_idx}">열람실 예약</a></li>
          <li><a href="my_cur_book.do?m_idx=${user.m_idx}">내 예약</a></li>
        </ul>
      </li>
      <li><a class="drop" href="user_lent_search_form.do?m_id=${user.id}">내서재</a>
        <ul>
          <li><a href="user_lent_search_form.do?m_id=${user.id}">대출이력 조회</a></li>
          <li><a href="hope_table.do">희망도서예약 신청내역</a></li>
          <li><a href="user_update_form.do">개인정보변경</a></li>
          <li><a href="user_del_form.do">회원탈퇴</a></li>
        </ul>
      </li>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- JAVASCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>