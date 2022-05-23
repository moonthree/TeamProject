/**
 * 
 */
 
 $(document).ready(function(){
        $('.sortFunding').hide();
        $('.sortStore').hide();
        $('.categoryDiv').hide();
        $('.filter_span').hide();
        $('.filter_span2').hide();
        
    });

$('#filterModalBtn').on("click", function(){
	//var filter_spna_num2 = $('.filter_span').length;
});
    
$('#filterDoBtn').on("click", function () {
	
	var filter_span_num = $('.filter_span').length;
	console.log(filter_span_num)
	$('.filter_span2').hide();
	for(var i=0; i<filter_span_num; i++){
		if($('.filter_span:eq('+i+')').is(':visible')){
			//$('.search-box').append($('.filter_span:eq('+i+')'))			
			$('.filter_span2:eq('+i+')').show();
		}
	}
	var serialize = $("#filterForm").serialize();
	console.log(serialize)
	if($('.project_fund').is(':visible')){
		$('#fundPlace').hide();
		$('#storePlace').hide();
		$.ajax({
			type: "get",
    	    url: "ajax_page_search.do",
    	    data:  serialize,
    	    success: function(data){
				//console.log(data)
				//$(".search-box").after(data);
				$("#searchPlace *").remove();
				$("#searchPlace").append(data);
				$('#filterModal').modal('hide')
			}
		})
	}else if($('.project_store').is(':visible')){
		$('#fundPlace').hide();
		$('#storePlace').hide();
		$.ajax({
			type: "get",
    	    url: "ajax_page_store_search.do",
    	    data:  serialize,
    	    success: function(data){
				//console.log(data)
				//$(".search-box").after(data);
				$("#searchPlace *").remove();
				$("#searchPlace").append(data);
				$('#filterModal').modal('hide')
			}
		})
	}
});
$('#filterResetBtn').on("click", function () {
    $('.filter_span').hide();
    $('.categoryDiv').hide();
    $('.sortFunding').hide();
    $('.sortStore').hide();
    $('.clicked').removeClass("clicked");
    $('.clicked2').remove();
    $('.clicked3').remove();
    $('.clicked4').remove();
    $('select.category option').removeAttr('selected','selected');
    $('select.condition option').removeAttr('selected','selected');
    $('select.conditionStore option').removeAttr('selected','selected');
    $('#fundPlace').show();
    $('#storePlace').show();
    location.reload();
});

$('#fundingPjtBtn').on("click", function(){
    if($(this).hasClass("clicked")){
        $(this).removeClass("clicked")
        $('.filter_span').hide();
        $('.categoryDiv').hide();
        $('.sortFunding').hide();
        $('select.category option').removeAttr('selected','selected');
    	$('select.condition option').removeAttr('selected','selected');
    	$('select.conditionStore option').removeAttr('selected','selected');
        $('.clicked').removeClass("clicked");
    }else{
        $('.clicked').removeClass("clicked");
        $(this).addClass("clicked")
        $('select.category option').removeAttr('selected','selected');
    	$('select.condition option').removeAttr('selected','selected');
    	$('select.conditionStore option').removeAttr('selected','selected');
        $('.filter_span').hide();
        $('.project_fund').show()
        $('.categoryDiv').show();
        $('.sortFunding').show();
        $('.sortStore').hide();
        $('.clicked2').remove();
        $('.clicked3').remove();
        $('.clicked4').remove();
    }
});
$('#storePjtBtn').on("click", function () {
    if ($(this).hasClass("clicked")) {
        $(this).removeClass("clicked");
        $('.filter_span').hide();
        $('.categoryDiv').hide();
        $('.sortStore').hide();
        $('select.category option').removeAttr('selected','selected');
    	$('select.condition option').removeAttr('selected','selected');
    	$('select.conditionStore option').removeAttr('selected','selected');
        $('.clicked').removeClass("clicked");
    } else {
        $('.clicked').removeClass("clicked");
        $(this).addClass("clicked");
        $('select.category option').removeAttr('selected','selected');
    	$('select.condition option').removeAttr('selected','selected');
    	$('select.conditionStore option').removeAttr('selected','selected');
        $('.filter_span').hide();
        $('.project_store').show()
        $('.categoryDiv').show();
        $('.sortFunding').hide();
        $('.sortStore').show();
        $('.clicked2').remove();
        $('.clicked3').remove();
        $('.clicked4').remove();
    }
});
var value = ""
$('.categoryBtn').on("click", function(){
    var idx = $(".categoryBtn").index(this);
    value = $(".categoryBtn:eq("+idx+")").val();
    console.log(value)
    $('.filter_span_category').hide();
    $('.filter_span_category:eq('+idx+')').show();
    $('select.category option').removeAttr('selected','selected');
    $('select.category option[value='+ value +']').attr('selected','selected');
});
$('.sortFundingBtn').on("click", function(){
    var idx = $(".sortFundingBtn").index(this);
    value = $(".sortFundingBtn:eq("+idx+")").val();
    $('.filter_span_fund').hide();
    $('.filter_span_fund:eq('+idx+')').show();
    $('select.condition option').removeAttr('selected','selected');
    $('select.condition option[value='+ value +']').attr('selected','selected');
});
$('.sortStoreBtn').on("click", function(){
    var idx = $(".sortStoreBtn").index(this);
    value = $(".sortStoreBtn:eq("+idx+")").val();
    $('.filter_span_store').hide();
    $('.filter_span_store:eq('+idx+')').show();
    $('select.conditionStore option').removeAttr('selected','selected');
    $('select.conditionStore option[value='+ value +']').attr('selected','selected');
});

var categoryBtn = document.getElementsByClassName("categoryBtn");
var sortFundingBtn = document.getElementsByClassName("sortFundingBtn");
var sortStoreBtn = document.getElementsByClassName("sortStoreBtn");
function handleClick2(event) {
    // console.log(event.target);
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나
    // console.log(event.target.classList);
    if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
    } else {
        for (var i = 0; i < categoryBtn.length; i++) {
            categoryBtn[i].classList.remove("clicked");
            $('.clicked2').remove();
        }
        event.target.classList.add("clicked");
    }
}
function handleClick3(event) {
    if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
    } else {
        for (var i = 0; i < sortFundingBtn.length; i++) {
            sortFundingBtn[i].classList.remove("clicked");
            $('.clicked3').remove();
        }
        event.target.classList.add("clicked");
    }
}
function handleClick4(event) {
    if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
    } else {
        for (var i = 0; i < sortStoreBtn.length; i++) {
            sortStoreBtn[i].classList.remove("clicked");
                $('.clicked4').remove();
        }
        event.target.classList.add("clicked");
        
    }
}
function init() {
    for (var i = 0; i < categoryBtn.length; i++) {
        categoryBtn[i].addEventListener("click", handleClick2);
    }
    for (var i = 0; i < sortFundingBtn.length; i++) {
        sortFundingBtn[i].addEventListener("click", handleClick3);
    }
    for (var i = 0; i < sortStoreBtn.length; i++) {
        sortStoreBtn[i].addEventListener("click", handleClick4);
    }
}
init();