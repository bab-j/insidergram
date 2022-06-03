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
<title>회원 가입</title>

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
<script>
	function idChk() {
		let firstForm = document.forms[0];
		firstForm.submit();
	}

	window.onload = function() {
		let asd = document.getElementById("uid");
		asd.value = "${uid}";
	}
</script>
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
					<form action="user/insertUser.do" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;"
									class=col-4>
									<a>아이디</a>
								</div>
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name=u_id
										id="uid" placeholder="ID" onfocus="this.placeholder=''"
										onblur="this.placeholder='Username'" onfocusout="confirmID()"
										oninvalid="this.setCustomValidity('ID를 입력해 주십시오.')" required>
									<div id="confirmIdResult" class="float-start"
										style="display: none;">ID 중복확인</div>
								</div>
							</div>
						</div>
						<!-- 비밀번호 -->
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;"
									class=col-4>
									<a>비밀번호</a>
								</div>
								<div class=col-7>
									<input class="form-control rounded-3" type="password"
										name=password id="password" placeholder="Password"
										onfocus="this.placeholder=''" onfocusout="confirmPassword()"
										onblur="this.placeholder='Password'"
										oninvalid="this.setCustomValidity('비밀번호를 입력해 주십시오.')" required>
									<div id="confirmPasswordResult" class="float-start"
										style="display: none;">비밀번호 확인</div>
								</div>
								<div class=col-1></div>
							</div>
						</div>
						<!-- 비밀번호 확인 -->
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;"
									class=col-4>
									<a>비밀번호확인</a>
								</div>
								<div class=col-7>
									<input class="form-control rounded-3" type="password"
										name="passwordOk" id="passwordOk"
										placeholder="Confirm Password" onfocus="this.placeholder=''"
										onblur="this.placeholder='Confirm Password'"
										onfocusout="confirmPasswordOk()"
										oninvalid="this.setCustomValidity('비밀번호를 확인해 주십시오.')" required>
									<div id="confirmPasswordOkResult" class="float-start"
										style="display: none;">비밀번호확인 확인</div>
								</div>
								<div class=col-1></div>
							</div>
						</div>
						<!-- 이메일 -->
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;"
									class=col-4>
									<a>이메일</a>
								</div>
								<div class=col-7>
									<input class="form-control rounded-3" type="email" name="email"
										id="email" placeholder="abc123@abc.com"
										onfocus="this.placeholder=''" onfocusout="confirmEmail()"
										onblur="this.placeholder='abc123@abc.com'" required>
								</div>
								<div class=col-1></div>
							</div>
						</div>
						<!-- 이름 -->
						<div class="form-floating mb-3">
							<div class="row">
								<div
									style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;"
									class=col-4>
									<a>이름</a>
								</div>
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name="name"
										id="name" placeholder="홍길동" onfocus="this.placeholder=''"
										onblur="this.placeholder='홍길동'" onfocusout="confirmName()"
										oninvalid="this.setCustomValidity('이름을 입력해 주십시오.')" required>
								</div>
								<div class=col-1></div>
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
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name="phone"
										id="phone" placeholder="010-0000-0000"
										onfocus="this.placeholder=''" onfocusout="confirmPhone()"
										onblur="this.placeholder='010-0000-0000'"
										oninvalid="this.setCustomValidity('전화번호를 입력해주십시오.')" required>
								</div>
								<div class=col-1></div>
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
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name="birth"
										id="birth" placeholder="생년월일 6자리"
										onfocus="this.placeholder=''" onfocusout="confirmBirth()"
										onblur="this.placeholder='생년월일 6자리'"
										oninvalid="this.setCustomValidity('생년월일을 입력해 주십시오.')" required>
								</div>
								<div class=col-1></div>
							</div>
						</div>
						<hr class="my-4">
						<div class="row">
							<div class="col-6">
								<a
									class="center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
									style="border-color: silver;" type="reset" href="user/login.do">
									<svg class="bi me-1 " width="0px" height="16"></svg>취소
								</a>
							</div>
							<div class="col-6">
								<input class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
									style="height: 42px; font-size: 17px" type="submit" id="subm"
									value="가입" disabled> <input type="hidden" name="uID"
									value="${uid }">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script>
		var bId = false;
		var bPwd = false;
		var bPwdOk = false;
		var bEmail = false;
		var bName = false;
		var bPhone = false;
		var bBirth = false;

		function idOk(bool) {
			bId = bool;
		}
		function pwdOk(bool) {
			bPwd = bool;
		}
		function pwdOkOk(bool) {
			bPwdOk = bool;
		}
		function emailOk(bool) {
			bEmail = bool;
		}
		function nameOk(bool) {
			bName = bool;
		}
		function idOk(bool) {
			bId = bool;
		}
		function phoneOk(bool) {
			bPhone = bool;
		}
		function birthOk(bool) {
			bBirth = bool;
		}
		function submitRq() {
			if (bId == true) {
				if (bPwd == true) {
					if (bPwdOk == true) {
						if (bEmail == true) {
							if (bName == true) {
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
						} else {
							document.getElementById("subm").disabled = true;
						}
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
		function confirmID() {
			let id = $("#uid").val();
			$
					.ajax(
							"user/confirmID.do",
							{
								type : "get",
								data : "u_id=" + id,
								dataType : "text",
								success : function(data) {
									console.log(data);
									if (data === "fail") {
										document
												.getElementById("confirmIdResult").style.color = "red";
										document
												.getElementById("confirmIdResult").innerHTML = "존재하는 ID입니다.";
										document
												.getElementById("confirmIdResult").style.display = "inline";
										idOk(false);
										submitRq();
									} else {
										if (id == "") {
											document
													.getElementById("confirmIdResult").style.color = "red";
											document
													.getElementById("confirmIdResult").innerHTML = "ID를 입력해 주세요.";
											document
													.getElementById("confirmIdResult").style.display = "inline";
											idOk(false);
											submitRq();
										} else {
											document
													.getElementById("confirmIdResult").style.color = "blue";
											document
													.getElementById("confirmIdResult").innerHTML = "사용가능한 ID입니다.";
											document
													.getElementById("confirmIdResult").style.display = "inline";
											idOk(true);
											submitRq();
										}

									}

								},
								error : function() {
									alert("실패~~~");
								}
							});
		}

		function confirmPassword() {
			var password = $("#password").val();
			if (password === "") {
				document.getElementById("confirmPasswordResult").style.color = "red";
				document.getElementById("confirmPasswordResult").innerHTML = "비밀번호를 입력해주세요.";
				document.getElementById("confirmPasswordResult").style.display = "inline";
				pwdOk(false);
				submitRq();
			} else {
				document.getElementById("confirmPasswordResult").style.display = "none";
				pwdOk(true);
				submitRq();
			}

		}

		function confirmPasswordOk() {
			var passwordOk = $("#passwordOk").val();
			var password = $("#password").val();
			if (password === passwordOk) {
				if (password == "") {
					document.getElementById("confirmPasswordOkResult").style.color = "red";
					document.getElementById("confirmPasswordOkResult").innerHTML = "비밀번호를 입력해주세요.";
					document.getElementById("confirmPasswordOkResult").style.display = "inline";
					pwdOkOk(false);
					submitRq();

				} else {
					document.getElementById("confirmPasswordOkResult").style.color = "blue";
					document.getElementById("confirmPasswordOkResult").innerHTML = "비밀번호가 일치합니다.";
					document.getElementById("confirmPasswordOkResult").style.display = "inline";
					pwdOkOk(true);
					submitRq();
				}

			} else {
				document.getElementById("confirmPasswordOkResult").style.color = "red";
				document.getElementById("confirmPasswordOkResult").innerHTML = "비밀번호가 다릅니다.";
				document.getElementById("confirmPasswordOkResult").style.display = "inline";
				pwdOkOk(false);
				submitRq();
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

		function confirmName() {
			var name = $("#name").val();
			if (name === "") {
				nameOk(false);
				submitRq();

			} else {
				nameOk(true);
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
</body>
</html>






