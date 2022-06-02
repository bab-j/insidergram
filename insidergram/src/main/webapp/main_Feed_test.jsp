<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
#k1 { /* 틀 */
	border: solid 1px rgb(169, 165, 165); 
	width: 500px; 
	height: auto; 
	--bs-gutter-x: none;
	border-radius: 5px;
	margin-top: 20px;
}

</style>
<style>
	input[id*="popup"] + label {position:absolute;}
	* {padding:0;margin:0;line-height:1;} 

	/* none처리로 화면에 책크박스 안보이게 함 */
	input[id*="popup"] {display:none;}  
	
	/* 추후 버튼 형테로 만들수 있음 [padding:20px;background:#ffcd41;] */
	input[id*="popup"] + label {display:inline-block;}

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
<title>메인 페이지</title>
</head>
<body>
	

<body style="background-color: #F5F5F5;">

	<div class="container" style="display: flex; flex-direction: column-reverse; align-content: space-around; flex-wrap: wrap;"> <!-- 중간 정렬 -->

		<div class="row" id="k1"> <!-- 틀 -->

			<div class="col-12">
				<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
				style="background-color: white;">
					
				<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">
					
					<div class="d-flex gap-2 w-100 justify-content-between">
						
						<div><h6 class="mb-0" style="margin-left: 15px;">tldhsrkwhr11(본인)</h6></div>
						<div href="#">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
							<path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
						</div>
					</div>
				</a>
			</div>

			<div class="col-12" style="display: flex; align-items: center;"> <!-- 중간 이미지 -->
				<img src="./img_src/test/1.jpg" class="card-img-top">

			</div>

			<div class="col-12" style="margin-top: 10px;margin-bottom: 10px;">

				<a style="margin-left: 20px;"> <!-- 하트 버튼 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
						<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
					</svg>
				</a>

					<!-- 시작 -->
				<input type="checkbox" id="popup1">
				<!-- 버튼 클릭시 팝업창 오픈 -->
				<label for="popup1">
					<a style="margin-left: 10px;"> <!-- 메시지 버튼 -->
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
							<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
						</svg>
					</a>
				</label>
				<div>
					<div>
						<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
						<label for="popup1"></label>
						<!-- 내용 추가 -->
						<div class="container" style="margin: 0px;padding: 0px;width: 1200px;height: 550px;">
							<div class="row square" style="margin: 0px;padding: 0px;width: 1200px;height: 550px;">
								<!-- 오른쪽 -->
								<div class="col-6" style="margin: 0px;padding: 0px;height: 550px;">
									<!-- 이미지 -->
									<img src="./img_src/test/1.jpg" class="card-img-top" style="height: 550px;border-radius: 0px;">

								</div>

								<!-- 원쪽 -->
								<div class="col-6" style="margin: 0px;padding: 0px;height: 550px;
																	border-top-right-radius: 5px;border-bottom-right-radius: 5px;">
									
									<!-- 상단 닉네임 -->
									<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
									style="height: 80px; background-color: white;">
										<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">
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
									<div style="width: 600px;height: 424px;overflow-y: auto; background-color: white;">
										
										<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" 
										style="border: none; height: 100px; margin-top: 0px;">
											<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0">
											<div class="d-flex gap-2 w-100 justify-content-between">
											<div>
												<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
												<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 해적왕 </p>
											</div>
											<small class="opacity-50 text-nowrap">3분전</small>
											</div>
										</a>

										<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" 
										style="border: none; height: 100px; margin-top: 0px;">
											<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0">
											<div class="d-flex gap-2 w-100 justify-content-between">
											<div>
												<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
												<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 그는 누구인가.. </p>
											</div>
											<small class="opacity-50 text-nowrap">3분전</small>
											</div>
										</a>
										
									</div>

									<!-- 메시지 보내기 -->
									<div class="input-group mb-3">
										<input style="height: 45px; border-radius: initial;" type="text" class="form-control" 
										placeholder="메시지 입력..." aria-label="Recipient's username" aria-describedby="button-addon2">
										<button class="btn btn-outline-primary" type="button" id="button-addon2" style="background-color: #0d6efd;color: white; border-top-right-radius: inherit;">
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
					<label for="popup1"></label>
				</div>

				<a style="margin-left: 45px;"> <!-- 저장하기 버튼 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-star" viewBox="0 0 16 16">
						<path d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z"/>
						<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
					</svg>
				</a>

			</div>
		</div>

<!------------------------------------------------------------------------------------------------------>

		<div class="row" id="k1"> <!-- 틀 -->

			<div class="col-12">
				<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
				style="background-color: white;">
					
				<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">
					
					<div class="d-flex gap-2 w-100 justify-content-between">
						
						<div><h6 class="mb-0" style="margin-left: 15px;">tldhsrkwhr11(본인)</h6></div>
						<div href="#">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
							<path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
						</div>
					</div>
				</a>
			</div>

			<div class="col-12" style="display: flex; align-items: center;"> <!-- 중간 이미지 -->
				<img src="./img_src/test/2.jpg" class="card-img-top">

			</div>

			<div class="col-12" style="margin-top: 10px;margin-bottom: 10px;">

				<a style="margin-left: 20px;"> <!-- 하트 버튼 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
						<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
					</svg>
				</a>

					<!-- 시작 -->
				<input type="checkbox" id="popup2">
				<!-- 버튼 클릭시 팝업창 오픈 -->
				<label for="popup2">
					<a style="margin-left: 10px;"> <!-- 메시지 버튼 -->
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
							<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
						</svg>
					</a>
				</label>
				<div>
					<div>
						<!-- 닫기 기능 1(모서리 상단에 숨어 있음) -->
						<label for="popup2"></label>
						<!-- 내용 추가 -->
						<div class="container" style="margin: 0px;padding: 0px;width: 1200px;height: 550px;">
							<div class="row square" style="margin: 0px;padding: 0px;width: 1200px;height: 550px;">
								<!-- 오른쪽 -->
								<div class="col-6" style="margin: 0px;padding: 0px;height: 550px;">
									<!-- 이미지 -->
									<img src="./img_src/test/2.jpg" class="card-img-top" style="height: 550px;border-radius: 0px;">

								</div>

								<!-- 원쪽 -->
								<div class="col-6" style="margin: 0px;padding: 0px;height: 550px;
																	border-top-right-radius: 5px;border-bottom-right-radius: 5px;">
									
									<!-- 상단 닉네임 -->
									<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
									style="height: 80px; background-color: white;">
										<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">
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
									<div style="width: 600px;height: 424px;overflow-y: auto; background-color: white;">
										
										<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" 
										style="border: none; height: 100px; margin-top: 0px;">
											<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0">
											<div class="d-flex gap-2 w-100 justify-content-between">
											<div>
												<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
												<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 해적왕 </p>
											</div>
											<small class="opacity-50 text-nowrap">3분전</small>
											</div>
										</a>

										<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" 
										style="border: none; height: 100px; margin-top: 0px;">
											<img src="./img_src/test/kim.jpg" alt="twbs" width="40" height="40" class="rounded-circle flex-shrink-0">
											<div class="d-flex gap-2 w-100 justify-content-between">
											<div>
												<h6 class="mb-0">tldhsrkwhr11(본인)</h6>
												<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 그는 누구인가.. </p>
											</div>
											<small class="opacity-50 text-nowrap">3분전</small>
											</div>
										</a>
										
									</div>

									<!-- 메시지 보내기 -->
									<div class="input-group mb-3">
										<input style="height: 45px; border-radius: initial;" type="text" class="form-control" 
										placeholder="메시지 입력..." aria-label="Recipient's username" aria-describedby="button-addon2">
										<button class="btn btn-outline-primary" type="button" id="button-addon2" style="background-color: #0d6efd;color: white; border-top-right-radius: inherit;">
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
					<label for="popup2"></label>
				</div>

				<a style="margin-left: 45px;"> <!-- 저장하기 버튼 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-star" viewBox="0 0 16 16">
						<path d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z"/>
						<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
					</svg>
				</a>

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