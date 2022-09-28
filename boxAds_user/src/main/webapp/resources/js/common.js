//공백 체크
function checkInputName(name, text) {	
	if( $("input[name='"+name+"'").val() == "" ){
		alert(text+" 입력해주세요.");
		$("input[name='"+name+"'").focus();
		return false;
	}
	return true;
}

//공백 체크 select
function checkInputSelect(name, text) {
	$("select[name='"+name+"'")
	if( $("select[name='"+name+"'").val() == "" ){
		alert(text+" 선택해주세요.");
		$("select[name='"+name+"'").focus();
		return false;
	}
	return true;
}

//number 체크
function checkNumber(name){	
	if( $.isNumeric( $("input[name='"+name+"'").val() ) ){
		return true;
	}else{
		alert("숫자를 입력해주세요.");
		$("input[name='"+name+"'").focus();
		return false;
	}
	return true;	
}

//ajax call
function ajaxCall(url, data, callBack, errorMsg){
	$.ajax({
		type : "POST",	
		url : url,	
		data : data,	
		success : function(obj){	
			callBack(obj);	
		},error : function() {	
			console.log(errorMsg+"에러가 발생되었습니다");	
		}	
	});
}

//ajax call json
function ajaxCallJson(url, data, callBack, errorMsg){
	$.ajax({
		type : "POST",	
		url : url,	
		data : data,	
		dataType : "json",
		success : function(obj){	
			callBack(obj);	
		},error : function() {	
			console.log(errorMsg+"에러가 발생되었습니다");	
		}	
	});
}


//textarea 값 엔터처리
function textareaSave(val){	
	val = val.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	return val
}

function textareaLoad(val){	
	val = val.split('<br/>').join("\r\n");	
	return val;
}

//3자리마다 숫자 콤마
function addComma(num)
{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

$(function(){
	$(":checkbox:not(#chkAll)").change(function(){
		var chk = $(":checkbox:not(#chkAll)");	
		var chkAll = $('#chkAll');

	    if(chk.length != chk.filter(":checked").length){
	    	chkAll.prop('checked', false);
	    } else {
	    	chkAll.prop('checked', true);
	    }
	});

	$("#chkAll").change(function(){
		if ( $("#chkAll").is(":checked") ) { 
	   		$("input[type=checkbox]").not(":disabled").prop("checked",true);
		}else {
	   		$("input[type=checkbox]").prop("checked",false);
		}	
	});

	$("#datepicker1, #datepicker2").on("change", function(){
		datepickerChk("datepicker1", "datepicker2")
	})

	$("#datepicker3, #datepicker4").on("change", function(){
		datepickerChk("datepicker3", "datepicker4")
	})
});

// empty
function empty(text){
	if(text != null && text != '') return false;
	return true;
}

function datepickerChk(startId, endId){
	var start = $("#"+startId);
	var end = $("#"+endId);
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();

	if(dd<10) { dd='0'+dd }
	if(mm<10) { mm='0'+mm } 

	today = yyyy+'-'+mm+'-'+dd;
	
	if(window.location.pathname != '/ad/write'){
		if(start.val() > today || end.val() > today){
			alert("오늘 이후는 선택하실 수 없습니다.");
			start.val("");
			end.val("");
			return false;
		}		
	}

	if(!empty(start.val()) && !empty(end.val()) && start.val() > end.val()) {
		alert("시작일과 종료일 선택 오류입니다.\n확인하시고 다시 입력해주세요.");
		start.val("");
		end.val("");
		return false;
	}

	return true;
}

// 용량 변환
function bytesToSize(bytes) {
   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if (bytes == 0) return '0 Byte';
   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
}

function pageMove(url) {
    var form = document.createElement("form");
    form.action = url;
    form.method = "get";
    //form.setAttribute("target", "_blank");
    document.body.appendChild(form);
    form.submit();
    form.remove();
}