function showtop(){
	t = $(document).scrollTop();
	if(t > 0){
		$('#gotop').show();
	}else{
		$('#gotop').hide();
	}
}
// 获取当前页导航 高亮显示标题
function set_current(){
	var pages=$('nav a');
	var cur_page=pages[0];
	for (var i=0;i<pages.length;++i){
		if(window.location.href.indexOf(pages[i].href)>=0)
			cur_page=pages[i];
	}
	cur_page.id='nav_current';
}
$(document).ready(function(e) {
	set_current();
	showtop();
	$('#gotop').click(function(){
		$(document).scrollTop(0);	
	});
});
$(window).scroll(function(e){
	showtop();		
})
