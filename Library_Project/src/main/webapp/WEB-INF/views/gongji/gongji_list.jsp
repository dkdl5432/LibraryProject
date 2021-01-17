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
      <h6>열린마당</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="list.do">공지사항</a></li>
          <li><a href="hope.do">희망도서신청</a></li>
          <li><a href="board.do">자유게시판</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>공지사항</h1>
	  <form>
	      <div class="scrollable">
	        <table>
	          <tbody>
	            <tr>
	              <th align = "center">번호</th>
	              <th align = "center">제목</th>
	              <th align = "center">작성자</th>
	              <th align = "center">등록일</th>
	              <th align = "center">조회</th>
	              <th align = "center">비고</th>
	            </tr>
	            <c:forEach  var = "vo" items = "${ list }">
		            <c:if test="${vo.del_info eq 1 }">
			            <tr>
			            	<td align = "center">공지</td>
							<td style="color: black;">
								<a href = "view.do?idx=${ vo.idx }&page=${empty param.page ? 1 : param.page}">
									${ vo.title }
								</a>
							</td>
							<td align = "center">${ vo.name }</td>
							<td align = "center">
								<fmt:parseDate value="${ vo.regdate }" pattern="yyyy-MM-dd HH:mm" var="Date"/>
								<fmt:formatDate value="${ Date }" pattern="yyyy/MM/dd"/>
							</td>
							<td align = "center">${ vo.readhit }</td>
							<td align = "center"></td>
			            </tr>
		            </c:if>
	            </c:forEach>
	            <c:forEach  var = "vo" items = "${ list }">
		            <tr>
		            	<td align = "center">${ vo.idx }</td>
						<td>
							<!-- 삭제되지 않은 글일 경우 클릭이 가능 -->
							<c:if test="${ vo.del_info ge 0 }">
								<a href = "view.do?idx=${ vo.idx }&page=${empty param.page ? 1 : param.page}">
									${ vo.title }
								</a>
							</c:if>
						</td>
						<td align = "center">${ vo.name }</td>
						<td align = "center">
							<fmt:parseDate value="${ vo.regdate }" pattern="yyyy-MM-dd HH:mm" var="Date"/>
							<fmt:formatDate value="${ Date }" pattern="yyyy/MM/dd"/>
						</td>
						<td align = "center">${ vo.readhit }</td>
						<td align = "center"></td>
		            </tr>
	            </c:forEach>
	            <c:if test = "${ empty list }">
					<tr>
						<td align = "center" colspan = "5">
							현재 등록된 글이 없습니다
						</td>
					</tr>
				</c:if>
				<tr align = "center">
					<td colspan = "6">
						${ pageMenu }
					</td>
				</tr>
	          </tbody>
	        </table>
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