<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ !empty sessionScope.user }">
	<c:if test="${user.m_idx eq 0 }">
		<script>
			alert("${user.name}님 환영합니다.");
			location.href="admin_main.do";
		</script>
	</c:if>
	<c:if test="${user.m_idx ne 0 }">
		<script>
			alert("${user.name}님 환영합니다.");
			location.href="main.do";
		</script>
	</c:if>
</c:if>

<c:if test="${ empty sessionScope.user }">
	<script>
		if( "${check}" == "no_id" ){
			alert("아이디가 존재하지 않습니다.");
		}
		
		if( "${check}" == "no_pwd" ){
			alert("비밀번호가 일치하지 않습니다");
		}
		location.href="login_form.do"
	</script>
</c:if>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두루미 도서관</title>
</head>
<body>

</body>
</html>