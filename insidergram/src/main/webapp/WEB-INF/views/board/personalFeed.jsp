<%@page import="com.spring.biz.feed.FeedVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

li {
	list-style-type: none;
}

.bigProfile_img {
	border-radius: 50%;
	width: 100%;
	height: 100%;
	display: inline;
	padding: 20px;
}

.square {
	width: 33.333%;
	position: relative;
	overflow: hidden;
}

.square:after {
	content: "";
	display: block;
	padding-bottom: 100%;
}

.inner {
	position: absolute;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-around;
}
</style>

<style>
input[id*="popup"]+label {
	position: absolute;
}

* {
	padding: 0;
	margin: 0;
	line-height: 1;
}

/* none처리로 화면에 책크박스 안보이게 함 */
input[id*="popup"] {
	display: none;
}

/* 추후 버튼 형테로 만들수 있음 [padding:20px;background:#ffcd41;] */
input[id*="popup"]+label {
	display: inline-block;
	color: #fff;
}

/* 팝업창 뛰우는 위치 지정 */
input[id*="popup"]+label+div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

/* 파업창 틀 */
input[id*="popup"]+label+div>div {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 1200px;
	height: 550px;
	background: rgba(0, 0, 0, 0.0);
	z-index: 2;
}

/* 상단 닫기버튼 */
input[id*="popup"]+label+div>div>label {
	position: absolute;
	top: 0%;
	right: 0%;
	transform: translate(40%, -40%);
	padding: 20px;
	background: none;
	border-radius: 100%;
	z-index: 1;
}

/* 여백 클릭시 닫기 처리 */
input[id*="popup"]+label+div>label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .65);
	z-index: 1;
}

/*
		input[id*="popup"] + label + div {display:none;}
		input[id*="popup"]:checked + label + div {display:block;}
		*/

/* 팝업창 나타날 때 자연스럽게 뜨도록 처리함(애니메이션 효과) */
input[id*="popup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 0.3s;
}

input[id*="popup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}
/* input[id^="docPopup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 0.5s;
}

input[id^="docPopup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}
input[id*="savePopup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 0.5s;
}

input[id*="savePopup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
} */
</style>
<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
}

.tab_content {
	text-align: center;
	font-size: 0;
	max-width: 850px;
	margin: 100px auto;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label {
	display: inline-block;
	padding: 20px;
	color: #999;
	font-size: 14px;
	cursor: pointer;
}

input[type="radio"]:checked+label {
	color: #000;
	border-top: solid 2px black;
	font-weight: bold;
}

.conbox {
	height: 600px;
	margin: 0 20px;
	display: none;
	text-align: left;
	font-size: 12px;
	padding: 20px;
	box-sizing: border-box;
}

input[id="tab01"]:checked ~ .con1 {
	display: block;
}

input[id="tab02"]:checked ~ .con2 {
	display: block;
}

input[id="tab03"]:checked ~ .con3 {
	display: block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}

</style>
<script>
	function updateUser() {
		location.href = "../user_update.jsp"
	}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>자기 페이지</title>

</head>
<body>
<body
	style="background-color: #F5F5F5; display: flex; justify-content: space-around; align-content: space-around; flex-wrap: wrap; padding-bottom: 50px;">

	<!--=------------------ 팝업 껍데기 -----------------------=-->
	<input type="checkbox" id="popup">
	<!-- 버튼 클릭시 팝업창 오픈 -->
	<label for="popup" id="popupLabel" style="padding: 3px 10px 3px 0px;">
	</label>
	<div>
		<div>
			<!-- 내용 추가 -->
			<div class="container" id="modalContainer"
				style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">

			</div>
		</div>
		<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
		<label for="popup"></label>
	</div>
	<!-- --------------------------------------------------------------------------- -->
	<%
	List<FeedVO> list = (List<FeedVO>) request.getAttribute("myFeedList");
	%>
	<jsp:include page="../../../header.jsp"></jsp:include>
	<main class="container py-3"
		style="background-color: #F5F5F5; width: 935px;">
		<div class="container-fluid pb-3 my-3 p-3"
			style="background-color: #F5F5F5;">
			<div class="d-grid gap-3" style="grid-template-columns: 1fr 2fr;">
				<div class="rounded-3"
					style="height: 200px; width: 200px; margin-top: 25px; margin-left: 40px;">
					<img class="bigProfile_img"
						src="../img_src/profile/${userVO.u_pic }" />
				</div>

				<div class="rounded-3" style="margin-left: 20px;">
					<div class="row">
						<!-- 1 -->
						<div class="col-12 my-4">
							<a style="font-size: xx-large;">${userVO.u_id }</a>
							<button
								class="center_ailgn py-2 mb-2 btn btn-outline-dark rounded-3"
								style="border-color: silver; text-align: center; height: 28px; margin-left: 50px; width: 110px; padding: 0px 5px 0px 5px; font-size: 13px; display: inline-flex; flex-direction: column; align-content: space-around; flex-wrap: nowrap; align-items: stretch; justify-content: space-evenly; font-weight: 500;"
								type="submit" onclick="updateUser()">
								<svg class="bi me-1 " style="width: 0px; height: 12px;"></svg>
								프로필 편집
							</button>
							<a style="margin-left: 5px; text-decoration: none; color: gray;"
								href="../user_delete.jsp"> <svg
									xmlns="http://www.w3.org/2000/svg" width="28" height="28"
									fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"
									style="margin-bottom: -5px;">
								<path
										d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
								<path fill-rule="evenodd"
										d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
							</svg>
							</a>
						</div>
						<!-- 2 -->
						<div class="col-12 my-3">
							<a>게시물</a><span
								style="margin-left: 5px; margin-right: 20px; font-weight: bold;">${picPost.size() + docPost.size() }</span>
							<a href="javascript:followInfo(true)">팔로워</a><span
								id="followerCnt" style="margin-left: 5px; margin-right: 20px; font-weight: bold;">${followerList.size() }</span>
							<a href="javascript:followInfo(false)">팔로우</a><span
								id="followCnt" style="margin-left: 5px; margin-right: 20px; font-weight: bold;">${followingList.size() }</span>
						</div>
						<!-- 3 -->
						<div class="col-12 my-3">
							<a style="font-weight: bold;">${userVO.name }</a>
						</div>
						<!-- 4 -->
						<div class="col-12 my-3">
							<a>${userVO.bio }</a>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- 시작 -->
		<div class="album" style="background-color: #F5F5F5;">
			<div class="container">
				<div class="tab_content"
					style="margin-top: 0px; border-top: solid 1px gray;">
					<!--text-->
					<input type="radio" name="tabmenu" id="tab01" checked> <label
						for="tab01" style="margin-right: 80px;"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-grid-3x3" viewBox="0 0 16 16">
	                	<path
								d="M0 1.5A1.5 1.5 0 0 1 1.5 0h13A1.5 1.5 0 0 1 16 1.5v13a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13zM1.5 1a.5.5 0 0 0-.5.5V5h4V1H1.5zM5 6H1v4h4V6zm1 4h4V6H6v4zm-1 1H1v3.5a.5.5 0 0 0 .5.5H5v-4zm1 0v4h4v-4H6zm5 0v4h3.5a.5.5 0 0 0 .5-.5V11h-4zm0-1h4V6h-4v4zm0-5h4V1.5a.5.5 0 0 0-.5-.5H11v4zm-1 0V1H6v4h4z" />
	                </svg>&nbsp; PIC
					</label> <input type="radio" name="tabmenu" id="tab02"> <label
						for="tab02" style="margin-right: 80px;"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
	                <path
								d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
	                </svg>&nbsp; DOC
					</label> <input type="radio" name="tabmenu" id="tab03"> <label
						for="tab03"> <svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-bookmark-star" viewBox="0 0 16 16">
	                <path
								d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z" />
	                <path
								d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
	                </svg>&nbsp; SAVED
					</label>
					<!--=------------------ 팔로우 팔로워 팝업 껍데기 -----------------------=-->
					
	<input type="checkbox" id="followpopup">
	<!-- 버튼 클릭시 팝업창 오픈 -->
	<label for="followpopup" id="followpopupLabel" style="padding: 3px 10px 3px 0px;">
	</label>
	<div>
		<div style="width: 400px;height: 500px; background:#f5f5f5;border-radius: 10px;display: flex;flex-direction: column;align-items: center;">
			<label for="followpopup" style="background-color: white;">x</label>
			<!-- 내용 추가 -->
			<div id="followModalContainer" class="row" style="margin: 0px; padding: 0px; width: 100%; height: 100%; border: solid 0.5px silver;flex-direction: column;">
				
				
			</div>
		</div>
		<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
		<label for="followpopup"></label>
	</div>
	<!-- --------------------------------------------------------------------------- -->
					<!--========================================== 사진 피드 ===================================================-->
					<div class="conbox con1">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
							style="padding-bottom: 100px;">
							<c:forEach var="picList" items="${picPost }">

								<div class="col square" id="post${picList.f_idx }" style="height: 246px; display: flex; align-items: stretch;" onclick="modalAjax(${picList.f_idx})">
									<div class="card shadow-sm inner">
										<img src="../img_src/feed/${picList.f_pic }"
											class="card-img-top"
											style="width: 100%; height: 100%">
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!--========================================== 글 피드 ===================================================-->
					<div class="conbox con2">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
							style="padding-bottom: 100px;">
							<c:forEach var="docPost" items="${docPost }">
								<div class="col square" id="post${docPost.f_idx }" style="height: 246px;display: flex;justify-content: center;align-items: center;font-weight: bold;">
									<div class="card shadow-sm inner"
										onclick="modalAjax(${docPost.f_idx})"
										style="text-align: center; justify-content: space-around; align-items: center; font-size: 100%; overflow: hidden;">
										<c:out value="${docPost.content }" />
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!--========================================== 저장 피드 ===================================================-->
					<div class="conbox con3">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
							style="padding-bottom: 100px;">

							<c:forEach var="saveFeed" items="${saveFeed }">

								<c:if test="${saveFeed.f_pic != null}">
									<div id="posts${saveFeed.f_idx }" class="col square" style="height: 246px; display: flex; align-items: stretch;">
										<div class="card shadow-sm inner" style="text-align: center;display: flex;flex-direction: row;">
											<img src="../img_src/feed/${saveFeed.f_pic }"
												class="card-img-top" onclick="modalAjax(${saveFeed.f_idx})">
										</div>
									</div>
								</c:if>
								
								<c:if test="${saveFeed.f_pic == null}">
									<div id="posts${saveFeed.f_idx }" class="col square"
										 style="height: 246px; display: flex; justify-content: center; align-items: center; font-weight: bold;">
										<div class="card shadow-sm inner" style="text-align: center;" 
											onclick="modalAjax(${saveFeed.f_idx})">
											<c:out value="${saveFeed.content }" />
										</div>
									</div>
								</c:if>
								
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<br>
	<br>
	<br>
	<script>
	function unFollow(my_id, target_id, er_idx) {
		$("#btnUnFollow" + er_idx).css('display', 'none');
		$("#btnFollow" + er_idx).css('display', 'inline');
		var followCnt = $("#followCnt").html();
		followCnt = Number(followCnt - 1);
		$("#followCnt").html(followCnt);
		
		$.ajax("../user/unFollow.do", {
			type: "get",
			data: {"my_id": my_id, "target_id": target_id}, // {"seq":1} 문자열 서버로 전송(JSON 문자열)
			dataType: "text",
			success: function(data){
				console.log(data);
				
			},
			error: function(){
				alert("실패~~")
			}
		});
	}
	function follow(my_id, target_id, er_idx) {
		$("#btnFollow" + er_idx).css('display', 'none');
		$("#btnUnFollow" + er_idx).css('display', 'inline');
		var followCnt = $("#followCnt").html();
		followCnt = Number(followCnt) + 1;
		$("#followCnt").html(followCnt);
		
		$.ajax("../user/follow.do", {
			type: "get",
			data: {"my_id": my_id, "target_id": target_id},
			dataType: "text",
			success: function(data){
				console.log(data);
				
			},
			error: function(){
				alert("실패~~")
			}
		});
	}
	function modalUnfollow(my_id, target_id, er_idx) {
		let result = confirm("정말 삭제 하시겠습니까?") 
		if (result == true) {
		$("#btnFollow" + er_idx).css('display', 'none');
			var followerCnt = $("#followerCnt").html();
			followerCnt = Number(followerCnt - 1);
			console.log("언팔 팔로워 카운트:" + followerCnt);
			$("#followerCnt").html(followerCnt);
			
			$.ajax("../user/unFollow.do", {
				type: "get",
				data: {"my_id": my_id, "target_id": target_id}, // {"seq":1} 문자열 서버로 전송(JSON 문자열)
				dataType: "text",
				success: function(data){
					console.log(data);
					$("#erInfo" + er_idx).remove();
				},
				error: function(){
					alert("실패~~")
				}
			});
		}
	}
	function modalFollow(my_id, target_id, er_idx) {
		$("#btnFollow" + er_idx).css('display', 'none');
		$("#btnUnFollow" + er_idx).css('display', 'inline');
		
		$.ajax("../user/follow.do", {
			type: "get",
			data: {"my_id": my_id, "target_id": target_id},
			dataType: "text",
			success: function(data){
				console.log(data);
				
			},
			error: function(){
				alert("실패~~")
			}
		});
	}
	function followInfo(bool) {
					var followInfoBox = "";
		$.ajax("../user/followInfo.do", {
			type: "get",
			data: { "u_id": "${userVO.u_id}" },
			dataType: "json",
			success: function(data){
				console.log("성공~~~~");
				console.log("내 팔로워들 : " + data.myFollowerList);
				console.log("내 팔로잉들 : " + data.myFollowingList);
			 	if (bool == true) {// 팔로워 모달창
			 		console.log("팔로워 받아오기~");
					followInfoBox += '<div class="col-12 p-3"style="height: 50px;border-bottom: solid 0.5px silver;display: flex;justify-content: center;align-items: center;">';
					followInfoBox += '<h5 style="font-weight: bold;margin: 0px;">팔로워</h5></div>';
					$.each(data.myFollowerList, function(index, obj) {
							
						followInfoBox += '<div id="erInfo' + obj.er_idx + '" class="col-12 p-3" style="height: 64px;border-bottom: solid 0.5px silver;display: flex;flex-direction: row;align-items: center;">';
						followInfoBox += '<a href="#" class="text-center" style="display: flex;flex-direction: row;align-items: center;">'; 
						followInfoBox += '<span><img src="../img_src/profile/' + obj.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 10px;"></span>';
						followInfoBox += '<span><h6 class="mb-0" style="margin-left: 15px;">' + obj.from_id + '</h6></span>';
						followInfoBox += '</a></div>';
					 /* ----------------- 팔로워 리스트 삭제 버튼 출력 ----------------- */
						followInfoBox += '<a href="javascript:modalUnfollow(\'' + obj.from_id + '\', \'${userVO.u_id}\', ' + obj.er_idx + ')" id="btnFollow' + obj.er_idx + '" style="padding : 5px 10px; display : inline; margin-left: 150px;"  class="btn btn-secondary" role="button">';
						followInfoBox += '삭제</a>';
						
						
							// ---------------------------------------------------------------------------------------------------
					});
			 	}
				else { // 팔로잉 모달창
					console.log("팔로잉 받아오기~");
					followInfoBox += '<div class="col-12 p-3"style="height: 50px;border-bottom: solid 0.5px silver;display: flex;justify-content: center;align-items: center;">';
					followInfoBox += '<h5 style="font-weight: bold;margin: 0px;">팔로잉</h5></div>';
					$.each(data.myFollowingList2, function(index, obj) {
						followInfoBox += '<div class="col-12 p-3" style="height: 64px;border-bottom: solid 0.5px silver;display: flex;flex-direction: row;align-items: center;">';
						followInfoBox += '<a href="#" class="text-center" style="display: flex;flex-direction: row;align-items: center;">'; 
						followInfoBox += '<span><img src="../img_src/profile/' + obj.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 10px;"></span>';
						followInfoBox += '<span><h6 class="mb-0" style="margin-left: 15px;">' + obj.to_id + '</h6></span>';
						followInfoBox += '</a></div>';
						 /* ----------------- 들어온 상세계정의 팔로잉들 중 내가 팔로우 한 계정과 안한 계정 판별해서 버튼 출력 ----------------- */
						followInfoBox += '<a href="javascript:unFollow(\'${userVO.u_id}\', \'' + obj.to_id + '\', ' + obj.er_idx + ')" id="btnUnFollow' + obj.er_idx + '" style="padding : 5px 10px; display : inline; margin-left: 150px;"  class="btn btn-secondary" role="button">';
						followInfoBox += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">';
						followInfoBox += '<path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />';
						followInfoBox += '<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />';
						followInfoBox += '</svg></a>';
						followInfoBox += '<a href="javascript:follow(\'${userVO.u_id}\', \'' + obj.to_id + '\', ' + obj.er_idx + ')" id="btnFollow' + obj.er_idx + '" class="btn btn-primary" role="button" style="display: none; padding : 5px 10px; margin-left: 145px;">팔로우</a>';
							/* else {
								followInfoBox += '<a href="javascript:modalUnfollow(\'${userVO.u_id}\', \'' + obj.to_id + '\', ' + obj.er_idx + ')" id="btnUnFollow' + obj.er_idx + '" class="btn btn-secondary" role="button" style="display: none; padding : 5px 10px;">';
								followInfoBox += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">';
								followInfoBox += '<path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />';
								followInfoBox += '<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />';
								followInfoBox += '</svg></a>';
								followInfoBox += '<a href="javascript:modalFollow(\'${userVO.u_id}\', \'' + obj.to_id + '\', ' + obj.er_idx + ')" id="btnFollow' + obj.er_idx + '" class="btn btn-primary" role="button" style="display: inline; padding : 5px 10px;margin-left: 145px;">팔로우</a>';
							} */
						
							// ---------------------------------------------------------------------------------------------------
					});
				}
			 	$("#followModalContainer").html(followInfoBox);
			},
		error: function(){
			alert("실패~~")
		}
	});
		$("#followpopup").click();
	
}	
	

	
	
function deleteFeed(f_idx) {
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	$
	.ajax(
			"deleteFeed.do",
			{
				type : "get",
				data : {
					"f_idx" : f_idx,
					"u_id" : '${userVO.u_id}'
				},
				dataType : "text",
				success : function(data) {
					console.log("성공~~~");
					console.log(data)
					$("#post"+f_idx).remove();
					$("#posts"+f_idx).remove();
					$("#popup").click();
				},
				error : function() {
					alert("실패~~~");
				}
			});
	  } 
	 
	 
	 
}

function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
function modalAjax(f_idx) {
	
	$.ajax("modal.do", {
		type : "get",
		data : { "f_idx":f_idx,
				 "u_id":"${userVO.u_id}" },
		dataType : "json",
		success : function(data) {
	var dispHtml = "";
			console.log("성공~~~");
			console.log(data);
			console.log(data.fvo.f_idx);
			//console.log(data.fvo.f_idx());
			
	dispHtml += '<div class="container"style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">';
	dispHtml += '<div class="row square" style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">';
				/* <!-- 왼 --> */
		if(data.fvo.f_pic != null) {
			/* <!-- 이미지 --> */
			dispHtml += '<div class="col-6" style="margin: 0px 0px 0px auto; padding: 0px; height: 550px;">';	
			dispHtml += '<img src="../img_src/feed/' + data.fvo.f_pic + '" class="card-img-top" style="height: 550px; border-radius: 0px; margin-left: auto;">';
			dispHtml += '</div>';
			/* <!-- 오른쪽 --> */
			dispHtml += '<div class="col-5" style="margin: 0px auto 0px 0px; padding: 0px; height: 550px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">';
			/* <!-- 상단 닉네임 --> */
			if(data.confirm == true) {
				dispHtml += '<div class="col-12 p-3" style="display: flex;align-items: center;background-color: white; border-top-right-radius: 5px;">';
				dispHtml += '<a href="otherFeed.do?u_id=' + data.fvo.u_id + '" class="text-center" style="display: flex;flex-direction: row;align-items: center;">';
				dispHtml += '<div><img src="../img_src/profile/' + data.fvo.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;"></div>';
				dispHtml += '<div><h6 class="mb-0" style="margin-left: 15px;">' + data.fvo.u_id + '</h6></div></a>';
					
				dispHtml += '<div class="dropdown" style="margin-left: 270px;font-size: 30px;padding-left : 50px;">';
				dispHtml += '<button onclick="myFunction()" class="dropbtn" style="background-color: white;padding-bottom: 15px;">...</button>';
				dispHtml += '<div id="myDropdown" class="dropdown-content" style="font-size: 15px;">';
				dispHtml += '<a href="goUpdate.do?f_idx=' + data.fvo.f_idx + '">수정</a>';
				dispHtml += '<a href="javascript:deleteFeed(' + data.fvo.f_idx + ')">삭제</a>';
				dispHtml += '</div></div></div>';
				
				/* <!-- 댓글창 --> */
				dispHtml += '<div style="height: 413px; overflow-y: auto; background-color: white;" id="commBox">';
			} else {
				dispHtml += '<a href="otherFeed.do?u_id=' + data.fvo.u_id + '" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center" style="height: 66px; background-color: white; border-top-right-radius: 5px;">';
				dispHtml += '<img src="../img_src/profile/' + data.fvo.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">';
				dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
				dispHtml += '<div><h6 class="mb-0" style="margin-left: 15px;">' + data.fvo.u_id + '</h6></div></div></a>';
				/* <!-- 댓글창 --> */
				dispHtml += '<div style="height: 424px; overflow-y: auto; background-color: white;" id="commBox">';
			}
			dispHtml += '<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none; height: 100px; margin-top: 0px;">';
			dispHtml += '<img src="../img_src/profile/' + data.fvo.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0">';
			dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
			dispHtml += '<div>';
			dispHtml += '<h6 class="mb-0">' + data.fvo.u_id + '</h6>';
			dispHtml += '<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;">' + data.fvo.content + '</p>';
			dispHtml += '</div>';
			dispHtml += '</div></a>';
		} else {
			/* <!-- 글 --> */
			dispHtml += '<div class="col-6" style="margin: 0px 0px 0px auto; padding: 0px; height: 550px;background-color: white; border: solid 1px silver;display: flex;justify-content: center;align-items: center;font-weight: bold;">';	
			dispHtml += data.fvo.content;
			dispHtml += '</div>';
			
			/* <!-- 오른쪽 --> */
			dispHtml += '<div class="col-5" style="margin: 0px auto 0px 0px; padding: 0px; height: 550px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">';
				/* <!-- 상단 닉네임 --> */
			if(data.confirm == true) {
				dispHtml += '<div class="col-12 p-3" style="display: flex;align-items: center;background-color: white; border-top-right-radius: 5px;">';
				dispHtml += '<a href="otherFeed.do?u_id=' + data.fvo.u_id + '" class="text-center" style="display: flex;flex-direction: row;align-items: center;">';
				dispHtml += '<div><img src="../img_src/profile/' + data.fvo.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;"></div>';
				dispHtml += '<div><h6 class="mb-0" style="margin-left: 15px;">' + data.fvo.u_id + '</h6></div></a>';
					
				dispHtml += '<div class="dropdown" style="margin-left: 270px;font-size: 30px;padding-left : 50px;">';
				dispHtml += '<button onclick="myFunction()" class="dropbtn" style="background-color: white;padding-bottom: 15px; ">...</button>';
				dispHtml += '<div id="myDropdown" class="dropdown-content" style="font-size: 15px;">';
				dispHtml += '<a href="goUpdate.do?f_idx=' + data.fvo.f_idx + '">수정</a>';
				dispHtml += '<a href="javascript:deleteFeed(' + data.fvo.f_idx + ')">삭제</a>';
				dispHtml += '</div></div></div>';
				
				/* <!-- 댓글창 --> */
				dispHtml += '<div style="height: 413px; overflow-y: auto; background-color: white;" id="commBox">';
			} else {
				dispHtml += '<a href="otherFeed.do?u_id=' + data.fvo.u_id + '" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center" style="height: 66px; background-color: white; border-top-right-radius: 5px;">';
				dispHtml += '<img src="../img_src/profile/' + data.fvo.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">';
				dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
				dispHtml += '<div><h6 class="mb-0" style="margin-left: 15px;">' + data.fvo.u_id + '</h6></div></div></a>';
				/* <!-- 댓글창 --> */
				dispHtml += '<div style="height: 424px; overflow-y: auto; background-color: white;" id="commBox">';
			}
		}
	$.each(data.fvo.comm, function(index, obj){
		dispHtml += '<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none; height: 100px; margin-top: 0px;">';
		dispHtml += '<img src="../img_src/profile/' + obj.u_pic + '" width="40" height="40"';
		dispHtml += 'class="rounded-circle flex-shrink-0">';
		dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
		dispHtml += '<div>';
		dispHtml += '<h6 class="mb-0">' + obj.u_id + '</h6>';
		dispHtml += '<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;">' + obj.comm + '</p>';
		dispHtml += '</div>';
		dispHtml += '</div></a>';
	});
	dispHtml += '</div>';
		/* <!-- 메시지 보내기 --> */
	dispHtml += '<div class="input-group mb-3" style="background-color: white; border-bottom-right-radius: 5px;">';
	dispHtml += '<input style="height: 40px; border-radius: 20px; margin: 10px 5px 10px 10px; padding: 3px 12px;" type="text" class="form-control" id="commBlock" placeholder="메시지 입력..." aria-label="Recipient\'s username" aria-describedby="button-addon2">';
	dispHtml += '<button class="btn btn-outline-primary" type="button" id="button-addon2" style="background-color: #0d6efd; color: white; border-radius: 70%; width: 35px; height: 35px; padding: 0px; margin: 10px;" onclick="writeComm('+ data.fvo.f_idx + ')">';
	dispHtml += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z" /></svg>';	
	dispHtml += '</button><div></div></div></div></div>';
	
	$("#modalContainer").html(dispHtml);
		},
		error : function() {
			alert("실패~~~");
		}
	});
	$("#popupLabel").click();
}
	
function writeComm(f_idx) {
	$
			.ajax(
					"writeComm.do",
					{
						type : "get",
						data : {
							"f_idx" : f_idx,
							"u_id" : '${userVO.u_id}',
							"comm" : $("#commBlock").val()
						},
						dataType : "json",
						success : function(data) {
							console.log("성공~~~");
							console.log(data);
							$("#commBlock").val("");
							var dispHtml = "";
							dispHtml += '<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none; height: 100px; margin-top: 0px;">';
							dispHtml += '<img src="../img_src/profile/' + data.u_pic + '" width="40" height="40"';
	dispHtml += 'class="rounded-circle flex-shrink-0">';
							dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
							dispHtml += '<div>';
							dispHtml += '<h6 class="mb-0">' + data.u_id
									+ '</h6>';
							dispHtml += '<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;">'
									+ data.comm + '</p>';
							dispHtml += '</div>';
							dispHtml += '<small class="opacity-50 text-nowrap">' + data.regdate +'</small>';
							dispHtml += '</div></a>';
							$("#commBox").append(dispHtml);
							$('#commBox').scrollTop(
									$('#commBox')[0].scrollHeight);
						},
						error : function() {
							alert("실패~~~");
						}
					});
}

</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
</body>
</html>