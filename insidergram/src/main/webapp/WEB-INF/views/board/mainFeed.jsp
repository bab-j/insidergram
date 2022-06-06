
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
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
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

/*
	input[id*="popup"] + label + div {display:none;}
	input[id*="popup"]:checked + label + div {display:block;}
	*/

/* 팝업창 나타날 때 자연스럽게 뜨도록 처리함(애니메이션 효과) */
input[id*="popup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 1s;
}

input[id*="popup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}

.material-symbols-outlined {
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
var nowPage = 1;
function debounce(callback, limit = 100) {
    let timeout
    return function(...args) {
        clearTimeout(timeout)
        timeout = setTimeout(() => {
            callback.apply(this, args)
        }, limit)
    }
}
document.addEventListener("scroll", debounce(e => {
    
    // clientHeight : 웹 브라우저 창의 높이
    // scrollTop : 현재 스크롤된 부분의 맨 위의 높이
    // scrollHeight : 문서의 총 높이 (= 스크롤의 총 높이)
    // 스크롤의 마지막에 도달 : clientHeight + scrollTop >= scrollHeight
    const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement
    if(clientHeight + scrollTop >= scrollHeight) {
    	let likeList = ${likeList};
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
							
								dispHtml += '<div class="oneFeed" style="border: 1px solid black">'
									dispHtml += '<span class=profileIMG style="border: 1px solid orange"> <a'
									dispHtml += 'href="getIndiFeed.do?u_id=' + obj.u_id + '"><img '
									dispHtml += 'src=' + obj.u_pic + '>' + obj.u_id + '</a>'
									dispHtml += '</span>'
									dispHtml += '<div class="feedIMG" style="border: 1px solid blue">'
										dispHtml += '<img src="../img_src/feed/' + obj.f_pic + '">'
									dispHtml += '</div>'
									dispHtml += '<div class="contentBox" style="border: 1px solid red">'
									dispHtml += obj.content + '</div>'
									dispHtml += '<div class="likeCommentBox">'
									dispHtml += '<a href="javascript:likeFeed(' + obj.f_idx + '">'
									if(likeList.includes(obj.f_idx)) {
										dispHtml += '<span id="fillHeart' + obj.f_idx + '" class="material-symbols-outlined">favorite</span>'
										dispHtml += '<span id="emptyHeart' + obj.f_idx + '" class="material-icons-outlined" style="display: none; margin-top: 0px;">favorite_border</span>'
									} else {
										dispHtml += '<span id="fillHeart' + obj.f_idx + '" class="material-symbols-outlined" style="display:none;">favorite</span>'
										dispHtml += '<span id="emptyHeart' + obj.f_idx + '" class="material-icons-outlined" margin-top: 0px;">favorite_border</span>'
									}
									dispHtml += '</a> 좋아요';
									dispHtml += '<p id="countLike${feed.f_idx}">${feed.countLike }</p>개'
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
}, 200))
	
</script>
</head>

<body style="background-color: #F5F5F5;">



	<jsp:include page="../../../header.jsp"></jsp:include>
	<!-- upside bar -->

	<br>
	<br>

	<div class="container"
		style="display: flex; flex-direction: column-reverse; align-content: space-around; flex-wrap: wrap;">
		<%
		List<String> list = (List<String>) request.getAttribute("likeList");
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
							<a href="getIndiFeed.do?u_id=${feed.u_id }"
								class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
								style="background-color: white;"> <img
								src="../img_src/profile/${userVO.u_pic } " width="45"
								height="45" class="rounded-circle flex-shrink-0"
								style="border-radius: 70%">

								<div class="d-flex gap-2 w-100 justify-content-between">

									<div>
										<h6 class="mb-0" style="margin-left: 15px;">${feed.u_id }</h6>
									</div>

									<div href="#">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-three-dots"
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
								<!-- 중간 이미지 -->
								<img src="../img_src/feed/${feed.f_pic }" class="inner1">

							</div>
						</div>
						<div class="col-12" style="margin-top: 10px; margin-bottom: 10px;">
							<div>
								<div class="likeCommentBox">
									<!---------------------- 게시물 좋아요 상태 설정 -------------------------- -->
									<c:set var="feedIdx" value="${feed.f_idx }" scope="page" />
									<%
									boolean like = list.contains(pageContext.getAttribute("feedIdx"));
									pageContext.setAttribute("like", like);
									%>
									<!-- ------------------------------------------------------------- -->
									<!-- 하트 버튼 -->
									<!-- 							<a>  
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="currentColor" class="bi bi-suit-heart"
									viewBox="0 0 16 16" ">
								<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
								</svg>
							</a>
 -->
									<a href="javascript:likeFeed(${feed.f_idx})"> <c:choose>
											<c:when test="${like }">
												<span id="fillHeart${feed.f_idx }"
													class="material-symbols-outlined"
													style="margin: 2px 0px 0px 2%;">favorite</span>
												<span id="emptyHeart${feed.f_idx }"
													class="material-icons-outlined"
													style="display: none; margin: 2px 0px 0px 2%;">favorite_border</span>
											</c:when>
											<c:otherwise>
												<span id="fillHeart${feed.f_idx }"
													class="material-symbols-outlined"
													style="display: none; margin: 2px 0px 0px 2%;">favorite</span>
												<span id="emptyHeart${feed.f_idx }"
													class="material-icons-outlined"
													style="margin: 2px 0px 0px 2%;">favorite_border</span>
											</c:otherwise>
										</c:choose>
									</a>
								</div>
								<!-- 메시지 버튼 -->
								<input type="checkbox" id="popup1">
								<!-- 버튼 클릭시 팝업창 오픈 -->
								<label for="popup1" style="padding: 3px 10px 3px 0px;">
									<a style="margin-left: 10px;"> <svg
											xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
							<path
												d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
						</svg>
								</a>
								</label>
								<div>
									<div>
										<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
										<label for="popup1"></label>
										<!-- 내용 추가 -->
										<div class="container"
											style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">
											<div class="row square"
												style="margin: 0px; padding: 0px; width: 1200px; height: 550px;">
												<!-- 오른쪽 -->
												<div class="col-6"
													style="margin: 0px; padding: 0px; height: 550px;">
													<!-- 이미지 -->
													<img src="../img_src/test/1.jpg" class="card-img-top"
														style="height: 550px; border-radius: 0px;">

												</div>

												<!-- 원쪽 -->
												<div class="col-6"
													style="margin: 0px; padding: 0px; height: 550px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">

													<!-- 상단 닉네임 -->
													<a href="#"
														class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
														style="height: 80px; background-color: white;"> <img
														src="../img_src/test/kim.jpg" width="40" height="40"
														class="rounded-circle flex-shrink-0"
														style="margin-left: 20px;">
														<div class="d-flex gap-2 w-100 justify-content-between">
															<div>
																<h6 class="mb-0" style="margin-left: 15px;">${feed.u_id }</h6>

															</div>
															<div href="#">
																<svg xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="currentColor"
																	class="bi bi-three-dots" viewBox="0 0 16 16">
													<path
																		d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />
												</svg>
															</div>
														</div>
													</a>

													<!-- 채팅창 -->
													<div
														style="width: 600px; height: 424px; overflow-y: auto; background-color: white;">

														<a href="#"
															class="list-group-item list-group-item-action d-flex gap-3 py-3"
															aria-current="true"
															style="border: none; height: 100px; margin-top: 0px;">
															<img src="../img_src/test/kim.jpg" width="40" height="40"
															class="rounded-circle flex-shrink-0">
															<div class="d-flex gap-2 w-100 justify-content-between">
																<div>
																	<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
																	<p class="mb-0 opacity-75"
																		style="padding-top: 10px; width: 300px;">해적왕</p>
																</div>
																<small class="opacity-50 text-nowrap">3분전</small>
															</div>
														</a> <a href="#"
															class="list-group-item list-group-item-action d-flex gap-3 py-3"
															aria-current="true"
															style="border: none; height: 100px; margin-top: 0px;">
															<img src="../img_src/test/kim.jpg" width="40" height="40"
															class="rounded-circle flex-shrink-0">
															<div class="d-flex gap-2 w-100 justify-content-between">
																<div>
																	<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
																	<p class="mb-0 opacity-75"
																		style="padding-top: 10px; width: 300px;">그는 누구인가..
																	</p>
																</div>
																<small class="opacity-50 text-nowrap">3분전</small>
															</div>
														</a>

													</div>

													<!-- 메시지 보내기 -->
													<div class="input-group mb-3">
														<input style="height: 45px; border-radius: initial;"
															type="text" class="form-control" placeholder="메시지 입력..."
															aria-label="Recipient's username"
															aria-describedby="button-addon2">
														<button class="btn btn-outline-primary" type="button"
															id="button-addon2"
															style="background-color: #0d6efd; color: white; border-top-right-radius: inherit;">
															<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor" class="bi bi-arrow-up"
																viewBox="0 0 16 16">
											<path fill-rule="evenodd"
																	d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z" />
										</svg>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
									<label for="popup1"></label>
								</div>

								<!-- 저장하기 버튼 -->
								<a style="display: inline-flex; padding: 3px 0 0 43px;"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-bookmark-star"
										viewBox="0 0 16 16">
						
						<path
											d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
					</svg>
								</a>
							</div>
							<hr style="border: 1px solid silver;">
							<div
								style="padding: 0 0 3px 5px; font-weight: bold; font-size: 15px;">
								좋아요 <span id="countLike${feed.f_idx}">${feed.countLike }</span> 개</div>
							<div class="contentBox">
								<b>${feed.u_id }</b>&nbsp;&nbsp; ${feed.content }
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>










	<%-- ${userVO }
	<!-- session : 로그인한 유저 정보 -->
	${feedList } --%>
	<!-- mo : 팔로워한 게시물 리스트 -->
	<%-- ${likeList } --%>
	<!-- mo : 좋아요한 계시물 번호 리스트 -->
	<%-- <c:set var="likeList" value="${likeList }" scope="request" /> --%>

	<!-- 피드 게시물 -->
	<div id="feedBox" class="feedBox" style="border: 1px solid black">
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
							<%-- 	<!---------------------- 게시물 좋아요 상태 설정 -------------------------- -->
							<c:set var="feedIdx" value="${feed.f_idx }" scope="page" />
							<%
								boolean like = list.contains(pageContext.getAttribute("feedIdx"));
							pageContext.setAttribute("like", like);
							%>
							<!-- ------------------------------------------------------------- -->
							<a href="javascript:likeFeed(${feed.f_idx})"> <c:choose>
									<c:when test="${like }">
										<span id="fillHeart${feed.f_idx }"
											class="material-symbols-outlined">favorite</span>
										<span id="emptyHeart${feed.f_idx }"
											class="material-icons-outlined"
											style="display: none; margin-top: 0px;">favorite_border</span>
									</c:when>
									<c:otherwise>
										<span id="fillHeart${feed.f_idx }"
											class="material-symbols-outlined" style="display: none;">favorite</span>
										<span id="emptyHeart${feed.f_idx }"
											class="material-icons-outlined" style="margin-top: 0px;">favorite_border</span>
									</c:otherwise>
								</c:choose>
							</a> 좋아요
							<p id="countLike${feed.f_idx}">${feed.countLike }</p>
							개 --%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
		
	</script>
</html>

