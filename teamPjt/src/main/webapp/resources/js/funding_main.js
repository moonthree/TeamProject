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
	$("#dogCategory").click(function(){
		category_val = 'dog';
		$('select.category option[value='+ category_val +']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "main.do",
            method: "GET",
            data: "categorySelect=dog&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="main.do?categorySelect=dog&condition=sortNew";
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
            url: "main.do",
            method: "GET",
            data: "categorySelect=cat&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="main.do?categorySelect=cat&condition=sortNew";
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
            url: "main.do",
            method: "GET",
            data: "categorySelect=other&condition=sortNew",
            success:function(){
                console.log("성공");
                
                location.href="main.do?categorySelect=other&condition=sortNew" 
                
            }
        });
	});
	let chosenCategory = $("#categorySelect option:selected").text();
	document.getElementById("chosenCategory").innerText = chosenCategory;
});

