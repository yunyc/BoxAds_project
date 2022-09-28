var oEditors = [];
window.onload = function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "textArea",  
		sSkinURI: "../js/se2/SmartEditor2Skin.html",  
		fCreator: "createSEditor2",
		htParams: { fOnBeforeUnload : function(){}}
	});
};


function saveBoard(){
	oEditors.getById["textArea"].exec("UPDATE_CONTENTS_FIELD", []);	
	if(validation()) {		
		$("form").submit();		
	}	
}

function validation(){
	var contents = $.trim(oEditors[0].getContents());		
	if(contents === '<p><br></p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
		alert("내용을 입력하세요.");		
		oEditors.getById['textArea'].exec('FOCUS');
		return false;
	}
	return true;
}

function delBtn(){
	if(confirm("삭제하시겠습니까?")){
		var idx = "${board.ab_idx}"
		location.href = "../action/delete_admin_board.jsp?idx="+idx; 
	}	
}