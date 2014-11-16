current_pos = -1;
document.onkeydown=function keydownlistener(e){
	var keyCode=e.which;
	if (keyCode == 38){//上
		current_pos=(current_pos+1)%num_of_item();
		current_pos
	}else if(keyCode == 40){//下
		if (current_pos==-1){
			current_pos=0;
		}
		current_pos=(current_pos-1)%num_of_item();

	}
	// alert('code:'+keyCode);
};

function createElement (type) {
	return document.createElement(type);
}
function num_of_item(){
	return $('#list li').length;
}
function on_select () {
	var lst_li = $('#list li');
	var cnt = 0;
	for (var i=0;i!=lst_li.length;++i){
		if (lst_li.children()[i].checked){
			cnt += 1;
		}
	}
	var status_text = '';
	if (cnt != 0){status_text += '选择了'+cnt+'个待办事项.\n';}
	status_text += '当前共有'+num_of_item()+'个待办事项.'
	$('#status').text(status_text);
}

function on_add_clicked () {
	var t = $('#content_to_add').val();
	// console.log(t);
	$('#content_to_add').val('');

	var li = createElement('li');
	li.val = t;

	var cb = createElement('input');
	cb.type = 'checkbox';
	cb.value = t;
	cb.onclick = 'on_select()';

	li.appendChild(cb);
	li.innerHTML += '&nbsp;&nbsp;' + t;
	$('#list').append(li);

	var status_text = '';
	status_text += '新增了一个待办事项.';
	status_text += '当前共有'+num_of_item()+'个待办事项.'
	$('#status').text(status_text);
}

function on_select_all () {
	var cbs = $('#list input');
	for (var i=0;i!=cbs.length;++i){
		cbs[i].checked=true;
	}
	$('#status').text('选择所有'+cbs.length+'个待办事项.');

}

function on_remove_all () {
	var lst_li = $('#list li');
	var ul = lst_li[0].parentNode;
	var len = lst_li.length;
	for (var i=0;i!=len;++i){
		ul.removeChild(lst_li[i]);
	}
	$('#status').text('清空了待办事项.');
}

function on_remove () {
	var lst_li = $('#list li');
	var len = lst_li.length;
	var ul = lst_li[0].parentNode;
	var cnt = 0;
	for (var i=0;i!=len;++i){
		// console.log(lst_li.children()[i].checked);
		if (lst_li.children()[i].checked){
			ul.removeChild(lst_li[i]);
			cnt += 1;
		}
	}
	$('#status').text('删除了'+cnt+'个待办事项.');
}

