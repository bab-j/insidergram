<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
body {
	padding-top: 75px;
	
}

.bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.home {
	margin-left: 50px;
	margin-top: 10px;
}

form p {
	margin-bottom: 1px;
	margin-top: 0px;
}
.sign h1 {
	padding : 0px;
}

table {
	width: 400px;
	border-collapse: collapse;
	margin-bottom: 0px;
}

th {
	width: 50px;
	padding-left: 20px;
	font-family: monospace;
	font-size: 1em;
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
	
	window.onload = function () {
		let asd = document.getElementById("uid");
		asd.value = "${uid}";
	}
	
	
	
	}
</script>
</head>

<body>
	<div class="bar">
		<div class="home">
			<h3>instarkilogram</h3>
		</div>
	</div>

	<div class="sign">
		<h1>
			<i>instarkilogram</i>
		</h1>
		<form action="usercontroller?type=UserIdChk" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name=uid id="uid" placeholder="Username" onfocus="this.placeholder=''" onblur="this.placeholder='Username'">
						<input type="button" id="button1" value="중복확인" onclick="confirmID()">
					</td>
				</tr>
			</table>
			<a href="javascript:confirmID()">중복확인</a>
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
						onfocus="this.placeholder=''" onblur="this.placeholder='생년월일 6자리'"></td>
				</tr>
			</table>
			<input type="button" id="butt" value="취소" onclick="goLogIn()">
			<input type="submit" id="subm" value="가입" >
			 <input type="hidden" name="uID" value="${uid }">
		</form>
	</div>
<script>

function confirmID() {
	let id = $("#uid").val();
	alert("confirmID() 실행~~~");
	$.ajax("confirmID.do", {
		type: "get",
		data: "id=" + id,
		dataType: "text",
		success: function(data){
			alert("성공~~~");
			console.log(data);
			if(data === "fail") {
				alert("아이디가 존재합니다!!");
			} else {
				alert("개어렵넸");
			}
				
		},
		error: function(){
			alert("실패~~~");
		}
	});
}
</script>
</body>
</html>






