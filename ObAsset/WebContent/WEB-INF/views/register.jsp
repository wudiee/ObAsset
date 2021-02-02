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

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                <!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->                   
                 <div><img src ="img/logo.png"/></div>
                 
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            
                            <form class="user" action="userRegister" method="post">
                               
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control form-control-user" id="exampleFirstName"
                                        placeholder="Name">
                                </div>
                                <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">중복체크</label>
                                </div>
                               
                                <div class="form-group">
                                    <input type="text" name="id" class="form-control form-control-user" id="exampleFirstName"
                                        placeholder="Id">
                                </div> 
                                
                                              
                                 <div class="form-group">
                                  <input type="password" name="password" class="form-control form-control-user" id="exampleFirstName"
                                        placeholder="Password">
                                </div>         
                                                 
                                
                                <!-- 연령대 선택 -->
                               * 연령대를 선택해주세요 <br>
                                
                                <div class="custom-control custom-radio">
                           <input type="radio" name="generation" id="age-10" value="10" class="custom-control-input">
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
                           <label class="custom-control-label" for="age-50">50대</label>
                        </div>
                        <br>
                               
                                <!-- 은행 선택 -->
                                * 주거래 은행을 선택해주세요 
                                <div class="custom-control custom-radio">
                           <input type="radio" name="bank" id="bank-nh" value="nh" class="custom-control-input">
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
                                
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="회원가입">
                                                            
                            </form>
                            
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

</body>

</html>