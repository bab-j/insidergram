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

.square {
	
	position: relative;
	overflow: hidden;
}

.square:after {
	content: "";
	display: block;
	padding-bottom: 100%;
}

.inner {
	position: absolute;
	
	height: 100%;
	display: flex;
	justify-content: space-around;
}
</style>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Carattere&display=swap');
</style>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	
	


	
	<div class="modal modal-signin position-static d-block bg-light"tabindex="-1" role="dialog" id="modalSignin" style="padding-bottom: 50px;"></div>
        <div class="modal-dialog" role="document">
            <div class="modal-content rounded-4 shadow align-items-md-center">
                <div class="modal-header p-5 pb-4 border-bottom-0 cen">
					<h2 class="fw-bold mb-0"
						style="font-family: 'Carattere', cursive; font-size: 70px;">
						insidergram</h2>
				</div>
                <div class="modal-body p-5 pt-0">
                    <form action="user/insertFeed.do" method="post" enctype="multipart/form-data">
                        <div class="form-floating mb-3">
                            <div class="row">
                                
                                    <hr class="my-4">
                                
                                <div class="Col-12 square" style="display: inline-block;text-align: center;overflow: hidden;padding: 0px;display: flex; justify-content: space-around;">
                                    <div class="inner">
                                        <img id="user_image" src="./img_src/test/kkkk.png" alt="" style="height: 100%; width: 100%;">
                                    </div>
                                </div>

                                    <hr class="my-4">
                                
                                <div class="Col-12" style="display: flex;justify-content: space-around">
                                    <input class="form-control" accept=".jpg" onchange="PreviewImage();" name="uploadFile" type="file" id="user_profile_img" />
                                </div>

                                <div class="Col-12"><h5 style="color: white;">.</h5></div>

                                <div class="Col-12">
                                    <textarea class="form-control" placeholder="내용 입력" name="content" rows="5" ></textarea>
                                </div>
                                <div class="Col-12"><h5 style="color: white;">.</h5></div>

                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <a
                                        class="center_ailgn w-100 py-2 btn btn-outline-dark rounded-3"
                                        style="border-color: silver;" type="reset" href="getBoardList.do">
                                        <svg class="bi me-1 " width="0px" height="16"></svg>취소
                                    </a>
                                </div>
                                <div class="col-6">
                                    <input class="center_ailgn w-100 py-2 btn btn-outline-primary rounded-3" type="submit" value="새글 등록" style="">
                                    
                                </div>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>


	


<script>
function PreviewImage() {
    // 파일리더 생성 
    var preview = new FileReader();
    preview.onload = function (e) {
    // img id 값 
    document.getElementById("user_image").src = e.target.result;
};
// input id 값 
preview.readAsDataURL(document.getElementById("user_profile_img").files[0]);
};
</script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
</script>
</body>
</html>