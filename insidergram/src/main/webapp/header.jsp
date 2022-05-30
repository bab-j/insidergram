<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
@import url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>
<style>

/* 마지막에 CSS 파일로 만들기 */

#Header {
	/*  position: fixed;*/ 
	background-color : white;
	border-bottom: 1px solid #dbdbdb;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 50px;
	background-color: white;
}

.nav-icon {
	justify-content: space-between;
	margin-top: 0px;
	margin-left: auto;
	margin-right: auto;
	font-size: 30px;
}

.total_search {
	width: 50%;
	height: 26px;
	font-size: 15px;
	padding-bottom: 0px;
	border-radius: 4px;
	border-style: solid;
}

.search_btn {
	font-size: 15px;
	height: 30px;
	padding-bottom: 0px;
	border-radius: 4px;
}

.container1 {
	padding-top: 0.8rem;
	width: 600px;
	margin-right: 0;
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
</style>

</head>
<body>



	<!-- 로그인 후 메인페이지 에서 보여주는 화면 -->

	<div id="Header">
		<div class="container" style="margin-top: 10px;">
			<div class="row">
				<div class="col-3 insiderIcon" style="">
					<a href="../user/getFeedList.do">insidergram</a>
				</div>
				<div class="col-6">
					<div class="container1">
						<form action="feedcontroller?type=search" method="post">
							<span> <input class="total_search" type="text" id="search"
								name="keyword" placeholder="통합검색">&nbsp; <input
								class="search_btn" type="submit" value="검색">
							</span>
						</form>
					</div>
				</div>
				<div class="col-3">
					<div class="nav-icon" style="text-align: right;">
						<ul>
							<li class="material-symbols-outlined dm_icon"><a
								href="../chat/getChatHeaderList.do">send</a></li>
							<li class="material-icons "><a href="mainFeed.jsp">home</a></li>
							<li class="material-icons-outlined "><a href="../insertFeed.jsp">add_circle_outline</a></li>
							<li class="material-icons "><a href="#">logout</a></li>
							<li class="material-icons "><a href="../chat/getChatHeaderList.do">send</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<div id="Header">
		<div class="container" style="margin-top: 10px;">
			<div class="row">
				<div class="col-3 insiderIcon" style="">
					<a href="../user/getFeedList.do">insidergram</a>
				</div>
				<div class="col-6">
					<div class="container1">
						<form action="feedcontroller?type=search" method="post">
							<span> <input class="total_search" type="text" id="search"
								name="keyword" placeholder="통합검색">&nbsp; <input
								class="search_btn" type="submit" value="검색">
							</span>
						</form>
					</div>
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


	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>