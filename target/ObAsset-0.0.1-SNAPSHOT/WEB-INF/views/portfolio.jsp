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

    <title>Portfolio Management</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/ObAsset/index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img src="img/logo.png">
                </div>
                <div class="sidebar-brand-text mx-1">ObAsset</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            <!-- Heading -->
            <div class="sidebar-heading">
                <br>Information
            </div>

            <!-- Nav Item - Charts -->
            <li class="nav-item active">
                <a class="nav-link" href="/ObAsset/portfolio">
                    <span>Portfolio Management</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="/ObAsset/board">
                    <span>Board</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="/ObAsset/news">
                    <span>Financial Video</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
              <li class="nav-item">
                <a class="nav-link collapsed" href="/ObAsset/logout">
                    <span>Logout</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="modal" data-target="#signOutModal">
                    <span>Withdraw</span>
                </a>
            </li>

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div><span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginOK} 님 반갑습니다.</span></div>
                                <img class="img-profile rounded-circle" src="${bank}">
                            </a>
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
               
                <!-- Content 시작 -->
                <div class="container-fluid">

                    <!-- Nested Row within Card Body -->
                        <div class="row d-flex justify-content-center align-items-center h-100">

                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h3 text-gray-900 mb-4"><b>자산 입력</b></h1>
                                        <h1 class="h6 text-gray-900 mb-4">(단위 : 만원)</h1>
                                    </div>
                                    <form class="user" action="addProperty" method="post">
                                    <input type="hidden" name="id" value = "${loginOK}">
                                    
                                        <div class="form-group">
                                         <input type="text" onKeyup="this.value=this.value.replace(/[^0-9-]/g,'');"
                                          name="stock" class="form-control form-control-user"
                                                id="stock" aria-describedby="emailHelp"
                                                placeholder="주식" > 
                                        </div>
                                        <div class="form-group">
                                            <input type="text" onKeyup="this.value=this.value.replace(/[^0-9-]/g,'');" 
                                            name="deposit" class="form-control form-control-user"
                                                id="deposit" placeholder="예적금">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" onKeyup="this.value=this.value.replace(/[^0-9-]/g,'');" 
                                            name="house" class="form-control form-control-user"
                                                id="house" placeholder="부동산">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" onKeyup="this.value=this.value.replace(/[^0-9-]/g,'');" 
                                            name="fund" class="form-control form-control-user"
                                                id="fund" placeholder="펀드">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" onKeyup="this.value=this.value.replace(/[^0-9-]/g,'');" 
                                            name="bond" class="form-control form-control-user"
                                                id="bond" placeholder="채권">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" onKeyup="this.value=this.value.replace(/[^0-9-]/g,'');"  
                                            name="gold" class="form-control form-control-user"
                                                id="gold" placeholder="금">
                                        </div>
                                        <div class="form-group">
                                            <input type="date" name="regdate" class="form-control form-control-user"
                                                id="regdate" placeholder="입력날짜">
                                        </div>
                                        
                                       <input type="submit" class="btn btn-primary btn-user btn-block" 
                                       		  id="submit" value="입력하기" disabled=""><br>
                                       	<h6 class="h6 text-gray-900 mb-4 text-right">손해일시 "-"기호를 숫자 앞에 붙여주세요</h6>

                                    </form>
                                </div>
                            </div>
                        </div>  
                </div>

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; ObAsset 2021</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<!-- sign out Modal-->
    <div class="modal fade" id="signOutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        
                    </button>
                </div>
                
                 <input type="password" id = "signOut_password" class="form-control"
      											placeholder="탈퇴 인증을 위해 비밀번호를 입력해주세요." required>
                	<div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="#" onclick="signOut()">Withdraw</a>
                    </div>
                    </div>
            
        </div>
    </div>
    
   <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        
                    </button>
                </div>
                <div class="modal-body">ObAsset에서 로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/ObAsset/logout">Logout</a>
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
    
    <!-- 유효성 체크 -->
	<script>
    // 전체 자산 입력시 입력 허용
	$("#stock").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(stock != ""){
			
			if(deposit != "" && house != "" && fund != "" && bond != "" && gold != "" && regdate != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
    // 전체 자산 입력시 입력 허용
	$("#deposit").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(deposit != ""){
			
			if(stock != "" && house != "" && fund != "" && bond != "" && gold != "" && regdate != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
    // 전체 자산 입력시 입력 허용
	$("#house").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(house != ""){
			
			if(deposit != "" && stock != "" && fund != "" && bond != "" && gold != "" && regdate != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
    // 전체 자산 입력시 입력 허용
	$("#fund").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(fund != ""){
			
			if(deposit != "" && house != "" && stock != "" && bond != "" && gold != "" && regdate != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
    // 전체 자산 입력시 입력 허용
	$("#bond").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(bond != ""){
			
			if(deposit != "" && house != "" && fund != "" && stock != "" && gold != "" && regdate != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
    // 전체 자산 입력시 입력 허용
	$("#gold").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(gold != ""){
			
			if(deposit != "" && house != "" && fund != "" && bond != "" && stock != "" && regdate != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
    // 전체 자산 입력시 입력 허용
	$("#regdate").blur(function() {
		var stock = $('#stock').val();
		var deposit = $('#deposit').val();
		var house = $('#house').val();
		var fund = $('#fund').val();
		var bond = $('#bond').val();
		var gold = $('#gold').val();
		var regdate = $('#regdate').val();
		
		if(regdate != ""){
			
			if(deposit != "" && house != "" && fund != "" && bond != "" && gold != "" && stock != ""){
				$("#submit").attr("disabled", false);
			}
			
		} else {
			
			$("#submit").attr("disabled", true);				
			
		} 
		
	});
	</script>
	
	<script>
	
	function signOut(){
		
		var id = "${loginOK}";
		var password = $("#signOut_password").val();
		
		if(password ==""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/withdraw?id="+id+"&password="+password,
			type : 'get',
			//data : param,
			success: function(result){
				
				if(result==0){
					alert("성공적으로 회원탈퇴 되었습니다.");
					window.location.reload();
				}
				else if(result==1)
					alert("비밀번호가 일치하지 않습니다.");
				else
					alert("회원탈퇴에 실패하였습니다.\n다시 시도해주세요.");
				
			}
		})
	}
	</script>
	
</body>

</html>