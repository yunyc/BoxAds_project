//function updateState(msg, formData){
//	if(confirm(msg)){			
//		$.ajax({
//		    type : "POST",
//		    url : "../order/updateState",
//		    data : formData,
//		    processData: false,
//		    contentType: false,
//		    success : function(result) {
//		    	if(result > 0){
//					alert("성공했습니다.");
//				} else {
//					alert("실패했습니다.");
//				}		        
//		    },
//		    err : function(err) {
//		        alert(err.status);
//		    }
//		});		
//	}
//}