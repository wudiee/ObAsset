<%@page import="java.util.Collections"%>
<%@page import="com.ob.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시판</title>

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
            <li class="nav-item">
                <a class="nav-link" href="/ObAsset/portfolio">
                    <span>Portfolio Management</span></a>
            </li>

           <!-- Nav Item - Tables -->
            <li class="nav-item active">
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

				<% 
					List<Board> boardList = (List<Board>)request.getAttribute("boardList");
				%>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">자유 게시판</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    	<% 
                                    		int idx = boardList.size();
											for(Board board:boardList){
                                    	%>
                                    	
                                    	<tr>
                                    		<td style="color: white">
                                    			<%=idx %>
                                    		</td>
                                    		<td>
                                    		<a href="/ObAsset/content?id=<%=board.getId()%>&seq=<%=board.getSeq()%>">
                                    			<%=board.getTitle() %></a>
                                    		</td>
                                    		<td>
                                    			<%=board.getId() %>
                                    		</td>
                                    		<td>
                                    			<%=board.getRegdate() %>
                                    		</td>
                                    		<td>
                                    			<%=board.getCnt() %>
                                    		</td>
                                    	</tr>
                                    	<% idx--; }%>
                                    </tbody>
                                 </table>
                                
                            	 <a href="/ObAsset/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">글쓰기</a>
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

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
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

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

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    
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