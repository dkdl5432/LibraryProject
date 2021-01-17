<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두루미 도서관</title>

	<script type="text/javascript">
		//window창 닫기
		function self_close() {
			window.close();
		}
		
		function pwd_change() {
			var m_idx = document.getElementById('m_idx').value;
			location.href = "pwd_search_change_form.do?m_idx=" + m_idx;
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
									<input type="hidden" name="m_idx" id="m_idx" value="${user.m_idx}">
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
											  	<td align="center">회원님의 아이디는 <p>"${ user.id }"</p> 입니다.</td>
										  	</tr>
										  	<tr>
											  	<td align="center"><div class="bts"><a href="javascript:pwd_change();" tabindex="4"><span style="width:80px">비밀 번호 찾기</span></a></div></td>
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