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
<% 
	String msg = (String)session.getAttribute("loginResult"); 
	if(msg != null && !(msg.equals("")) ){
%>
<script>
  alert(<%=msg%>);
</script>

<%
	} session.removeAttribute("loginResult");
%>
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
                                    <form class="user" action="loginCheck" method="post">
                                        <div class="form-group">
                                            <input type="text" name="id" class="form-control form-control-user"
                                                id="id" placeholder="ID">
                                          <div class="mr-0 d-none d-lg-inline small" style="color:red" id="id_check" ></div>
                                                
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control form-control-user"
                                                id="password" placeholder="Password">
                                           <div class="mr-0 d-none d-lg-inline small" style="color:red" id="password_check" ></div>
                                                
                                        </div>
                                        
                                       <input type="submit" class="btn btn-primary btn-user btn-block" 
                                           name="login_submit" id="login_submit" value="로그인" disabled="">

                                    </form>
                                    
                                    <hr>
                                     <div class="text-center">
                                        <a class="small" href="/ObAsset/findId">아이디 찾기</a>
                                        <a class="small" href="/ObAsset/findPassword">비밀번호 찾기</a>
                                    </div>
                                    
                                    <div class="text-center">
                                        <a class="small" href="/ObAsset/register">회원가입</a>
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
	$("#id").blur(function() {
		var user_id = $('#id').val();
		var password = $('#password').val();
		
		if(user_id != ""){
			$("#id_check").text("");
			
			if(password != ""){
				$("#login_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#id_check').text('아이디를 입력해주세요 :)');
			$('#id_check').css('color', 'red');
			$("#login_submit").attr("disabled", true);				
			
		} 
		
	});
    
	// 비밀번호 유효성 검사
	$("#password").blur(function() {
		var user_id = $('#id').val();
		var password = $('#password').val();
		
		if(password != ""){
			$("#password_check").text("");
			
			if(id != ""){
				$("#login_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#password_check').text('비밀번호를 입력해주세요 :)');
			$('#password_check').css('color', 'red');
			$("#login_submit").attr("disabled", true);				
			
		} 
		
	});
	
    </script>

</body>

</html>