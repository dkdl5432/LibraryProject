<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	//비밀번호 변경
	function pwd_change() {
		//파라미터
		var f = document.getElementById("id_f");
		var m_idx = f.m_idx.value;
		var pwd = f.pwd.value.trim();
		var pwd_re = f.pwd_re.value.trim();
		
		//정규식
		var pwdReg = /^[a-zA-Z0-9]{10,15}$/;
		
		//유효성 검사
		//비밀번호
		if(!pwdReg.test(pwd) || pwd == "" || pwd_re == "" ){
			alert('비밀번호를 숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
			f.pwd.value = "";
			f.pwd_re.value = "";
			f.pwd.focus();
			return;
		}
		
		if( pwd != pwd_re ){
			alert('비밀번호와 비밀번호 확인의 값이 다릅니다.');
			f.pwd.value = "";
			f.pwd_re.value = "";
			f.pwd.focus();
			return;
		}
		
		//ajax를 통해 파라미터 값을 전송
		var url = "pwd_search_change.do";
		var param = "m_idx=" + m_idx 
		+ "&pwd=" + encodeURIComponent(pwd);
		
		sendRequest(url, param, pwd_resultFn, "POST");
		
	}

	function pwd_resultFn() {
		
		if( xhr.readyState == 4 && xhr.status == 200 ){
			//서버로부터 도착한 데이터
			var data = xhr.responseText;
			
			if( data == 'no' ){
				alert("비밀번호 변경이 실패하였습니다.");
				window.close();
			}
			
			alert("비밀번호가 변경되었습니다. 로그인 해주세요.");
			window.close();
			
		}
		
	}
</script>

</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td bgcolor="#999999" style="padding:5px 10px;" class="white12bold">아이디/비밀번호 찾기</td>
			</tr>
		</tbody>
	</table>
	
	<table width="500" class="grey12">
		<tbody><tr>
			<td style="padding:20px 0 0 0">
				<table width="460" align="center">
					<tbody>
						<tr>
							<td style="padding:15px; border-top:2px #cccccc solid; border-right:2px #cccccc solid; border-bottom:2px #cccccc solid; border-left:2px #cccccc solid;">
								<form name="id_f" id="id_f">
									<input type="hidden" name="m_idx" id="m_idx" value="${m_idx}">
									<table width="420">
									  	<tbody>
										  	<tr>
										  		<td class="stitle">비밀번호 변경</td>
										  	</tr>
									  	</tbody>
								  	</table>
								  	
								  	<table width="420" cellspacing="1" class="regtable">
									  	<tbody>
											<tr>
											  	<td width="120" height="25" bgcolor="#f4f4f4">비밀번호</td>
											  	<td width="150">
											  		<input type="password" name="pwd" id="pwd" tabindex="1" placeholder="비밀번호를 입력해주세요.">
											  	</td>
											  	<td rowspan="2" align="center"><div class="bts"><a href="javascript:pwd_change();" tabindex="4"><span style="width:80px">비밀번호 변경</span></a></div></td>
										  	</tr>
										  	<tr>
											  	<td height="25" bgcolor="#f4f4f4">비밀번호 확인</td>
											  	<td>
											  		<input type="password" name="pwd_re" id="pwd_re" tabindex="2" placeholder="비밀번호를 다시 입력해주세요.">
											  	</td>
										  	</tr>
										</tbody>
									</table>
								</form>
								
							</td>
						</tr>
					</tbody>
				</table>
				
				<table align="right" >
					<tbody>
						<tr>
							<td height="40" style="padding:0 13px 0 0">
								<div class="bts"><a href="javascript:self_close();"><span style="width:50px">닫기</span></a></div>
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