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
html, body {
	width: 100%;
	height: 100%;
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
	height: 94%;
    overflow-y: auto;
    direction: ltr;
}
.chat_content_start {
	padding: 10px 10px 10px 10px;
	background-color: #f5f5f5;
	border-radius: 30px;
	margin-left: 10px
}

.chat_content_end {
	padding: 10px 10px 10px 10px;
	background-color: #f5f5f5;
	border-radius: 30px;
	margin-right:10px;
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
.sm_id {
	color:gray;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>insidergram : DM test</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="h-100 w-100 position-fixed"
		style="background-color: #F5F5F5; margin-top:50px;">

		<div class="container h-100 pt-3 pb-3 " style="width: 1250px;""">
			<div class="row h-100 pb-5">
				<div
					class="shadow-sm p-3 mb-5 bg-body rounded col-4 container border overflow-auto"
					id="chatHeaderList">
					<c:forEach var="vo" items="${chatHeaderList }">
						<c:if test="${vo.from_id eq userVO.u_id }">
							<a id="hId${vo.h_idx }" class="row d-flex"
								href="javascript:getChatMessageList(${vo.h_idx }, '${userVO.u_id }')">
								<div class="col-2">
									<div class="box">
										<div class="img_box">
											<img class="img_size " src="../img_src/profile/${vo.u_pic }">
										</div>
									</div>
								</div>
								<div class="col-8" style="text-overflow: ellipsis;">
									<c:if test="${ vo.from_status eq '0'}">
										<div>
											<p id="u_id${vo.h_idx }" style="font-weight: bolder; margin:0;">${vo.to_id }</p>
											<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
										</div>
									</c:if>
									<c:if test="${vo.from_status ne '0' }">
										<div>
											<p id="u_id${vo.h_idx }" style="margin: 0;">${vo.to_id }</p>
											<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
										</div>
									</c:if>
								</div> <small class="col-2">1분전</small>
							</a>
						</c:if>
						<c:if test="${vo.from_id ne userVO.u_id }">
							<a id="hId${vo.h_idx }" class="row d-flex"
								href="javascript:getChatMessageList(${vo.h_idx }, '${userVO.u_id }')">
								<div class="col-2">
									<div class="box">
										<div class="img_box">
											<img class="img_size " src="../img_src/profile/${vo.u_pic }">
										</div>
									</div>
								</div>
								<div class="col-8" style="text-overflow: ellipsis;">
									<c:if test="${ vo.to_status eq '0'}">
										<div>
											<p id="u_id${vo.h_idx }" style="font-weight: bolder; margin:0;">${vo.from_id }</p>
											<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
										</div>
									</c:if>
									<c:if test="${vo.to_status ne '0' }">
										<div>
											<p id="u_id${vo.h_idx }" style="margin:0;">${vo.from_id }</p>
											<small id="subject${vo.h_idx }" class="sm_id">${vo.subject }</small>
										</div>
									</c:if>
								</div> <small class="col-2">2분전</small>
							</a>
						</c:if>
					</c:forEach>
				</div>
				<div
					class="shadow-sm p-3 mb-5 bg-body rounded col-8 h-100 container border">
					<div class="container h-100 position-relative" id="chatMessageView">
						<h1>채팅하세요.</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		var nowChatHeaderIdx = 0;

		function getChatMessageList(h_idx, u_id) {
			nowChatHeaderIdx = h_idx;
			alert("getChatMessageList() 실행~~~ h_idx:" + h_idx + ", u_id:"
					+ u_id);
			var id = "u_id" + h_idx;
			document.getElementById(id).style.fontWeight = "normal";

			$
					.ajax(
							"getChatMessageList.do",
							{
								type : "get",
								data : "h_idx=" + h_idx,
								dataType : "json",
								success : function(data) {
									alert("성공~~~");
									console.log(data);

									var my_id = u_id;
									let dispHtml = "";
									dispHtml += "<div class=\"row my_chat_message\" id=\"chatMessageContainer\">";
									$
											.each(
													data,
													function(index, obj) {
														if (obj.u_id == my_id) {
															dispHtml += "<div class=\"d-flex justify-content-end align-items-center\">";
															dispHtml += "<div class=\"chat_content_end\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size\" src=\"../img_src/profile/"+ obj.u_pic +"\">"
															dispHtml += "</div>";
															dispHtml += "</div>";	
															dispHtml += "</div>"
														} else {
															dispHtml += "<div class=\"d-flex justify-content-start align-items-center\">";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size \" src=\"../img_src/profile/" + obj.u_pic + "\">"
															dispHtml += "</div>";
															dispHtml += "</div>";
															dispHtml += "<div class=\"chat_content_start\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "</div>"
														}
													});
									dispHtml += "</div>";
									dispHtml += "<div class=\"row position-absolute bottom-0 start-0\" style=\"width: 100%;\">";
									dispHtml += "<div class=\"col-11\">";
									dispHtml += "<input class=\"form-control\" type=\"text\" name=\"content\" id=\"content\">";
									dispHtml += "</div>";
									dispHtml += "<button class=\"btn btn-primary col-1 \" type=\"submit\" onclick=\"insertChatMessage(\'${userVO.u_id}\', \'${userVO.name }\', \'${userVO.u_pic }\')\">전송</button>";
									dispHtml += "</div>";
									$("#chatMessageView").html(dispHtml);
									$('#chatMessageContainer').scrollTop($('#chatMessageContainer')[0].scrollHeight);
								},
								error : function() {
									alert("실패~~~");
								}
							});
		}

		function insertChatMessage(u_id, u_name, u_pic) {
			let content = $("#content").val();
			alert("insertChatMessage() 실행~~~nowChatHeaderIdx: "
					+ nowChatHeaderIdx + ", content: " + content);

			var sid = "subject" + nowChatHeaderIdx;
			var hId;
			hId = "hId" + nowChatHeaderIdx;

			document.getElementById(sid).innerHTML = content;
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
									alert("성공~~~");
									console.log(data);
									var dispHtml = "";
									$
											.each(
													data,
													function(index, obj) {
														if (obj.u_id == u_id) {
															dispHtml += "<div class=\"d-flex justify-content-end align-items-center\">";
															dispHtml += "<div class=\"chat_content_end\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size\" src=\"../img_src/profile/"+ obj.u_pic +"\">"
															dispHtml += "</div>";
															dispHtml += "</div>";	
															dispHtml += "</div>"
														} else {
															dispHtml += "<div class=\"d-flex justify-content-start align-items-center\">";
															dispHtml += "<div class=\"box\">";
															dispHtml += "<div class=\"img_box\">";
															dispHtml += "<img class=\"img_size \" src=\"../img_src/profile/" + obj.u_pic + "\">"
															dispHtml += "</div>";
															dispHtml += "</div>";
															dispHtml += "<div class=\"chat_content_start\">";
															dispHtml += obj.content;
															dispHtml += "</div>";
															dispHtml += "</div>"
														}
													});
									$("#chatMessageContainer").append(dispHtml);
									$('#chatMessageContainer').scrollTop($('#chatMessageContainer')[0].scrollHeight);
									$("#content").val("");
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