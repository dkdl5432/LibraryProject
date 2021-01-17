<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ result eq 'no_pwd' }">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href = "user_del_form.do";
	</script>
</c:if>
<c:if test="${ result eq 'success' }">
	<script>
	alert("정상적으로 회원 탈퇴가 되었습니다. 감사합니다.\n 문의가 있을 경우 고객상담실에 연락 부탁드립다.");
	location.href = "main.do";
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