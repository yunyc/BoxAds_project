function updateState(oIdx, nextState, logTypeArr, alertMesg){
	let mesg = $(":text[name='mesg']").val();
	
	$.post("../order/updateState", { idx:oIdx, state:nextState, logTypeArr:logTypeArr, mesg:mesg }, function(result){
		if(result > 0){
			if(alertMesg != null){
				alert(alertMesg);
				location.reload();
			}
		} else {
			alert("실패했습니다.");
		}				
	})	
}	

function setDataForUpdate(tag, alertMesg){
	if(confirm(alertMesg+"하시겠습니까?")){		
		updateState(oIdx, $(tag).val(), $(tag).attr("data-logType"), alertMesg + "되었습니다.");			
	}
}

function setDataForInsert(tag, alertMesg){
	var type = $(tag).attr("data-logType");
	
	if(type == "B9" && !checkInputName('delivery', '택배사를')) return false;
	if(type == "B9" && !checkInputName('mesg', '운송장 정보를')) return false;
	
	if(confirm(alertMesg+"하시겠습니까?")){
		if(type != "B6" && type != "B9"){
			insertProcessLog(tag, alertMesg)
		} else {			
			$("#printFrm").submit();
		}		
	}
}

function insertProcessLog(tag, alertMesg){		
	let mesg = $(":text[name='mesg']").val();
	let delivery = $(":text[name='delivery']").val();
	
	$.post("../order/insertProcessLog", { idx:oIdx, logTypeArr:$(tag).attr("data-logType"), mesg:mesg, delivery:delivery }, function(result){
		if(result > 0){
			if(alertMesg != null){
				alert(alertMesg + "되었습니다.");
				location.reload();
			}
		} else {
			alert("실패했습니다.");
		}
	})
}