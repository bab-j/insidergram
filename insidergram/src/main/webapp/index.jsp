<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insidergram : start</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// Ajax 요청처리에 의해 데이터 가져와서 화면 표시
	/* 	function getJsonBoardListData() {
	 alert("getJsonBoardListData() 실행~~~");
	 $.ajax("getJsonBoardList.do", {
	 type: "get",
	 dataType: "json",
	 success: function(data){
	 alert("성공~~~");
	 console.log(data);
	
	 let dispHtml = "<ul>";
	 $.each(data, function(index, obj){
	 dispHtml += "<li>";
	 dispHtml += this.seq + ", ";
	 dispHtml += this.title + ", ";
	 dispHtml += this["writer"] + ", ";
	 dispHtml += obj.content + ", ";
	 dispHtml += obj.regdate + ", ";
	 dispHtml += obj["cnt"] + ", ";
	 dispHtml += "</li>";
	 });
	 dispHtml += "<ul>";
	 $("#listDisp").html(dispHtml);
	 },
	 error: function(){
	 alert("실패~~~");
	 }
	 });
	 } */
</script>
<style>
.h1 {
text-align : center;
	font-family: 'Lobster', cursive;
	font-size: 32px;
	font-weight: 3px;
}
.linkline {
text-decoration: none;
color : inherit;
}

.big_font {
margin-top : 100px;;
display : block;
font-size: 70px;

}
</style>
</head>
<body style=" --bs-bg-opacity: 1; background-color: rgba(var(--bs-light-rgb),var(--bs-bg-opacity))!important;">

	<div id="container">
		<br><br><br><br>
		<br><br><br>
		<p class="h1">
			<a class="linkline big_font" href="user/login.do">Let's get in!</a>
		</p>

		<!-- <h2>Ajax 요청 처리</h2>
	<p><a href="javascript:getJsonBoardListData()">JSON 데이터 가져오기(BoardList)</a></p>
	<p><a href="javascript:getJsonBoardData()">JSON 데이터 가져오기(Board)</a></p> -->

		<!-- <div id="listDisp">
		<ul>
			<li>데이터 가져와서 출력하기</li>
		</ul>
	</div> -->
	</div>

	<script>
		/* function getJsonBoardData() {
			alert("getJsonBoardData() 실행~~")
			//let vo = { seq: 1};
			let vo = {};
			vo.seq = 1;
			console.log(vo);
			console.log(JSON.stringify(vo));
			
			$.ajax("getJsonBoard.do", {
				type: "post",
				//data: "seq=1", // key-value 형태
				data: JSON.stringify(vo), // {"seq":1} 문자열 서버로 전송(JSON 문자열)
				contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON 형식)
				dataType: "json", //서버로 부터 응답받을 데이터 형식
				success: function(data){
					alert("성공~~");
					console.log(data);
					
					let dispHtml = "<ul><li>";
					dispHtml += data.seq + ", ";
					dispHtml += data.title + ", ";
					dispHtml += data["writer"] + ", ";
					dispHtml += data.content + ", ";
					dispHtml += data.regdate + ", ";
					dispHtml += data["cnt"] + ", ";
					dispHtml += "</li><ul>";
					$("#listDisp").html(dispHtml);
				},
				error: function(){
					alert("실패~~")
				}
			});
		} */
	</script>
</body>
</html>