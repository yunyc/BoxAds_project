$(function(){
	$(document).on("click", ":checkbox[name='favIdx']", function(){		
		var id = $(this).attr("id");

		if($(this).prop('checked')){
			$.post(getPath()+"/common/wishInsert", {type : $(this).attr("data-type"), favIdx : $(this).val()}, function(data) {
	 			if(data > 0){
	 			} else {
	 				$("#"+id).prop("checked", false);
	 				if(getSessionIdx() == ""){
	 					alert("로그인이 필요한 서비스 입니다.");	 					
	 				}
	 			}
			});
		} else {			
			$.post(getPath()+"/common/wishDelete", {type : $(this).attr("data-type"), favIdx : $(this).val()}, function(data) {				
				if(data > 0){
	 			} else if(getSessionIdx() == ""){
 					alert("로그인이 필요한 서비스 입니다.");	 					
 				}
			});
		}
	})
	
	$("#wish").click(function() {
		var favFlag = $(".favFlag").val();

		if (favFlag == "N") {
			
			$.post(getPath()+"/common/wishInsert", {type : type, favIdx : favIdx}, function(data) {
	 			if(data > 0){
	 				$(".favFlag").val("Y");
	 				$(".ico_like").attr("style", "background-image:url(../images/main/ico_like_on.png); background-size:cover");	 				
	 				let cnt = $(".cnt").text();
	 				$(".cnt").text(Number(cnt) + 1);
	 			} else if(getSessionIdx() == ""){	 				
 					alert("로그인이 필요한 서비스 입니다.");	 					
 				}
			});
		} else {
			$.post(getPath()+"/common/wishDelete", {type : type, favIdx : favIdx}, function(data) {				
				if(data > 0){
					$(".favFlag").val("N");
					$(".ico_like").attr("style", "background-image:url(../images/sub/ico_like.png)");
					let cnt = $(".cnt").text();
	 				$(".cnt").text(Number(cnt) - 1);
	 			} else if(getSessionIdx() == ""){
 					alert("로그인이 필요한 서비스 입니다.");	 					
 				}
			});
		}
	});
})