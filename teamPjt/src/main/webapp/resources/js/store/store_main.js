/**
 * 
 */
 
 
$(document).ready(function() {
	$(".dropdown-toggle").dropdown();
	$('#condition').on('change', function(){
		this.form.submit()
	})
	let category_val = '';
	let condition_val = '';
	$("#fundCategory").click(function(){
		category_val = 'fund';
		$('select.category option[value='+ category_val +']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "store_main.do",
            method: "GET",
            data: "categorySelect=fund&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="store_main.do?categorySelect=fund&condition=sortNew";
            }
        });
	});
	$("#dogCategory").click(function(){
		category_val = 'dog';
		$('select.category option[value='+ category_val +']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "store_main.do",
            method: "GET",
            data: "categorySelect=dog&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="store_main.do?categorySelect=dog&condition=sortNew";
            }
        });
	});
	$("#catCategory").click(function(){
		category_val = 'cat';
		$('select.category option[value='+ category_val +']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "store_main.do",
            method: "GET",
            data: "categorySelect=cat&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="store_main.do?categorySelect=cat&condition=sortNew";
            }
        });
	});
	$("#otherCategory").click(function(){
		category_val = 'other';
		$('select.category option[value='+category_val+']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "store_main.do",
            method: "GET",
            data: "categorySelect=other&condition=sortNew",
            success:function(){
                console.log("성공");
                
                location.href="store_main.do?categorySelect=other&condition=sortNew" 
                
            }
        });
	});
	let chosenCategory = $("#categorySelect option:selected").text();
	document.getElementById("chosenCategory").innerText = chosenCategory;
	
	//메인에 별점이랑 리뷰 숫자 뿌려주는 기능
	var a = $("#listMainSize").val();
	
	for(var i=0; i<a; i++){
		var test = {
	        "store_idx" : $('#idx'+i).val()
		}
		$.ajax({
			url: "star_avg",
			method: "POST",
			data: test,
			async:false,
			success:function(data){
				document.getElementById("rating-bg"+i).value = data;
				document.getElementById("starAverage"+i).innerText = data;
			}
		});
		$.ajax({
			url: "reviewNum",
			method: "POST",
			data: test,
			async:false,
			success:function(data2){
				document.getElementById("starTotal"+i).innerText = data2;
			}
		});
	};
	//메인에 별점이랑 리뷰 숫자 뿌려주는 기능 끝
	
});

	    
	    