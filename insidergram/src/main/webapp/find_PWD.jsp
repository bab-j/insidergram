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
<title>비밀번호 찾기</title>

<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	text-align: center;
}

#confirm1 {
	text-align: center;
	border: 1px solid silver;
    border-radius: 3px;
    height: 34px;
    margin-top: 2px;
}

</style>
<style>
@import url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</style>

</head>

<body>
	

	<div id="Header" class="modal modal-signin position-static d-block bg-light py-5" tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
				<div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<h2 class="fw-bold mb-0"
					style="font-family: 'Carattere', cursive; 
					font-size: 70px; padding-bottom: 20px;">
					insidergram
					</h2>
				</div>
				<!-- 틀 만들기 -->
				<div class="modal-body p-5 pt-0">
					<!-- 아이디 -->
					<form action="usercontroller?type=UserIdChk" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;" 
								class=col-4> <a>아이디</a></div>
								<div class=col-8>
									<input class="form-control rounded-3" type="text" name=u_id id="uid"
											placeholder="ID" onfocus="this.placeholder=''"
											onblur="this.placeholder='Username'"> 
								</div>
							</div>
						</div>
					</form>
					<!-- 이메일 -->
					<form action="usercontroller?type=FindID" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>이메일</a></div>
								<div class=col-8>
									<input class="form-control rounded-3" type="email" name="email"
									placeholder="abc123@abc.com" onfocus="this.placeholder=''"
									onblur="this.placeholder='abc123@abc.com'"> 
								</div>
							</div>
						</div>
					</form>
					<!-- 전화번호 -->
					<form action="usercontroller?type=FindID" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>전화번호</a></div>
								<div class=col-8>
									<input class="form-control rounded-3" type="text" name="phone"
									placeholder="010-0000-0000" onfocus="this.placeholder=''"
									onblur="this.placeholder='010-0000-0000'"> 
								</div>
							</div>
						</div>
					</form>
					<!-- 생년월일 -->
					<form action="usercontroller?type=FindID" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>생년월일</a></div>
								<div class=col-8>
									<input class="form-control rounded-3" type="text" name="birth" placeholder="생년월일 6자리"
									onfocus="this.placeholder=''"
									onblur="this.placeholder='생년월일 6자리'"> 
								</div>
							</div>
						</div>
					</form>
					<hr class="my-4">
					<div class="row">
						<div class="col-6">
							<a class="center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
								style="border-color: silver;" type="submit" href="user/login.do">
								<svg class="bi me-1 " width="0px" height="16"></svg>취소
							</a>
						</div>
						<div class="col-6">
							<input class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							style="height: 42px; font-size: 17px" type="submit" id="subm" value="비밀번호 찾기"> 
							<!-- <input type="hidden" name="uID" value="${uid }"> -->
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






