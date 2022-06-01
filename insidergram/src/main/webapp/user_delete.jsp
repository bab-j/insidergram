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
<title>계정 삭제</title>


<style>
body {
	--bs-bg-opacity: 1;
    background-color: rgba(var(--bs-light-rgb),var(--bs-bg-opacity))!important;
	text-align: center;
	
}
	
.center_ailgn{
text-align: center;
}	

</style>



</head>
<body>

	<div class="modal modal-signin position-static d-block bg-light py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow align-items-md-center">
					<div class="modal-header p-5 pb-4 border-bottom-0 cen">
						<h2 class="fw-bold mb-0" 
							style="font-style: italic; font-size: 45px; padding-bottom: 20px;">계정 삭제</h2>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="usercontroller?type=delete" method="post">
							
							<div class="form-floating mb-3">
								<input class="form-control rounded-3" type="password"
									name="password" id="pwd" placeholder="PASSWORD"
									onfocus="this.placeholder=''"
									onblur="this.placeholder='Password'"> <label
									for="floatingPassword">Password</label>
							</div>
							
							<div class="form-floating mb-3" style="height: 20px;">
								<div class="form-control rounded-3" style="border:none; text-align: left; padding-top: 0px; padding-left: 0px;">
									<input type="checkbox" class="form-check-input" id="dropdownCheck">
									<label class="form-check-label" for="dropdownCheck">Really you want to delete your account?</label>
								</div>
							</div>
							<hr class="my-4">
						</form>
						<div class="row">
							<div class="col-6">
								<a class="center_ailgn w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
									style="border-color: silver;" type="submit" href="./Personal_story.jsp">
									<svg class="bi me-1 " width="0px" height="16"></svg>취소
								</a>
							</div>
							<div class="col-6">
								<input class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
								style="height: 42px; font-size: 17px" type="submit" id="subm" value="수정"> 
							</div>
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