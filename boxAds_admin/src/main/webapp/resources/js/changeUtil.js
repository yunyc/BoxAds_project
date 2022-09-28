$(function() {
		window.uploadList = [];
		var $path = $("input[name=path]").val();
		var $type = $("input[name=type]").val();
		var $idx = $("input[name=idx]").val();
        
        $(document).on('click', '#delete, .btn_download', function() {
        	
        	var confirm = window.confirm("삭제하시겠습니까?");
        	
        	if (confirm) {
        		var index = $('.btn_download').index(this);
        		var fileIdx = $(".fileIdx").eq(index).val();
            	uploadList.splice(index, 1);
            	
        		$(".btn_download").eq(index).remove();
        		$(".file_name").eq(index).remove();
        		
        		if ($idx) {
        			$("form").append('<input type="hidden" name="deleteIdx" value="' + fileIdx + '" />');
        		}
        		
        	}
        });
        
        $("button.save").click(function() {
        	var title = $("input[name=title]").val();

    		if ($type === "N" || $type === "F") {
    			var content = validate();
        	}

    		if ($type === "F") {
    			var category = $('input:radio[name=category]').is(':checked');        
    		}
    		
    		if ($type === "B" || $type === "A") {
    			var notice = $("#state:checked").val();
        		var url = $("#url").val();
        		var startDate = $("input[name=startDate]").val();
        		var endDate = $("input[name=endDate]").val();
        		var var_window = $("#window option:checked").val();
        		
        		if (!$idx) {
        			var pcFile = $("#pc").val();
            		var mFile = $("#mobile").val();
        		}
    		}
    		
    		// 값 유무 여부 검사, 전송
            if (!title) {
    			alert("제목을 입력하지 않았습니다.");
    	    } else if (content === false) {
    	    	

        	} else if (category === false) {
    			alert("종류선택을 입력하지 않았습니다.");

    		} else if (url === "" && var_window !== 'N') {
    			alert("링크URL을 입력하지 않았습니다.");

        	} else if (pcFile === "") {
    			alert("PC이미지를 업로드하지 않았습니다.");

    		} else if (mFile === "") {
    			alert("모바일 이미지를 업로드하지 않았습니다.");

    		} else if (startDate === "") {
    			alert("시작 날짜를 선택하지 않았습니다.");

    		} else if (endDate === "") {
    			alert("종료 날짜를 선택하지 않았습니다.");

    		} else {
    		     var msg = "등록하시겠습니까?";
    			 
    		     if ($idx) {
    				 var msg = "수정하시겠습니까?"
    			 }
    		     
           		 var confirm = window.confirm(msg);

           		 if (confirm) {
           			 
           			if ($idx) {
           				ajaxSubmit("boardVO", $path, $type, "수정되었습니다");
           			
           			} else {
           				ajaxSubmit("boardVO", $path, $type, "등록되었습니다");
           			}
           					
               	 }

            }

        });
        
        $("input[type=file]").not("#uploadFile").change(function() {
        	var $that = $(this);
        	var fileList = $that.get(0).files;
        	var successExtention = ['ppt', 'pptx', 'xls', 'xlsx', 'doc', 'docx', 'jpg', 'jpeg', 'bmp', 'gif'];
        	var _URL = window.URL || window.webkitURL;
        	var maxSize = 5 * 1024 * 1024 
        	var widthLength = 3;
        	var heightLength = 4;
        	
        	$.each(fileList, function(index, item) {
        		
        		if ($type === "B" || $type === "A") {
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

	function ajaxSubmit(id, path, type, msg) {
		var uploadFile = {
        		name: "uploadFile",
        		type: "file",
        		value: ""
        	};
        	
        	$("#" + id).ajaxForm({
                contentType : false,
                processData: false,
                enctype : "multipart/form-data",
                success: function(data) {
                	alert(msg);
                    location.href = path + data;
                },
                error : function(jqXHR, textStatus, errorThrown){
                    alert("오류가 발생했습니다." + errorThrown);
                },
                beforeSubmit: function(data, form, option) {
                	
                	for (i = 0; i < uploadList.length; i++) {
                		uploadFile.value = uploadList[i];
                		data.push(uploadFile);
                	}
                }
            });
        	
        	if (type === "N" || type === "Q") {
        		$("input[name=uploadFile]").val("");
        	}
        	
            $("#" + id).submit();
	}
 
	function appendFilename(file) {
    	uploadList.push(file)

		$(".mt10").append("<li style='float:none;'><span class='file_name'>" + file.name + "</span>"
							+ "<button id='delete' class='btn_download'>삭제</button></li>");

	}
	
	function disable() {
		var window = $('select[name=window] option:selected').val();

		if (window === "N") {
			$("#url").attr("disabled", "true");
		} else {
			$("#url").removeAttr("disabled");
		}
	}

	
function ajax(id, path, msg, selImg) {
		
    	
    	$("#" + id).ajaxForm({
            contentType : false,
            processData: false,
            enctype : "multipart/form-data",
            success: function(data) {
 
            	if (data === "") {
            		alert("중복된 이메일이 있습니다. 이메일을 다시 입력해주세요.");
            	} else if (msg) {
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
    	
    	$("#" + id).submit();
}

function deleteFile(path, idx) {
	
	var confirm = window.confirm("삭제하시겠습니까?");
	
	if (confirm) {
		uploadList.splice(idx, 1);
		return true;
	}
}

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