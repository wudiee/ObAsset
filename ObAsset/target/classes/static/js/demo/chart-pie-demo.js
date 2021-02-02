// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
    
    datasets: [{
      data: [10,10,10,10,10,40],
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


var ctx1 = document.getElementById("myPieChart1");
var myPieChart1 = new Chart(ctx1, {
	  type: 'doughnut',
	  data: {
	    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
	    
	    datasets: [{
	      data: [10,10,10,10,10,40],
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

var ctx2 = document.getElementById("myPieChart2");
var myPieChart2 = new Chart(ctx2, {
	  type: 'doughnut',
	  data: {
	    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
	    
	    datasets: [{
	      data: [10,10,10,10,10,40],
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

var ctx3 = document.getElementById("myPieChart3");
var myPieChart3 = new Chart(ctx3, {
	  type: 'doughnut',
	  data: {
	    labels: ["주식", "예적금", "부동산", "펀드", "채권", "금"],
	    
	    datasets: [{
	      data: [10,10,10,10,10,40],
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
