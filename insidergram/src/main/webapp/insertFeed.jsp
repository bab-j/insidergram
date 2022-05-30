<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insidergram : New post</title>

</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>

<div id="container">
	<h1>글등록 [insertBoard.jsp]</h1>
	
	
	<form action="board/insertFeed.do" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>업로드</th>
			<td>
				<input type="file" name="uploadFile">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>

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