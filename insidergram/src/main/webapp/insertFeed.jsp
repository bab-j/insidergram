<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	  
<meta charset="UTF-8">
<title>insidergram : New post</title>

<style>
* {
	padding: 0;
	margin: 0;
	line-height: 1;
}
</style>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	
	<br><br><br><br>

<div id="container">
	<h1>글등록 [insertBoard.jsp]</h1>
	
	
	<form action="user/insertFeed.do" method="post" enctype="multipart/form-data">
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


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
</script>
</body>
</html>