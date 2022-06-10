<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
html, body {
	width: 100%;
	height: 100%;
}

.chat_header {
	margin-bottom: 10px;
}

.chat_list {
	border: 1px solid silver;
	width: 500px;
	height: 600px;
	margin-top: 30px;
	margin-left: 25px;
	display: inline-flex;
	float: left;
}

.my_chat_message {
	height: 85%;
	overflow-y: auto;
	direction: ltr;
}

.chat_content_start {
	margin: 3px 3px 3px 3px;
	padding: 10px 10px 10px 10px;
	align-self: center;
	background-color: #f5f5f5;
	border-radius: 30px;
	margin-left: 10px;
	max-width: 250px;
}

.chat_content_end {
	margin: 3px 3px 3px 3px;
	padding: 10px 10px 10px 10px;
	align-self: center;
	background-color: #f5f5f5;
	border-radius: 30px;
	margin-right: 10px;
	max-width: 300px;
}

.chat_body {
	background-color: f6f7f7;;
	width: 1250px;
	height: 600px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 75px;
	text-align: center;
}

.box {
	border-radius: 50%;
	width: 56px;
	height: 56px;
	display: inline-block;
	text-align: center;
	overflow: hidden;
	border: 1px solid gray;
}

.img_box {
	margin-top: 2px;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	display: inline-block;
	overflow: hidden;
	border-radius: 50%;
}

.img_size {
	max-width: 100%;
	object-fit: cover;
	display: block;
	margin: auto;
	display: block;
	object-fit: cover;
}

.time {
	font-size: 12px;
	color: gray;
	float: right;
}

.sm_id {
	color: gray;
}

.display_flex {
	display: inline-flex;
}

.display_block {
	display: inline-block;
}

.chatlist

a:hover {
	background-color: f6f7f7;
}
</style>
<style>
input[id*="popup"]+label {
	position: absolute;
} /* 예제파일 확인시 가운데 정렬 스타일 - 삭제 후 사용하세요 */
* {
	padding: 0;
	margin: 0;
	line-height: 1;
} /* 기본 브라우저 리셋 스타일 */
input[id*="popup"] {
	display: none;
}

input[id*="popup"]+label {
	display: inline-block;
	color: black
}

input[id*="popup"]+label+div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

input[id*="popup"]+label+div>div {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 300px;
	background: #fff;
	z-index: 2;
}

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

input[id*="popup"]+label+div>label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .9);
	z-index: 1;
}
/*
input[id*="popup"] + label + div {display:none;}
input[id*="popup"]:checked + label + div {display:block;}
*/
input[id*="popup"]+label+div {
	opacity: 0;
	visibility: hidden;
	transition: all 1s;
}

input[id*="popup"]:checked+label+div {
	opacity: 1;
	visibility: visible;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>insidergram : DM test</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="h-100 w-100 position-fixed"
		style="background-color: #F5F5F5; margin-top: 50px;">

		<div class="container h-100 pt-3 pb-3 " style="width: 1250px;">
			<div class="row h-100 pb-5">
				<div class="shadow-sm mb-5 bg-body rounded col-4 border"
					style="padding: 0; overflow-y: auto; overflow-x: hidden;">
					<div style="height: 59px;">
						<!-- 팝업창 여기부터 -->
						<input type="checkbox" id="popup">
						<!-- 버튼 클릭시 팝업창 오픈 -->

						<label for="popup"
							><span
							class="material-symbols-outlined " style="font-variation-settings: 'FILL' 0, 'wght' 500, 'GRAD' 0, 'opsz' 20; margin: 20px;"> chat_bubble </span> </label>
						
						<div>
							<div style="border-radius: 5px; height: 400px;">
								<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
								<label for="popup"></label>
								<!-- 내용 추가 -->
								<b style="margin: 20px; display: flex;">새로운 메시지..</b> <input
									class="form-control rounded-3" type="text" name=u_id
									id="searchBox" placeholder=" 검색" onkeyup="searchID()" required
									style="border-radius: 7px;">
								<div id="headerBox" class="d-flex p-3 row"
									style="width: 100%; overflow: auto; height: 300px;">&nbsp;&nbsp;검색결과</div>
							</div>
							<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
							<label for="popup" id="close"></label>
						</div>
						<a href="../../biz/user/getMyFeed.do">
						<div style="font-size : 25px; font-weight: bold; padding :15px 0; text-align:center;"> ${userVO.u_id }</div>
						</a>
					</div>
					<!-- 여기까지  -->
					<div id="chatHeaderList" class="border-top"
						style="overflow-x: hidden; overflow-y: auto; padding: 10px 10px 0 10px;">
						<c:forEach var="vo" items="${chatHeaderList }">
							<c:if test="${vo.from_id eq userVO.u_id }">
								<a id="hId${vo.h_idx }" class="row d-flex chat_header"
									href="javascript:getChatMessageList(${vo.h_idx }, '${userVO.u_id }')">
									<div class="col-3" style="    width: 20%;">
										<div class="box">
											<div class="img_box">
												<img id="img${vo.h_idx }" class="img_size"
													src="../img_src/profile/${vo.u_pic }">
											</div>
										</div>
									</div>
									<div class="col-6" style="text-overflow: ellipsis;  margin: 5px 0 5px 0;">
										<c:if test="${ vo.from_status eq '0'}">
											<div>
												<p id="u_id${vo.h_idx }"
													style="font-weight: bolder; margin: 0;">${vo.to_id }</p>
												<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
											</div>
										</c:if>
										<c:if test="${vo.from_status ne '0' }">
											<div>
												<p id="u_id${vo.h_idx }" style="margin: 0;">${vo.to_id }</p>
												<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
											</div>
										</c:if>
									</div>
									<div class="col-3">
										<small class="time" id="time${vo.h_idx }">${vo.time }</small>
									</div>
								</a>
							</c:if>
							<c:if test="${vo.from_id ne userVO.u_id }">
								<a id="hId${vo.h_idx }" class="row d-flex chat_header"
									href="javascript:getChatMessageList(${vo.h_idx }, '${userVO.u_id }')">
									<div class="col-3" style="    width: 20%;">
										<div class="box">
											<div class="img_box">
												<img id="img${vo.h_idx }" class="img_size "
													src="../img_src/profile/${vo.u_pic }">
											</div>
										</div>
									</div>
									<div class="col-6" style="text-overflow: ellipsis;     margin: 5px 0 5px 0; ">
										<c:if test="${ vo.to_status eq '0'}">
											<div>
												<p id="u_id${vo.h_idx }"
													style="font-weight: bolder; margin: 0;">${vo.from_id }</p>
												<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
											</div>
										</c:if>
										<c:if test="${vo.to_status ne '0' }">
											<div>
												<p id="u_id${vo.h_idx }" style="margin: 0;">${vo.from_id }</p>
												<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
											</div>
										</c:if>
									</div>
									<div class="col-3">
										<small class="time" id="time${vo.h_idx }">${vo.time }</small>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="shadow-sm p-0 mb-5 bg-body rounded col-8 h-100 border">
					<div class="h-100 position-relative" id="chatMessageView">
						<h1 style="text-align: center;">채팅할 상대를 찾아주세요!</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(window).on('load', function() {
			var from_hid = '${h_idx}';
			console.log('window.onload>>' + from_hid);
			if (from_hid == '') {

			} else {
				getChatMessageList(from_hid, '${userVO.u_id}');
			}
		});
		var nowChatHeaderIdx = 0;

		function getChatMessageList(h_idx, u_id) {
			nowChatHeaderIdx = h_idx;
			var id = "u_id" + h_idx;
			document.getElementById(id).style.fontWeight = "normal";

			var imgSrc = document.getElementById("img" + h_idx).src;
			var target = document.getElementById("u_id" + h_idx).innerText;
			$
					.ajax(
							"getChatMessageList.do",
							{
								type : "get",
								data : "h_idx=" + h_idx,
								dataType : "json",
								success : function(data) {
									console.log(data);

									var my_id = u_id;
									let dispHtml = "";
									dispHtml += "<a href=\"../user/otherFeed.do?u_id="
											+ target + "\">"
									dispHtml += "<div style=\"height:60px;\" class=\"d-flex align-items-center border-bottom\">"
									dispHtml += "<div style=\"height:40px; width:40px; overflow:hidden; border-radius:50%; margin-left:10px;\" class=\"border\">"
									dispHtml += "<img src=\"" + imgSrc + "\" class=\"img_size\">"
									dispHtml += "</div>"
									dispHtml += "<div style=\"font-weight:bolder; margin-left:10px;\">"
									dispHtml += target;
									dispHtml += "</div>"
									dispHtml += "</div>"
									dispHtml += "</a>"
									dispHtml += "<div class=\"my_chat_message\" id=\"chatMessageContainer\" style=\"padding:10px 10px 0 10px\">";
									$
											.each(
													data,
													function(index, obj) {
														if (obj.u_id == my_id) {
															dispHtml += "<div class=\"d-flex justify-content-end\" style=\"margin-bottom:10px;\">";
															dispHtml += "<div class=\"chat_content_end\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "<a href=\"../user/otherFeed.do?u_id="
																	+ obj.u_id
																	+ "\">";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size\" src=\"../img_src/profile/"+ obj.u_pic +"\">"
															dispHtml += "</div>";
															dispHtml += "</div>";
															dispHtml += "</a>";
															dispHtml += "</div>"
														} else {
															dispHtml += "<div class=\"d-flex justify-content-start\" style=\"margin-bottom:10px;\">";
															dispHtml += "<a href=\"../user/otherFeed.do?u_id="
																	+ obj.u_id
																	+ "\">";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size \" src=\"../img_src/profile/" + obj.u_pic + "\">"
															dispHtml += "</div>";
															dispHtml += "</div>";
															dispHtml += "</a>";
															dispHtml += "<div class=\"chat_content_start\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "</div>"
														}
													});
									dispHtml += "</div>";
									dispHtml += "<div class=\"row position-absolute bottom-0 start-0\" style=\"width: 100%; padding:0 10px 10px 10px\">";
									dispHtml += "<div class=\"col-11\">";
									dispHtml += "<input class=\"form-control\" type=\"text\" name=\"content\" id=\"content\" style=\"border-radius: 30px; width: 100%; margin-left: 10px;\">";
									dispHtml += "</div>";
									dispHtml += "<button class=\"btn btn-primary col-1 \" type=\"submit\" onclick=\"insertChatMessage(\'${userVO.u_id}\', \'${userVO.name }\', \'${userVO.u_pic }\')\" style=\"border-radius: 50%; width: 38px; height: 38px !important; margin: 0 0 0 10px; heig ht: 40px;\">";
									dispHtml += "<span class=\"material-symbols-outlined\" style=\"margin-left:-50%;\">north</span>";
									dispHtml += "</button>";
									dispHtml += "</div>";
									$("#chatMessageView").html(dispHtml);
									$('#chatMessageContainer')
											.scrollTop(
													$('#chatMessageContainer')[0].scrollHeight);
								},
								error : function() {
								}
							});
		}

		function insertChatMessage(u_id, u_name, u_pic) {
			let content = $("#content").val();
			var sid = "subject" + nowChatHeaderIdx;
			var hId = "hId" + nowChatHeaderIdx;
			var timeId = "time" + nowChatHeaderIdx;

			document.getElementById(sid).innerHTML = content;
			document.getElementById(timeId).innerHTML = "방금전";
			var header = document.getElementById("chatHeaderList");
			header
					.insertBefore(document.getElementById(hId),
							header.firstChild);

			$
					.ajax(
							"insertChatMessage.do",
							{
								type : "get",
								data : {
									"h_idx" : nowChatHeaderIdx,
									"content" : content,
									"u_id" : u_id,
									"u_name" : u_name,
									"u_pic" : u_pic
								},
								dataType : "json",
								success : function(data) {
									console.log(data);
									var dispHtml = "";
									$
											.each(
													data,
													function(index, obj) {
														if (obj.u_id == u_id) {
															dispHtml += "<div class=\"d-flex justify-content-end\" style=\"margin-bottom:10px;\">";
															dispHtml += "<div class=\"chat_content_end\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "<a href=\"../user/otherFeed.do?u_id="
																	+ obj.u_id
																	+ "\">";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size\" src=\"../img_src/profile/"+ obj.u_pic +"\">"
															dispHtml += "</div>";
															dispHtml += "</div>";
															dispHtml += "</a>";
															dispHtml += "</div>"
														} else {
															dispHtml += "<div class=\"d-flex justify-content-start\" style=\"margin-bottom:10px;\">";
															dispHtml += "<a href=\"../user/otherFeed.do?u_id="
																	+ obj.u_id
																	+ "\">";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size \" src=\"../img_src/profile/" + obj.u_pic + "\">"
															dispHtml += "</div>";
															dispHtml += "</div>";
															dispHtml += "</a>";
															dispHtml += "<div class=\"chat_content_start\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "</div>"
														}
													});
									$("#chatMessageContainer").html(dispHtml);
									$('#chatMessageContainer')
											.scrollTop(
													$('#chatMessageContainer')[0].scrollHeight);
									$("#content").val("");
								},
								error : function() {
								}
							});
		}
		function searchID() {
			var searchId = $("#searchBox").val();
			console.log(searchId);
			$
					.ajax(
							"../user/seachUser.do",
							{
								type : "get",
								data : "u_id=" + searchId,
								dataType : "json",
								success : function(data) {
									console.log(data);
									var dispHtml = "";
									$
											.each(
													data,
													function(index, obj) {
														dispHtml += '<div class="col-12 d-flex mb-2 align-items-center">';
														dispHtml += '<div class="box">';
														dispHtml += '<div class="img_box">';
														dispHtml += '<img class="img_size " src="../img_src/profile/' + obj.u_pic +'">';
														dispHtml += '</div>';
														dispHtml += '</div>';
														dispHtml += '<div class="flex-grow-1" style="margin-left:10px;">';
														dispHtml += '<p style="margin: 0;">'
																+ obj.u_id
																+ '</p>';
														dispHtml += '<small class="sm_id">'
																+ obj.name
																+ '</small>';
														dispHtml += '</div>';
														dispHtml += '<div>';
														dispHtml += '<a href="javascript:createChat(\'${userVO.u_id}\',\''
																+ obj.u_id
																+ '\')" style="color:#121212; font-variation-settings: \'FILL\' 0, \'wght\' 500, \'GRAD\' 0, \'opsz\' 20;vertical-align: middle;" class="material-symbols-outlined">mark_chat_read</a>';
														dispHtml += '</div>';
														dispHtml += '</div>';
													});
									$("#headerBox").html(dispHtml);
								},
								error : function() {
								}
							});
		}

		function createChat(my_id, target_id) {
			$
					.ajax(
							"createChat.do",
							{
								type : "get",
								data : {
									"my_id" : my_id,
									"target_id" : target_id
								},
								dataType : "json",
								success : function(data) {
									console.log(data);

									let dispHtml = '';
									$
											.each(
													data,
													function(index, obj) {
														if (obj.from_id == target_id) {
															nowChatHeader = obj.h_idx;
															console
																	.log("nowChatHeader:"
																			+ nowChatHeader);
														} else if (obj.to_id == target_id) {
															nowChatHeader = obj.h_idx;
															console
																	.log("nowChatHeader:"
																			+ nowChatHeader);
														}
														if (obj.from_id == '${userVO.u_id}') {

															dispHtml += '<a id="hId'
																	+ obj.h_idx
																	+ '" class="row d-flex chat_header" href="javascript:getChatMessageList('
																	+ obj.h_idx
																	+ ', \'${userVO.u_id }\')">';
															dispHtml += '<div class="col-3" style="width:20%">';
															dispHtml += '<div class="box">';
															dispHtml += '<div class="img_box">';
															dispHtml += '<img id="img'+ obj.h_idx + '" class="img_size " src="../img_src/profile/' + obj.u_pic +'">';
															dispHtml += '</div>';
															dispHtml += '</div>';
															dispHtml += '</div>';
															dispHtml += '<div class="col-6" style="text-overflow: ellipsis; margin: 5px 0 5px 0;">';
															if (obj.from_status == '0') {
																dispHtml += '<div>';
																dispHtml += '<p id="u_id' + obj.h_idx + '" style="font-weight: bolder; margin: 0;">'
																		+ obj.to_id
																		+ '</p>';
																dispHtml += '<small id="subject'+ obj.h_idx +'" class="sm_id">'
																		+ obj.subject
																		+ '</small>';
																dispHtml += '</div>';
															} else {
																dispHtml += '<div>';
																dispHtml += '<p id="u_id' + obj.h_idx + '" style="margin: 0;">'
																		+ obj.to_id
																		+ '</p>';
																dispHtml += '<small id="subject' + obj.h_idx +'" class="sm_id">'
																		+ obj.subject
																		+ '</small>';
																dispHtml += '</div>';
															}
															dispHtml += '</div>';
															dispHtml += '<div class="col-3">';
															dispHtml += '<small class="time" id="time' + obj.h_idx + '">'
																	+ obj.time
																	+ '</small>';
															dispHtml += '</div>'
															dispHtml += '</a>';
														} else {
															dispHtml += '<a id="hId'
																	+ obj.h_idx
																	+ '" class="row d-flex chat_header"';
															dispHtml += 'href="javascript:getChatMessageList('
																	+ obj.h_idx
																	+ ', \'${userVO.u_id }\')">';
															dispHtml += '<div class="col-3" style="width:20%">';
															dispHtml += '<div class="box">';
															dispHtml += '<div class="img_box">';
															dispHtml += '<img id="img'+ obj.h_idx + '" class="img_size " src="../img_src/profile/' + obj.u_pic + '">';
															dispHtml += '</div>';
															dispHtml += '</div>';
															dispHtml += '</div>';
															dispHtml += '<div class="col-6" style="text-overflow: ellipsis; margin: 5px 0 5px 0;">';
															if (obj.to_status == '0') {
																dispHtml += '<div>';
																dispHtml += '<p id="u_id' + obj.h_idx + '" style="font-weight: bolder; margin: 0;">'
																		+ obj.from_id
																		+ '</p>';
																dispHtml += '<small id="subject' + obj.h_idx +'" class="sm_id">'
																		+ obj.subject
																		+ '</small>';
																dispHtml += '</div>';
															} else {
																dispHtml += '<div>';
																dispHtml += '<p id="u_id' + obj.h_idx + '" style="margin: 0;">'
																		+ obj.from_id
																		+ '</p>';
																dispHtml += '<small id="subject' + obj.h_idx +'" class="sm_id">'
																		+ obj.subject
																		+ '</small>';
																dispHtml += '</div>';
															}
															dispHtml += '</div>';
															dispHtml += '<div class="col-3">';
															dispHtml += '<small class="time" id="time' + obj.h_idx + '">'
																	+ obj.time
																	+ '</small>';
															dispHtml += '</div>'
															dispHtml += '</a>';
														}
													});

									$("#chatHeaderList").html(dispHtml);
									getChatMessageList(nowChatHeader, my_id);
								},
								error : function() {
								}
							});
			$("#close").click();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>