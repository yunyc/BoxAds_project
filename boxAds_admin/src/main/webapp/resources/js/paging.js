function paging (total, curPage, pageLine, id){
	let totalPage = Math.ceil(total / pageLine);
	let pageGroup = Math.ceil(curPage / pageLine);
	
	let last = pageGroup * pageLine;    // 화면에 보여질 마지막 페이지 번호
    let first = last - (pageLine-1);    // 화면에 보여질 첫번째 페이지 번호
    let next = last+1;
    let prev = first-1;
	 
	let pageStr = "";
    if(last > totalPage) { last = totalPage; }
					
    //if(totalPage > 0){ pageStr += '<a href="javascript:void(0)" onclick="goPage('+1+'); return false;">'+'첫페이지'+'</a>'; }
	if(prev > 0){ pageStr += '<a href="javascript:void(0)" title="이전 '+pageLine+'페이지 이동" class="prev" onclick="goPage('+prev+')"><</a> '; }
	for(let j=first; j <= last && j > 0; j++){
		if(curPage == j && id != "ajax"){
			pageStr += '<a href="javascript:void(0)" title="현재 '+j+'페이지" class="on">'+j+'</a>';
		} else {
			
			if (id) {
				pageStr += '<a href="javascript:void(0)" title="'+j+'페이지 이동" onclick="goPage('+j+','+ id +')">'+j+'</a>';	
			} else {
				pageStr += '<a href="javascript:void(0)" title="'+j+'페이지 이동" onclick="goPage('+j+')">'+j+'</a>';	
			}
						
		}
	}
	if(last < totalPage) {
		
		if (id !== "ajax") {
			pageStr += '<a href="javascript:void(0)" title="다음 '+pageLine+'페이지 이동" class="next" onclick="goPage('+next+','+ id +')">></a> ';	
		}  else {
			pageStr += '<a href="javascript:void(0)" title="다음 '+pageLine+'페이지 이동" class="next" onclick="goPage('+next+')">></a> ';	
		}
		 
	}
	//if(totalPage > 0){ pageStr += '<a href="javascript:void(0)" onclick="goPage('+totalPage+'); return false;">'+'마지막페이지'+'</a>'; }
	return pageStr;
}

function goPage(pageNo, id){
	
	if (id) {
		var id = $(id).attr("id");
		$(":hidden[name='" + id + "']").val(pageNo);
		$("#" + id).submit();
		
	} else {
		$(":hidden[name='curPage']").val(pageNo);
		$("form").submit();
	}
		

}

