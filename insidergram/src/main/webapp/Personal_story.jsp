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
  
		@media (min-width: 768px) {
		  .bd-placeholder-img-lg {
			font-size: 3.5rem;
		  }
		}
  
		.b-example-divider {
		  height: 3rem;
		  background-color: rgba(0, 0, 0, .1);
		  border: solid rgba(0, 0, 0, .15);
		  border-width: 1px 0;
		  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
		input[id*="popup"] + label {position:absolute;}
		* {padding:0;margin:0;line-height:1;} 

		/* none처리로 화면에 책크박스 안보이게 함 */
		input[id*="popup"] {display:none;}  
		
		/* 추후 버튼 형테로 만들수 있음 [padding:20px;background:#ffcd41;] */
		input[id*="popup"] + label {display:inline-block;color:#fff;}

		/* 팝업창 뛰우는 위치 지정 */
		input[id*="popup"] + label + div {position:fixed;top:0;left:0;width:100%;height:100%;z-index:100;}
		
		/* 파업창 틀 */
		input[id*="popup"] + label + div > div {position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width: 1200px;height: 550px; background:rgba(0, 0, 0, 0.045);z-index:2;}
		
		/* 상단 닫기버튼 */
		input[id*="popup"] + label + div > div > label {position:absolute;top:0%;right:0%;transform:translate(40%,-40%);padding:20px;background:none;border-radius:100%;z-index:1;}
		
		/* 여백 클릭시 닫기 처리 */
		input[id*="popup"] + label + div > label {position:absolute;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.65);z-index:1;}
		
		/*
		input[id*="popup"] + label + div {display:none;}
		input[id*="popup"]:checked + label + div {display:block;}
		*/

		/* 팝업창 나타날 때 자연스럽게 뜨도록 처리함(애니메이션 효과) */
		input[id*="popup"] + label + div {opacity:0;visibility:hidden;transition:all 1s;}
		input[id*="popup"]:checked + label + div {opacity:1;visibility:visible;}
	</style>

<meta charset="UTF-8">
<title>자기 페이지</title>
</head>
<body>
	

<body style="background-color: #F5F5F5;">
  


<main class="container py-3" style="background-color: #F5F5F5;">
	<div class="container-fluid pb-3 my-3 p-3" style="background-color: #F5F5F5;">
		<div class="d-grid gap-3" style="grid-template-columns: 1fr 2fr;">
			<div class="rounded-3" style="height: 300px; width: 300px;">
				<img class="bigProfile_img" src="../img/kim.jpg" />
			</div>

			<div class="rounded-3" style="margin-left: 20px;">
				<div class="row">
					<!-- 1 -->
					<div class="col-12 my-4">
						<a style="font-size: xx-large;">tldhsrkwhr11</a>
						<button class="center_ailgn py-2 mb-2 btn btn-outline-dark rounded-3"
								style="border-color: silver; text-align: center; margin-left: 20px;"
								type="submit" href="#">
								<svg class="bi me-1 " style="width: 0px; height: 12px;" ></svg>프로필 편집
						</button>
						
					</div>
					<!-- 2 -->
					<div class="col-12 my-3">
						<a>게시물</a><span style="margin-left: 5px; margin-right: 20px; font-weight: bold;">3</span>
						<a>팔로워</a><span style="margin-left: 5px; margin-right: 20px; font-weight: bold;">94</span>
						<a>팔로우</a><span style="margin-left: 5px; margin-right: 20px; font-weight: bold;">132</span>
					</div>
					<!-- 3 -->
					<div class="col-12 my-3">
						<a style="font-weight: bold;">김동욱(25)</a>
					</div>
					<!-- 4 -->
					<div class="col-12 my-3">
						<a>날이 좋아서 날이 좋지 않아서...</a>
					</div>

				</div>
			</div>
		</div>
	</div>

<div class="album" style="background-color: #F5F5F5;">
  <div class="container">
	<hr class="my-1">
	<div class="my-2 text-center">
		<div class="row" >
			<li class="col-3"></li>
			<li class="col-2 text-center p-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid-3x3" viewBox="0 0 16 16">
					<path d="M0 1.5A1.5 1.5 0 0 1 1.5 0h13A1.5 1.5 0 0 1 16 1.5v13a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13zM1.5 1a.5.5 0 0 0-.5.5V5h4V1H1.5zM5 6H1v4h4V6zm1 4h4V6H6v4zm-1 1H1v3.5a.5.5 0 0 0 .5.5H5v-4zm1 0v4h4v-4H6zm5 0v4h3.5a.5.5 0 0 0 .5-.5V11h-4zm0-1h4V6h-4v4zm0-5h4V1.5a.5.5 0 0 0-.5-.5H11v4zm-1 0V1H6v4h4z"/>
				  </svg>&nbsp;<a style="font-weight: bold;">PIC</a>
			</li>
			<li class="col-2 text-center p-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
					<path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
				  </svg>&nbsp;<a style="color: #6c757d">DOC</a>
			</li>
			<li class="col-2 text-center p-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star" viewBox="0 0 16 16">
					<path d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z"/>
					<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
				  </svg>&nbsp;<a style="color: #6c757d">SAVED</a>
			</li>
			<li class="col-3"></li>
		</div>
	</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		
	  <div class="col square">
		<div class="card shadow-sm inner">
			<!-- 시작 -->
			<input type="checkbox" id="popup1">
			<!-- 버튼 클릭시 팝업창 오픈 -->
			<label for="popup1">
				<img src="../img/2.jpg"
				class="card-img-top">
			</label>
			<div>
				<div>
					<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
					<label for="popup1"></label>
					<!-- 내용 추가 -->
					as

				</div>
				<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
				<label for="popup1"></label>
			</div>
		  
		</div>
	  </div>

	  <div class="col square">
		<div class="card shadow-sm inner">
			<!-- 시작 -->
			<input type="checkbox" id="popup2">
			<!-- 버튼 클릭시 팝업창 오픈 -->
			<label for="popup2">
				<img src="../img/1.jpg"
				class="card-img-top">
			</label>
			<div>
				<div>
					<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
					<label for="popup2"></label>
					<!-- 내용 추가 -->
					df

				</div>
				<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
				<label for="popup2"></label>
			</div>

		  
		</div>
	  </div>

	  <div class="col square">
		<div class="card shadow-sm inner">
			<!-- 시작 -->
			<input type="checkbox" id="popup3">
			<!-- 버튼 클릭시 팝업창 오픈 -->
			<label for="popup3">
				<img src="../img/3.jpg"
				class="card-img-top">
			</label>
			<div>
				<div>
					<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
					<label for="popup3"></label>
					<!-- 내용 추가 -->
					<div class="container" style="margin: 0px;padding: 0px;width: 1200px;height: 550px;">
						<div class="row square" style="margin: 0px;padding: 0px;width: 1200px;height: 550px;">
							<!-- 오른쪽 -->
							<div class="col-6" style="margin: 0px;padding: 0px;height: 550px;">
								
								<img src="../img/3.jpg" class="card-img-top" style="height: 550px;border-radius: 0px;">

							</div>

							<!-- 원쪽 -->
							<div class="col-6 bg-white" style="margin: 0px;padding: 0px;height: 550px;
																border-top-right-radius: 5px;border-bottom-right-radius: 5px;">
								
								<!-- 상단 닉네임 -->
								<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
								style="height: 80px;">
									<img src="../img/kim.jpg" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">
									<div class="d-flex gap-2 w-100 justify-content-between">
									<div>
										<h6 class="mb-0" style="margin-left: 15px;">tldhsrkwhr11(본인)</h6>
										
									</div>
										<div href="#">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
												<path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
											</svg>
										</div>
									</div>
								</a>

								<!-- 채팅창 -->
								<div style="width: 600px;height: 424px;overflow-y: auto;">
									
									<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" 
									style="border: none; height: 100px; margin-top: 0px;">
										<img src="../img/kim.jpg" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0">
										<div class="d-flex gap-2 w-100 justify-content-between">
										  <div>
											<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
											<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 내일 주말이다 아자아자 파팅 ~~~~~~~! 하하하하</p>
										  </div>
										  <small class="opacity-50 text-nowrap">3분전</small>
										</div>
									</a>

									<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" 
									style="border: none; height: 100px; margin-top: 0px;">
										<img src="../img/kim.jpg" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0">
										<div class="d-flex gap-2 w-100 justify-content-between">
										  <div>
											<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
											<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 내일 주말이다 아자아자 파팅 ~~~~~~~! 하하하하</p>
										  </div>
										  <small class="opacity-50 text-nowrap">3분전</small>
										</div>
									</a>

									

								</div>

								<!-- 메시지 보내기 -->
								<div class="input-group mb-3">
									<input style="height: 45px;" type="text" class="form-control" 
									placeholder="메시지 입력..." aria-label="Recipient's username" aria-describedby="button-addon2">
									<button class="btn btn-outline-primary" type="button" id="button-addon2">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
									  </svg>
									</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- 닫기 기능 2(박스 아웃 쪽 클릭시 닫기 처리됨) -->
				<label for="popup3"></label>
			</div>
		
		</div>
	  </div>

	</div>

  </div>
</div>

</main>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>