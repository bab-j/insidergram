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

.center_ailgn {
	text-align: center;
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
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="modal modal-signin position-static d-block bg-light py-5" tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
				<div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<h2 class="fw-bold mb-0"
						style="font-family: 'Lobster', cursive; font-size: 48px;">insidergram</h2>
				</div>
				<!-- 틀 만들기 -->
				<div class="modal-body p-5 pt-0">
					<form action="usercontroller?type=UserIdChk" method="post">
						<div class="form-floating mb-3">
							<div class="row">
								<div class=col-9>
									<input class="form-control rounded-3" type="text" name=uid id="uid"
											placeholder="아이디" onfocus="this.placeholder=''"
											onblur="this.placeholder='Username'"> 
								</div>
								<div class=col-3>
									<input type="button" id="button1" value="중복확인" onclick="confirmID()">
								</div>
							</div>
						</div>
						<!-- 아이디 -->
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name=uid id="uid"
									placeholder="Username" onfocus="this.placeholder=''"
									onblur="this.placeholder='Username'"> <input
									type="button" id="button1" value="중복확인" onclick="confirmID()">
								</td>
							</tr>
						</table>
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
					<form action="usercontroller?type=UserSignUp" method="post">
						<table>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name=upwd id="pwd"
									placeholder="Password" onfocus="this.placeholder=''"
									onblur="this.placeholder='Password'"></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" name=uPwdOk
									placeholder="Confirm Password" onfocus="this.placeholder=''"
									onblur="this.placeholder='Confirm Password'"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email"
									placeholder="abc123@abc.com" onfocus="this.placeholder=''"
									onblur="this.placeholder='abc123@abc.com'"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" placeholder="홍길동"
									onfocus="this.placeholder=''" onblur="this.placeholder='홍길동'"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="phone"
									placeholder="010-0000-0000" onfocus="this.placeholder=''"
									onblur="this.placeholder='010-0000-0000'"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="birth" placeholder="생년월일 6자리"
									onfocus="this.placeholder=''"
									onblur="this.placeholder='생년월일 6자리'"></td>
							</tr>
						</table>
						<input type="button" id="butt" value="취소" onclick="goLogIn()">
						<input type="submit" id="subm" value="가입"> <input
							type="hidden" name="uID" value="${uid }">
					</form>
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
					data : "uId=" + id,
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






