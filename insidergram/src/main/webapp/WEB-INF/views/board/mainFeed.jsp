
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
	width: 500px;
	height: auto;
	margin: 20px 0;
	background-color: white;
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

input[id*="popup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 0.1s;
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
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.inner1 {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.contentBox {
	padding: 5px 5px 5px 10px;
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

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
}

.show {
	display: block;
}

#x {
	height: 0.5px;
}
</style>
<script>
	//$(window).on('load', function() {
	//});

	$(document).ready(function() {
		
	});
</script>
</head>

<body  style=" --bs-bg-opacity: 1; background-color: rgba(var(--bs-light-rgb),var(--bs-bg-opacity))!important;">
	<input type="checkbox" id="popup">
	<!-- 버튼 클릭시 팝업창 오픈 -->
	<label for="popup" id="popupLabel" style="padding: 3px 10px 3px 0px;">
	</label>
	<div id="popupShowOrHide">
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
		<div id="feedBox"
			style="display: flex; flex-direction: column; align-items: center;">
			<%
				List<String> list = (List<String>) request.getAttribute("likeList");
			List<Integer> saveList = (List<Integer>) request.getAttribute("saveList");
			%>
			<!-- 중간 정렬 -->
			<c:choose>
				<c:when test="${empty feedList }">
					<h3 style="margin: 100px; font-size: 50px;">게시물이 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="feed" items="${feedList }">
						<div id="post${feed.f_idx }"
							style="background-color: white; display: flex; flex-direction: column; align-items: center; margin: 30px; border: solid 0.5px silver; border-radius: 5px;">
							<div class="row col-6" id="k1"
								style="-bs-gutter-x: 0; margin-top: 0px; margin-bottom: 0px; border-bottom: solid 0.5px silver; border-top-left-radius: 5px; border-top-right-radius: 5px;">
								<!-- 틀 -->

								<div class="col-12">
									<div class="d-flex gap-2 w-100 justify-content-between">
										<div>
											<a href="otherFeed.do?u_id=${feed.u_id }"
												class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none text-center"
												style="background-color: white;"> <img
												src="../img_src/profile/${feed.u_pic }" width="45"
												height="45" class="rounded-circle flex-shrink-0"
												style="border-radius: 70%"> <span class="mb-0"
												style="font-size: 20px; margin: 10px 20px; font-weight: bold;">${feed.u_id }</span>
											</a>
										</div>
										<c:set var="feedIdx" value="${feed.f_idx }" scope="page" />
										<%
											List<Integer> myPost = (List<Integer>) request.getAttribute("myFidxList");
										boolean confirmMyPost = myPost.contains(pageContext.getAttribute("feedIdx"));
										pageContext.setAttribute("confirmMyPost", confirmMyPost);
										%>
										<c:if test="${confirmMyPost }">
											<div class="dropdown"
												style="display: flex; align-items: center; font-size: 30px;">
												<button onclick="myFunction(${feed.f_idx })" class="dropbtn"
													style="background-color: white; border: none; margin-bottom: 15px;">...</button>
												<div id="myDropdown${feed.f_idx }" class="dropdown-content"
													style="font-size: 15px; margin-top: 100px;">
													<a href="goUpdate.do?f_idx=${feed.f_idx }">edit</a> <a
														href="javascript:deleteFeed(${feed.f_idx }, t	rue)">delete</a>
												</div>
											</div>
										</c:if>
									</div>
								</div>


								<div class="col-12 square"
									style="display: flex; align-items: center;">
									<div class="inner"
										style="display: flex; justify-content: center; align-items: center; font-weight: bold;">
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
									style="margin-top: 10px; margin-bottom: 0px;">
									<div>
										<div class="likeCommentBox" style="margin-left: 5px;">
											<!---------------------- 게시물 좋아요 상태 설정 -------------------------- -->
											<%
												boolean like = list.contains(pageContext.getAttribute("feedIdx"));
											pageContext.setAttribute("like", like);
											%>
											<!-- ------------------------------------------------------------- -->
											<a href="javascript:likeFeed(${feed.f_idx})"> <c:choose>
													<c:when test="${like }">
														<span id="fillHeart${feed.f_idx }"
															class="material-symbols-outlined likeFill"
															style="margin: 0px 0px 3px 2px; font-size: 32px;">favorite</span>
														<span id="emptyHeart${feed.f_idx }"
															class="material-icons-outlined"
															style="display: none; margin: 0px 0px 3px 2px; font-size: 32px;">favorite_border</span>
													</c:when>
													<c:otherwise>
														<span id="fillHeart${feed.f_idx }"
															class="material-symbols-outlined likeFill"
															style="display: none; margin: 0px 0px 3px 2px; font-size: 32px;">favorite</span>
														<span id="emptyHeart${feed.f_idx }"
															class="material-icons-outlined"
															style="margin: 0px 0px 3px 2px; font-size: 32px">favorite_border</span>
													</c:otherwise>
												</c:choose>
											</a>
										</div>

										<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 메시지 버튼 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
										<a style="margin-left: 10px;"
											href="javascript:modalAjax(${feed.f_idx })"> <span
											class="material-symbols-outlined"
											style="font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 20; margin: 1px 0px 0px 2%; font-size: 30px;">
												chat_bubble </span>
										</a>
										<!-- --------------------------------------------------------------------------------------------------------------------- -->



										<!---------------------- 게시물 즐겨찾기 상태 설정 -------------------------- -->
										<%-- <c:set var="idx" value="${feed.f_idx }" scope="page" /> --%>
										<%
											boolean save = saveList.contains(pageContext.getAttribute("feedIdx"));
										pageContext.setAttribute("save", save);
										%>
										<!-- ------------------------------------------------------------- -->
										<!------------------------------------ 저장하기 버튼 ------------------------------------>
										<c:choose>
											<c:when test="${save }">
												<a href="javascript:saveFeed(${feed.f_idx })"
													style="display: inline-flex; float: right; margin: 0px 15px 0px 0px; font-size: 32px;">
													<span id="fillSave${feed.f_idx }"
													class="material-icons-outlined"
													style="display: inline; margin: 0px 0px 0px 0px; font-size: 32px;">
														bookmark </span> <span id="emptySave${feed.f_idx }"
													class="material-icons-outlined"
													style="display: none; float: right; margin: 0px 0px 0px 0px; font-size: 32px;">
														bookmark_border </span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:saveFeed(${feed.f_idx })"
													style="display: inline-flex; float: right; margin: 0px 15px 0px 0px; font-size: 32px;">
													<span id="fillSave${feed.f_idx }"
													class="material-icons-outlined"
													style="display: none; float: right; margin: 0px 0px 0px 0px; font-size: 32px;">
														bookmark </span> <span id="emptySave${feed.f_idx }"
													class="material-icons-outlined"
													style="display: inline; margin: 0px 0px 0px 0px; font-size: 32px;">
														bookmark_border </span>

												</a>
											</c:otherwise>
										</c:choose>
										<!-- ---------------------------------------------------------------------------- -->
									</div>
									<div
										style="padding: 0 0 3px 0px; font-weight: bold; font-size: 15px; margin: 10px 0; margin-left: 10px;">
										좋아요 <span id="countLike${feed.f_idx}">${feed.countLike }</span>
										개
									</div>
									<c:if test="${feed.f_pic != null }">
										<div class="contentBox">
											<b>${feed.u_id }</b>&nbsp;&nbsp; ${feed.content }
										</div>
									</c:if>
									<hr id="x">
									<div id="commDiv${feed.f_idx }" style="margin-left: 15px;">
										<c:if test="${feed.comm.size() > 2 }">
											<a style="display: inline-flex; color: grey"
												href="javascript:modalAjax(${feed.f_idx })">댓글
												<p id="commCNT${feed.f_idx }">${feed.comm.size() }</p>개 모두
												보기
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
											<b style="margin: 5px 20px 5px 0; display: inline-flex;">
												${comm.getU_id() }</b>  ${comm.getComm() }<br>
										</c:forEach>
									</div>
									<br>
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
		$(document)
				.ready(
						function() {
							$(window)
									.scroll(
											function() {
												if ($(window).scrollTop() == $(
														document).height()
														- $(window).height()) {

													let likeList = ${ likeList };
													let myFidxList = ${ myFidxList };
													let saveList = ${ saveList };
													nowPage++;
													$
															.ajax(
																	"nextFeed.do",
																	{
																		type : "get",
																		data : {
																			"u_id" : "${userVO.u_id}",
																			"nowPage" : nowPage
																		},
																		dataType : "json",
																		success : function(
																				data) {
																			var dispHtml = "";

																			$
																					.each(
																							data,
																							function(
																									index,
																									obj) {
																								
																								dispHtml += '<div id="post' + obj.f_idx + '" style="background-color: white;display: flex;flex-direction: column;align-items: center;margin: 30px;border: solid 0.5px silver;border-radius: 5px;">'
																								dispHtml += '<div class="row col-6" id="k1" style="-bs-gutter-x: 0;margin-top: 0px;margin-bottom: 0px;border-bottom: solid 0.5px silver;border-top-left-radius: 5px;border-top-right-radius: 5px;">';
																								dispHtml += '<div class="col-12">';
																								dispHtml += '<div class="d-flex gap-2 w-100 justify-content-between">';
																								dispHtml += '<div>';
																								dispHtml += '<a href="otherFeed.do?u_id=' + obj.u_id + '" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none text-center"style="background-color: white;"> <img src="../img_src/profile/' + obj.u_pic + '" width="45" height="45" class="rounded-circle flex-shrink-0" style="border-radius: 70%">';
																								dispHtml += '<span class="mb-0" style="font-size: 20px; margin: 10px 20px; font-weight: bold;">' + obj.u_id + '</span>'
																								dispHtml += '</a></div>'
																								
																								if(myFidxList.includes(obj.f_idx)) {
																									dispHtml += '<div class="dropdown" style="display: flex;align-items: center;font-size: 30px;">';
																									dispHtml += '<button onclick="myFunction(' + obj.f_idx + ')" class="dropbtn" style="background-color: white;border: none;margin-bottom: 15px;">...</button>';
																									dispHtml += '<div id="myDropdown' + obj.f_idx + '" class="dropdown-content" style="font-size: 15px; margin-top: 100px;">';
																									dispHtml += ' <a href="goUpdate.do?f_idx=' + obj.f_idx + '">edit</a>';
																									dispHtml += ' <a href="javascript:deleteFeed(' + obj.f_idx + ', true)">delete</a>';
																									dispHtml += '</div></div>';
																								}
																								dispHtml += '</div></div>';
																								dispHtml += '<div class="col-12 square"	style="display: flex; align-items: center;">';
																								dispHtml += '<div class="inner" style="display: flex; justify-content: center; align-items: center; font-weight: bold;">';
																								if (obj.f_pic == null) {
																									dispHtml += obj.content;
																								}
																								if (obj.f_pic != null) {
																									dispHtml += '<img src="../img_src/feed/' + obj.f_pic + '" class="inner1">';
																								}
																								dispHtml += '</div></div>';
																								
																								dispHtml += '<div class="col-12" style="margin-top: 10px; margin-bottom: 10px;">';
																								dispHtml += '<div>';
																								dispHtml += '<div class="likeCommentBox" style="margin-left: 5px;">';

																								dispHtml += '<a href="javascript:likeFeed(' + obj.f_idx + ')">';
																								if (likeList.includes(obj.f_idx)) {
																									dispHtml += '<span id="fillHeart' + obj.f_idx + '" class="material-symbols-outlined likeFill" style="margin: 0px 0px 3px 2px; font-size: 32px; display: inline;">favorite</span>';
																									dispHtml += '<span id="emptyHeart' + obj.f_idx + '" class="material-icons-outlined" style="display: none; margin: 0px 0px 3px 2px; font-size: 32px;">favorite_border</span>';
																								} else {
																									dispHtml += '<span id="fillHeart' + obj.f_idx + '" class="material-symbols-outlined likeFill" style="margin: 0px 0px 3px 2px; font-size: 32px; display: none;">favorite</span>';
																									dispHtml += '<span id="emptyHeart' + obj.f_idx + '" class="material-icons-outlined" style="display: inline; margin: 0px 0px 3px 2px; font-size: 32px;">favorite_border</span>';
																								}
																								dispHtml += '</a></div>';

																								/* <!-- 메시지 버튼 --> */
																								dispHtml += '<a style="margin-left: 10px;" href="javascript:modalAjax(' + obj.f_idx + ')">';
																								dispHtml += '<span class="material-symbols-outlined" style="font-variation-settings: \'FILL\' 0, \'wght\' 400, \'GRAD\' 0, \'opsz\' 20; margin: 1px 0px 0px 2%; font-size: 30px;">chat_bubble</span>';
																								dispHtml += '</a>';
																								/* <!------------------------------------ 저장하기 버튼 ------------------------------------> */
																								if (saveList
																										.includes(obj.f_idx)) {
																									dispHtml += '<a href="javascript:saveFeed(' + obj.f_idx + ')" style="display: inline-flex; float: right; margin: 0px 15px 0px 0px; font-size: 32px;">';
																									dispHtml += '<span id="fillSave' + obj.f_idx + '" class="material-icons-outlined" style="display: inline; float: right; margin: 0px; font-size: 32px;"> bookmark </span>';
																									dispHtml += '<span id="emptySave' + obj.f_idx + '" class="material-icons-outlined" style="display: none; margin: 0px; font-size: 32px;">bookmark_border </span>';
																									dispHtml += '</a>';
																								} else {
																									dispHtml += '<a href="javascript:saveFeed(' + obj.f_idx + ')" style="display: inline-flex; float: right; margin: 0px 15px 0px 0px; font-size: 32px;">';
																									dispHtml += '<span id="fillSave' + obj.f_idx + '" class="material-icons-outlined" style="display: none; float: right; margin: 0px; font-size: 32px;"> bookmark </span>';
																									dispHtml += '<span id="emptySave' + obj.f_idx + '" class="material-icons-outlined" style="display: inline; margin: 0px; font-size: 32px;">bookmark_border </span>';
																									dispHtml += '</a>';
																								}

																								/* <!-- ---------------------------------------------------------------------------- --> */
																								dispHtml += '</div>';
																								dispHtml += '<div style="padding: 0 0 3px 5px; font-weight: bold; font-size: 15px; margin: 10px 0;margin-left: 10px;">';
																								dispHtml += '좋아요 <span id="countLike' + obj.f_idx + '">' + obj.countLike + '</span>개';
																								dispHtml += '</div>';
																								if (obj.f_pic != null) {
																									dispHtml += '<div class="contentBox">';
																									dispHtml += '<b>' + obj.u_id + '</b> &nbsp;&nbsp; ' + obj.content;
																									dispHtml += '</div>';
																								}
																								dispHtml += '<hr id="x">';
																								dispHtml += '<div id="commDiv' + obj.f_idx + '" style="margin-left: 15px;">';
																								if (obj.comm.length > 2) {
																									dispHtml += '<a style="display: inline-flex; color: grey" href="javascript:modalAjax(' + obj.f_idx + ')">';
																									dispHtml += '댓글 <p id="commCNT' + obj.f_idx + '">' + obj.comm.length + '</p>개 모두 보기';
																									dispHtml += '</a><br>';
																								}
																								let twoComm = 0;
																								$.each( obj.comm,function( idx,obj2) {
																									twoComm++;
																									if (twoComm == 3) {
																										return false;
																									}
																									dispHtml += '<b style="margin: 5px 20px 5px 0; display: inline-flex;"> '+ obj2.u_id +' </b>';
																									dispHtml += obj2.comm + '<br>';
																								});
																								dispHtml += '</div>';
																								dispHtml += '<br>';
																								dispHtml += '</div>';
																								dispHtml += '</div>';
																								dispHtml += '</div>';
																							});
																			$(
																					"#feedBox")
																					.append(
																							dispHtml);
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
			var countLike = Number($('#countLike' + f_idx).html()) + 0;

			$
					.ajax(
							"likeFeed.do",
							{
								type : "get",
								data : {
									"f_idx" : fIdx,
									"u_id" : uId
								},
								dataType : "text",
								success : function(data) {
									console.log("성공~~~");
									console.log(data);
									if (data == '1') {
										console.log('좋아요 처리');
										document.getElementById("fillHeart"
												+ f_idx).style.display = "inline";
										document.getElementById("emptyHeart"
												+ f_idx).style.display = "none";
										countLike++;
										$('#countLike' + f_idx).html(countLike);
									} else {
										console.log('좋아요 삭제 처리');
										document.getElementById("fillHeart"
												+ f_idx).style.display = "none";
										document.getElementById("emptyHeart"
												+ f_idx).style.display = "inline";
										countLike--;
										$('#countLike' + f_idx).html(countLike);
									}

								},
								error : function() {
									alert("실패~~~");
								}
							});
		}
		function deleteFeed(f_idx, bool) {
			var result = confirm("게시물을 삭제 하시겠습니까?")
			if(result == true) {
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
							if(bool != true) {
								$("#popupLabel").click();								
							}
						},
						error : function() {
							alert("실패~~~");
						}
					});
			}
		}

		function myFunction(f_idx) {
			  document.getElementById("myDropdown" + f_idx).classList.toggle("show");
			}

		function modalFunction(f_idx) {
			  document.getElementById("modalDropdown" + f_idx).classList.toggle("show");
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
			$
					.ajax(
							"modal.do",
							{
								type : "get",
								data : {
									"f_idx" : f_idx
								},
								dataType : "json",
								success : function(data) {
									var dispHtml = "";
									console.log("성공~~~");
									console.log(data);
									dispHtml += '<div class="container"style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">';
									dispHtml += '<div class="row square" style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">';
									/* <!-- 왼 --> */
									if (data.fvo.f_pic != null) {
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
												
											dispHtml += '<div class="dropdown" style="margin-left: 270px;font-size: 30px;">';
											dispHtml += '<button onclick="modalFunction(' + data.fvo.f_idx + ')" class="dropbtn" style="background-color: white;padding-bottom: 15px;border: none;">...</button>';
											dispHtml += '<div id="modalDropdown' + data.fvo.f_idx + '" class="dropdown-content" style="font-size: 15px;">';
											dispHtml += '<a href="goUpdate.do?f_idx=' + data.fvo.f_idx + '">edit</a>';
											dispHtml += '<a href="javascript:deleteFeed(' + data.fvo.f_idx + ')">delete</a>';
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
												
											dispHtml += '<div class="dropdown" style="margin-left: 270px;font-size: 30px;">';
											dispHtml += '<button onclick="modalFunction(' + data.fvo.f_idx + ')" class="dropbtn" style="background-color: white;padding-bottom: 15px;border: none;">...</button>';
											dispHtml += '<div id="modalDropdown' + data.fvo.f_idx + '" class="dropdown-content" style="font-size: 15px;">';
											dispHtml += '<a href="goUpdate.do?f_idx=' + data.fvo.f_idx + '">edit</a>';
											dispHtml += '<a href="javascript:deleteFeed(' + data.fvo.f_idx + ')">delete</a>';
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
										dispHtml += '<small class-"opacity-50 text-nonwrap">' + obj.regdate + '</small>';
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
		
		
		function saveFeed(f_idx) {
			$
					.ajax(
							"saveFeed.do",
							{
								type : "get",
								data : {
									"f_idx" : f_idx,
									"u_id" : '${userVO.u_id}'
								},
								dataType : "text",
								success : function(data) {
									console.log("성공~~~");
									console.log(data);
									if (data == 1) {
										console.log('즐겨찾기 처리');
										document.getElementById("fillSave"
												+ f_idx).style.display = "inline";
										document.getElementById("emptySave"
												+ f_idx).style.display = "none";
									} else {
										console.log('즐겨찾기 해제 처리');
										document.getElementById("emptySave"
												+ f_idx).style.display = "inline";
										document.getElementById("fillSave"
												+ f_idx).style.display = "none";
									}
								},
								error : function() {
									alert("실패~~~");
								}
							});
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
									dispHtml += '<small class="opacity-50 text-nowrap">방금전</small>';
									dispHtml += '</div></a>';
									$("#commBox").append(dispHtml);
									$('#commBox').scrollTop(
											$('#commBox')[0].scrollHeight);
								},
								error : function() {
									alert("실패~~~");
								}
							});
			console.log("댓글수 : " + $("#commDiv" +f_idx).children("b").length);
			if( $("#commDiv" +f_idx).children("b").length < 2) {
				$("#commDiv" + f_idx).append('<b style="margin:5px 20px 5px 0; display: inline-flex;"> ${userVO.u_id}</b>' + $("#commBlock").val() + '<br>');
			} else if ($("#commDiv" +f_idx).children("b").length == 2)  {
				if ($("#commDiv" +f_idx).children("a").length == 0) {
					var aTag = "";
					aTag += '<a style="display: inline-flex; color: grey" href="javascript:modalAjax(' + f_idx + ')">댓글';
					aTag += '<p id="commCNT' + f_idx + '">3</p>개 모두 보기';
					aTag += '</a>';
					aTag += '<br>';
					$("#commDiv" + f_idx).prepend(aTag);
				} else {
					var commCNT = $("#commCNT" + f_idx).html();
					console.log(commCNT);
					commCNT++;
					$("#commCNT" + f_idx).html(commCNT);
				}
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>





</html>

