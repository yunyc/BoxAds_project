$(function() {
		window.uploadList = [];
	    
		var type = $("input[name=type]").val() || "";
		
		// 새로 등록한 파일을 삭제할 경우
	    $(document).on('click', '.delete', function() {
	    	var idx = $('.btn_download').index(this);
	    	var order = $('.delete').index(this);
	        var confirm = window.confirm("삭제하시겠습니까?");
	        	
	        if (confirm) {
	        	
	            uploadList.splice(order, 1);
	            	
	        	$(".btn_download").eq(idx).remove();
	        	$(".file_name").eq(idx).remove();
	        }
	     });
	    
	    // 수정할 때 기존에 존재하는 파일을 삭제할 경우
	    $(document).on('click', '.del', function() {
	    	var index = $('.btn_download').index(this);
	    	var fileIdx = $(".fileIdx").eq(index).val();
	        var confirm = window.confirm("삭제하시겠습니까?");
	        	
	        if (confirm) {
	            	
	        	$(".mt10 li").eq(index).remove();
	        	$("form").append('<input type="hidden" name="deleteIdx" value="' + fileIdx + '" />');
	        		
	        }
	       });
        
        // 파일 타입 검사
        $("#uploadFile, #pc, #mobile").change(function() {
        	var $that = $(this);
        	var fileList = $that.get(0).files;
        	var successExtention = ['ppt', 'pptx', 'xls', 'xlsx', 'doc', 'docx', 'jpg', 'jpeg', 'bmp', 'gif'];
        	var _URL = window.URL || window.webkitURL;
        	var maxSize = 5 * 1024 * 1024 
        	var widthLength = 3;
        	var heightLength = 4;
        	
        	$.each(fileList, function(index, item) {
        		
        		if (type === "B" || type === "A") {
                	successExtention = ['jpg', 'jpeg', 'bmp', 'gif'];
                	
                	var img = new Image();
                    img.src = _URL.createObjectURL(item);
                    /**
                    img.onload = function() {
                        
                        if(img.width.toString().length !== widthLength || img.height.toString().length !== heightLength) {
                            alert("이미지 사이즈를 000x0000 으로 맞춰서 올려주세요.");
                            $that.val("");
                        }
                    }
                    **/
            	}
        		
        		var extention = item.name.split('.').pop().toLowerCase();
    			
    			if ($.inArray(extention, successExtention) == -1) {
    				alert('지원하지 않는 파일 확장자입니다.');
    				$that.val("");
    			
    			} else if(item.size > maxSize) {
    				alert("파일 용량은 5mb를 넘지 않아야 합니다.");
    				$that.val("");
    				
    			} else {
    				appendFilename(item);
    			}
    		});
        });
});

 
	function appendFilename(file) {
    	uploadList.push(file)

		$(".mt10").append("<li style='float:none;'><span class='file_name'>" + file.name + "</span>"
							+ "<button class='btn_download delete'>삭제</button></li>");

	}

// ajax 전송
function ajax(id, path, msg, selImg) {
		
    	$("#" + id).ajaxForm({
            contentType : false,
            processData: false,
            enctype : "multipart/form-data",
            success: function(data) {
 
            	if (msg) {
            		alert(msg);
            		location.href = path + data;
            	} 
            	
            },
            error : function(jqXHR, textStatus, errorThrown){
                alert("오류가 발생했습니다." + errorThrown);
            },
            beforeSubmit: function(data, form, option) {
            	    
            		for (i = 0; i < uploadList.length; i++) {
                		
            			if (i === selImg) {
            				var uploadFile = {
                            		name: "repFile",
                            		type: "file",
                            		value: uploadList[i]
                            };
            				
            			} else {
            				var uploadFile = {
                            		name: "uploadFile",
                            		type: "file",
                            		value: uploadList[i]
                            };
            			}
            			
                		data.push(uploadFile);
            	}
            	
            }
           
        });
    	$("input[name=uploadFile]").val("");
    	$("#" + id).submit();
}

// 이미지 미리보기
function readURL(input, selector) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $(selector).attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}

function readFile(input, selector, idx) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $(selector).attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[idx]);
	  }
	}

