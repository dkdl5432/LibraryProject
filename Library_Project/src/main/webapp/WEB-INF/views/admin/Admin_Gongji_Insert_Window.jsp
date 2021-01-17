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

<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<script type="text/javascript">
	//window창 닫기
	function self_close() {
		window.close();
	}
	
	//책 추가
	function gongji_insert() {
		var f = document.getElementById("gongji_f");
		//파라미터 받기
		var title = f.title.value;
		var name = f.name.value;
		var content = f.content.value;
		//유효성 검사
		if( f.title.value.trim() == '' ){
			alert("제목을 입력하시오");
			f.title.focus();
			return;
		}
		if( f.name.value.trim() == '' ){
			alert("작성자를 입력하세요")
			f.title.focus();
			return;
		}
		if( f.content.value.trim() == '' ){
			alert("내용은 한글자 이상 입력해야 합니다")
			f.content.focus();
			return;
		}
		
		/* alert(title);
		alert(name);
		alert(content); */
		
		//gongji테이블에 데이터 넣기
		var url = "admin_gongji_insert.do";
		var param = "title=" + title + 
				"&name=" + name +
				"&content=" + content;
		sendRequest(url, param, resulFn, "POST");
	}
	
	function resulFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			
			if(data == "no"){
				alert("저장되지 않았습니다.다시 작성해주세요");
				var f = document.getElementById("gongji_f");
				f.title.value = "";
				f.name.value = "";
				f.content.value = "";
				return;
			}
			//부모창 원하는 주소로 옮기기
			window.opener.document.location.href="admin_gongji_form.do";
			window.close();
		}
	}
</script>

</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td bgcolor="#999999" style="padding:5px 10px;" class="white12bold">공지사항 글 작성</td>
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
								<form name="gongji_f" id="gongji_f">
									<table width="900">
									  	<tbody>
										  	<tr>
										  		<td class="stitle">공지사항 글 작성</td>
									  	</tr>
									  	</tbody>
								  	</table>
								  	
								  	<table width="900" cellspacing="1" class="regtable">
									  	<tbody>
										  	<tr>
											  	<th bgcolor="#f4f4f4">제목</th>
											  	<td><input name = "title"></td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">작성자</th>
											  	<td><input name = "name"></td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">내용</th>
											  	<td>
													<textarea name = "content" rows = "9" cols = "60"></textarea>
												</td>
										  	</tr>
										</tbody>
									</table>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table align="right" style="margin-right:5px" >
					<tbody>
						<tr>
							<td height="40" style="padding:0 13px 0 0">
								<div class="bts"><a href="javascript:gongji_insert();"><span style="width:50px">글작성</span></a>
								<a href="javascript:self_close();"><span style="width:50px">닫기</span></a></div>
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