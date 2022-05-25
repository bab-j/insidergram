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
	text-align: center;
}

@import
	url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

#confirm1 {
	text-align: center;
	border: 1px solid silver;
    border-radius: 3px;
    height: 34px;
    margin-top: 2px;
}

.insiderIcon {
	font-family: 'Lobster', cursive;
	font-size: 48px;
	font-weight: 3px;
	text-decoration: none;
	padding-bottom: 20px;
	color: inherit;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function idChk() {
		let firstForm = document.forms[0];
		firstForm.submit();
	}
	function goLogIn() {
		location.href = "login.jsp";
	}

	window.onload = function() {
		let asd = document.getElementById("uid");
		asd.value = "${uid}";
	}
</script>
</head>

<body>
	

	<div id="Header" class="modal modal-signin position-static d-block bg-light py-5" tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
				<div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<h2 class="fw-bold mb-0"><a class="insiderIcon">insidergram</a></h2>
				</div>
				<!-- 틀 만들기 -->
				<div class="modal-body p-5 pt-0">
					<form action="usercontroller?type=UserIdChk" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;" 
								class=col-4> <a>아이디</a></div>
								<div class=col-5>
									<input class="form-control rounded-3" type="text" name=u_id id="uid"
											placeholder="ID" onfocus="this.placeholder=''"
											onblur="this.placeholder='Username'"> 
								</div>
								<div class=col-3>
									<input class="btn btn-outline-secondary" type="button" id="confirm1" value="중복확인" onclick="confirmID()">
								</div>
							</div>
						</div>
						<!-- 아이디 중복 확인-->
						<c:choose>
							<c:when test="${login == 1 }">
								<p style="color: red">사용 불가능한 아이디입니다.</p>
								<input type="hidden" name="clickDu" value="N">
							</c:when>
							<c:when test="${login == 0 }">
								<p style="color: blue">사용 가능한 아이디입니다.</p>
								<input type="hidden" name="clickDu" value="Y">
							</c:when>
						</c:choose>
					</form>
					<!-- 비밀번호 -->
					<form action="usercontroller?type=UserSignUp" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 18px; text-align: left;" 
								class=col-4> <a>비밀번호</a></div>
								<div class=col-7>
									<input class="form-control rounded-3" type="password" name=upwd id="pwd"
									placeholder="Password" onfocus="this.placeholder=''"
									onblur="this.placeholder='Password'"> 
								</div>
								<div class=col-1></div>
							</div>
						</div>
					</form>
					<!-- 비밀번호 확인 -->
					<form method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>비밀번호 확인</a></div>
								<div class=col-7>
									<input class="form-control rounded-3" type="password" name=uPwdOk
									placeholder="Confirm Password" onfocus="this.placeholder=''"
									onblur="this.placeholder='Confirm Password'"> 
								</div>
								<div class=col-1></div>
							</div>
						</div>
					</form>
					<!-- 이메일 -->
					<form method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>이메일</a></div>
								<div class=col-7>
									<input class="form-control rounded-3" type="email" name="email"
									placeholder="abc123@abc.com" onfocus="this.placeholder=''"
									onblur="this.placeholder='abc123@abc.com'"> 
								</div>
								<div class=col-1></div>
							</div>
						</div>
					</form>
					<!-- 이름 -->
					<form method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>이름</a></div>
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name="name" placeholder="홍길동"
									onfocus="this.placeholder=''" onblur="this.placeholder='홍길동'">
								</div>
								<div class=col-1></div>
							</div>
						</div>
					</form>
					<!-- 전화번호 -->
					<form method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>전화번호</a></div>
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name="phone"
									placeholder="010-0000-0000" onfocus="this.placeholder=''"
									onblur="this.placeholder='010-0000-0000'"> 
								</div>
								<div class=col-1></div>
							</div>
						</div>
					</form>
					<!-- 생년월일 -->
					<form method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 17px; text-align: left;" 
								class=col-4> <a>생년월일</a></div>
								<div class=col-7>
									<input class="form-control rounded-3" type="text" name="birth" placeholder="생년월일 6자리"
									onfocus="this.placeholder=''"
									onblur="this.placeholder='생년월일 6자리'"> 
								</div>
								<div class=col-1></div>
							</div>
						</div>
					</form>
					<hr class="my-4">
					<div class="row">
						<div class="col-6">
							<input class=" center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
							style="border-color: silver;" type="button" id="butt" value="취소" onclick="goLogIn()">
						</div>
						<div class="col-6">
							<input class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							style="height: 42px; font-size: 17px" type="submit" id="subm" value="가입"> 
							<input type="hidden" name="uID" value="${uid }">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


		<script>
			function confirmID() {
				let id = $("#uid").val();
				alert("confirmID() 실행~~~");
				$.ajax("confirmID.do", {
					type : "get",
					data : "u_id=" + id,
					dataType : "text",
					success : function(data) {
						alert("성공~~~");
						console.log(data);
						if (data === "fail") {
							alert("아이디가 존재합니다!!");
						} else {
							alert("개어렵넸");
						}

					},
					error : function() {
						alert("실패~~~");
					}
				});
			}
		</script>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
		
		</script>
</body>
</html>






