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

<script>
	function SignUp() {
		location.href = "usercontroller?type=GoSignUp";
	}
</script>

<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	text-align: center;
}

@import
	url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
</style>

<link rel="stylesheet" href="../css/header.css">

</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>

	<div class="modal modal-signin position-static d-block bg-light py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
				<div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<!-- <h5 class="modal-tit"le">Modal title</h5> -->
					<h2 class="fw-bold mb-0"
						style="font-family: 'Lobster', cursive; font-size: 48px;">insidergram</h2>
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
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit" value="로그인">로그인</button>
						<small class="text-muted">By clicking Sign up, you agree
							to the terms of use.</small>
						<hr class="my-4">

					</form>
					<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
						type="submit" href="#">
						<svg class="bi me-1" width="16" height="16"></svg>
						회원가입
					</button>
					<div class="row">
						<div class="col-6">
							<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
								type="submit" href="#">
								<svg class="bi me-1" width="16" height="16"></svg>
								Find ID
							</button>
						</div>
						<div class="col-6">
							<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
								type="submit" href="#">
								<svg class="bi me-1" width="16" height="16"></svg>
								Find Password
							</button>
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