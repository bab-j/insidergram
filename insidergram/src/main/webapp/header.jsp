<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>상단 바</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>
<style>
.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 500, 'GRAD' 0, 'opsz' 20
}
/* 마지막에 CSS 파일로 만들기 */
#Header {
	position: fixed;
	background-color: white;
	border-bottom: 1px solid #dbdbdb;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 60px;
	background-color: white;
	width: 100%;
	z-index: 1000;
}

.nav-icon {
	justify-content: space-between;
	margin-top: 0px;
	margin-left: auto;
	margin-right: auto;
	font-size: 30px;
}

.search_btn {
	font-size: 12px;
	padding: 3px 12px 3px 12px;
}

.container1 {
	padding-top: 0.8rem;
	width: 600px;
	margin-right: 0;
	text-align: center;
}

/* fallback */
@font-face {
	font-family: 'Material Icons';
	font-style: normal;
	font-weight: 400;
	src:
		url(https://fonts.gstatic.com/s/materialicons/v128/flUhRq6tzZclQEJ-Vdg-IuiaDsNc.woff2)
		format('woff2');
}
/* fallback */
@font-face {
	font-family: 'Material Icons Outlined';
	font-style: normal;
	font-weight: 400;
	src:
		url(https://fonts.gstatic.com/s/materialiconsoutlined/v103/gok-H7zzDkdnRel8-DQ6KAXJ69wP1tGnf4ZGhUce.woff2)
		format('woff2');
}

.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 24px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	margin-top: 17px;
	-webkit-font-smoothing: antialiased;
}

.material-icons-outlined {
	font-family: 'Material Icons Outlined';
	font-weight: normal;
	font-style: normal;
	font-size: 24px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	word-wrap: normal;
	direction: ltr;
	margin-top: 17px;
	-webkit-font-smoothing: antialiased;
}

.dm_icon {
	color: black;
	font-weight: 800;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	color: inherit;
}

.insiderIcon {
	font-family: 'Carattere', cursive;
	font-size: 40px;
	font-weight: bold;
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
</style>
<script>
	function logOut() {

		if (confirm("ㄹㅇ 로그아웃 하시겠습니까??") == true) { //확인

			location.href = "../../../biz/user/logout.do"

		} else { //취소

			return false;

		}

	}
</script>



</head>
<body>



	<!-- 로그인 후 메인페이지 에서 보여주는 화면 -->
	<c:if test="${userVO!=null }">
		<div id="Header">
			<div class="container" style="margin-top: 10px;">
				<div class="row justify-content-between">
					<div class="col-3 insiderIcon"
						style="display: inline-block; margin: 5px 0 0 0;">
						<a href="../../biz/user/getFeedList.do">insidergram</a>
					</div>
					<div class="col-4">
						<form action="feedcontroller?type=search" method="post">
							<input id="searchForm" class="form-control" type="text" id="search"
								autocapitalize="none" autocomplete="off" name="keyword" placeholder="검색"
								style="margin-top: 5px; background-color: #f5f5f5; border: 0;"
								onfocus="javascript:showSearchTable()" onkeyup="javascript:searching()">
						</form>
					</div>
					<div class="col-3">
						<div class="nav-icon" style="text-align: right;">
							<ul>
								<li class="material-symbols-outlined dm_icon"><a
									href="../../biz/chat/getChatHeaderList.do">send</a></li>
								<li class="material-icons "><a
									href="../../biz/user/getMyFeed.do">home</a></li>
								<li class="material-icons-outlined "><a
									href="../../biz/insertFeed.jsp">add_circle_outline</a></li>
								<li class="material-icons "><a href='javascript:void(0);'
									onclick="logOut();">logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${userVO==null }">
		<div id="Header">
			<div class="container" style="margin-top: 10px;">
				<div class="row justify-content-between">
					<div class="col-3 insiderIcon" style="">
						<a href="../user/getFeedList.do">insidergram</a>
					</div>
					<div class="col-4">
						<form action="feedcontroller?type=search" method="post">
							<input id="searchForm" class="form-control" type="text" id="search"
								autocapitalize="none" autocomplete="off" name="keyword" placeholder="검색"
								style="margin-top: 5px; background-color: #f5f5f5; border: 0;"
								onfocus="javascript:showSearchTable()">
						</form>
					</div>
					<div class="col-3">
						<div class="nav-icon" style="text-align: right;">
							<ul>
								<li class="material-symbols-outlined"><a
									href="javascript:history.back()">arrow_back_ios</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<div id="rhombus" class="border-start border-top"
		style="display: none; position: fixed; height: 14px; width: 14px; transform: rotate(45deg) translate(-50%, 0); margin-top: 59px; background-color: white; left: 50%; z-index: 1000;"></div>
	<div id="searchTable" class="border container pt-2"
		style="z-index: 5000; display: none; height: 400px; width: 30%; position: fixed; margin-top: 59px; left: 50%; transform: translate(-50%, 0); background: white; overflow-y:auto; overflow-x:hidden">
	</div>
	<a href="javascript:hideSearchTable()" id="resetSearch"
		class="material-symbols-outlined"
		style="display: none; position: fixed; z-index: 10000; color: lightgray; left: 58%; transform: translate(70%, 0); margin-top: 15px;">cancel</a>
	<!-- 부트스트랩 -->
	<script>
		function showSearchTable() {
			$("#rhombus").css('display', 'inline');
			$("#searchTable").css('display', 'inline');
			$("#resetSearch").css('display', 'inline');
		}
		function hideSearchTable() {
			$("#rhombus").css('display', 'none');
			$("#searchTable").css('display', 'none');
			$("#resetSearch").css('display', 'none');
			$("#searchForm").val("");
		}
		function searching() {
			var keyword = $("#searchForm").val();
			$.ajax("../user/seachUser.do",	{
						type : "get",
						data : "u_id=" + keyword,
						dataType : "json",
						success : function(data) {
							console.log(data);
							var dispHtml = "";
							$
									.each(
											data,
											function(index, obj) {
												dispHtml += '<a href="../user/otherFeed.do?u_id=' + obj.u_id + '" class="row d-flex mb-2 ms-0 justify-content-start">';
												dispHtml += '<div class="img_box col-2" style="padding:0px;">';
												dispHtml += '<img class="img_size " src="../img_src/profile/' + obj.u_pic +'">';
												dispHtml += '</div>';
												dispHtml += '<div class="flex-grow-1 col">';
												dispHtml += '<p style="margin: 0;">'
														+ obj.u_id
														+ '</p>';
												dispHtml += '<small class="sm_id">'
														+ obj.name
														+ '</small>';
												dispHtml += '</div>';
												dispHtml += '</a>';
											});
							$("#searchTable").html(dispHtml);
						},
						error : function() {
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