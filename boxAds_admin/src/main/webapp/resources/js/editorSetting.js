var $path = $("input[name=path]").val();

//Naver Smart Editor 2
var oEditors = [];
//스마트에디터 프레임생성
nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "content",
	sSkinURI : $path + "/resources/se2/SmartEditor2Skin.html",
	htParams : {
		// 툴바 사용 여부
		bUseToolbar : true,
		// 입력창 크기 조절바 사용 여부
		bUseVerticalResizer : true,
		// 모드 탭(Editor | HTML | TEXT) 사용 여부
		bUseModeChanger : true,
	}
});

// textArea에 이미지 첨부
function pasteHTML(filepath) {
	var html = '<img src="/resources/se2/upload/'+ filepath + '">';
	oEditors.getById["content"].exec("PASTE_HTML", [ html ]);
}

// submit 검증
function validate(msg) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	var contents = $.trim(oEditors[0].getContents());
	if(contents === '<p><br></p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음.
		alert(msg + " 입력하지 않았습니다.");
		oEditors.getById['content'].exec('FOCUS');
		return false;
	}
	
/*	if($(":hidden[name='idx']").val() == ''){
		$(":hidden[name='idx']").val(0)		
	}*/
	
	return true;
}
