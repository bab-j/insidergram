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
.chat_list {
	border: 1px solid silver;
	width: 500px;
	height: 600px;
	margin-top: 30px;
	margin-left: 25px;
	display: inline-flex;
	float: left;
}

.chat_content {
	border: 1px solid silver;
	width: 700px;
	height: 600px;
	margin-top: 30px;
	margin-right: 25px;
	display: inline-flex;
	float: right;
	overflow-y: scroll;
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

.img_size {
	width: 56px;
	height: 56px;
	display: inline-block;
	border-radius: 50%
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
	<div>
		<div class="vh-100" style="background-color: #F5F5F5">
			<div class="container h-100 pt-5 pb-5" style="width: 1250px;">

				<div></div>
				<div class="row h-100">
					<div class="shadow-sm p-3 mb-5 bg-body rounded col-4 container" id="chatHeaderList">
						<c:forEach var="vo" items="${chatHeaderList }">
							<c:if test="${vo.from_id eq userVO.u_id }">
								<a id="hId${vo.h_idx }" class="row d-flex"
									href="javascript:getChatMessageList(${vo.h_idx }, '${userVO.u_id }')">
									<div class="col-2">
										<img class="img_size "
											src="../img_src/profile/28778_54512_4628.jpeg">
										${vo.to_id }
									</div>
									<div class="col-8" style="text-overflow: ellipsis;">
										<c:if test="${ vo.from_status eq '0'}">
											<p id="subject${vo.h_idx }" style="font-weight: bold;">${vo.subject }</p>
										</c:if>
										<c:if test="${vo.from_status ne '0' }">
											<p id="subject${vo.h_idx }">${vo.subject }</p>
										</c:if>
									</div> <small class="col-2">1분전</small>
								</a>
							</c:if>
							<c:if test="${vo.from_id ne userVO.u_id }">
								<a id="hId${vo.h_idx }" class="row d-flex"
									href="javascript:getChatMessageList(${vo.h_idx }, '${userVO.u_id }')">
									<div class="col-2">
										<img class="img_size "
											src="../img_src/profile/28778_54512_4628.jpeg">
										${vo.from_id }
									</div>
									<div class="col-8" style="text-overflow: ellipsis;">
										<c:if test="${ vo.to_status eq '0'}">
											<p id="subject${vo.h_idx }" style="font-weight: bold;">${vo.subject }</p>
										</c:if>
										<c:if test="${vo.to_status ne '0' }">
											<p id="subject${vo.h_idx }">${vo.subject }
										</c:if>
									</div> <small class="col-2">2분전</small>
								</a>
							</c:if>
						</c:forEach>
					</div>
					<div class="shadow-sm mb-5 bg-body rounded col-8 h-100 container">
						<div class="container h-100 position-relative d-block">
							<div class="row myChatMessage" id="chatMessageContainer"></div>
							<div class="row position-absolute bottom-0 start-0"
								style="width: 100%;">
								<div class="col-11">
									<input class="form-control" type="text" name="content"
										id="content">
								</div>
								<button class="btn btn-primary col-1 " type="submit"
									onclick="insertChatMessage('${userVO.u_id}', '${userVO.name }', '${userVO.u_pic }')">전송</button>
							</div>
						</div>
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
			var sid = "subject" + h_idx;
			document.getElementById(sid).style.fontWeight = "normal";

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
									$
											.each(
													data,
													function(index, obj) {
														if (obj.u_id == my_id) {
															dispHtml += "<div class=\"d-flex justify-content-end align-items-center\">";
															dispHtml += obj.content
																	+ "<img class=\"img_size \" src=\"../img_src/28778_54512_4628.jpeg\">"
															dispHtml += "</div>"
														} else {
															dispHtml += "<div class=\"d-flex justify-content-start align-items-center\">";
															dispHtml += "<img class=\"img_size \" src=\"../img_src/28778_54512_4628.jpeg\">"
																	+ obj.content;
															dispHtml += "</div>"
														}
													});
									$("#chatMessageContainer").html(dispHtml);
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
			header.insertBefore(document.getElementById(hId), header.firstChild);
			
			$.ajax("insertChatMessage.do", {
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

					getChatMessageList(nowChatHeaderIdx, u_id);

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