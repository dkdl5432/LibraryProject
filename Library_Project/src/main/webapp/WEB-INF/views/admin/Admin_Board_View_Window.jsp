<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ user.m_idx ne 0 }">
	<script>
		alert("관리자만 접근이 가능합니다.");
		location.href="main.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두루미 도서관</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<script type="text/javascript">
	//window창 닫기
	function self_close() {
		window.close();
	}
	//삭제
	function window_board_del(idx) {
		if( !confirm("정말삭제하시겠습니까?") ){
			return;
		}
		//location.href = "admin_board_del.do?idx="+idx;
		var url = "admin_board_del.do";
		var param = "idx=" + idx;
		sendRequest(url, param, resulFn, "POST");
	}
	//복구
	function window_board_restore(idx) {
		if( !confirm("복구하시겠습니까?") ){
			return;
		}
		//location.href = "admin_board_restore.do?idx="+idx;
		var url = "admin_board_restore.do";
		var param = "idx=" + idx;
		sendRequest(url, param, resulFn, "POST");
	}
	
	function resulFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			
			if(data == "no"){
				//실패시 얼럿창 띄우기
				alert("작업이 실패했습니다.다시실행해주세요.");
			}
			location.href="admin_board_view_window_form.do?idx=${param.idx}&page=${param.page}";
		}
	}
</script>

</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td bgcolor="#999999" style="padding:5px 10px;" class="white12bold">자유게시판 관리</td>
			</tr>
		</tbody>
	</table>
	
	<table width="950" class="grey12">
		<tbody><tr>
			<td style="padding:20px 0 0 0">
					<table width="940" align="center">
						<tbody>
							<tr>
							<td style="padding:15px; border-top:2px #cccccc solid; border-right:2px #cccccc solid; border-bottom:2px #cccccc solid; border-left:2px #cccccc solid;">
								<table width="900">
								  	<tbody>
									  	<tr>
									  		<td class="stitle">글 보기</td>
									  	</tr>
								  	</tbody>
								</table>
								<form name="admin_user_f" id="admin_user_f">
								  	<table width="900" cellspacing="1" class="regtable">
									  	<tbody>
										  	<tr>
											  	<th bgcolor="#f4f4f4">제목</th>
											  	<td>
											  		${ board.subject }
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">작성자</th>
											  	<td>
											  		${ board.name }
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">작성 날짜</th>
											  	<td>
											  		${ board.regdate }
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">내용</th>
											  	<td>
											  		<pre>${ board.content }</pre>
				  								</td>
										  	</tr>
										</tbody>
									</table>
									</form>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				</tr>
			</tbody>
		</table>
	
	<table width="950" class="grey12">
		<tbody><tr>
			<td style="padding:20px 0 0 0">
					<table width="940" align="center">
						<tbody>
							<tr>
							<td style="padding:15px; border-top:2px #cccccc solid; border-right:2px #cccccc solid; border-bottom:2px #cccccc solid; border-left:2px #cccccc solid;">
								<table width="900">
								  	<tbody>
									  	<tr>
									  		<td class="stitle">댓글</td>
									  	</tr>
								  	</tbody>
								</table>
								  	<table width="900" cellspacing="1" class="regtable">
									  	<tbody>
										  	<tr>
											  	<th bgcolor="#f4f4f4">ID</th>
											  	<th bgcolor="#f4f4f4">이름</th>
											  	<th bgcolor="#f4f4f4">내용</th>
											  	<th bgcolor="#f4f4f4">날짜</th>
											  	<th bgcolor="#f4f4f4">IP</th>
											  	<th bgcolor="#f4f4f4">삭제유무</th>
											  	<th bgcolor="#f4f4f4">비고</th>
										  	</tr>
										  	<c:if test="${ empty list }">
											  	<tr>
												  	<td colspan="5">댓글이 없습니다</td>
											  	</tr>
										  	</c:if>
										  	<c:if test="${ !empty list }">
										  		<c:forEach var="list" items="${ list }">
												  	<tr>
													  	<td align="center">${ list.mem_id }</td>
													  	<td align="center">${ list.name }</td>
													  	<td align="center">${ list.content }</td>
													  	<td align="center">${ list.regdate }</td>
													  	<td align="center">${ list.ip }</td>
													  	<td align="center">${ list.del_info eq '0' ? '':'삭제된 글' }</td>
													  	<td align="center">
													  		<c:if test="${ list.del_info eq 0 }">
	                                        					<input type="button" value="삭제" title="삭제" onclick="window_board_del('${ list.idx }');">
	                                        				</c:if>
	                                        				<c:if test="${ list.del_info eq 1 }">
	                                        					<input type="button" value="복구" title="복구" onclick="window_board_restore('${ list.idx }');">
	                                        				</c:if>
													  	</td>
												  	</tr>
										  		</c:forEach>
										  	</c:if>
										  	<tr>
										  		<td colspan="7" align="center">${ pageMenu }</td>
										  	</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					
					<table align="right" style="margin-right:5px" >
						<tbody>
							<tr>
								<td height="40" style="padding:0 13px 0 0">
									<div class="bts">
										<!-- <a href="javascript:update();"><span style="width:50px">수정</span></a> -->
										<a href="javascript:self_close();"><span style="width:50px">닫기</span></a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				</tr>
			</tbody>
		</table>

</body>
</html>