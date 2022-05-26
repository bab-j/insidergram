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

.whale_body {
	background-color: f6f7f7;
	width: 1250px;
	height: 100%;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}
</style>
<meta charset="UTF-8">
<title>insidergram : DM test</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div>
		<div>
			<div>
				<div class="whale_body">
					<div class="chat_body">

						<div class="shadow-sm p-3 mb-5 bg-body rounded chat_list ">
							<c:forEach var="vo" items="${chatHeaderList }">
								<c:if test="${vo.from_id eq userVO.u_id }">
									<div>
										<a class="display_block" href="#"><img class="img_size "
											src="../img_src/28778_54512_4628.jpeg">
											<div>
												<div>${vo.to_id }</div>
												<div>post 1minutes.</div>
											</div> </a>
									</div>
								</c:if>
								<c:if test="${vo.from_id ne userVO.u_id }">
									<div>
										<a class="display_block" href="#"><img class="img_size "
											src="../img_src/28778_54512_4628.jpeg">
											<div>
												<div>${vo.from_id }</div>
												<div>post 1minutes.</div>
											</div> </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="shadow-sm p-3 mb-5 bg-body rounded chat_content">
							<ul>
								<li>1</li>
								<li>1</li>
								<li>1</li>
								<li>1</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>