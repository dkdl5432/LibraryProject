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
	
	//아이디 찾기
	function id_search() {
		//파라미터
		var f = document.getElementById("id_f");
		var name = f.name.value.trim();
		var email = f.id_email.value.trim();
		
		//정규식
		var nameReg = /^[가-힣]{2,4}$/;
		var emailReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		
		//유효성 검사
		//이름
		if(!nameReg.test(name) || name == ""){
			alert('한글 이름으로 2~4자리를 사용해야합니다.');
			f.name.value = "";
			f.name.focus();
			return;
		}
		//이메일
		if(!emailReg.test(email) || email == ""){
			alert('이메일을 정확히 입력해주세요.');
			f.id_email.value = "";
			f.id_email.focus();
			return;
		}
		
		//Ajax를 통해 id를 서버로 전송
		var url = "id_search.do";
		
		//encodeURIComponent : 파라미터로 전송하고자 하는 값에
		//@, #등 특수문자가 포함되어 있어도 정상전달하기 위한 인코딩 메서드
		var param = "name=" + encodeURIComponent(name)
			+ "&email=" + encodeURIComponent(email);
		
		sendRequest(url, param, id_resultFn, "POST");
		
	}
	function id_resultFn() {
		
		if( xhr.readyState == 4 && xhr.status == 200 ){
			//서버로부터 도착한 데이터
			var data = xhr.responseText;
			var json = eval(data);
			
			if(json[0].res == "no"){
				alert("일치하는 정보가 없습니다.");
				return;
			}
			
			var m_idx = json[1].m_idx;
			var email = json[2].email;
			
			location.href = "id_search_check_form.do?m_idx=" + m_idx
					+ "&email=" + email;
				
		}
		
	}
	
	//비밀번호 찾기
	function pw_search() {
		//파라미터
		var f = document.getElementById("pw_f");
		var id = f.id.value.trim();
		var email = f.pwd_email.value.trim();
		
		//정규식
		var emailReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		
		//유효성검사
		//아이디
		if(id == ""){
			alert('아이디를 입력해주세요.');
			f.id.value = "";
			f.id.focus();
			return;
		}
		//이메일
		if(!emailReg.test(email) || email == ""){
			alert('이메일을 정확히 입력해주세요.');
			f.pwd_email.value = "";
			f.pwd_email.focus();
			return;
		}
		
		//Ajax를 통해 파라미터를 서버로 전송
		var url = "pwd_search.do";
		var param = "id=" + encodeURIComponent(id)
			+ "&email=" + encodeURIComponent(email);
		
		sendRequest(url, param, pwd_resultFn, "POST");
		
	}
	function pwd_resultFn() {
		
		if( xhr.readyState == 4 && xhr.status == 200 ){
			//서버로부터 도착한 데이터
			var data = xhr.responseText;
			var json = eval(data);

			if(json[0].res == "no"){
				alert("정보를 잘못 입력하셨습니다.");
				return;
			}
			
			var m_idx = json[1].m_idx;
			var email = json[2].email;
			
			location.href = "pwd_search_check_form.do?m_idx=" + m_idx
					+ "&email=" + email;
			
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
									<table width="420">
									  	<tbody>
										  	<tr>
										  		<td class="stitle">아이디 찾기</td>
										  	</tr>
									  	</tbody>
								  	</table>
								  	
								  	<table width="420" cellspacing="1" class="regtable">
									  	<tbody>
										  	<tr>
											  	<td width="100" height="25" bgcolor="#f4f4f4">이름</td>
											  	<td width="130">
											  		<input type="text" name="name" id="name" tabindex="1">
											  	</td>
											  	<td rowspan="2" align="center"><div class="bts"><a href="javascript:id_search();" tabindex="4"><span style="width:80px">아이디 찾기</span></a></div></td>
										  	</tr>
										  	<tr>
											  	<td height="25" bgcolor="#f4f4f4">e-Mail</td>
											  	<td>
											  		<input type="text" name="id_email" id="id_email" tabindex="2">
											  	</td>
										  	</tr>
										</tbody>
									</table>
								</form>
								
								<form name="pw_f" id="pw_f">
								  	<table width="400">
									  	<tbody>
										  	<tr>
										  		<td class="stitle">비밀번호 찾기</td>
										  	</tr>
										</tbody>
									</table>
										  	
									<table width="400" cellspacing="1" class="regtable">
										<tbody>
											<tr>
												<td width="100" height="25" bgcolor="#f4f4f4">ID</td>
												<td width="130">
													<input type="text" name="id" id="id" tabindex="5">
												</td>
												<td rowspan="2" align="center"><div class="bts"><a href="javascript:pw_search();" tabindex="8"><span style="width:80px">비밀번호 찾기</span></a></div></td>
											</tr>
											<tr>
												<td height="25" bgcolor="#f4f4f4">e-Mail</td>
												<td>
													<input type="text" name="pwd_email" id="pwd_email" tabindex="6">
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