	<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
 -->
<!-- <link
	href="https://fonts.googleapis.com/css?family=Material+Icons|
	Material+Icons+Outlined|Material+Icons+Two+Tone|
	Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<link rel="stylesheet" href="style.css"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<!--브라우저 적당량  -->
<title>insidergram : 메인화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous">
</script>
 -->
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
						<!-- 프사 -->
						<span class=profileIMG style="border: 1px solid orange">
							<img src="${feed.u_pic }"> ${feed.u_id } 
						</span>
						<div class="feedIMG" style="border: 1px solid blue">
							<img src="${feed.f_pic }">
						</div>
						<div class="contentBox" style="border: 1px solid red">
							${feed.content }
						</div>
						<div class="likeCommentBox" style="border: 1px solid red">
<!---------------------- 게시물 좋아요 상태 -------------------------- -->
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
	
	
	
	
	
	
	
	
	
	<%-- <div class="main_body">
		<!-- 메인 박스 -->
		<div class="center_body ">
			<!-- 블루 -->
			
			<!-- 게시물 시작~~~~~~------- -->
			<c:choose>
			<c:when test="${empty pList }">
				<br><br><h3>게시물이 존재하지 않습니다.</h3>
			</c:when>
			
			<c:otherwise>
			<c:forEach var="fv" items='${pList }'>

				<div class="feed_box">
					<!--흰 컨텐츠 -->
	
					<div class="feed_name">
	
						<table>
							<thead class="profile_box">
								<tr>  <!-- 프로필 사진 -->
								<td>
									<a href="feedcontroller?type=otherUser&f_id=${fv.u_id }">
										 <img class="profile_img" src="../imgs/${fv.u_pic }">
										 </a>
									</td>
									<td class="profile_name" >
										<a href="feedcontroller?type=otherUser&f_id=${fv.u_id }">${fv.u_id }</a>
									</td>
									
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3">
										<a href="feedcontroller?type=idvPage&f_idx=${fv.f_idx }">
										<c:set var="f_idx" value="${fv.f_idx }" scope="request"/>
											<img class="feed_img" src="../imgs/${fv.f_pic} " id="feed_img" >
										</a>
									</td>
								</tr>
							</tbody>
							<tbody class="feed_body">
								<tr class="feed_row">
								
			<!-- 좋아요 상태에 따라 아이콘 색 채우기 -->
								<c:choose>
								<c:when test="${result == 0 }">
									<td class="material-icons-outlined icon_space" id="like"><a href="feedcontroller?type=addLike&f_idx=${fv.f_idx }&cPage=${cPage}">favorite_border</a></td>
									<td class="material-icons-outlined icon_space">mode_comment</td>
								</c:when>
								<c:otherwise>
									<td class="material-icons-outlined" style="color:red;" id=like><a href="feedcontroller?type=delLike&f_idx=${fv.f_idx }&cPage=${cPage}">favorite</a></td>
									<td class="material-icons-outlined icon_space">mode_comment</td>
								</c:otherwise>
								</c:choose>
								</tr>
							</tbody>
						</table>
						<div class="u_comment">
							<div class="like">
								<span>좋아요 <%= %>개</span> <br> <br>
							</div>
							
							<div class="contain_box">
							<span class="comment_width">
							<a href="feedcontroller?type=otherUser&f_id=${fv.u_id }">${fv.u_id }</a></span>
							<span class="feed_contain_font">
							<a href="feedcontroller?type=idvPage&f_idx=${fv.f_idx }">${fv.content }</a></span>
							</div>
							
							<hr style="border-top: 0.3px solid #dbdbdb;">
						</div>
						<br> <br>
					</div>
				</div>
			</c:forEach>
			</c:otherwise>
			</c:choose>

			<!--왼쪽  -->
			<!--오른쪽  -->
		</div>
	</div> --%>
	
</body>
</html>






