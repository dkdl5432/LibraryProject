<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:if test="${ vo.del_info eq 1 }">
	<script>
		alert("존재하지 않는 게시글입니다.");
		location.href = "board.do?page=${param.page}";
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
<script>
	//수정
	function modify(){
		//파라미터 받기
		var f = document.getElementById("modify_form");
		var subject = f.subject.value;
		var content = f.content.value;
		
		//유효성검사
		if(subject.trim() == ""){
			alert("제목을 작성해주세요.");
			f.subject.value = "";
			f.subject.focus();
			return;
		}
		if(content.trim() == ""){
			alert("내용을 작성해주세요.");
			f.content.value = "";
			f.content.focus();
			return;
		}
		
		var url = "board_modify.do";
		var param = "page=${param.page}&idx=${board.idx}&subject=" + subject + "&content=" + content;
		sendRequest(url, param, resultFn, "POST");
		
	}
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			if(data == 'yes'){
				alert("글을 수정되었습니다.");
				location.href = "board_view.do?page=${param.page}&idx=${board.idx}";
			}
		}
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
      <h1>자유게시판</h1>
	  <form id="modify_form">
	      <div class="scrollable">
	        <table>
	          <tbody>
	            <tr>
	              	<th>제목</th>
				  	<td><input name = "subject" value="${board.subject }"></td>
	            </tr>
	            <tr>
					<th>작성자</th>
					<td>${board.name}</td>
				</tr>
	            <tr>
					<th>작성일</th>
					<td>${board.regdate}</td>
				</tr>
				<tr>
					<td style="height:300px;" colspan="2">
						<textarea name = "content" rows = "16" cols = "100">${ board.content }</textarea>
					</td>
				</tr>
	          </tbody>
	        </table>
	        <div align="right">
				<!-- 글 수정 -->
				<a href="#" onclick = "modify();" style="cursor:pointer; color:black;"><i class="fa-edit fa-fw fas"></i>수정</a>
				<!-- 글 취소 -->
				<a href="#" onclick = "javascript:location.href='board_view.do?page=${param.page}&idx=${board.idx }'" style="cursor:pointer; color:black;"><i class="fa-file-excel fa-fw fas"></i>취소</a>
	        </div>
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