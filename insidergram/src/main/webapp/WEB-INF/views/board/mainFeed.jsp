	<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
width : 624px;
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
	$().ready(function(){
	});
		function moreFeed() {
			alert($("#feedBox div").length )
		}
</script>
</head>

<body>


	<jsp:include page="../../../header.jsp"></jsp:include>
	<!-- upside bar -->

	<br>
	<br>
	${userVO } <!-- session : 로그인한 유저 정보 -->
	${feedList } <!-- mo : 팔로워한 게시물 리스트 -->
	${likeList } <!-- mo : 좋아요한 계시물 번호 리스트 -->
	<c:set var="likeList" value="${likeList }" scope="request"/>
<% List<String> list = (List<String>)request.getAttribute("likeList");
String osName = System.getProperty("os.name").toLowerCase();
System.out.println("osName : " + osName);
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
						<span class=profileIMG style="border: 1px solid orange">
							<a href="getIndiFeed.do?u_id=${feed.u_id }"><img src="${feed.u_pic }"> ${feed.u_id }</a> 
						</span>
						<div class="feedIMG" style="border: 1px solid blue">
							<img src="../img_src/feed/${feed.f_pic }">
						</div>
						<div class="contentBox" style="border: 1px solid red">
							${feed.content }
						</div>
						<div class="likeCommentBox" style="border: 1px solid red">
<!---------------------- 게시물 좋아요 상태 설정 -------------------------- -->
<c:set var="likeFeed" value="${feed.f_idx }" scope="request"/>
<%
boolean like = list.contains(request.getAttribute("likeFeed"));
pageContext.setAttribute("like", like);
%>
<!-- ------------------------------------------------------------- -->
							<c:choose>
								<c:when test="${like }">
									좋아요
								</c:when>
								<c:otherwise>
									안좋아요
								</c:otherwise>
							</c:choose>
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
</html>

