<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--
Template Name: Bistup
Author: <a href="https://www.os-templates.com/">OS Templates</a>
Author URI: https://www.os-templates.com/
Copyright: OS-Templates.com
Licence: Free to use under our free template licence terms
Licence URI: https://www.os-templates.com/template-terms
-->
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>두루미 도서관</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<jsp:include page="Library_Menu_Top.jsp"/>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('${pageContext.request.contextPath}/resources/images/demo/backgrounds/background.jpg');">
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <article>
      <p>최대표가 야심차게 준비한 새로운 비즈니스</p>
      <h3 class="heading">두루미 도서관	</h3>
      <p>최고급 도서관 그리고 최상의 서비스까지 "내 꿈은 세계정복"</p>
      <footer><a class="btn" href="hi.do">더 알아보기</a></footer>
    </article>
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
    <section id="introblocks">
      <div class="sectiontitle">
        <h6 class="heading">공지사항</h6>
      </div>
       
      		<table>
	          <tbody>
	            <tr>
	              <th align = "center">번호</th>
	              <th align = "center">제목</th>
	              <th align = "center">작성자</th>
	              <th align = "center">등록일</th>
	              <th align = "center">조회</th>
	              <th align = "center">비고</th>
	            </tr>
	            <c:forEach  var = "vo" items = "${ list }">
		            <c:if test="${vo.del_info eq 1 }">
			            <tr>
			            	<td align = "center">공지</td>
							<td>
								<a href = "view.do?idx=${ vo.idx }&page=${empty param.page ? 1 : param.page}"  style="color: black;">
									${ vo.title }
								</a>
							</td>
							<td align = "center">${ vo.name }</td>
							<td align = "center">
								<fmt:parseDate value="${ vo.regdate }" pattern="yyyy-MM-dd HH:mm" var="Date"/>
								<fmt:formatDate value="${ Date }" pattern="yyyy/MM/dd"/>
							</td>
							<td align = "center">${ vo.readhit }</td>
							<td align = "center"></td>
			            </tr>
		            </c:if>
	            </c:forEach>
	            <c:forEach  var = "vo" items = "${ list }">
		            <tr>
		            	<td align = "center">${ vo.idx }</td>
						<td>
							<!-- 삭제되지 않은 글일 경우 클릭이 가능 -->
							<c:if test="${ vo.del_info ge 0 }">
								<a href = "view.do?idx=${ vo.idx }&page=${empty param.page ? 1 : param.page}">
									${ vo.title }
								</a>
							</c:if>
						</td>
						<td align = "center">${ vo.name }</td>
						<td align = "center">
							<fmt:parseDate value="${ vo.regdate }" pattern="yyyy-MM-dd HH:mm" var="Date"/>
							<fmt:formatDate value="${ Date }" pattern="yyyy/MM/dd"/>
						</td>
						<td align = "center">${ vo.readhit }</td>
						<td align = "center"></td>
		            </tr>
	            </c:forEach>
	            <c:if test = "${ empty list }">
					<tr>
						<td align = "center" colspan = "5">
							현재 등록된 글이 없습니다
						</td>
					</tr>
				</c:if>
				<tr align = "center">
					<td colspan = "6">
						${ pageMenu }
					</td>
				</tr>
	          </tbody>
	        </table>
       
    </section>
    <!-- ################################################################################################ -->
    <hr class="btmspace-80">
    <!-- ################################################################################################ -->
	<section>
      <div class="sectiontitle">
        <h6 class="heading">신규 책 추천 도서</h6>
      </div>
      <ul class="nospace group overview">
        <li class="one_third">
          <figure>
             <a href="lent_page.do?isbl=9791130306865">
             <table>
             <tr>
                   <td class="main_newbook_td1">
                      <img src="${pageContext.request.contextPath}/resources/images/book_img/9791130306865.PNG" alt="" style="height: 190px;">
                   </td>
                   <td class="main_newbook_td2" style="color: black;">
                      제목 : 법의 이름으로<br>
                      저자 : 김성돈<br>
                      줄거리 : <br>법의 색깔에 관한 이야기이다<br>
                   </td>
             </tr>
             </table>
             </a>
            <figcaption>
              <h6 class="heading">법의 이름으로</h6>
              <p>신규 책입니다.</p>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure>
          <a href="lent_page.do?isbl=9791165297886">
           <table>
             <tr>
                   <td class="main_newbook_td1">
                      <img src="${pageContext.request.contextPath}/resources/images/book_img/9791165297886.PNG" alt="" style="height: 190px;">
                  </td>
                  <td class="main_newbook_td2" style="color: black;">
                      제목 : 가을의 감옥<br>
                      저자 : 이규원<br>
                      줄거리 : <br>놀라운 발상의 전환!!<br>
                  </td>
               </tr>
            </table>
            </a>
            <figcaption>
              <h6 class="heading">가을의 감옥</h6>
              <p>신규 책입니다.</p>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure>
             <a href="lent_page.do?isbl=9788974331344">
             <table>
             <tr>
                   <td class="main_newbook_td1">
                      <img src="${pageContext.request.contextPath}/resources/images/book_img/9788974331344.PNG" alt="" style="height: 190px;">
                   </td>
                   <td class="main_newbook_td2" style="color: black;">
                      제목 : 버드 캐칭<br>
                      저자 : 김범정<br>
                      줄거리 : <br>김범정 장편소설 버드캐칭 출간<br>
                   </td>
             </tr>
             </table>
             </a>
            <figcaption>
              <h6 class="heading">버드 캐칭</h6>
              <p>신규 책입니다</p>
            </figcaption>
          </figure>
        </li>
      </ul>
    </section>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper coloured">
  <article class="hoc cta clear"> 
    <!-- ################################################################################################ -->
    <h6 class="three_quarter first">초대박 오픈 이벤트! 저희 도서관을 이용해주시는 고객님 선착순 500분께 시설 추가 한시간 무료 이용권 지급해드립니다!</h6>
    <footer class="one_quarter"><a class="btn" href="book.do">예약하러 가기</a></footer>
    <!-- ################################################################################################ -->
  </article>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h6 class="heading">오시는 길</h6>
    </div>
   <ul class="nospace group overview">
        
        <li>
          <a href="come.do">
           <table style="width: 1000px;" align="center">
             <tr>
                   <td class="main_newbook_td1">
                      <img src="${ pageContext.request.contextPath }/resources/images/img/gangnam1.png" alt=""style="width: 1000px; height:600px;">
                  </td>
                  </tr>
                  <tr>
                  <td class="main_newbook_td2" style="color: black;">
					                강남역 1번 출구에서 걸어서 50m!<br>
					                많은 이용 부탁드립니다.
                  </td>
               </tr>
            </table>
            </a>
        </li>
       
      </ul>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <figure class="hoc container clear clients"> 
    <!-- ################################################################################################ -->
    <ul class="nospace group">
      <h2>제휴 기업</h2>
      <li class="one_quarter first"><a href="https://www.kakao.com"><img src="${pageContext.request.contextPath}/resources/images/demo/kakao1.png" style = "width:249px; height:100px;" alt=""></a></li>
      <li class="one_quarter"><a href="https://www.samsung.com"><img src="${pageContext.request.contextPath}/resources/images/demo/samsung.png" style = "width:249px; height:100px;" alt=""></a></li>
      <li class="one_quarter"><a href="https://www.amazon.com"><img src="${pageContext.request.contextPath}/resources/images/demo/amazon.png" style = "width:249px; height:100px;" alt=""></a></li>
      <li class="one_quarter"><a href="https://www.alibaba.com"><img src="${pageContext.request.contextPath}/resources/images/demo/alibaba.png" style = "width:249px; height:100px;" alt=""></a></li>
    </ul>
    <!-- ################################################################################################ -->
  </figure>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<jsp:include page="Library_Menu_Footer.jsp"/>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="${pageContext.request.contextPath}/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>