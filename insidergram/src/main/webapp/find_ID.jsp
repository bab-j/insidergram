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
<title>아이디 찾기</title>

<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
	text-align: center; -
	-bs-bg-opacity: 1;
	background-color: rgba(var(- -bs-light-rgb), var(- -bs-bg-opacity))
		!important;
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
@import
	url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</style>

</head>

<body>


	<div id="Header"
		class="modal modal-signin position-static d-block bg-light py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
				<div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<h2 class="fw-bold mb-0"
						style="font-family: 'Carattere', cursive; font-size: 70px; padding-bottom: 20px;">
						insidergram</h2>
				</div>
				<!-- 틀 만들기 -->
				<div class="modal-body p-5 pt-0">
					<!-- 이메일 -->
					<form action="javascript:forgetId()" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;"
									class=col-4>
									<a>이메일</a>
								</div>
								<div class=col-8>
									<input class="form-control rounded-3" type="email" name="email"
										id="email" placeholder="abc123@abc.com"
										onfocus="this.placeholder=''" onfocusout="confirmEmail()"
										onblur="this.placeholder='abc123@abc.com'" required>
								</div>
							</div>
						</div>

						<!-- 전화번호 -->
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;"
									class=col-4>
									<a>전화번호</a>
								</div>
								<div class=col-8>
									<input class="form-control rounded-3" type="text" name="phone"
										id="phone" placeholder="- 제외하고 입력해 주세요"
										onfocus="this.placeholder=''" onfocusout="confirmPhone()"
										onblur="this.placeholder='- 제외하고 입력해 주세요' " required>
								</div>
							</div>
						</div>
						<!-- 생년월일 -->
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;"
									class=col-4>
									<a>생년월일</a>
								</div>
								<div class=col-8>
									<input class="form-control rounded-3" type="text" name="birth"
										id="birth" placeholder="생년월일 6자리"
										onfocus="this.placeholder=''" onfocusout="confirmBirth()"
										onblur="this.placeholder='생년월일 6자리'" required>
								</div>
							</div>
						</div>
						<hr class="my-4">
						<div class="row">
							<div class="col-6">
								<a
									class="center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
									style="border-color: silver;" href="user/login.do"> <svg
										class="bi me-1 " width="0px" height="16"></svg>취소
								</a>
							</div>
							<div class="col-6">
								<input class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
									style="height: 42px; font-size: 17px" type="submit" id="subm"
									value="아이디 찾기" disabled>

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function forgetId() {
			var email = $("#email").val();
			var phone = $("#phone").val();
			var birth = $("#birth").val();
			$.ajax("user/forgetId.do", {
				type : "get",
				data : {
					"email" : email,
					"phone" : phone,
					"birth" : birth
				},
				dataType : "text",
				success : function(data) {
					console.log(data);
					alert("ID : " + data);
				},
				error : function() {
					alert("실패~~~");
				}
			});
		}

		var bEmail = false;
		var bPhone = false;
		var bBirth = false;

		function emailOk(bool) {
			bEmail = bool;
		}
		function phoneOk(bool) {
			bPhone = bool;
		}
		function birthOk(bool) {
			bBirth = bool;
		}
		function submitRq() {
			if (bEmail == true) {
				if (bPhone == true) {
					if (bBirth == true) {
						document.getElementById("subm").disabled = false;
					} else {
						document.getElementById("subm").disabled = true;
					}
				} else {
					document.getElementById("subm").disabled = true;
				}
			} else {
				document.getElementById("subm").disabled = true;
			}
		}

		function confirmEmail() {
			var email = $("#email").val();
			if (email === "") {
				emailOk(false);
				submitRq();

			} else {
				emailOk(true);
				submitRq();
			}

		}

		function confirmPhone() {
			var phone = $("#phone").val();
			if (phone === "") {
				phoneOk(false);
				submitRq();

			} else {
				phoneOk(true);
				submitRq();
			}

		}

		function confirmBirth() {
			var birth = $("#birth").val();
			if (birth === "") {
				birthOk(false);
				submitRq();

			} else {
				birthOk(true);
				submitRq();
			}

		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
		integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>






