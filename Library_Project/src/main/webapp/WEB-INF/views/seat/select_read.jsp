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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script>
	function time(i){
		location.href="to_select_time.do?seat_idx="+i;
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
      <h1>열람실 좌석표</h1>
      <%-- idx가 s인 seat의 현재시간 사용중인지 아닌지 
			  모든 네모는 <a/>하이퍼링크 달려있음
			 if문으로 일정 네모마다 띄어쓰기 및 줄바꿈해주기 --%>
		<br>
		<hr>
		<br>
		<p align="center">			 
	<c:choose>
		<c:when test="${hour<9 or hour>=18}">
		    	<c:set var="t" value="1"/>
		   	  		<c:forEach var="s" items="${ list}">
		    	  	
		    	  	<button type="button" class="btn btn-outline-dark btn-lg" onclick="time(${s.seat_idx});">
		    	  		<fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/>
		    	  	</button>
		    	  	<c:if test="${(s.seat_idx-24)%7 == 0}"><br></c:if> <!-- 6 12 18 24 -->
				
					<c:if test="${t %14 == 0}"><br></c:if>
					<c:set var="t" value="${t+1 }" />
					</c:forEach>
		   		 </c:when>
    	<c:when test="${9<=hour and hour<12}">
    	<c:set var="t" value="1"/>
   	  		<c:forEach var="s" items="${list}">
    	  	
    	  		<c:if test="${s.t1_mem_idx < 0 }">
    	  		<button type="button" class="btn btn-outline-dark btn-lg" onclick="time('${s.seat_idx}');"><fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/></button>
    	  		</c:if>
    	  		
    	  		<c:if test="${s.t1_mem_idx >= 0 }">
    	  		<button type="button" class="btn btn-secondary btn-lg" onclick="time('${s.seat_idx}');"><fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/></button>
    	  		</c:if>
    	  		
			 	<c:if test="${(s.seat_idx-24)%7 == 0}"><br></c:if> <!-- 6 12 18 24 -->
				
				<c:if test="${t %14 == 0}"><br></c:if>
				<c:set var="t" value="${t+1 }" />
			</c:forEach>
   	 </c:when>

    	<c:when test="${12<=hour and hour<15}">
    	<c:set var="t" value="1"/>
   	  		<c:forEach var="s" items="${ list}">
    	  	
    	  		<c:if test="${s.t2_mem_idx < 0 }">
    	  		<button type="button" class="btn btn-outline-dark btn-lg" onclick="time('${s.seat_idx}');"><fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/></button>
    	  		</c:if>
    	  		
    	  		<c:if test="${s.t2_mem_idx >= 0 }">
    	  		<button type="button" class="btn btn-secondary btn-lg" onclick="time('${s.seat_idx}');"><fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/></button>
    	  		</c:if>
    	  		
    	  		
			 	<c:if test="${(s.seat_idx-24)%7 == 0}"><br></c:if> <!-- 6 12 18 24 -->
				
				<c:if test="${t %14 == 0}"><br></c:if>
				<c:set var="t" value="${t+1 }" />
			</c:forEach>
   	 </c:when>
    
   	 <c:when test="${15<=hour and hour<18}">
 		<c:set var="t" value="1"/>
   	  		<c:forEach var="s" items="${ list}">
    	  	
    	  		<c:if test="${s.t3_mem_idx < 0 }">
    	  		<button type="button" class="btn btn-outline-dark btn-lg" onclick="time('${s.seat_idx}');"><fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/></button>
    	  		</c:if>
    	  		
    	  		<c:if test="${s.t3_mem_idx >= 0 }">
    	  		<button type="button" class="btn btn-secondary btn-lg" onclick="time('${s.seat_idx}');"><fmt:formatNumber value="${s.seat_idx}" minIntegerDigits="2"/></button>
    	  		</c:if>
    	  		
    	  	
			 	<c:if test="${(s.seat_idx-24 )%7 == 0}"><br></c:if> <!-- 6 12 18 24 -->
				
				<c:if test="${t %14 == 0}"><br></c:if>
				<c:set var="t" value="${t+1 }" />
			</c:forEach>
   	 </c:when>
	</c:choose>
	
</p>
	<p align="right">
		<input type="button" value="뒤로 가기" onclick="location.href='curr_booked';">
		</p>	
		 <!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
		    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
		    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

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