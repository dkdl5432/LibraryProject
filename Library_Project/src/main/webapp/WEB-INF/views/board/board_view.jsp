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
	//수정 폼
	function modify(){
		if(${not empty sessionScope.user} && ${user.id eq vo.mem_id}){
			location.href = "board_modify_form.do?page=${param.page}&idx=${vo.idx}";
		}
	}
	//삭제
	function del(){
		if(${not empty sessionScope.user} && ${user.id eq vo.mem_id}){
			if(confirm("삭제하시겠습니까?")){
				var url = "board_delete.do";
				var param = "idx=${vo.idx}";
				sendRequest(url, param, resultFn, "POST");
			}
		}
	}
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data  =xhr.responseText;
			if(data == 'yes'){
				alert("글을 삭제하였습니다");
				location.href = "board.do?page=${param.page}";
			}
		}
	}
	//삭제2
	function com_del(idx, mem_id){
		if('${user.id}' == mem_id ){
			if(confirm("삭제하시겠습니까?")){
				var url = "board_delete.do";
				var param = "idx=" + idx;
				sendRequest(url, param, resultF, "POST");
			}
		}
	}
	function resultF(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data  =xhr.responseText;
			if(data == 'yes'){
				alert("글을 삭제하였습니다");
				location.href = "board_view.do?idx=${param.idx}&page=${param.page}";
			}
		}
	}
	
	//엔터키
	function enterkeydown(f) {
		if( event.keyCode == 13 ){
			//엔터키 눌렀을때 실행할 내용
			board_comment(f);
		}
	}
	//댓글달기
	function board_comment(f) {
		var content = f.content.value;
		if(content == ""){
			alert("댓글을 작성해주세요.");
			f.content.value = "";
			return;
		}
		f.method = "post";
		f.action = "board_comment.do";
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
	  <form>
	      <div class="scrollable">
	        <table>
	          <tbody>
	            <tr>
	              	<th>제목</th>
				  	<td>${vo.subject }</td>
	            </tr>
	            <tr>
					<th>작성자</th>
					<td>${vo.name}</td>
				</tr>
	            <tr>
					<th>작성일</th>
					<td>${vo.regdate}</td>
				</tr>
				<tr>
					<td style="height:300px;" colspan="2"><pre>${ vo.content }</pre></td>
				</tr>
	          </tbody>
	        </table>
	        <div align="right">
				<!-- 목록으로 돌아기기  -->
				<a href="#" onclick = "javascript:location.href='board.do?page=${param.page}'" style="cursor:pointer; color:black;"><i class="fa-list fa-fw fas"></i>목록보기</a>
	        	<c:if test="${ !empty sessionScope.user }">
					<!-- 글 수정 -->
					<a href="#" onclick = "javascript:modify();" style="cursor:pointer; color:black;"><i class="fa-edit fa-fw fas"></i>수정</a>
					<!-- 글 삭제 -->
					<a href="#" onclick = "javascript:del();" style="cursor:pointer; color:black;"><i class="fa-trash fa-fw fas"></i>글삭제</a>
	        	</c:if>
	        </div>
	      </div>
      </form>
      <br>
      <hr>
      <br>
      <!-- ################################################################################################ -->
      <div id="comments">
        <h6>댓글 달기</h6>
        <form id="comment_form">
        <input type="hidden" id="idx" name="idx" value="${vo.idx}">
        <input type="hidden" id="page" name="page" value="${param.page}">
          <div class="one_third first">
            <label for="name">
	            ${ user.name }
            </label>
          </div>
          <c:if test="${ empty sessionScope.user }">
	          <div class="block clear">
	            <textarea name="content" id="content" cols="20" rows="5" placeholder="로그인후 이용해주세요" readonly></textarea>
	          </div>
          </c:if>
          <c:if test="${ !empty sessionScope.user }">
	          <div class="block clear">
	            <textarea name="content" id="content" cols="20" rows="5" placeholder="댓글을 달아주세요" onkeydown="enterkeydown(this.form);"></textarea>
	          </div>
          </c:if>
          <div>
            <input type="button" value="댓글달기" onclick="board_comment(this.form);">
          </div>
        </form>
        <h6>전체 댓글</h6>
        <ul>
          <li>
          	<c:if test="${ empty board_List }">
          		<article>
	              <div class="comcont">
	                <p>댓글이 없습니다.</p>
	              </div>
	            </article>
          	</c:if>
          	<c:if test="${ !empty board_List }">
          		<c:forEach var="board" items="${ board_List }">
	          		<article>
		              <header>
		                <figure class="avatar"><img src="${pageContext.request.contextPath}/resources/images/demo/avatar.png" alt=""></figure>
		                <address>
		                By ${ board.name }
		                </address>
		                ${ board.regdate }
		                <time datetime="2045-04-06T08:15+00:00">${ board.regdate }</time>
		              </header>
		              <div class="comcont">
		                <p><pre>${ board.content }</pre></p>
		              </div>
		              <div align="right">
		              	<!-- 글 삭제 -->
						<a href="#" onclick = "javascript:com_del('${board.idx}', '${board.mem_id}');" style="cursor:pointer; color:black;"><i class="fa-trash fa-fw fas"></i>글삭제</a>
		              </div>
		            </article>
		            <hr>
          		</c:forEach>
          		<div align="center">
          			${ pageMenu }
          		</div>
          		<hr>
          	</c:if>
          </li>
        </ul>
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