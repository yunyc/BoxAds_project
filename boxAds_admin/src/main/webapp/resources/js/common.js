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
	if( $("select[name='"+name+"'").val() == "" ){
		alert(text+" 선택해주세요.");
		$("select[name='"+name+"'").focus();
		return false;
	}
	return true;
}

//조건 true, false 체크
function checkValid(value, text) {
	
	if (!value) {
		alert(text);
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

// 전체선택
function checkAll(id, name){	
	if ( $("#"+id).is(":checked") ) { 
   		$(":checkbox[name='"+name+"']").not(":disabled").prop("checked",true);   		
	}else {
		$(":checkbox[name='"+name+"']").prop("checked",false);
	}	
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
	
	$('button:contains("검색")').attr("type", "button");
	$('button:contains("검색")').attr("onclick", "searchPageReset()");	
});

// empty
function empty(text){
	if(text != null && text != '') return false;
	return true;
}

function datepickerChk(startId, endId){
	var start = $("#"+startId);
	var end = $("#"+endId);
	
	if(!empty(start.val()) && !empty(end.val()) && start.val() > end.val()) {
		alert("시작일과 종료일 선택 오류입니다.\n확인하시고 다시 입력해주세요.");
		start.val("");
		end.val("");
		return false;
	}
	
	return true;
}

function selectCheck(name, value) {
	
	$("select[name=" + name + "]").find("option").each(function(i, item) {
		
		if ($(item).val() === value) {
			$(item).prop("selected", true);
		}
	});
}

function boxCheck(name, value) {
	
	$("input[name=" + name + "]:checkbox").each(function(i, item) {
		
		if ($(item).val() === value) {
			$(item).prop("checked", true);
		}
	});
}


// 날짜포맷
function getFormatDate(date){
	var year = date.getFullYear();	//yyyy
	var month = (1 + date.getMonth());	//M
	month = month >= 10 ? month : '0' + month;	// month 두자리로 저장
	var day = date.getDate();	//d
	day = day >= 10 ? day : '0' + day;	//day 두자리로 저장
	return  year + '-' + month + '-' + day;
}

// 날짜 설정 - 달
function changeDateMonth(obj, month){
	var d = new Date()
	$("#datepicker2").val( getFormatDate(d) );
		
	var monthOfYear = d.getMonth()
	d.setMonth(monthOfYear - month)
	$("#datepicker1").val( getFormatDate(d) );    
  
	$(".date").removeClass("on")
	$(obj).addClass("on")  
}


//날짜 설정 - 일
function changeDateDay(obj, day){
	var d = new Date();
	$("#datepicker2").val( getFormatDate(d) );
	
	var dayOfMonth = d.getDate()
	d.setDate(dayOfMonth - day)		
	$("#datepicker1").val( getFormatDate(d) );    
  
	$(".date").removeClass("on")
	$(obj).addClass("on")  
}

function pageMove(url) {
    var form = document.createElement("form");
    form.action = url;
    form.method = "post";
    form.setAttribute("target", "_blank");
    document.body.appendChild(form);
    form.submit();
    form.remove();
}

function searchPageReset() {
	let word = $(":text[name='searchKeyword'], :text[name='keyword']").val();
	console.log("검색어: ", word);
	
	if(word != "" ){
		$(":hidden[name='curPage']").val("1");
		$("form").submit();		
	} else {
		alert("검색어를 입력해주세요");
	}
	
}