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

    <title>Register</title>

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
                            
                            <form class="user" action="userRegister" method="post">
                               
                               	<!-- 이름 입력 -->
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control form-control-user" 
                                    	id="name" placeholder="Name" required>
                                 <div class="mr-2 d-none d-lg-inline small" style="color:red" id="name_check" ></div>
                                </div>
                                
                                <!-- 아이디 입력 & 중복체크 버튼 -->
                               	<div class="form-group">
                                  <input type="text" name="id" class="form-control form-control-user" 
                                  id="id" placeholder="ID" required>
                                  <div class="mr-2 d-none d-lg-inline small" style="color:red" id="id_check"></div>
                               	</div>
                               	
                                <!-- 비밀번호 입력 -->              
                                <div class="form-group">
                                  <input type="password" name="password" class="form-control form-control-user" 
                                  id="password" placeholder="Password" required>
                                  <div class="mr-2 d-none d-lg-inline small" style="color:red" id="password_check"></div>
                                </div>         
                                
                                <!-- 연령대 선택 -->
                               * 연령대를 선택해주세요 <br>
                                <div class="custom-control custom-radio">
                           <input type="radio" name="generation" id="age-10" value="10" class="custom-control-input" checked>
                           <label class="custom-control-label" for="age-10">10대</label>
                        </div>   
                        <div class="custom-control custom-radio">
                           <input type="radio" name="generation" id="age-20" value="20" class="custom-control-input">
                           <label class="custom-control-label" for="age-20">20대</label>
                        </div>
                        <div class="custom-control custom-radio">
                           <input type="radio" name="generation" id="age-30" value="30" class="custom-control-input">
                           <label class="custom-control-label" for="age-30">30대</label>
                        </div>
                        <div class="custom-control custom-radio">
                           <input type="radio" name="generation" id="age-40" value="40" class="custom-control-input">
                           <label class="custom-control-label" for="age-40">40대</label>
                        </div>
                        <div class="custom-control custom-radio">
                           <input type="radio" name="generation" id="age-50" value="50" class="custom-control-input">
                           <label class="custom-control-label" for="age-50">50대 이상</label>
                        </div>
                        <br>
                               
                                <!-- 은행 선택 -->
                                * 주거래 은행을 선택해주세요 
                                <div class="custom-control custom-radio">
                           <input type="radio" name="bank" id="bank-nh" value="nh" class="custom-control-input" checked>
                           <label class="custom-control-label" for="bank-nh">농협</label>
                        </div>
                                <div class="custom-control custom-radio">
                           <input type="radio" name="bank" id="bank-sh" value="sh" class="custom-control-input">
                           <label class="custom-control-label" for="bank-sh">신한</label>
                        </div>
                                <div class="custom-control custom-radio">
                           <input type="radio" name="bank" id="bank-ibk" value="ibk" class="custom-control-input">
                           <label class="custom-control-label" for="bank-ibk">IBK</label>
                        </div>
                                <div class="custom-control custom-radio">
                           <input type="radio" name="bank" id="bank-kb" value="kb" class="custom-control-input">
                           <label class="custom-control-label" for="bank-kb">국민</label>
                        </div>
                                <div class="custom-control custom-radio">
                           <input type="radio" name="bank" id="bank-wr" value="wr" class="custom-control-input">
                           <label class="custom-control-label" for="bank-wr">우리</label>
                        </div>
                               <br>
                                
                                <input type="submit" class="btn btn-primary btn-user btn-block" 
                                	name="reg_submit" id="reg_submit" value="회원가입" disabled="">
                                                            
                            </form>
                            
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
    idFlag = false;
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#id').val();
		var password = $('#password').val();
		var name = $('#name').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?id='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						idFlag = false;
						$("#id_check").text("사용중인 아이디입니다 :D");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(user_id != ""){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							idFlag = true;
						
							if(password != "" && name !=""){
								$("#reg_submit").attr("disabled", false);
							}
							
						} else {
							id_check = false;
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
							}
						}
				        }, error : function() {
						console.log("실패");
				      }
			    });
		   });
    
	// 비밀번호 유효성 검사
	$("#password").blur(function() {
		var user_id = $('#id').val();
		var password = $('#password').val();
		var name = $('#name').val();	
		
		if(password != ""){
			$("#password_check").text("");
			
			if(id != "" && name !="" && idFlag){
				$("#reg_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#password_check').text('비밀번호를 입력해주세요 :)');
			$('#password_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);				
			
		} 
		
	});
	// 이름 유효성 검사
	$("#name").blur(function() {
		var user_id = $('#id').val();
		var password = $('#password').val();
		var name = $('#name').val();	
		
		if(name != ""){
			$("#name_check").text("");
			
			if(id != "" && password !="" && idFlag){
				$("#reg_submit").attr("disabled", false);
			}
			
		} else {
			
			$('#name_check').text('이름을 입력해주세요 :)');
			$('#name_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);				
			
		} 
		
	});
    </script>

</body>

</html>