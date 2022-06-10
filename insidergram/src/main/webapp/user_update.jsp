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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insidergram : 회원 수정</title>

<style>
* {
	padding: 0;
	margin: 0;
	line-height: 1;
}

.square {
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
	height: 100%;
	display: flex;
	justify-content: space-around;
}
</style>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>

</head>

<body>
	<jsp:include page="./header.jsp"></jsp:include>

	<div class="modal modal-signin position-static d-block bg-light py-5"
		tabindex="-1" role="dialog" id="modalSignin" style="">
		<div class="modal-dialog" role="document" style="max-width: 1000px;">

			<div class="modal-content rounded-4 shadow align-items-md-center">

				<form action="user/insertFeed.do" method="post"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-6 modal-body" style="padding: 30px 48px;">

							<div class="form-floating mb-3">
								<div class="row">

									<hr class="my-4">

									<div class="Col-12 square"
										style="display: inline-block; text-align: center; overflow: hidden; padding: 0px; display: flex; justify-content: space-around;">
										<div class="inner">
											<img id="user_image" src="./img_src/test/kkkk.png" alt=""
												style="height: 100%; width: 100%;">
										</div>
										<div class="row" style="margin-top: 10px;">
											<div class="Col-12"
												style="display: flex; justify-content: space-around">
												<input class="form-control" accept=".jpg"
													onchange="PreviewImage();" name="uploadFile" type="file"
													id="user_profile_img" />
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px;"></div>
									<hr class="my-4">
								</div>

							</div>
						</div>
						<div class="col-6" style="padding: 30px; 48px;">
							<div class="form-floating mb-3">
								<div class="row"
									style="display: flex; justify-content: center; align-items: center;">

									<hr class="my-4">



									<div class="row" style="margin-top: 25px;">
										<div
											style="text-align: center; font-weight: bold; font-size: 18px; text-align: left;"
											class=col-4>비밀번호</div>
										<div class=col-8>
											<input class="form-control rounded-3" type="password"
												name=upwd id="pwd" placeholder="Password"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='Password'">
										</div>
									</div>

									<div class="row" style="margin-top: 25px;">
										<div
											style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;"
											class=col-4>
											<a>비밀번호 확인</a>
										</div>
										<div class=col-8>
											<input class="form-control rounded-3" type="password"
												name=uPwdOk placeholder="Confirm Password"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='Confirm Password'">
										</div>
									</div>

									<div class="row" style="margin-top: 25px;">
										<div
											style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;"
											class=col-4>
											<a>이메일</a>
										</div>
										<div class=col-8>
											<input class="form-control rounded-3" type="email"
												name="email" placeholder="abc123@abc.com"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='abc123@abc.com'">
										</div>
									</div>

									<div class="row" style="margin-top: 25px;">
										<div
											style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;"
											class=col-4>
											<a>전화번호</a>
										</div>
										<div class=col-8>
											<input class="form-control rounded-3" type="text"
												name="phone" placeholder="010-0000-0000"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='010-0000-0000'">
										</div>
									</div>

									<div class="row" style="margin-top: 25px;">
										<div
											style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;"
											class=col-4>
											<a>한줄 소개</a>
										</div>
										<div class=col-8>
											<input class="form-control rounded-3"
												placeholder="날이 좋아서 날이 ..." onfocus="this.placeholder=''"
												onblur="this.placeholder='날이 좋아서 날이 ...'">
										</div>
									</div>
									<div class="row" style="margin-top: 25px;">
										<div class="Col-12"
											style="display: flex; justify-content: space-around">
											<input class="form-control" accept=".jpg"
												onchange="PreviewImage();" name="uploadFile" type="file"
												id="user_profile_img" />
										</div>

									</div>
									<div class="row" style="margin-top: 25px;">
										<div class="col-6">
											<a
												class="center_ailgn w-100 py-2 btn btn-outline-dark rounded-3"
												style="border-color: silver;" type="reset"
												href="javascript:history.back()"> <svg class="bi me-1 "
													width="0px" height="16"></svg>취소
											</a>
										</div>
										<div class="col-6">
											<input
												class="center_ailgn w-100 py-2 btn btn-outline-primary rounded-3"
												type="submit" value="수정" style="">

										</div>
										<div class="Col-12">
										</div>
										<hr class="my-4" style="border: solid 0.6px;">
									</div>
								</div>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		function PreviewImage() {
			// 파일리더 생성 
			var preview = new FileReader();
			preview.onload = function(e) {
				// img id 값 
				document.getElementById("user_image").src = e.target.result;
			};
			// input id 값 
			preview
					.readAsDataURL(document.getElementById("user_profile_img").files[0]);
		};
	</script>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>






