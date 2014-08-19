function showtop(){
	t = $(document).scrollTop();
	if(t > 0){
		$('#gotop').show();
	}else{
		$('#gotop').hide();
	}
}
$(document).ready(function(e) {
	showtop();
	$('#gotop').click(function(){
		$(document).scrollTop(0);	
	})
});
$(window).scroll(function(e){
	showtop();		
})
