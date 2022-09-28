$(function() {
	window.uploadList = [];
});
	function ajaxSubmit(path, msg) {
		
        	
        	$("#memberVO").ajaxForm({
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
                    		var uploadFile = {
                            		name: "uploadFile",
                            		type: "file",
                            		value: uploadList[i]
                            };
                    		data.push(uploadFile);
                	}
                	
                }
               
            });
        	
	}
	
	function ajax(id, path, msg, selImg) {  
    	$("#" + id).ajaxForm({
            contentType : false,
            processData: false,
            enctype : "multipart/form-data",
            success: function(data) {
            	/*console.log(data)*/
 
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
	
	function readURL(input, selector) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $(selector).attr('style', 'background-image:url(' + e.target.result+ ')');  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
	
	function appendFile(file, selector, element) {
		
    	uploadList.push(file)

		$(selector).append(element);

	}
	
	function deleteFile(path, idx) {
		
		var confirm = window.confirm("삭제하시겠습니까?");
    	
    	if (confirm) {
    		uploadList.splice(idx, 1);
    		//$.post(path + "/board/file_delete", {idx: idx});
    		return true;
    	}
		
    }
 
	