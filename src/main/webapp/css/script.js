$('.slider').owlCarousel({
	loop: true,
	margin: 0,
	nav: true,
	autoplay: true,
	autoplayTimeout: 4000,
	animateOut: 'fadeOut',
	responsive: {
		0: {
			items: 1
		},
		600: {
			items: 1
		},
		1000: {
			items: 1
		}
	}
})
$('.owl-loaded').owlCarousel({
	loop: true,
	margin: 10,
	dots: false,
	nav: true,
	responsive: {
		0: {
			items: 1
		},
		600: {
			items: 3
		},
		1000: {
			items: 3
		}
	}
})


$(document).ready(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop()) {
			$('.sticky-header').addClass('sticky');
		} else {
			$('.sticky-header').removeClass('sticky');
		}
	})
})

$('.shop-btn').click(function() {
	$('nav .offcanvas_main_menu .shop-show').toggleClass("show");
})
$('.blog-btn').click(function() {
	$('nav .offcanvas_main_menu .blog-show').toggleClass("show");
})
$('.pages-btn').click(function() {
	$('nav .offcanvas_main_menu .pages-show').toggleClass("show");
})
$('.shop-lay-btn').click(function() {
	$('nav .offcanvas_main_menu .lay-show').toggleClass("show");
})
$('.shop-other-btn').click(function() {
	$('nav .offcanvas_main_menu .other-show').toggleClass("show");
})
$('.shop-pro-btn').click(function() {
	$('nav .offcanvas_main_menu .pro-show').toggleClass("show");
})

$('.mini_cart_wrapper').click(function() {
	$('.mini_cart').addClass("active");
})

$('.mini_cart_close').click(function() {
	$('.mini_cart').toggleClass("active");
})
/* Chart function */
function cateChart(id, nameCate = [], numCate = []) {
	const data = {
		labels: nameCate,
		datasets: [{
			label: 'Line Chart',
			data: numCate,
			borderColor: 'rgb(75, 192, 192)',
			tension: 0.1
		}]
	};
	const config = {
		type: 'line',
		data: data,
	};
	let ctx = document.getElementById(id)
	new Chart(ctx, config)
}
function colChart(id, nameCate = [], numCate = []) {
	const data = {
		labels: nameCate,
		datasets: [{
			label: 'My First Dataset',
			data: numCate,
			backgroundColor: [
				'rgba(255, 99, 132, 0.2)',
				'rgba(255, 159, 64, 0.2)',
				'rgba(255, 205, 86, 0.2)',
				'rgba(75, 192, 192, 0.2)',
				'rgba(54, 162, 235, 0.2)',
				'rgba(153, 102, 255, 0.2)',
				'rgba(201, 203, 207, 0.2)',
				'rgba(211, 203, 207, 0.2)',
				'rgba(221, 203, 207, 0.2)',
				'rgba(231, 203, 207, 0.2)',
				'rgba(241, 203, 207, 0.2)',
				'rgba(251, 203, 207, 0.2)'
			],
			borderColor: [
				'rgb(255, 99, 132)',
				'rgb(255, 159, 64)',
				'rgb(255, 205, 86)',
				'rgb(75, 192, 192)',
				'rgb(54, 162, 235)',
				'rgb(153, 102, 255)',
				'rgb(201, 203, 207)',
				'rgba(211, 203, 207)',
				'rgba(221, 203, 207)',
				'rgba(231, 203, 207)',
				'rgba(241, 203, 207)',
				'rgba(251, 203, 207)'
			],
			borderWidth: 1
		}]
	};
	const config = {
		type: 'bar',
		data: data,
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		},
	};

	let ctx = document.getElementById(id)
	new Chart(ctx, config)
}

function polarChart(id, nameCate = [], numCate = []) {
	const data = {
		labels: nameCate,
		datasets: [{
			label: 'Polar Chart',
			data: numCate,
			backgroundColor: [
				'rgb(255, 99, 132)',
				'rgb(255, 159, 64)',
				'rgb(255, 205, 86)',
				'rgb(75, 192, 192)',
				'rgb(54, 162, 235)',
				'rgb(153, 102, 255)',
				'rgb(201, 203, 207)',
				'rgba(211, 203, 207)',
				'rgba(221, 203, 207)',
				'rgba(231, 203, 207)',
				'rgba(241, 203, 207)',
				'rgba(251, 203, 207)'
			]
		}]
	};
	const config = {
		type: 'polarArea',
		data: data,
		options: {}
	};

	let ctx = document.getElementById(id)
	new Chart(ctx, config)
}

function radarChart(id, nameCate = [], numCate = [], numCateRadar2 = []) {
	const data = {
		labels: nameCate,
		datasets: [{
			label: 'Radar Chart',
			data: numCate,
			fill: true,
			backgroundColor: 'rgba(255, 99, 132, 0.2)',
			borderColor: 'rgb(255, 99, 132)',
			pointBackgroundColor: 'rgb(255, 99, 132)',
			pointBorderColor: '#fff',
			pointHoverBackgroundColor: '#fff',
			pointHoverBorderColor: 'rgb(255, 99, 132)'
		}, {
			label: 'My Second Dataset',
			data: numCateRadar2,
			fill: true,
			backgroundColor: 'rgba(54, 162, 235, 0.2)',
			borderColor: 'rgb(54, 162, 235)',
			pointBackgroundColor: 'rgb(54, 162, 235)',
			pointBorderColor: '#fff',
			pointHoverBackgroundColor: '#fff',
			pointHoverBorderColor: 'rgb(54, 162, 235)'
		}]
	};
	const config = {
		type: 'radar',
		data: data,
		options: {
			elements: {
				line: {
					borderWidth: 3
				}
			}
		},
	};

	let ctx = document.getElementById(id)
	new Chart(ctx, config)
}