
<%@page import="com.spring.biz.comment.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.biz.feed.FeedVO"%>
<%@page import="com.spring.biz.feed.impl.FeedDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,GRAD@48,400,1,0" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>insidergram : 메인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
#k1 { /* 틀 */
	border: solid 1px silver;
	width: 500px;
	height: auto;
	margin-top: 20px;
	background-color: white;
	border-radius: 5px;
	width: 500px;
}

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
	background: rgba(0, 0, 0, 0.045);
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

input[id*="popup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 0.3s;
}

input[id*="popup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}

.likeFill {
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48;
	color: red;
}

.square {
	width: 50%;
	position: relative;
	justify-content: space-evenly;
}

.square:after {
	content: "";
	display: block;
	padding-bottom: 100%;
}

.inner {
	position: absolute;
	width: 95%;
	height: 95%;
	overflow: hidden;
}

.inner1 {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.contentBox {
	padding: 5px 5px 30px 5px;
	width: 100%;
	height: auto;
	overflow: inherit;
}

.row { -
	-bs-gutter-x: 0;
}

.likeCommentBox {
	float: left;
}
</style>
<script>


//$(window).on('load', function() {
//});

$(document).ready(function() {
	
	
});




	


</script>
</head>

<body style="background-color: #F5F5F5;">
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


	<jsp:include page="../../../header.jsp"></jsp:include>
	<!-- upside bar -->

	<br>
	<br>
	<%-- <%
	List<List<CommentVO>> commList = (List<List<CommentVO>>)request.getAttribute("commList");
	/* FeedVO fvo = new FeedVO();
	for(List<CommentVO> li : commList) {
		fvo.setComm(li);
	} */
	
%>	 --%>
	<div class="container"
		style="display: flex; flex-direction: column-reverse; align-content: space-around; flex-wrap: wrap;">
		<div id="feedBox">
			<%
				List<String> list = (List<String>) request.getAttribute("likeList");
			List<Integer> saveList = (List<Integer>) request.getAttribute("saveList");
			%>
			<!-- 중간 정렬 -->
			<c:choose>
				<c:when test="${empty feedList }">
					<h3>게시물이 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="feed" items="${feedList }">


						<div class="row col-6" id="k1" style="-bs-gutter-x: 0;">
							<!-- 틀 -->

							<div class="col-12">
								<a href="otherFeed.do?u_id=${feed.u_id }"
									class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
									style="background-color: white;"> <img
									src="../img_src/profile/${feed.u_pic } " width="45" height="45"
									class="rounded-circle flex-shrink-0" style="border-radius: 70%">

									<div class="d-flex gap-2 w-100 justify-content-between">

										<div>
											<h6 class="mb-0" style="margin-left: 15px;">${feed.u_id }</h6>
										</div>

										<div href="#">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-three-dots"
												viewBox="0 0 16 16">
							<path
													d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />
							</svg>
										</div>
									</div>
								</a>
							</div>
							<div class="col-12 square"
								style="display: flex; align-items: center;">
								<div class="inner">
									<c:if test="${feed.f_pic == null }">
								${feed.content }
							</c:if>
									<!-- 중간 이미지 -->
									<c:if test="${feed.f_pic != null }">
										<img src="../img_src/feed/${feed.f_pic }" class="inner1">
									</c:if>

								</div>
							</div>
							<div class="col-12"
								style="margin-top: 10px; margin-bottom: 10px;">
								<div>
									<div class="likeCommentBox">
										<!---------------------- 게시물 좋아요 상태 설정 -------------------------- -->
										<c:set var="feedIdx" value="${feed.f_idx }" scope="page" />
										<%
											boolean like = list.contains(pageContext.getAttribute("feedIdx"));
										pageContext.setAttribute("like", like);
										%>
										<!-- ------------------------------------------------------------- -->
										<a href="javascript:likeFeed(${feed.f_idx})"> <c:choose>
												<c:when test="${like }">
													<span id="fillHeart${feed.f_idx }"
														class="material-symbols-outlined likeFill"
														style="margin: 2px 0px 0px 2%;">favorite</span>
													<span id="emptyHeart${feed.f_idx }"
														class="material-icons-outlined"
														style="display: none; margin: 2px 0px 0px 2%;">favorite_border</span>
												</c:when>
												<c:otherwise>
													<span id="fillHeart${feed.f_idx }"
														class="material-symbols-outlined likeFill"
														style="display: none; margin: 2px 0px 0px 2%;">favorite</span>
													<span id="emptyHeart${feed.f_idx }"
														class="material-icons-outlined"
														style="margin: 2px 0px 0px 2%;">favorite_border</span>
												</c:otherwise>
											</c:choose>
										</a>
									</div>

									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 메시지 버튼 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<a style="margin-left: 10px;"
										href="javascript:modalAjax(${feed.f_idx })"> <svg
											xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16"
											onclick="">
										<path
												d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
									</svg>
									</a>
									<!-- --------------------------------------------------------------------------------------------------------------------- -->



									<!---------------------- 게시물 즐겨찾기 상태 설정 -------------------------- -->
									<c:set var="idx" value="${feed.f_idx }" scope="page" />
									<%
										boolean save = saveList.contains(pageContext.getAttribute("idx"));
									pageContext.setAttribute("save", save);
									%>
									<!-- ------------------------------------------------------------- -->
									<!------------------------------------ 저장하기 버튼 ------------------------------------>
									<c:choose>
										<c:when test="${save }">
											<a href="javascript:saveFeed(${feed.f_idx })"
												style="display: inline-flex; float: right; margin: 0px 10px 0px 0px;">
												<span id="fillSave${feed.f_idx }"
												class="material-icons-outlined"
												style="display: inline; margin: 0px 10px 0px 0px;">
													bookmark </span> <span id="emptySave${feed.f_idx }"
												class="material-icons-outlined"
												style="display: none; float: right; margin: 0px 10px 0px 0px;">
													bookmark_border </span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:saveFeed(${feed.f_idx })"
												style="display: inline-flex; float: right; margin: 0px 10px 0px 0px;">
												<span id="fillSave${feed.f_idx }"
												class="material-icons-outlined"
												style="display: none; float: right; margin: 0px 10px 0px 0px;">
													bookmark </span> <span id="emptySave${feed.f_idx }"
												class="material-icons-outlined"
												style="display: inline; margin: 0px 10px 0px 0px;">
													bookmark_border </span>

											</a>
										</c:otherwise>
									</c:choose>
									<!-- ---------------------------------------------------------------------------- -->
								</div>
								<hr style="border: 1px solid silver;">
								<div
									style="padding: 0 0 3px 5px; font-weight: bold; font-size: 15px;">
									좋아요 <span id="countLike${feed.f_idx}">${feed.countLike }</span>
									개
								</div>
								<c:if test="${feed.f_pic != null }">
									<div class="contentBox">
										<b>${feed.u_id }</b>&nbsp;&nbsp; ${feed.content }
									</div>
								</c:if>
								<hr>
								<div>
									<c:if test="${feed.comm.size() > 2 }">
										<a style="display: inline-flex; margin-bottom: 20px;"
											href="javascript:modalAjax(${feed.f_idx })">댓글
											<p id="commCNT${feed.f_idx }">${feed.comm.size() }</p>개 모두 보기
										</a>
										<br>
									</c:if>
									<%
										int twoComm = 0;
									%>
									<c:forEach var="comm" items="${feed.comm }">
										<%
											twoComm++;
										if (twoComm == 3) {
											break;
										}
										%>
										${comm.getU_id() } : ${comm.getComm() }<br>
									</c:forEach>
									</label>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script>
	
		var nowPage = 1;
		$(document).ready(function () {
			$(window).scroll(function() {
			    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			      
			    let likeList = ${likeList};
			    let saveList = ${saveList};
			    alert("스크롤이벤트 발생~!" + likeList);
			    nowPage++;
			    $.ajax("nextFeed.do", {
					type : "get",
					data : {"u_id":"${userVO.u_id}", "nowPage":nowPage },
					dataType : "json",
					success : function(data) {
						var dispHtml = "";
						
						 $.each(
								data,
								function(index, obj) {
											dispHtml += '<div class="row col-6" id="k1" style="-bs-gutter-x: 0;">';
											dispHtml += '<div class="col-12">';
											dispHtml += '<a href="otherFeed.do?_id=' + obj.u_id + '" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center" style="background-color: white;">';
											dispHtml += '<img src="../img_src/profile/' + obj.u_pic + '" width="45" height="45" class="rounded-circle flex-shrink-0" style="border-radius: 70%">';
											dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
											dispHtml += '<div>';
											dispHtml += '<h6 class="mb-0" style="margin-left: 15px;">' + obj.u_id + '</h6>';
											dispHtml += '</div>';
											dispHtml += '<div href="#">	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots"	viewBox="0 0 16 16"> <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />';
											dispHtml += '</svg></div></div></a></div>';
											dispHtml += '<div class="col-12 square"	style="display: flex; align-items: center;">';
											dispHtml += '<div class="inner">';
											if(obj.f_pic == null) {
												dispHtml += obj.content ;
											}
											if(obj.f_pic != null) {
												dispHtml += '<img src="../img_src/feed/' + obj.f_pic + '" class="inner1">';
											}
											dispHtml += '</div></div>';
											dispHtml += '<div class="col-12" style="margin-top: 10px; margin-bottom: 10px;">';
											dispHtml += '<div>';
											dispHtml += '<div class="likeCommentBox">';
												
											dispHtml += '<a href="javascript:likeFeed(' + obj.f_idx + ')">';
											if (likeList.includes(obj.f_idx)) {
												dispHtml += '<span id="fillHeart' + obj.f_idx + '" class="material-symbols-outlined likeFill" style="margin: 2px 0px 0px 2%;">favorite</span>';
												dispHtml += '<span id="emptyHeart' + obj.f_idx + '" class="material-icons-outlined" style="display: none; margin: 2px 0px 0px 2%;">favorite_border</span>';					
											} else {
												dispHtml += '<span id="fillHeart' + obj.f_idx + '" class="material-symbols-outlined likeFill" style="display: none; margin: 2px 0px 0px 2%;">favorite</span>';
												dispHtml += '<span id="emptyHeart' + obj.f_idx + '" class="material-icons-outlined" style="margin: 2px 0px 0px 2%;">favorite_border</span>'	;					
											}
											dispHtml +=	'</a></div>';
											
											/* <!-- 버튼 클릭시 팝업창 오픈 --> */
											dispHtml += '<a style="margin-left: 10px;" href="javascript:modalAjax(' + obj.f_idx + ')">';
											dispHtml += '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">';
											dispHtml += '<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />';
											dispHtml += '</svg></a>';
											/* dispHtml += '<div><div>' */
											/* <!------------------------------------ 저장하기 버튼 ------------------------------------> */
											if (saveList.includes(obj.f_idx)) {
												dispHtml += '<a href="javascript:saveFeed(' + obj.f_idx + ')" style="display: inline-flex; float: right; margin: 0px 10px 0px 0px;">'; 
												dispHtml += '<span id="fillSave' + obj.f_idx + '" class="material-icons-outlined" style="display: inline; margin: 0px 10px 0px 0px;"> bookmark </span>';
												dispHtml += '<span id="emptySave' + obj.f_idx + '" class="material-icons-outlined" style="display: none; float: right; margin: 0px 10px 0px 0px;">bookmark_border </span>';		
												dispHtml += '</a>';
											} else {
												dispHtml += '<a href="javascript:saveFeed(' + obj.f_idx + ')" style="display: inline-flex; float: right; margin: 0px 10px 0px 0px;">';	
												dispHtml += '<span id="fillSave' + obj.f_idx + '" class="material-icons-outlined" style="display: none; float: right; margin: 0px 10px 0px 0px;"> bookmark </span>';
												dispHtml += '<span id="emptySave' + obj.f_idx + '" class="material-icons-outlined" style="display: inline; margin: 0px 10px 0px 0px;">bookmark_border </span>';
												dispHtml += '</a>';
											}
											
											/* <!-- ---------------------------------------------------------------------------- --> */
											dispHtml += '</div>';
											dispHtml += '<hr style="border: 1px solid silver;">';
											dispHtml += '<div style="padding: 0 0 3px 5px; font-weight: bold; font-size: 15px;">';
											dispHtml += '좋아요 <span id="countLike' + obj.f_idx + '">' + obj.countLike + '</span>개';
											dispHtml += '</div>';
											if (obj.f_pic != null) {
												dispHtml += '<div class="contentBox">';
												dispHtml += '<b>' + obj.u_id + '</b>&nbsp;&nbsp; ' + obj.content;
												dispHtml += '<hr>';
												dispHtml += '<div>';
											}
											if (obj.comm.length > 2) {
												dispHtml += '<a style="display:inline-flex; margin-bottom: 20px;" href="javascript:modalAjax(' + obj.f_idx + ')">';
												dispHtml += '댓글 <p id="commCNT' + obj.f_idx + '">' + obj.comm.length + '</p>개 모두 보기 <br>';
												dispHtml += '</a><br>';
											} 
											/* dispHtml += '<div>'; */
												let twoComm = 0;
												$.each(obj.comm, function(idx, obj2) {
													twoComm++;
													
													if(twoComm == 3) {
														return false;
													}
													dispHtml += obj2.u_id + ':' + obj2.comm + '<br>';
												});
											/* dispHtml += '</div>'; */
											dispHtml += '</div>';
											dispHtml += '</div>';
											dispHtml += '</div>';
											dispHtml += '</div>';
											dispHtml += '</div>';
									});
									$("#feedBox").append(dispHtml);		
								},
								error : function() {
								alert("실패~~~");
								}
							});
			    		}	
					});
		});
		
		
		/* function debounce(callback, limit = 100) {
		    let timeout;
		    return function(...args) {
		        clearTimeout(timeout);
		        timeout = setTimeout(() => {
		            callback.apply(this, args);
		        }, limit);
		    }
		} */

		//document.addEventListener("scroll", debounce(e => {
		    
		    // clientHeight : 웹 브라우저 창의 높이
		    // scrollTop : 현재 스크롤된 부분의 맨 위의 높이
		    // scrollHeight : 문서의 총 높이 (= 스크롤의 총 높이)
		    // 스크롤의 마지막에 도달 : clientHeight + scrollTop >= scrollHeight
		    //const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement;
		    //if(clientHeight + scrollTop >= scrollHeight) {
		    	
		    	
		    	
		    //}
		//}, 200));


function likeFeed(f_idx) {
	let fIdx = f_idx
	let uId = "${ userVO.u_id }"
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

function modalAjax(f_idx) {
	alert("연결 될까요옹?!" + f_idx);
	$.ajax("modal.do", {
		type : "get",
		data : { "f_idx":f_idx },
		dataType : "json",
		success : function(data) {
	var dispHtml = "";
			console.log("성공~~~");
			console.log(data);
	dispHtml += '<div class="row square" style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">';
				/* <!-- 왼 --> */
		if(data.f_pic != null) {
			/* <!-- 이미지 --> */
			dispHtml += '<div class="col-6" style="margin: 0px 0px 0px auto; padding: 0px; height: 550px;">';	
			dispHtml += '<img src="../img_src/feed/' + data.f_pic + '" class="card-img-top" style="height: 550px; border-radius: 0px; margin-left: auto;">';
			dispHtml += '</div>';
			/* <!-- 오른쪽 --> */
			dispHtml += '<div class="col-5" style="margin: 0px auto 0px 0px; padding: 0px; height: 550px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">';
			/* <!-- 상단 닉네임 --> */
			dispHtml += '<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center" style="height: 66px; background-color: white; border-top-right-radius: 5px;">';
			dispHtml += '<img src="../img_src/profile/' + data.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">';
			dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
			dispHtml += '<div><h6 class="mb-0" style="margin-left: 15px;">' + data.u_id + '</h6></div>';
			dispHtml += '<div href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">';
			dispHtml += '<path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />';
			dispHtml += '</svg></div></div></a>';
			/* <!-- 댓글창 --> */
			dispHtml += '<div style="height: 424px; overflow-y: auto; background-color: white;">';
			dispHtml += '<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none; height: 100px; margin-top: 0px;">';
			dispHtml += '<img src="../img_src/profile/' + data.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0">';
			dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
			dispHtml += '<div>';
			dispHtml += '<h6 class="mb-0">' + data.u_id + '</h6>';
			dispHtml += '<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;">' + data.content + '</p>';
			dispHtml += '</div>';
			dispHtml += '</div></a>';
		} else {
			/* <!-- 이미지 --> */
			dispHtml += '<div class="col-6" style="margin: 0px 0px 0px auto; padding: 0px; height: 550px;">';	
			dispHtml += data.content;
			dispHtml += '</div>';
			
			/* <!-- 오른쪽 --> */
			dispHtml += '<div class="col-5" style="margin: 0px auto 0px 0px; padding: 0px; height: 550px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">';
			/* <!-- 상단 닉네임 --> */
			dispHtml += '<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center" style="height: 66px; background-color: white; border-top-right-radius: 5px;">';
			dispHtml += '<img src="../img_src/profile/' + data.u_pic + '" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">';
			dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
			dispHtml += '<div><h6 class="mb-0" style="margin-left: 15px;">' + data.u_id + '</h6></div>';
			dispHtml += '<div href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">';
			dispHtml += '<path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />';
			dispHtml += '</svg></div></div></a>';
			/* <!-- 댓글창 --> */
			dispHtml += '<div style="height: 424px; overflow-y: auto; background-color: white;" id="commBox">';
			
		}
	$.each(data.comm, function(index, obj){
		dispHtml += '<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none; height: 100px; margin-top: 0px;">';
		dispHtml += '<img src="../img_src/profile/' + obj.u_pic + '" width="40" height="40"';
		dispHtml += 'class="rounded-circle flex-shrink-0">';
		dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
		dispHtml += '<div>';
		dispHtml += '<h6 class="mb-0">' + obj.u_id + '</h6>';
		dispHtml += '<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;">' + obj.comm + '</p>';
		dispHtml += '</div>';
		dispHtml += '<small class="opacity-50 text-nowrap">3분전</small>'	;
		dispHtml += '</div></a>';
	});
	dispHtml += '</div>';
		/* <!-- 메시지 보내기 --> */
	dispHtml += '<div class="input-group mb-3" style="background-color: white; border-bottom-right-radius: 5px;">';
	dispHtml += '<input style="height: 40px; border-radius: 20px; margin: 10px 5px 10px 10px; padding: 3px 12px;" type="text" class="form-control" id="commBlock" placeholder="메시지 입력..." aria-label="Recipient\'s username" aria-describedby="button-addon2">';
	dispHtml += '<button class="btn btn-outline-primary" type="button" id="button-addon2" style="background-color: #0d6efd; color: white; border-radius: 70%; width: 35px; height: 35px; padding: 0px; margin: 10px;" onclick="writeComm('+ data.f_idx + ')">';
	dispHtml += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z" /></svg>';	
	dispHtml += '</button></div></div></div>';
	
	$("#modalContainer").html(dispHtml);
		},
		error : function() {
			alert("실패~~~");
		}
	});
	$("#popupLabel").click();
}

function saveFeed(f_idx) {
	$.ajax("saveFeed.do", {
		type : "get",
		data : { "f_idx":f_idx, "u_id":'${userVO.u_id}'},
		dataType : "text",
		success : function(data) {
			console.log("성공~~~");
			console.log(data);
			if (data == 1) {
				console.log('즐겨찾기 처리');
				document.getElementById("fillSave"+f_idx).style.display="inline";
				document.getElementById("emptySave"+f_idx).style.display="none";
			} else {
				console.log('즐겨찾기 해제 처리');
				document.getElementById("emptySave"+f_idx).style.display="inline";
				document.getElementById("fillSave"+f_idx).style.display="none";
			}
		},
		error : function() {
			alert("실패~~~");
		}
	});
}

function writeComm(f_idx) {
	$.ajax("writeComm.do", {
		type : "get",
		data : { "f_idx":f_idx, "u_id":'${userVO.u_id}', "comm":$("#commBlock").val() },
		dataType : "json",
		success : function(data) {
			console.log("성공~~~");
			console.log(data);
			$("#commBlock").val("");
			var commCNT = $("#commCNT" + data.f_idx).html();
			commCNT++;
			alert(commCNT);
			var dispHtml = "";
			dispHtml += '<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none; height: 100px; margin-top: 0px;">';
			dispHtml += '<img src="../img_src/profile/' + data.u_pic + '" width="40" height="40"';
			dispHtml += 'class="rounded-circle flex-shrink-0">';
			dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
			dispHtml += '<div>';
			dispHtml += '<h6 class="mb-0">' + data.u_id + '</h6>';
			dispHtml += '<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;">' + data.comm + '</p>';
			dispHtml += '</div>';
			dispHtml += '<small class="opacity-50 text-nowrap">3분전</small>'	;
			dispHtml += '</div></a>';
			$("#commBox").append(dispHtml);
			$("#commCNT" + data.f_idx).html(commCNT);
			$('#commBox').scrollTop($('#commBox')[0].scrollHeight);
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

