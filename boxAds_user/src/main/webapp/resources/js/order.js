$(function(){
	// 광고선택
	$("#adSelect").on("change", function(){	
		pathChk = "bx";
		adIdx = $(this).val();		
		$("#cpSelect, .cpSelect").val("0").attr("selected", true);
		pdtCheck(adIdx, $('option:selected', this).attr('data-cidx'), boxCidx, boxCnt);
	})
	
	// 쿠폰선택
	$("#cpSelect, .cpSelect").on("click", function(){		
		if(adIdx == null || adIdx == 0){
			alert("애드를 먼저 선택해 주세요.");
			return false;			
			
		} else {
			$("#cpSelect, .cpSelect").on("change", function(){
				cpIdx = $('option:selected', this).attr('data-idx');
				//total = total === "undefined" ? 0 : total;				
				setTotal(total, $(this).val());
			})
		}
	})
	
	// 박스선택
	$("#select_box").on("change", function(){
		pathChk = "ad";
		boxIdx = $(this).val();
		let bxCidx = $('option:selected', this).attr('data-cidx');
		let bxCnt = $('option:selected', this).attr('data-cnt');
		
		pdtCheck(adIdx, adCidx, bxCidx, bxCnt);
	})	
})

var pathChk;
var flag = false;

function setPrice(boxCnt, boxUnit, prUnit){
	// 총 단가 * 박스 수 + 인쇄 단가 * 박스 수
	let adPrice = Number(boxUnit) * Number(boxCnt)
	let prPrice;
	
	/*console.log(boxCnt, boxUnit, prUnit)
	console.log(adPrice)*/
	
	$("#adPrice, .adPrice").text(addComma(adPrice));
	if(prUnit != null){
		prPrice = Number(boxCnt) * Number(prUnit)
		total = adPrice + prPrice;
		
		setPr(prPrice);
		setTotal(total, 0);		
	} else {
		total = adPrice;		
	}
}

function setPr(price){	
	$("#prPrice, .prPrice").text(addComma(price));
}

function setTotal(total, coupon){
	if(coupon != null){ $("#cpPrice").text("- " + addComma(coupon)); }
	
	$("#totalPrice, .totalPrice").text(addComma(total - Number(coupon)));	
	if( myCash >= total - coupon ){ 
		//$("#charge, .charge").removeClass("off"); 
		//$("#charge, .charge").removeAttr("href");
		$(".orderBtn").removeClass("off");
	} else {
		//$("#charge, .charge").addClass("off");
		//$("#charge, .charge").attr("href", getPath()+"/wallet/cash_charge");
		$(".orderBtn").addClass("off");
	}
}

var mesg;
function pdtCheck(adIdx, adCidx, bxCidx, bxCnt){	
	if(adIdx > 0 && bxCidx > 0){
		ajaxCallJson("../order/pdtCheck", {adIdx, adCidx, bxCidx, bxCnt}, function(result){
			if(result.msg != null){
				alert(result.msg);
				mesg = result.msg;				
				if(pathChk == "bx"){
					setPr(0);
					setTotal(0, 0);				
				}
				
				flag = false;
				return false;
			}
			
			flag = true;
			if(pathChk == "bx"){
				setPrice(boxCnt, boxUnit, result.unit);
			}
			
		}, "");		
	}
}

function validOrderBox(){
	if(!flag){
		if(adIdx == 0){
			alert("애드를 선택해 주세요.");
		} else {
			alert(mesg);			
		}		
	} else if(myCash < total){
		alert("사용 가능한 보유캐시가 부족하여 결제가 안됩니다.\n캐시 충전 후 다시 주문해주세요");
		
	} else if(confirm("주문하시겠습니까?")){		
		$.post("../order/orderBox", { aIdx:adIdx, bIdx:boxIdx, cIdx:cpIdx }, function(result){
			if(result > 0){
				$("form").attr("action", "order_finish?idx="+result);
				$("form").submit();
			} else {
				alert("주문에 실패했습니다.");
			}				
		})			
	}
}

function validOrderAd(){
	if(!flag){
		if(typeof boxIdx === "undefined" || boxIdx == 0){
			alert("박스를 선택해주세요.");
		} else {
			alert(mesg);			
		}
		
	} else if(confirm("신청하시겠습니까?")){
		$.post("../order/orderAd", { aIdx:adIdx, bIdx:boxIdx }, function(result){
			/*console.log(result);*/
			if(result > 0){
				alert("광고가 신청 되었습니다.");
			} else {
				alert("신청에 실패했습니다.");
			}				
		})
	}	
}

function validOrder(){
	if(myCash < total){
		alert("사용 가능한 보유캐시가 부족하여 결제가 안됩니다.\n캐시 충전 후 다시 주문해주세요");		
	} else if(confirm("주문하시겠습니까?")){		
		$.post("../order/orderBox", { aIdx:adIdx, bIdx:boxIdx, cIdx:cpIdx }, function(result){
			if(result > 0){
				let alertMesg = "신청 승인되었습니다.";					
				$.post("../order/updateState", { idx:oIdx, state:"A3", logTypeArr:"A5" }, function(){
					if(result > 0){
						$("form").attr("action", "order_finish?idx="+result);
						$("form").submit();						
					}
				})
				//updateState(oIdx, "A3", "A5", null, alertMesg);
			} else {
				alert("주문에 실패했습니다.");
			}				
		})
	}	
}

function updateState(oIdx, nextState, logTypeArr, mesg, alertMesg){
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
		updateState(oIdx, $(tag).val(), $(tag).attr("data-logType"), null, alertMesg + "되었습니다.");		
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

function validDelivery(tag, alertMesg){
	if(!checkInputName('mesg', '운송장 정보를')) return false;
	if(!checkInputName('delivery', '택배사를')) return false;
	
	if(confirm(alertMesg+"하시겠습니까?")){	
		insertProcessLog(tag, alertMesg);
	}
}
