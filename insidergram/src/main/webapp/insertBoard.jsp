<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>

</head>
<body>

<div id="container">
	<h1>글등록 [insertBoard.jsp]</h1>
	<p><a href="logout.do">로그아웃</a></p>
	
	<form action="board/insertFeed.do" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th width="70">제목</th>
			<td>
				<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" name="writer">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<th>업로드</th>
			<td>
				<input type="file" name="uploadFile">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="새글 등록">
			</td>
		</tr>
	</table>
	</form>
	<p>
		<a href="getBoardList.do">글 목록 가기</a>
	</p>
	
</div>	
</body>
</html>