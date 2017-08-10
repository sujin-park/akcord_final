var header = $('.container-head');
function checkScrollTop() {
	if ($(window).scrollTop() < 10) {
		header.removeClass('scrollActive');
	} else {
		header.addClass('scrollActive');
	}
}

checkScrollTop();


$(window).on('scroll', checkScrollTop);