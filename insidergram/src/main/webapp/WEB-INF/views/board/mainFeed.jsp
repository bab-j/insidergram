
<%@page import="com.spring.biz.feed.impl.FeedDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>insidergram : 메인화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.feed_name {
	margin-left: auto;
	margin-right: auto;
}

.profile_img {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	margin-left: 10px;
	margin-right: 10px;
}

.profile_name {
	font-weight: bold;
	height: 32px;
	font-size: 20px;
}

.profile_box {
	width: 624px;
	list-style-type: none;
	float: left;
	margin-left: 5px;
}

.img_row {
	margin-right: auto;
	width: 293px;
	height: 293px;
	margin-left: auto;
}

.feed_body {
	margin-left: 20px;
	text-align: left;
}

.feed_row {
	text-align: left;
}

.like {
	font-weight: bold;
	padding-top: 8px;
}

.user_name {
	margin-left: 10px
}

.u_comment {
	margin-left: 10px;
	text-align: left;
}

.comment_write {
	text-align: center;
}

.comment_textbox {
	height: 32px;
	border-radius: 4px;
	border: 1px solid silver;
}

.comment_width {
	width: 70px;
	font-weight: bold;
	display: inline-block;
}

.feed_contain_font {
	text-align: left;
	padding-bottom: 30px;
	font: bold 12px;
}

.contain_box {
	padding-bottom: 50px;
}

.paging {
	list-style: none;
	display: inline-flex;
}

.li_paging {
	align-content: center;
	margin-left: 20px;
}

.now {
	font-weight: bold;
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
							<c:choose>
								<c:when test="${like }">
									<a href="javascript:unLikeFeed(${feed.f_idx})">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-balloon-heart-fill"
											viewBox="0 0 16 16" style="color : red;">
										  <path fill-rule="evenodd"	d="M8.49 10.92C19.412 3.382 11.28-2.387 8 .986 4.719-2.387-3.413 3.382 7.51 10.92l-.234.468a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.235-.468ZM6.726 1.269c-1.167-.61-2.8-.142-3.454 1.135-.237.463-.36 1.08-.202 1.85.055.27.467.197.527-.071.285-1.256 1.177-2.462 2.989-2.528.234-.008.348-.278.14-.386Z" />
										</svg>
									</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:likeFeed(${feed.f_idx})">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-balloon-heart"
											viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="m8 2.42-.717-.737c-1.13-1.161-3.243-.777-4.01.72-.35.685-.451 1.707.236 3.062C4.16 6.753 5.52 8.32 8 10.042c2.479-1.723 3.839-3.29 4.491-4.577.687-1.355.587-2.377.236-3.061-.767-1.498-2.88-1.882-4.01-.721L8 2.42Zm-.49 8.5c-10.78-7.44-3-13.155.359-10.063.045.041.089.084.132.129.043-.045.087-.088.132-.129 3.36-3.092 11.137 2.624.357 10.063l.235.468a.25.25 0 1 1-.448.224l-.008-.017c.008.11.02.202.037.29.054.27.161.488.419 1.003.288.578.235 1.15.076 1.629-.157.469-.422.867-.588 1.115l-.004.007a.25.25 0 1 1-.416-.278c.168-.252.4-.6.533-1.003.133-.396.163-.824-.049-1.246l-.013-.028c-.24-.48-.38-.758-.448-1.102a3.177 3.177 0 0 1-.052-.45l-.04.08a.25.25 0 1 1-.447-.224l.235-.468ZM6.013 2.06c-.649-.18-1.483.083-1.85.798-.131.258-.245.689-.08 1.335.063.244.414.198.487-.043.21-.697.627-1.447 1.359-1.692.217-.073.304-.337.084-.398Z" />
										</svg>
									</a>
								</c:otherwise>
							</c:choose>
							<p>좋아요 ${feed.countLike }개</p>
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
		$.ajax("likeFeed.do", {
			type : "get",
			data : { "f_idx":fIdx, "u_id":uId },
			dataType : "text",
			success : function(data) {
				alert("성공~~~");
				console.log(data);
			},
			error : function() {
				alert("실패~~~");
			}
		});
	}
	function unLikeFeed(f_idx) {
		let fIdx = f_idx
		let uId = "${ userVO.u_id }"
		console.log("unLikeFeed() 실행~~~");
		console.log("fIdx : " + fIdx + ", uID : " + uId);
		$.ajax("unLikeFeed.do", {
			type : "get",
			data : { "f_idx":fIdx, "u_id":uId },
			dataType : "text",
			success : function(data) {
				alert("성공~~~");
				console.log(data);
			},
			error : function() {
				alert("실패~~~");
			}
		});
	}
	
</script>

</html>

