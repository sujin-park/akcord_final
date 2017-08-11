var header = $('.container-head');
var logo = $('.logo');
var gear = $('.fa-gear');
function checkScrollTop() {
	if ($(window).scrollTop() < 10) {
		header.removeClass('scrollActive');
		logo.removeClass('scrollActive');
		gear.removeClass('scrollActive');
	} else {
		header.addClass('scrollActive');
		logo.addClass('scrollActive');
		gear.addClass('scrollActive');
	}
}

checkScrollTop();


$(window).on('scroll', checkScrollTop);