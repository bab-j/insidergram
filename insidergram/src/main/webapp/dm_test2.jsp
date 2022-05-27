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

</style>
<meta charset="UTF-8">
<title>insidergram : DM test</title>
</head>
<body>
	

	<main class="container">  
	  <div class="container-fluid pb-3 my-3 p-3">
		<div class="d-grid gap-3" style="grid-template-columns: 1fr 2fr;">

		  <!-- 왼쪽 -->
		  <div class="bg-light border rounded-3" style="height: 740px;">
			  
			<!-- 틀 박스 -->
			<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 415px; height: 740px;">
				
				<!-- 상단 닉네임 -->
				<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
				style="height: 62px;">
					
					<div class="d-flex gap-2 w-10 justify-content-between">
					  <div>
						<h6 class="mb-0" style="padding-left: 130px">tldhsrkwhr11(본인)</h6>
						
					  </div>
					  
					</div>
				</a>

				<!-- -->
				<div class="list-group list-group-flush border-bottom scrollarea" style="overflow-y: auto; height: 100%;">

					<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none;">
						<img src="https://github.com/twbs.png" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0">
						<div class="d-flex gap-2 w-100 justify-content-between">
						  <div>
							<h6 class="mb-0">상대방 닉네임</h6>
							<p class="mb-0 opacity-75">최근 활동: 4시간 전</p>
						  </div>
						  <small class="opacity-50 text-nowrap">활동중</small>
						</div>
					</a>

					<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none;">
						<img src="https://github.com/twbs.png" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0">
						<div class="d-flex gap-2 w-100 justify-content-between">
						  <div>
							<h6 class="mb-0">상대방 닉네임</h6>
							<p class="mb-0 opacity-75">최근 활동: 4시간 전</p>
						  </div>
						  <small class="opacity-50 text-nowrap">비활동중</small>
						</div>
					</a>

					<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true" style="border: none;">
						<img src="https://github.com/twbs.png" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0">
						<div class="d-flex gap-2 w-100 justify-content-between">
						  <div>
							<h6 class="mb-0">상대방 닉네임</h6>
							<p class="mb-0 opacity-75">최근 활동: 4시간 전</p>
						  </div>
						  <small class="opacity-50 text-nowrap">활동중</small>
						</div>
					</a>
			
				</div>
			  </div>

		  </div>
		  <!-- 오른쪽 -->
		  <div class="bg-light border rounded-3">
			
			<!-- 틀 박스 -->
			<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 100%; height: 94%;">
				
				<!-- 상단 닉네임 -->
				<a href="#" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom text-center"
				style="height: 62px;">
					<img src="https://github.com/twbs.png" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0" style="margin-left: 20px;">
					<div class="d-flex gap-2 w-100 justify-content-between">
					  <div>
						<h6 class="mb-0" style="margin-left: 15px;">qwer3543(상대)</h6>
						
					  </div>
					  <small class="opacity-50 text-nowrap">활동중</small>
					</div>
				</a>

				<!-- -->
				<div class="list-group list-group-flush border-bottom scrollarea float-md-end" style="overflow-y: auto;  height: 95%;">
																								<!-- class에 offcanvas-bottom 지우면 올라갑니다 ㅠㅠ -->
					<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3 offcanvas-bottom" aria-current="true" style="border: none;">
						<img src="https://github.com/twbs.png" alt="twbs" width="45" height="45" class="rounded-circle flex-shrink-0">
						<div class="d-flex gap-2 w-100 justify-content-between">
						  <div>
							<h6 class="mb-0">qwer3543(상대)</h6>
							<p class="mb-0 opacity-75" style="padding-top: 10px; width: 300px;"> 내일 주말이다 아자아자 파팅 ~~~~~~~! 하하하하</p>
						  </div>
						  <small class="opacity-50 text-nowrap">3분전</small>
						</div>
					</a>

					
			
				</div>
			  </div>

			
			<div class="input-group mb-3">
				<input style="height: 45px;" type="text" class="form-control" 
				placeholder="메시지 입력..." aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
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