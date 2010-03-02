$(document).ready(function(){

	// on hover of a gallery item do...
	$('.gallery li').hover(function(){

		// slide up the caption by 70px (160px - 90px)
		$(".caption", this).stop().animate({top:'90px'},{queue:false,duration:160});

	// off hover
	}, function() {

		// slide down the caption to original position (160px from the top of the gallery item)
		$(".caption", this).stop().animate({top:'160px'},{queue:false,duration:160});
	});
});