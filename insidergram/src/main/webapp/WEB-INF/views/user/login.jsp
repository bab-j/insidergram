<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="en">
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>

<script src="js/jquery-3.3.1.min.js"></script>
<script>

	function SignUp() {
		location.href = "usercontroller?type=GoSignUp";
	}
	
	function loginCheck() {
		
		var inputFrm = document.inputFrm;
		var name = inputFrm.name.value;
		var password = inputFrm.password.value;
		
		
		if(!name || !password){
			                alert("아이디와 비밀번호를 모두 입력해주세요.")
			            }else{
			inputFrm.submit();
			            }
			        }
		
		
</script>

<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	text-align: center; -
	-bs-bg-opacity: 1;
	background-color: rgba(var(- -bs-light-rgb), var(- -bs-bg-opacity))
		!important;
}

.center_ailgn {
	text-align: center;
}
@font-face {
  font-family: 'Carattere';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url(https://fonts.gstatic.com/s/carattere/v7/4iCv6Kp1b9dXlgt_Ckvjv2yNL4U.woff2) format('woff2');
  unicode-range: U+0102-0103, U+0110-0111, U+0128-0129, U+0168-0169, U+01A0-01A1, U+01AF-01B0, U+1EA0-1EF9, U+20AB;
}
/* latin-ext */
@font-face {
  font-family: 'Carattere';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url(https://fonts.gstatic.com/s/carattere/v7/4iCv6Kp1b9dXlgt_CkvjvmyNL4U.woff2) format('woff2');
  unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
}
/* latin */
@font-face {
  font-family: 'Carattere';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url(https://fonts.gstatic.com/s/carattere/v7/4iCv6Kp1b9dXlgt_CkvjsGyN.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
}
</style>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>

</head>
<body>

	<div class="modal modal-signin position-static d-block bg-light py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
				<div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<h2 class="fw-bold mb-0"
						style="font-family: 'Carattere', cursive; font-size: 70px; padding-bottom: 20px;">insidergram</h2>
				</div>

				<div class="modal-body p-5 pt-0">
					<form class="" name="inputFrm" action="login.do" method="post">
						<div class="form-floating mb-3">
							<input class="form-control rounded-3" type="text" name="u_id"
								id="name" placeholder="ID" onfocus="this.placeholder=''"
								onblur="this.placeholder='Username'"> <label
								for="floatingInput">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control rounded-3" type="password"
								name="password" id="pwd" placeholder="PASSWORD"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Password'"> <label
								for="floatingPassword">Password</label>
						</div>
						<input type="button"
							class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" value="로그인"
							onclick="loginCheck()">로그인
						</button>
						<small class="text-muted">By clicking Sign up, you agree
							to the terms of use.</small>
						<hr class="my-4">

					</form>
					<a class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
						style="border-color: silver;" href="../signUp.jsp"> <svg
							class="bi me-1" width="0px" height="16"></svg> 회원가입
					</a>
					<div class="row">
						<div class="col-6">
							<a
								class="center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
								style="border-color: silver;" type="submit"
								href="../find_ID.jsp"> <svg class="bi me-1 " width="0px"
									height="16"></svg>아이디 찾기
							</a>
						</div>
						<div class="col-6">
							<a
								class=" center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
								style="border-color: silver;" type="submit"
								href="../find_PWD.jsp"> <svg class="bi me-1 " width="0px"
									height="16"></svg> 비밀번호 찾기
							</a>
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