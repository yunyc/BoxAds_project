	
	c_name = '';
	c_html = '';
	
	
	// 순서나 카테고리 클릭 시 input으로 변경
	function set_input(tag, field){
		// 다른 기존 변경하려던 사항 원래대로 돌림
		$('.c_upt').find('.c_cancel').click();
		
		var value = $(tag).text().trim();
		c_name = value;
		c_html = $(tag).closest('tr').html();
		var td_html = '<input type="text" id="update_input" value="' + value + '" style="max-width:30%;text-align:center;height:24px;">';
		
		if( field == 'order' ){
			td_html += '<button class="name_upt_btn" onclick="change_order_input(this)" value="' + value + '" type="button">수정</button>';
			td_html += '<button class="name_upt_btn c_cancel" onclick="input_out(this,\'order\')" type="button">취소</button>';
		} else {
			td_html += '<button class="name_upt_btn" onclick="change_name(this)" type="button">수정</button>';
			td_html += '<button class="name_upt_btn c_cancel" onclick="input_out(this,\'name\')" type="button">취소</button>';
		}
		$(tag).parent('td').html(td_html);
		focusCampo('update_input');
	}
	
	// input 원래대로 돌림
	function input_out(btn, field){
		$td = $(btn).parent('td');
		var td_html = '<p onclick="set_input(this,\'' + field + '\')">' + c_name + '</p>';
		$td.html(td_html);
	}
	
	// input 마지막으로 focus
	function focusCampo(id){
		var tag = document.getElementById(id);
		if(tag != null && tag.value.length != 0){
			if(tag.createTextRange){
				var FieldRange = tag.createTextRange();
				FieldRange.moveStart('character', tag.value.length);
				FieldRange.collapse();
				FieldRange.select();
			} else if ( tag.selectionStart || tag.selectionStart == '0' ) {
				var elemLen = tag.value.length;
				tag.selectionStart = elemLen;
				tag.selectionEnd = elemLen;
				tag.focus();
			}
		} else {
			tag.focus();
		}
	}
	
	// 순서 변경 수정 클릭 시
	function change_order_input(btn){
		
		var data = {
			c_idx:		$(btn).closest('tr').children('td').eq(0).children('input[type=checkbox]').val(),
			c_order:	$(btn).val(),
			c_order_ch:	$(btn).siblings('input').val(),
			c_type:		$('#c_type').val()
		};
		
		change_order(btn, data);
	}
	
	// 순서변경 ajax & 후처리
	function change_order(tag, data){
		
		$.ajax({
			data: data,
			url: '../category/change_order',
			success: function(result){
				if( result == 'success' ){
					
					var $tbody = $('#tblList');
					var $this_tr = $(tag).closest('tr'); // 기존 TR
					var $new_tr = $('<tbody><tr>' + c_html + '</tr></tbody>'); // 새로 삽입 될 TR
					
					// 뒤로 갈 경우
					if(data.c_order < data.c_order_ch) {
						
						$new_tr.children('tr').children('td').eq(1).html('<p onclick="set_input(this,\'order\')">' + data.c_order_ch + '</p>')
						
						$tbody.find('tr').each(function(){
							
							var this_order = $(this).find('td').eq(1).find('p').text();
							
							if( this_order == data.c_order_ch ) {
								$(this).find('td').eq(1).find('p').text(this_order*1 - 1);
								$(this).after($new_tr.html());
							} else if( this_order*1 > data.c_order*1 && this_order*1 <= data.c_order_ch*1 ) {
								$(this).find('td').eq(1).find('p').text(this_order*1 - 1);
							}
							
						});
						
					// 앞으로 갈 경우
					} else {
						
						$new_tr.children('tr').children('td').eq(1).html('<p onclick="set_input(this,\'order\')">' + data.c_order_ch + '</p>')
						
						$tbody.find('tr').each(function(){
							
							var this_order = $(this).find('td').eq(1).find('p').text();
							
							if( this_order == data.c_order_ch ) {
								$(this).find('td').eq(1).find('p').text(this_order*1 + 1);
								$(this).before($new_tr.html());
							} else if( this_order*1 < data.c_order*1 && this_order*1 >= data.c_order_ch*1 ) {
								$(this).find('td').eq(1).find('p').text(this_order*1 + 1);
							}
							
						});
						
					}
					
					$this_tr.remove();
					c_html = '';
					c_name = '';
					alert('수정 되었습니다');
					
				} else {
					console.log('error: ' + result);
				}
			}
		});
		
	}
	
	// 카테고리명 변경
	function change_name(btn){
		
		if( confirm('카테고리명을 변경하시면\n해당 카테고리를 가지고 있던 회원은 기타로 변경됩니다.\n계속하시겠습니까?') ) {
			
			$this_td = $(btn).closest('td');
			
			var data = {
				c_name: $(btn).siblings('input').val(),
				c_idx: $(btn).closest('tr').children('td').eq(0).children('input[type=checkbox]').val()
			};
			
			$.ajax({
				url: '../category/change_name',
				data: data,
				success: function(result){
					
					if(result == 'success'){
						
						$this_td.html('<p onclick="set_input(this,\'name\')">' + data.c_name + '</p>');
						alert('수정 되었습니다.');
						
					} else {
						console.log('error: ' + result);
					}
					
				}
			});
			
			
		}
		
	}
	
	
	// 카테고리 새로 등록
	function insert_new_category(){
		// 다른 기존 변경하려던 사항 원래대로 돌림
		$('.c_upt').find('.c_cancel').click();
		
		var type = $('#c_type').val();
		var name = $('#addIn').val();
		
		if( name == '' ){
			return false;
		}
		
		if( confirm('\'' + name + '\'카테고리를 새로 등록하시겠습니까?') ) {
			
			$.ajax({
				url: '../category/insert_category',
				data: { c_name: name, c_type: type },
				dataType: 'json',
				success: function(result){
					if(result.rst){
						
						var c_idx = result.c_idx;
						var c_order = result.c_order;
						var $last_tr = $('#tblList').find('tr').last();
						var $add_tr = $('<tbody><tr>' + $last_tr.html() + '</tr></tbody>');
						
						// 추가할 tr set
						$add_tr.find('input[type=checkbox]').val(c_idx);
						$add_tr.find('.c_upt').eq(0).html('<p onclick="set_input(this,\'order\')">' + c_order + '</p>');
						$add_tr.find('.c_upt').eq(1).html('<p onclick="set_input(this,\'name\')">' + name + '</p>');
						
						$('#addIn').val('');
						$('#tblList').append($add_tr.html());
						
						$('html').animate({scrollTop: $last_tr.offset().top},400);
						
					}else{
						console.log(result.err_msg);
					}
				}
			});
		}
	}
	
	// 카테고리 삭제
	function delete_category(btn){
		
		if( !confirm( '정말 이 카테고리를 삭제하시겠습니까?\n해당 카테고리를 가지고 있던 회원은\n기타로 변경됩니다.' ) ){
			return false;
		}
		
		var $this_tr = $(btn).closest('tr');
		
		var data = {
			c_idx: $(btn).closest('tr').children('td').eq(0).children('input[type=checkbox]').val(),
			c_order: $(btn).closest('tr').find('.c_upt').eq(0).text(),
			c_type: $('#c_type').val()
		};
		
		$.ajax({
			url: '../category/delete_category',
			data: data,
			async: false,
			success: function(result){
				
				if(result == 'success'){
					
					$('#tblList').find('tr').each(function(){
						var this_order = $(this).find('.c_upt').eq(0).text();
						
						if(this_order*1 > data.c_order*1){
							$(this).find('.c_upt').eq(0).text(this_order*1 - 1);
						}
					});
					
					$this_tr.remove();
					alert('삭제되었습니다.');
					
				}else{
					console.log(result);
				}
				
			}
		});
		
	}
	
	function delete_selected_category() {
		
		var category_str = '';
		var idx_arr = new Array();
		$('#tblList').find('input[type=checkbox]:checked').each(function(i){
			if( i != 0 ) category_str += ', ';
			category_str += "'" + $(this).closest('tr').children('td').eq(2).text() + "'";
			
			idx_arr.push($(this).val());
		});
		
		if( confirm(category_str + '카테고리가 식제됩니다. 계속하시겠습니까?') ) {
			
			for( var i = 0 ; i < idx_arr.length ; i++ ) {
				
				var $tr = null;
				
				$('#tblList').find('input[type=checkbox]').each(function(){
					if( $(this).val() == idx_arr[i] ) {
						$tr = $(this).closest('tr');
						return;
					}
				});
				
				data = {
					c_idx: $tr.children('td').eq(0).children('input[type=checkbox]').val(),
					c_order: $tr.find('.c_upt').eq(0).text(),
					c_type: $('#c_type').val()
				};
				
				$.ajax({
					url: '../category/delete_category',
					data: data,
					async: false,
					success: function(result){
						
						if(result == 'success'){
							
							$('#tblList').find('tr').each(function(){
								var this_order = $(this).find('.c_upt').eq(0).text();
								
								if(this_order*1 > data.c_order*1){
									$(this).find('.c_upt').eq(0).text(this_order*1 - 1);
								}
							});
							
							$tr.remove();
							
						}else{
							console.log(result);
						}
						
					}
				});
			}
		}
		
	}
	
	
	
	