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

	//다음에서 주소검삭하는 기능
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            
	            var addr = ''; 
	            var extraAddr = ''; 
	            
	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else { 
	                addr = data.jibunAddress;
	            }    
	            
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("addr").value = addr;            
	            document.getElementById("extraaddr").focus();
	        }
	    }).open();
	}
	//이메일 복구
	function email_reset() {
		document.getElementById("email").value = '${vo.email}';
	}
	//수정
	function update() {
		
		//정규식
	    var pwdReg = /^[a-zA-Z0-9]{10,15}$/;
	    var telReg = /^\d{3}-\d{3,4}-\d{4}$/;
	    var emailReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;

	    //유효성 검사
		//이메일
		if(!emailReg.test(document.getElementById("email").value.trim()) || document.getElementById("email").value.trim() == ""){
			alert('이메일을 정확히 입력해주세요.');
			f.email.value = "";
			f.email.focus();
			return;
		}

		//우편번호
		if(document.getElementById("postcode").value == ""){
			alert("우편번호를 검색하세요.");
			return;
		}
		
		/* alert(document.getElementById("m_idx").value);
		alert(document.getElementById("pwd").value);
		alert(document.getElementById("email").value);
		alert(document.getElementById("tel").value);
		alert(document.getElementById("gen").value);
		alert(document.getElementById("postcode").value);
		alert(document.getElementById("addr").value);
		alert(document.getElementById("extraaddr").value); */
		
		//member테이블에 수정
		var url = "admin_user_update.do";
		var param = "m_idx=" + document.getElementById("m_idx").value +
			"&pwd=" + document.getElementById("pwd").value +
			"&email=" + document.getElementById("email").value +
			"&tel=" + document.getElementById("tel").value +
			"&gen=" + document.getElementById("gen").value +
			"&postcode=" + document.getElementById("postcode").value +
			"&addr=" + document.getElementById("addr").value +
			"&extraaddr=" + document.getElementById("extraaddr").value;
		
		sendRequest(url, param, resulFn, "POST");
	}
	function resulFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//부모창 원하는 주소로 옮기기
			window.opener.document.location.href="admin_user_form.do";
			window.close();
		}
	}	
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
								<table width="900">
								  	<tbody>
									  	<tr>
									  		<td class="stitle">회원정보 수정</td>
									  	</tr>
								  	</tbody>
								</table>
								<form name="admin_user_f" id="admin_user_f">
									<input type="hidden" id="m_idx" value="${ vo.m_idx }">
									<input type="hidden" id="id" value="${ vo.id }">
									<input type="hidden" id="name" value="${ vo.name }">
									<input type="hidden" id="gen" value="${ vo.gen }">
								  	<table width="900" cellspacing="1" class="regtable">
									  	<tbody>
										  	<tr>
											  	<th bgcolor="#f4f4f4">아이디</th>
											  	<td>
											  		${ vo.id }
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">비밀번호</th>
											  	<td>
											  		<input type="password" id="pwd">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">이름</th>
											  	<td>
											  		${ vo.name }
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">이메일</th>
											  	<td>
											  		<input name="email" id="email" size="20" class="form-control w300 __ck" autocomplete="off" value="${vo.email}" onchange="email_change(this);">
													<input type="button" id="btnEmailReset" value="되돌리기" onclick="email_reset();" style="cursor:pointer"><br>
				  								</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">전화번호</th>
											  	<td>
											  		<input id="tel" value="${ vo.tel }">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">우편번호</th>
											  	<td>
											  		<input id="postcode" value="${ vo.postcode }" onclick="execDaumPostcode();" readonly>
													<input type="button" value="검색" onclick="execDaumPostcode();" style="cursor:pointer">
											  	</td>
										  	</tr>
										  	<tr>
											  	<th bgcolor="#f4f4f4">주소</th>
											  	<td>
											  		<input name="addr" id="addr" placeholder="주소" value="${vo.addr}" onclick="execDaumPostcode();" readonly>
											  	</td>
										  	</tr>
											<tr>
								              <th bgcolor="#f4f4f4">상세주소</th>
											  <td>
											   	<input name="extraaddr" id="extraaddr" value="${vo.extraaddr}">
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
									<div class="bts">
										<a href="javascript:update();"><span style="width:50px">수정</span></a>
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