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
	function book_insert(f) {
//		var f = document.getElementById("book_f");
		//파라미터 받기
		var book_name = f.book_name.value;
		var category = f.category.value;
		var company = f.company.value;
		var content = f.content.value;
		var author = f.author.value;
		var book_year = f.book_year.value;
		var isbl = f.isbl.value;
		var photo = f.photo.value;
		//유효성 검사
		
		if(book_name == ''){
			alert("책이름을 써주세요");
			return;
		}
		if(category == ''){
			alert("카테고리를 써주세요");
			return;
		}
		if(company == ''){
			alert("출판사를 써주세요");
			return;
		}
		if(content == ''){
			alert("내용을 써주세요");
			return;
		}
		if(author == ''){
			alert("저자를 써주세요");
			return;
		}
		if(book_year == ''){
			alert("출판년도를 써주세요");
			return;
		}
		if(isbl == ''){
			alert("isbl을 써주세요");
			return;
		}
		if( photo == '' ){
			alert("사진을 선택하셈");
			return;
		}
		//off_book테이블에 데이터 넣기
	//	var url = "new_book.do";
	//	var param = "book_name="+book_name+"&category="+category+"&company="+company+"&content="+content+"&author="+author+"&book_year="+book_year+"&isbl="+isbl+"&photo="+photo;
	//	sendRequest(url, param, resulFn, "POST");
		f.action = "new_book.do";
		f.submit();
	}
	
	/* function resulFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//부모창 원하는 주소로 옮기기
			window.opener.document.location.href="admin_book_form.do";
			//부모창 새로고침
			window.close();
		}
	} */
</script>

</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td bgcolor="#999999" style="padding:5px 10px;" class="white12bold">신규책 추가</td>
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
								<form name="book_f" id="book_f" enctype="multipart/form-data" method="post">
									<table width="900">
									  	<tbody>
										  	<tr>
										  		<td class="stitle">신규책</td>
										  	</tr>
									  	</tbody>
								  	</table>
								  	
								  	<table width="900" cellspacing="1" class="regtable">
									  	<tbody>
										  	<tr>
											  	<th bgcolor="#f4f4f4">책고유번호</th>
											  	<td>
											  		<input type="text" name="isbl" id="isbl" tabindex="1">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">책이름</th>
											  	<td>
											  		<input type="text" name="book_name" id="book_name" tabindex="1">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">카테고리</th>
											  	<td>
											  		<input type="text" name="category" id="category" tabindex="1">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">출판사</th>
											  	<td>
											  		<input type="text" name="company" id="company" tabindex="1">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">줄거리</th>
											  	<td>
											  		<textarea id="content" name="content" rows = "9" cols = "60"></textarea>
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">저자</th>
											  	<td>
											  		<input type="text" name="author" id="author" tabindex="1">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">출판년도</th>
											  	<td>
											  		<input type="text" name="book_year" id="book_year" tabindex="1">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">책 이미지</th>
											  	<td>
											  		사진 : <input type="file" name="photo">
											  	</td>
										  	</tr>
										  	<tr>
										  		<td>
										  			<input type="button" value="책 추가" onclick="book_insert(this.form);">
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