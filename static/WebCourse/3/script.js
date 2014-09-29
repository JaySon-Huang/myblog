timer_id = NaN;
function toggleListItemClass (item) {
	if (item.hasClass('highlight')){
		item.removeClass();
	}else{
		item.addClass('highlight');
	}
}
function setChangeliColorTimer (interval) {

	var list_item = $('#movie_names>li:first');
	timer_id = setInterval(function (){
		toggleListItemClass(list_item);
		list_item = list_item.next();
		if(list_item.length == 0)	list_item = $('#movie_names>li:first');
	},interval);
}
function reverseStr (str) {
	var retVal = "";
	for (var i = str.length - 1; i >= 0; i--) {
		retVal += str[i];
	}
	return retVal;
}
function onReverseBtnClick(){
	var list_items = $('#movie_names>li .m_name');
	var text = "";
	for (var i=0; i!= list_items.length; ++i){
		item = list_items[i];
		text += reverseStr( item.innerHTML );
		text += '\n';
	}
	alert(text);
}
function onReverListClick(){
	var list_items = $('#movie_names>li .m_name');
	var text = "";
	for (var i=list_items.length-1; i >= 0; --i){
		text += list_items[i].innerHTML + '\n';
	}
	alert(text);
}
