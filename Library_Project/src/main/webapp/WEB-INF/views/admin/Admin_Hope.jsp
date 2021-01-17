<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ user.m_idx ne 0 }">
	<script>
		alert("관리자만 접근이 가능합니다.");
		location.href="main.do";
	</script>
</c:if><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>두루미 도서관 : 관리자 페이지</title>
        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
		var check = true;
		function allow(idx, result) {
			if( !confirm("허락하시겠습니까?") ){
				return;
			}
			
			if(result !=0){
				alert("이미 처리되었습니다");
				return;
			}
			var url = "allow.do";
			var param = "idx=" + idx;
			
			sendRequest(url, param, allow_resultFn,"POST")
		}
		function allow_resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data == "no"){
					alert("승인에 실패했습니다. 관리자에게 문의하세요.");
					return;
				}
				alert("승인이 완료되었습니다.");
				location.href='admin_hope_form.do';
			}
		}
		function reject(idx, result) {
			if( !confirm("거절하시겠습니까?")){
				return;
			}
			if(check==false || result != 0 ){
				alert("이미 처리가 완료되었습니다.");
				return;
			}
			var url = "reject.do";
			var param = "idx=" + idx;
			sendRequest(url, param, reject_resultFn, "POST")
		}
		function reject_resultFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data == "no"){
					alert("거절에 실패했습니다. 관리자에게 문의해주세요.");
					return;
				}
				alert("거절 처리가 완료되었습니다.");
				location.href="admin_hope_form.do";
			}
		}
</script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="admin_main.do">Admin</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="main.do">Web</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout_form.do">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Book</div>
                            <a class="nav-link collapsed" href="admin_book_form.do" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-book"></i></div>
                               	 책
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="admin_book_form.do">기존 및 신규책 관리</a>
                                    <a class="nav-link" href="admin_lent_form.do">대여 및 반납 관리</a>
                                    <a class="nav-link" href="admin_rec_form.do">이달의 추천 도서 관리</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">User</div>
                            <a class="nav-link" href="admin_user_form.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
								회원 관리
                            </a>
                            <div class="sb-sidenav-menu-heading">Board</div>
                            <a class="nav-link collapsed" href="admin_gongji_form.do" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                               	 열린마당
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="admin_gongji_form.do">공지사항 관리</a>
                                    <a class="nav-link" href="admin_hope_form.do">희망도서 신청 관리</a>
                                    <a class="nav-link" href="admin_board_qa_form.do">자유게시판 관리</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Place</div>
                            <a class="nav-link" href="admin_booking_form.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-reader"></i></div>
								열람실 관리
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in:</div>
                        ${user.name}님
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">희망도서 신청 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="admin_main.do">Admin</a></li>
                            <li class="breadcrumb-item active">희망도서 신청관리</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               	희망도서 관리
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                               	<th width="10%">ID</th>
												<th>제목</th>
												<th width="20%">저자</th>
												<th width="10%">출판사</th>
												<th width="20%">신청일</th>
												<th width="10%">처리결과</th>
												<th width="10%">비고</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th width="10%">ID</th>
												<th>제목</th>
												<th width="20%">저자</th>
												<th width="10%">출판사</th>
												<th width="20%">신청일</th>
												<th width="10%">처리결과</th>
												<th width="10%">비고</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        	<c:forEach var="vo" items="${hope_table }">
                                        		<tr>
                                        			<td>${vo.m_id }</td>
													<td>${vo.subject }</td>
													<td>${vo.author }</td>
													<td>${vo.company }</td>
													<td>${vo.regdate }</td>
													<td><c:choose>
										                    <c:when test="${vo.result eq 0}">
													                          처리중               
										                    </c:when>
										                    <c:when test="${vo.result eq 1}">
										                       	거절                     
										                       </c:when>
										                    <c:when test="${vo.result eq 2}">
										                       	완료             
										                       </c:when>
										                    <c:when test="${vo.result eq 3}">
										                       	취소됨             
										                       </c:when>
										                  </c:choose></td>
													<td align="center">
														<input type="button" value="승인"  onclick="allow(${vo.idx}, ${vo.result });">
														<input type="button" value="거절"  onclick="reject(${vo.idx}, ${vo.result });">
													</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/assets/demo/datatables-demo.js"></script>
    </body>
</html>
