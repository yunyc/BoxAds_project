function paging (total, curPage, pageLine){
	let totalPage = Math.ceil(total / pageLine);
	let pageGroup = Math.ceil(curPage / pageLine);
	
	let last = pageGroup * pageLine;    // 화면에 보여질 마지막 페이지 번호
    let first = last - (pageLine-1);    // 화면에 보여질 첫번째 페이지 번호
    let next = last+1;
    let prev = first-1;
	 
	let pageStr = "";
    if(last > totalPage) { last = totalPage; }
					
    //if(totalPage > 0){ pageStr += '<a href="javascript:void(0)" onclick="fn_egov_link_page('+1+'); return false;">'+'첫페이지'+'</a>'; }
	if(prev > 0){ pageStr += '<a href="javascript:void(0)" title="이전 '+pageLine+'페이지 이동" class="prev" onclick="fn_egov_link_page('+prev+')"><</a> '; }
	for(let j=first; j <= last && j > 0; j++){
		if(curPage == j){
			pageStr += '<a href="javascript:void(0)" title="현재 '+j+'페이지" class="on">'+j+'</a>';
		} else {
			pageStr += '<a href="javascript:void(0)" title="'+j+'페이지 이동" onclick="fn_egov_link_page('+j+')">'+j+'</a>';				
		}
	}
	if(last < totalPage){ pageStr += '<a href="javascript:void(0)" title="다음 '+pageLine+'페이지 이동" class="next" onclick="fn_egov_link_page('+next+')">></a> '; }
	//if(totalPage > 0){ pageStr += '<a href="javascript:void(0)" onclick="fn_egov_link_page('+totalPage+'); return false;">'+'마지막페이지'+'</a>'; }
	return pageStr;
}

$(function(){
	$("#more").on("click", function(){
		appendList(ulId, orNm);
	})
	
	$("#moreText").on("click", function(){
		appendTextList(ulId, orNm);
	})
	
	$(":radio").on("change", function(){
		orderList();
	})
});

var ulId, orNm, url, order;
function appendList(pageId, orderName){
	url = $("#url").val();
	order = $(":radio[name="+orderName+"]:checked").val();
	let start = Number($("#start").val());	
	let total = Number($("#total").val());
	let keyword = $(":text[name='searchKeyword']").val();
	let perPage = 12;

	/*console.log("total: " + total);
	console.log("start: " + start);*/

	$("#start").val(start+perPage);
	btnRemove($("#start").val(), $("#total").val());
	if(start >= $("#total").val()) return false;


	$.post(url, {start:start , end:perPage, order:order, cCIdx:cate, searchKeyword:keyword } , function(data){
		start += perPage;
		$("#"+pageId).append(data);
	})

	ulId = pageId;
	orNm = orderName;
	
}

function orderList(){
	order = $(":radio[name="+orNm+"]:checked").val();	
	trigerChk();
}

function appendTextList(pageId, per){
	url = $("#url").val();	

	let start = Number($("#start").val());	
	let total = Number($("#total").val());

	let state = $("select[name='state']").val();
	let stDate = $(":text[name='startDate']").val();
	let edDate = $(":text[name='endDate']").val();
	let title = $(":text[name='title']").val();
	let table = $(":hidden[name='table']").val();
	let searchType = $("select[name=searchType]").val();
	let keyword = $("input[name='keyword']").val();
	let category = $("#category").val();
	let replyFlag = $("select[name=replyFlag]").val();
	
	/*console.log("start", start)
	console.log("total", total)*/
	
	$("#start").val(start+per);
	btnRemove($("#start").val(), $("#total").val());
	if(start >= $("#total").val()) return false;
	
	$.post(url, {start:start 
				,end:per
				,state:state
				,startDate:stDate
				,endDate:edDate
				,title:title
				,table:table 
				,searchType:searchType
				,keyword:keyword
				,category:category
				,replyFlag:replyFlag} , function(data){
		start += per;
		$("#"+pageId).append(data);
		
		ulId = pageId;
		orNm = per;
		
		//btnRemove($("#start").val(), $("#total").val());
	})
}


function appendTextListCustom(pageId, per){
	url = $("#url").val();	

	let total = Number($("#total").val());
	let start = total - per < 0 ? 0 : Number(total - per);	
	let writer = $(":hidden[name='writer']").val();
	let receiver = $(":hidden[name='receiver']").val();
	
	$("#total").val(start);
	
	/*console.log("start", start)
	console.log("total", total)*/
	
	$.post(url, {start:start, 
				end:per,
				writer:writer,
				receiver:receiver
				} , function(data){
		start += per;

		$("#"+pageId).prepend(data);
		
		if(total - per > 0){
			$("#"+pageId).prepend('<div class="list_before"><button type="button" id="moreMessage" class="btn btn_before">이전 메시지 불러오기</button></div>');			
		}
		
		ulId = pageId;
		orNm = per;
		
		btnRemove($("#start").val(), $("#total").val());
	})
}

function trigerChk(){
	if($("#adBtn").hasClass("on")){
		$("#adBtn").trigger("click");
	} else {
		$("#bxBtn").trigger("click");
	}
}

function btnRemove(st, tot){	
	if (Number(st) >= Number(tot)) {
		$("#moreAd, #moreBox, #moreText, #more").hide();
	} else {
		$("#moreAd, #moreBox, #moreText, #more").show();
	}	
}

function noDataChk(id, total){
	if(total <= 0){
		$("#"+id).show();
	} else {
		$("#"+id).hide();
	}
}