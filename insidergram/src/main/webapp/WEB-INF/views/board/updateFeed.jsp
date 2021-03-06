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
<title>insidergram : Update post</title>

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body
	style="-bs-bg-opacity: 1; background-color: rgba(var(- -bs-light-rgb), var(- -bs-bg-opacity)) !important;">
	<jsp:include page="../../../header.jsp"></jsp:include>





	<div class="modal modal-signin position-static d-block bg-light"
		tabindex="-1" role="dialog" id="modalSignin"
		style="padding-bottom: 50px;"></div>
	<div class="modal-dialog" role="document "
		style="max-width: 1000px; width: 1000px; height: 800px; margin-top: 70px;">
		<div class="modal-content rounded-4 shadow align-items-md-center">

			<br> <br> <br>
			<div class="modal-body p-5 pt-0 col-12 "
				style="display: inline-flex; float: left; padding: 40px 48px 40px 48px ! important;">
				<c:if test="${fvo.f_pic == null }">
					<form action="user/updateFeed.do" method="post"
						enctype="multipart/form-data" class="col-12" style="text-align: center">
						<div class="form-floating mb-3 col-6"
							style="display: none; float: left;">
							<div class="row" style="width: 100%;">
								<div class="square"
									style="display: inline-block; text-align: center; overflow: hidden; padding: 0px; display: flex; justify-content: space-around;">
									<div class="inner">
										<img id="user_image" src="../img_src/feed/${fvo.f_pic }"
											alt="" style="height: 100%; width: 100%;">
									</div>
								</div>
								<br style="line-height: 30px;">


							</div>
						</div>

						<div class="col-6" style="display: inline-block;">
							<textarea class="form-control" placeholder="" name="content"
								rows="14" style="width: 100%; line-height: 1.57;">${fvo.content }</textarea>
							<input name="f_idx" value="${fvo.f_idx }" type="hidden">
							<br> <br> <br>
							<div class="row">
								<div class="col-6">
									<a
										class="center_ailgn w-100 py-2 btn btn-outline-dark rounded-3"
										style="border-color: silver;" type="reset"
										href="javascript:history.back()"> <svg class="bi me-1 "
											width="0px" height="16"></svg>??????
									</a>
								</div>
								<div class="col-6">
									<input
										class="center_ailgn w-100 py-2 btn btn-outline-primary rounded-3"
										type="submit" value="??????" style="">

								</div>
							</div>
							<br> <br> <br>
						</div>
					</form>
				</c:if>
				<c:if test="${fvo.f_pic != null }">
					<form action="user/updateFeed.do" method="post"
						enctype="multipart/form-data" class="col-12">
						<div class="form-floating mb-3 col-6"
							style="display: flex; float: left;">
							<div class="row" style="width: 100%;">
								<div class="square"
									style="display: inline-block; text-align: center; overflow: hidden; padding: 0px; display: flex; justify-content: space-around;">
									<div class="inner">
										<img id="user_image" src="../img_src/feed/${fvo.f_pic }"
											alt="" style="height: 100%; width: 100%;">
									</div>
								</div>
								<br style="line-height: 30px;">


							</div>
						</div>

						<div class="col-6" style="display: inline-block; float: right;">
							<textarea class="form-control" placeholder="" name="content"
								rows="14" style="width: 100%; line-height: 1.57;">${fvo.content }</textarea>
							<input name="f_idx" value="${fvo.f_idx }" type="hidden">
							<br> <br> <br>
							<div class="row">
								<div class="col-6">
									<a
										class="center_ailgn w-100 py-2 btn btn-outline-dark rounded-3"
										style="border-color: silver;" type="reset"
										href="javascript:history.back()"> <svg class="bi me-1 "
											width="0px" height="16"></svg>??????
									</a>
								</div>
								<div class="col-6">
									<input
										class="center_ailgn w-100 py-2 btn btn-outline-primary rounded-3"
										type="submit" value="??????" style="">

								</div>
							</div>
							<br> <br> <br>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>







	<script>
		function PreviewImage() {
			// ???????????? ?????? 
			var preview = new FileReader();
			preview.onload = function(e) {
				// img id ??? 
				document.getElementById("user_image").src = e.target.result;
			};
			// input id ??? 
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