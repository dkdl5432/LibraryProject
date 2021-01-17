<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두루미 도서관</title>
<script type="text/javascript">
	function send_hope() {
		var s = document.ss;

		if (s.subject.value == '') {
			alert("제목을 입력하세요");
			return;
		}

		if (s.author.value == '') {
			alert("저자를 입력하세요");
			return;
		}

		if (s.company.value == '') {
			alert("출판사를 입력하세요");
			return;
		}

		if (s.book_year.value == '') {
			alert("출판년도를 입력하세요");
			return;

		}

		if (s.isbn.value == '') {
			alert("ISBN을 입력하세요");
			return;
		}

		s.submit();
	}
</script>
</head>
<body id="top">
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<jsp:include page="../Library_Menu_Top.jsp" />
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
				<h6>열린마당</h6>
				<nav class="sdb_holder">
					<ul>
						<li><a href="list.do">공지사항</a></li>
						<li><a href="hope.do">희망도서신청</a></li>
						<li><a href="board.do">자유게시판</a></li>
					</ul>
				</nav>
				<!-- ################################################################################################ -->
			</div>
			<!-- ################################################################################################ -->
			<!-- ################################################################################################ -->
			<div class="content three_quarter">
				<!-- ################################################################################################ -->
				<h1>희망도서신청</h1>
				<form name="ss" method="get" action="hope_insert.do">
					<table width="500" align="center" border="1">
						<tr>
							<th>제목</th>
							<td><input name="subject" style="width: 250px"></td>
						</tr>
						<tr>
							<th>저자</th>
							<td><input name="author" style="width: 250px"></td>
						</tr>
						<tr>
							<th>출판사</th>
							<td><input name="company"></td>
						</tr>
						<tr>
							<th>출판년도</th>
							<td><input name="book_year"></td>
						</tr>
						<tr>
							<th>ISBN</th>
							<td><input name="isbn"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
	        					<a href="#" onclick = "send_hope();" style="cursor:pointer; color:black;"><i class="fa-edit fa-fw fas"></i>신청</a>
	        					<a href="#" onclick = "javascript:location.href='hope.do'" style="cursor:pointer; color:black;"><i class="fa-file-excel fa-fw fas"></i>취소</a>
						</tr>
					</table>
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
	<jsp:include page="../Library_Menu_Footer.jsp" />
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.backtotop.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>