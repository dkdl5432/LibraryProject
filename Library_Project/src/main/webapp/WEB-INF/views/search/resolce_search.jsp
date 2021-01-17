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
<style type="text/css">
	
</style>
<script type="text/javascript">
	function send(f){
		
		var search = f.search.value.trim();
		//유효성검사
		if( search == ''){
			alert("검색할 내용을 입력하세요");
			return;
		}
			
		f.method = "get";
		f.action = "search_view.do";
		f.submit();
		
	}
	
	function lent(book_name){
		alert(book_name);
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
      <div class="scrollable">
        <h1>자료 검색</h1>
        <form>
        	<table border="1" align="center">
	          <thead>
	            <tr>
	            	<td>
						<select name="curlum">
							<option value="book_name">책이름</option>
							<option value="category">카테고리</option>
							<option value="company">출판사</option>
							<option value="isbl">ISBL</option>
							<option value="book_year">출판년도</option>
						</select>
						<input name="search">
						<input type="button" value="검색" onclick="send(this.form);">
					</td>
	            </tr>
	          </thead>
	        </table>
        </form>
        <c:forEach var="i" items="${ list }">
        	<table border="1" align="center">
	          <tbody>
	            <tr>
	              <td rowspan="3" align="center" class="img_style" style="width: 30%">
	              	<img alt="" src="${pageContext.request.contextPath}/resources/images/book_img/${i.isbl}.PNG" 
	              							onclick="lent(${i.book_name});"  >
	              </td>
				  <td class="book_style" style="width: 70%">
					<a href="lent_page.do?isbl=${i.isbl}">
					${ i.book_name } | ${ i.category } | ${ i.company }<br>
					${ i.author } | ${ i.book_year } | ${ i.isbl }<br>
					${ i.content }</a>
			 	  </td>
	            </tr>
	          </tbody>
	        </table>
        </c:forEach>
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