var header = $('.container-head');
var logo = $('.logo');
function checkScrollTop() {
	if ($(window).scrollTop() < 10) {
		header.removeClass('scrollActive');
		logo.removeClass('scrollActive');
	} else {
		header.addClass('scrollActive');
		logo.addClass('scrollActive');
	}
}

checkScrollTop();


$(window).on('scroll', checkScrollTop);