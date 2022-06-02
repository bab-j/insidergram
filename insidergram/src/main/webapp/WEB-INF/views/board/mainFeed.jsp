
<%@page import="com.spring.biz.feed.impl.FeedDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>insidergram : 메인화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.material-symbols-outlined{
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48;
  color: red;
}

</style>
<script>
	$().ready(function() {
	});
	
</script>
</head>

<body>


	<jsp:include page="../../../header.jsp"></jsp:include>
	<!-- upside bar -->

	<br>
	<br> ${userVO }
	<!-- session : 로그인한 유저 정보 -->
	${feedList }
	<!-- mo : 팔로워한 게시물 리스트 -->
	${likeList }
	<!-- mo : 좋아요한 계시물 번호 리스트 -->
	<c:set var="likeList" value="${likeList }" scope="request" />
	<%
	List<String> list = (List<String>) request.getAttribute("likeList");
	%>
	<!-- 피드 게시물 -->
	<div class="feedBox" style="border: 1px solid black">
		<c:choose>
			<c:when test="${empty feedList }">
				<h3>게시물이 존재하지 않습니다.</h3>
			</c:when>
			<c:otherwise>
				<c:forEach var="feed" items="${feedList }">
					<!-- ================== 피드 게시물 1개(프사 ~ 댓글) ===================== -->
					<div class="oneFeed" style="border: 1px solid black">
						<!-- 프사, id(클릭 시 해당 계정 페이지로 이동) -->
						<span class=profileIMG style="border: 1px solid orange"> <a
							href="getIndiFeed.do?u_id=${feed.u_id }"><img
								src="${feed.u_pic }"> ${feed.u_id }</a>
						</span>
						<div class="feedIMG" style="border: 1px solid blue">
							<img src="../img_src/feed/${feed.f_pic }">
						</div>
						<div class="contentBox" style="border: 1px solid red">
							${feed.content }</div>
						<div class="likeCommentBox" style="border: 1px solid red">
							<!---------------------- 게시물 좋아요 상태 설정 -------------------------- -->
							<c:set var="feedIdx" value="${feed.f_idx }" scope="page" />
<%
boolean like = list.contains(pageContext.getAttribute("feedIdx"));
pageContext.setAttribute("like", like);
%>
							<!-- ------------------------------------------------------------- -->
							<a href="javascript:likeFeed(${feed.f_idx})">
								<c:choose>
									<c:when test="${like }">
										<span id="fillHeart${feed.f_idx }" class="material-symbols-outlined" >favorite</span>
										<span id="emptyHeart${feed.f_idx }" class="material-icons-outlined" style="display:none; margin-top:0px;">favorite_border</span>
									</c:when>
									<c:otherwise>
										<span id="fillHeart${feed.f_idx }" class="material-symbols-outlined" style="display: none;">favorite</span>
										<span id="emptyHeart${feed.f_idx }" class="material-icons-outlined" style="margin-top:0px;">favorite_border</span>
										<%-- <img id="emptyHeart${feed.f_idx }" src="../img_src/feed/heart.svg"> --%>
									</c:otherwise>
								</c:choose>
							</a>
							좋아요 <p id="countLike${feed.f_idx}">${feed.countLike }</p>개
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="moreBtn">
		<a href="javascript:moreFeed()">더보기</a>
	</div>

</body>
<script>
	
	function likeFeed(f_idx) {
		let fIdx = f_idx
		let uId = "${ userVO.u_id }"
		console.log("likeFeed() 온클릭 9 실행~~~");
		console.log("fIdx : " + fIdx + ", uID : " + uId);
		
		var countLike = Number($('#countLike'+f_idx).html()) +0;
		$.ajax("likeFeed.do", {
			type : "get",
			data : { "f_idx":fIdx, "u_id":uId },
			dataType : "text",
			success : function(data) {
				console.log("성공~~~");
				console.log(data);
				if(data == '1') {
					console.log('좋아요 처리');
					document.getElementById("fillHeart"+f_idx).style.display="inline";
					document.getElementById("emptyHeart"+f_idx).style.display="none";
					countLike++;
					$('#countLike'+f_idx).html(countLike);
				} else {
					console.log('좋아요 삭제 처리');
					document.getElementById("fillHeart"+f_idx).style.display="none";
					document.getElementById("emptyHeart"+f_idx).style.display="inline";
					countLike--;
					$('#countLike'+f_idx).html(countLike);
				}
				
			},
			error : function() {
				alert("실패~~~");
			}
		});
	}
	
</script>

</html>

