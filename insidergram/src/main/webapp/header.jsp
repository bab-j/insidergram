<!DOCTYPE html>
<html lang="en">
<head>
    
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="../css/header.css">

</head>
<body>

    <!-- 메인 페이지로 접속시 세션에 값이 담겨있는지 체크-->
    <!-- <%
        String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}  %>
    만약 ID값이 있다면 userID로 값 저장 -->
    
    <!--  로그인 하지 않았을 때 보여지는 화면
		  <%  if(userID == null){  %>
    -->
    <div id="Hader">
        <div class="container">
            <div class="row">
                <div class="col-3" style="font-family: 'Lobster', cursive; font-size: 32px;">
                    <a href="#">Insidegram</a>
                </div>
                <div class="col-6"></div>
                <div class="col-3"></div>
            </div>
        </div>
    </div>

    <!--  로그인이 되어 있는 상태에서 보여주는 화면
			<%	}else{   %>
    -->

    <div id="Hader">
        <div class="container" style="margin-top: 10px;">
            <div class="row">
            <div class="col-3" style="font-family: 'Lobster', cursive; font-size: 32px;">
                <a href="#">Insidegram</a>
            </div>
            <div class="col-6">
                <div class="container1">
                    <form action="feedcontroller?type=search" method="post" >
                        <span> 
                            <input class="total_search" type="text" id="search" name="keyword"
                            placeholder="통합검색">&nbsp; <input class="search_btn" type="submit" value="검색">
                        </span>
                    </form>
                </div>
            </div>
                <div class="col-3">
                    <div class="nav-icon" style="text-align: right;">
                        <ul>
                            <li class="material-icons " ><a href="#">home</a></li>
                            <li class="material-icons-outlined "><a href="#">add_circle_outline</a></li>
                            <li class="material-icons "><a href="#">logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- <%  }  %> -->



    <!-- 부트스트랩 -->
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
	</script>
</body>
</html>