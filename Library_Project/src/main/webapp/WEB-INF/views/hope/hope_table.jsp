<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두루미 도서관</title>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
	function cancel(idx, result){
		if(!confirm("정말 취소하시겠습니까?")){
			return;
		}

		if(result!=0){
			alert("처리가 완료된 상태입니다.");
			return;
		}
		
			var url = "cancel.do";
			var param = "idx=" +idx;
			
			sendRequest(url, param, resultFn, "POST");
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			if(json[0].result=='no'){
				alert("수정 실패, 관리자에게 문의하세요.");
			}
			
			alert("취소가 완료되었습니다.");
			location.href='hope_table.do';
		}
	}
</script>
</head>
<body>
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
      <h6>내서재</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="user_lent_search_form.do?m_id=${user.id}">대출이력 조회</a></li>
          <li><a href="hope_table.do">희망 도서예약 신청내역</a></li>
          <li><a href="user_update_form.do">개인정보변경</a></li>
          <li><a href="user_del_form.do">회원탈퇴</a></li>
        </ul>
         </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>희망도서예약신청 내역</h1>
	  <form>
	      <div class="scrollable">
			<table width="700" align="center" border="1" style="border-clooapse:collapse;">
		<tr>
			<th width="10%">순번</thh>
			<th>제목</th>
			<th width="20%">저자</th>
			<th width="10%">출판사</th>
			<th width="20%">신청일</th>
			<th width="10%">처리결과</th>
			<th width="10%">비고</th>
		</tr>
		
		<c:forEach var="vo" items="${hope_table }">
		<tr>
			<td align="center">${vo.idx }</td>
			<td align="center">${vo.subject }</td>
			<td align="center">${vo.author }</td>
			<td align="center">${vo.company }</td>
			<td align="center">${vo.regdate }</td>
			<td align="center"><c:choose>
      		<c:when test="${vo.result eq 0}">
			                          처리중               
                    </c:when>
                    <c:when test="${vo.result eq 1}">
                       	거절                     
                       </c:when>
                    <c:when test="${vo.result eq 2}">
                       	완료             
                       </c:when>
                    <c:when test="${vo.result eq 3}">
                       	취소됨             
                       </c:when>
                  </c:choose></td>
			<td align="center">
				<input type="button" value="취소" onclick="cancel(${vo.idx},${ vo.result });">
			</td>
		</tr> 
		</c:forEach>
		<c:if test="${empty hope_table }">
			<tr>
				<td align="center" colspan="7">
					현재 등록된 글이 없습니다.
				</td>
			</tr>
		</c:if>
		
		 <tr align="center">
			<td colspan="7">
				${pageMenu }
			</td>
		</tr>
		 
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