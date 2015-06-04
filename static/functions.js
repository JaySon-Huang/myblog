function showtop(){
    t = $(document).scrollTop();
    if (t > 0){
        $('#gotopbox').show();
    }else{
        $('#gotopbox').hide();
    }
}
$(document).ready(function(e) {
    showtop();
    $('#gotopbox').click(function() {
        $(document).scrollTop(0);
    });
});
$(window).scroll(function(e) {
    showtop();
});
