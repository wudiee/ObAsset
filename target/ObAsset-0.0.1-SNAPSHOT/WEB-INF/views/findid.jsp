<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row d-flex justify-content-center align-items-center h-100">

                            <div class="col-lg-10">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="sidebar-brand-text mx-3" style="color:#4e73df"><b>ObAsset</b></h1>
                                    </div><br>
                                        
                                       <div class="form-group">
                                           <input type="email" name="email" class="form-control form-control-user"
                                               id="email" placeholder="Email">
                                         <div class="mr-0 d-none d-lg-inline small" style="color:red" id="email_check" ></div>
                                                
                                       </div>
                                        
                                        
                                      <input type="submit" class="btn btn-primary btn-user btn-block" 
                                           name="findId_submit" id="findId_submit" onclick="sendId()" value="아이디 찾기" disabled="">
                                    
                   					<hr>
                   					
                                    <div class="text-center">
                                        <a class="small" href="/ObAsset/login">로그인</a>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

	<script>
    // 아이디 유효성 검사
	$("#email").blur(function() {
		var user_id = $('#email').val();
		
		if(user_id != ""){
			$("#email_check").text("");
			
			if( email != ""){
				$("#findId_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#email_check').text('이메일을 입력해주세요 :)');
			$('#email_check').css('color', 'red');
			$("#findId_submit").attr("disabled", true);				
		} 
		
	});
    
	function sendId(){

		var email = $("#email").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/find/id?email="+email,
			type : 'get',
			//data : param,
			success: function(result){
				
				if(result==0)
					alert(email+"에 아이디가 발송되었습니다.");
				else if(result==1)
					alert("해당 정보와 일치하는 아이디가 존재하지 않습니다.");
				else
					alert("이메일 발송이 실패하였습니다.\n이메일 확인 부탁 드립니다.");
				
			}
		})
	}
	
    </script>

</body>

</html>