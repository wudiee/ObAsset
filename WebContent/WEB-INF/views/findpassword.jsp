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
  alert("아이디 또는 비밀번호를 확인해주세요!");
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

                                     <div class="form-group">
                                        <input type="text" name="id" class="form-control form-control-user"
                                              id="id" placeholder="ID">
                                        <div class="mr-0 d-none d-lg-inline small" style="color:red" id="id_check" ></div>
                                                
                                      </div>
                                        
                                       <div class="form-group">
                                          <input type="email" name="email" class="form-control form-control-user"
                                               id="email" placeholder="Email">
                                         <div class="mr-0 d-none d-lg-inline small" style="color:red" id="email_check" ></div>
                                       </div>
                                        
                                       <input type="submit" class="btn btn-primary btn-user btn-block" 
                                           name="findPassword_submit" onclick="sendPassword()" id="findPassword_submit" value="비밀번호 찾기" disabled="">

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
	$("#id").blur(function() {
		var user_id = $('#id').val();
		var email = $('#email').val();
		
		if(user_id != ""){
			$("#id_check").text("");
			
			if(email != ""){
				$("#findPassword_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#id_check').text('아이디를 입력해주세요 :)');
			$('#id_check').css('color', 'red');
			$("#findPassword_submit").attr("disabled", true);				
			
		} 
		
	});
    
	// 비밀번호 유효성 검사
	$("#email").blur(function() {
		var user_id = $('#id').val();
		var email = $('#email').val();
		
		if(email != ""){
			$("#email_check").text("");
			
			if(id != ""){
				$("#findPassword_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#email_check').text('이메일을 입력해주세요 :)');
			$('#email_check').css('color', 'red');
			$("#findPassword_submit").attr("disabled", true);				
			
		} 
		
	});
	
	function sendPassword(){
		
		var id = $('#id').val();
		var email = $("#email").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/find/password?id="+id+"&email="+email,
			type : 'get',
			success: function(result){
				
				if(result==0)
					alert(email+"에 회원정보가 발송되었습니다.");
				else if(result==1)
					alert("해당 정보와 일치하는 계정이 존재하지 않습니다.");
				else
					alert("비밀번호 발송이 실패하였습니다.\n이메일 확인 부탁 드립니다.");
				
			}
		})
	}
	
    </script>

</body>

</html>