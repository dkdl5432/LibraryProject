<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "login_form.do";
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
<style>
* {
font-size: 16px;
font-family: Consolas, sans-serif;
}
</style>
<script type="text/javascript">
  	function send(f){
  		
  		f.method = "get";
   		f.action ="book_lent.do";
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
      <h6>자료 검색</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="search.do">자료 검색</a></li>
          <li><a href="newbook_week.do">신규 책</a></li>
          <li><a href="recommend_book.do">이달의 추천 도서</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>예약/대여</h1>
      <div class="scrollable">
        <form>
        	<input type="hidden" id="m_id" name="m_id" value="${vo.id}">
	        <table border="1" align="center">
	          <tbody>
	            <tr>
	            	<td rowspan="6" style="height: 150px;" align="center">
	              		<img alt="" src="${pageContext.request.contextPath}/resources/images/book_img/${b_vo.isbl}.PNG">
	              	</td>
					<td colspan="2" align="center">
						${ b_vo.book_name }
	 				</td>
	            </tr>
	            <tr>
					<th>
	 					ID :
	 				</th>
	 				<td>
	 					${ vo.id }
	 				</td>
				</tr>
				<tr>
					<th>
	 					예약 :
	 				</th>
	 				<td>
	 					<select name="lent">
							<option value="reserve">예약</option>
						</select>
	 				</td>
				</tr>
				<tr>
					<th>
	 					대여 날짜 :
	 				</th>
	 				<td>
	 					<p><input name="lentdate" type="date" value="${ sysdate }" min="${sysdate }" max=""></p>
	 				</td>
				</tr>
				<tr>
					<th>
	 					반납 날짜 :
	 				</th>
	 				<td>
	 					<p><input name="redate" type="date" value="${ sysdate }" min="${sysdate }" max=""></p>
	 				</td>
				</tr>
				<tr>
					<td colspan="3" align="right">
						<input name="b_isbl" type="hidden" value="${ b_vo.isbl }">
	 					<input type="hidden" name="b_name" value="${ b_vo.book_name }">
	 					<input type="button" value="예약/대여" onclick="send(this.form);">
	 				</td>
				</tr>
	          </tbody>
	        </table>
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