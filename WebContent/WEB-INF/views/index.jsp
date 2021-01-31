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

    <title>메인화면</title>

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
               
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                            
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">내 자산 추이</h6>
                                </div>
                                
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                            
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">내 포트폴리오 비율</h6>
                                </div>
                                
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-secondary"></i> 주식
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 예적금
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 부동산<br>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 펀드
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-dark"></i> 채권
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> 금
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col mr-2">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

                                    <h6 class="m-0 font-weight-bold text-primary"> ${age}대 포트폴리오 비율</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item" href="${contextPath}/updateAge?age=10">10대</a>
                                            <a class="dropdown-item" href="${contextPath}/updateAge?age=20">20대</a>
                                            <a class="dropdown-item" href="${contextPath}/updateAge?age=30">30대</a>
                                            <a class="dropdown-item" href="${contextPath}/updateAge?age=40">40대</a>
                                            <a class="dropdown-item" href="${contextPath}/updateAge?age=50">50대 이상</a>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">주식 <span
                                            class="float-right">${barData.stock}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-secondary" role="progressbar" style="width: ${barData.stock}%"
                                            aria-valuenow="${barData.stock}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">예적금<span
                                            class="float-right">${barData.deposit}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: ${barData.deposit}%"
                                            aria-valuenow="${barData.deposit}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">부동산<span
                                            class="float-right">${barData.house}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: ${barData.house}%"
                                            aria-valuenow="${barData.house}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">펀드<span
                                            class="float-right">${barData.fund}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: ${barData.fund}%"
                                            aria-valuenow="${barData.fund}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">채권 <span
                                            class="float-right">${barData.bond}%</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-dark" role="progressbar" style="width: ${barData.bond}%"
                                            aria-valuenow="${barData.bond}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <br>
                                    <h4 class="small font-weight-bold">금<span
                                            class="float-right">${barData.gold}%</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: ${barData.gold}%"
                                            aria-valuenow="${barData.gold}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>


                        </div>

                       <!--  <div class="col-lg-6 mb-4">

                        </div> -->
                    </div>

            <!-- 3개원 테스트 -->
            <!-- Pie Chart -->
                <!-- Content Row -->
                    <div class="row">
                    <!-- Content Column -->
            
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                            
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">공격형</h6>
                                </div>
                                
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart1"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-secondary"></i> 주식
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 예적금
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 부동산<br>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 펀드
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-dark"></i> 채권
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> 금
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                            
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">평균</h6>
                                </div>
                                
                                <!-- Card Body -->
                                 <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart2"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-secondary"></i> 주식
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 예적금
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 부동산<br>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 펀드
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-dark"></i> 채권
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> 금
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                            
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">안전형</h6>
                                </div>
                                
                                <!-- Card Body -->
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart3"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-secondary"></i> 주식
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 예적금
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 부동산<br>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 펀드
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-dark"></i> 채권
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> 금
                                        </span>
                                    </div>
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
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
<!-- <script src="js/demo/chart-area-demo.js"></script>-->    
<!-- <script src="js/demo/chart-pie-demo.js"></script>-->
   
   <script language=javascript>
   <!-- 내자산 추이 -->
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
	      var k = Math.pow(10, prec);
	      return '' + Math.round(n * k) / k;
	    };
	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	  if (s[0].length > 3) {
	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	  }
	  if ((s[1] || '').length < prec) {
	    s[1] = s[1] || '';
	    s[1] += new Array(prec - s[1].length + 1).join('0');
	  }
	  return s.join(dec);
	}

	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	    datasets: [{
	      label: "Asset",
	      lineTension: 0.3,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: [${month.get(0)},${month.get(1)},${month.get(2)},${month.get(3)},${month.get(4)},${month.get(5)},
	    	    ${month.get(6)},${month.get(7)},${month.get(8)},${month.get(9)},${month.get(10)},${month.get(11)}],
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return '$' + number_format(value);
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel) + '만원';
	        }
	      }
	    }
	  }
	});
	
	<!-- 내 포트폴리오 그래프 -->
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
	    
	    datasets: [{
	      data: [${myPortfolio.stock}*100,${myPortfolio.deposit}*100,${myPortfolio.house}*100,${myPortfolio.fund}*100,${myPortfolio.bond}*100,${myPortfolio.gold}*100],
	      backgroundColor: ['#858796', '#1cc88a', '#36b9cc', '#4e73df', '#5a5c69', '#f6c23e'],
	      hoverBackgroundColor: ['#60616f', '#13855c', '#258391', '#224abe', '#373840', '#dda20a'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	
	<!-- 공격형 -->
	var ctx1 = document.getElementById("myPieChart1");
	var myPieChart1 = new Chart(ctx1, {
		  type: 'doughnut',
		  data: {
		    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
		    
		    datasets: [{
			  data: [${riskyPortfolio.stock}*100,${riskyPortfolio.deposit}*100,${riskyPortfolio.house}*100,${riskyPortfolio.fund}*100,${riskyPortfolio.bond}*100,${riskyPortfolio.gold}*100],
		      backgroundColor: ['#858796', '#1cc88a', '#36b9cc', '#4e73df', '#5a5c69', '#f6c23e'],
		      hoverBackgroundColor: ['#60616f', '#13855c', '#258391', '#224abe', '#373840', '#dda20a'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 80,
		  },
		});

	<!-- 평균형 -->
	var ctx2 = document.getElementById("myPieChart2");
	var myPieChart2 = new Chart(ctx2, {
		  type: 'doughnut',
		  data: {
		    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
		    
		    datasets: [{
			  data: [${averagePortfolio.stock}*100,${averagePortfolio.deposit}*100,${averagePortfolio.house}*100,${averagePortfolio.fund}*100,${averagePortfolio.bond}*100,${averagePortfolio.gold}*100],
		      backgroundColor: ['#858796', '#1cc88a', '#36b9cc', '#4e73df', '#5a5c69', '#f6c23e'],
		      hoverBackgroundColor: ['#60616f', '#13855c', '#258391', '#224abe', '#373840', '#dda20a'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 80,
		  },
		});

	<!-- 안전형 -->
	var ctx3 = document.getElementById("myPieChart3");
	var myPieChart3 = new Chart(ctx3, {
		  type: 'doughnut',
		  data: {
		    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
		    
		    datasets: [{
			  data: [${safetyPortfolio.stock}*100,${safetyPortfolio.deposit}*100,${safetyPortfolio.house}*100,${safetyPortfolio.fund}*100,${safetyPortfolio.bond}*100,${safetyPortfolio.gold}*100],
		      backgroundColor: ['#858796', '#1cc88a', '#36b9cc', '#4e73df', '#5a5c69', '#f6c23e'],
		      hoverBackgroundColor: ['#60616f', '#13855c', '#258391', '#224abe', '#373840', '#dda20a'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 80,
		  },
		});
	</script>
</body>

</html>