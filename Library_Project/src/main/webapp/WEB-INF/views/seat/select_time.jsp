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
<script>
function time_book(f){	//유효성 검사 작성해야함
	
	var chk_obj = document.getElementsByName("time");
    var chk_leng = chk_obj.length;
    var checked = 0;
    for (i=0; i < chk_leng; i++) {
        if (chk_obj[i].checked == true) {
            checked += 1;
        }
    }
    if (checked < 1 ) {
        alert("한 개 이상 선택해주세요");
        return;
    }

	f.action="time_book.do";
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
      <h1>select_time</h1>
      <form id="time_book">
		<input type="hidden" value="${seat.seat_idx}" name="seat_idx">
		<input type="hidden" value="${user.m_idx }" name="m_idx">
		<table border="1">
		<tr>
			<th>${seat.seat_idx}번 좌석</th>
		</tr>
		<tr>
			<td>
				<c:if test="${hour<12 or hour>=18}">
					<c:if test="${seat.t1_mem_idx<=0}">
						<input type="checkbox" name="time" value="1" >9시 ~ 12시
					</c:if>
					<c:if test="${seat.t1_mem_idx>0}">
						<input type="checkbox"  disabled><del>9시 ~ 12시</del>
					</c:if>
				</c:if>
				<c:if test="${hour>=12 and hour<18 }">
					<input type="checkbox" disabled><del>9시 ~ 12시</del>
				</c:if>
			
				<c:if test="${hour<15 or hour>=18}">
					<c:if test="${seat.t2_mem_idx<=0}">
						<input type="checkbox" name="time" value="2" >12시 ~ 15시
					</c:if>
					<c:if test="${seat.t2_mem_idx>0}">
						<input type="checkbox" disabled><del>12시 ~ 15시</del>
					</c:if>
				</c:if>
				<c:if test="${hour>=15 and hour<18}">
					<input type="checkbox"  disabled><del>12시 ~ 15시</del>
				</c:if>
				
				
			
					<c:if test="${seat.t3_mem_idx<=0}">
						<input type="checkbox" name="time" value="3" >15시 ~ 18시
					</c:if>
					<c:if test="${seat.t3_mem_idx>0}">
						<input type="checkbox" disabled><del>15시 ~ 18시</del>
					</c:if>
			
			</td>
		</tr>
		<tr>
			<td><input type="button" value="예약하기" onclick="time_book(this.form);"></td>
			<c:if test="${seat.seat_idx<25 }">
				<input type="button" value="뒤로 가기" onclick="location.href='to_select_mult.do';">
				</c:if>
				<c:if test="${seat.seat_idx>=25 }">
				<input type="button" value="뒤로 가기" onclick="location.href='to_select_read.do';">
				</c:if>
		</tr>
	</table>
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