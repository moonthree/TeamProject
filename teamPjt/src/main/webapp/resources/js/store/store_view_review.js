/**
 * 
 */
 
var adminDoReviewDel = $("#adminDoReviewDel");
adminDoReviewDel.on("click", function(){
	store_review_idx = $(this).data('id');
	$('input[name=store_review_idx]').attr('value',store_review_idx);
});
var reviewAdminBtn = $("#reviewAdminBtn");
reviewAdminBtn.on("click", function(){
	$.ajax({	
        url: "reviewAdminDel",
        type: "POST",
        data: $("#reviewAdminForm").serialize(),
   	   success: function(){
              $('#reviewAdminModal').modal('hide')
              window.alert('삭제에 성공했습니다!')
              location.reload();
          },
          error: function(){
              alert("삭제 에러");
          }   
    });	
});
var reviewAdminNo = $("#reviewAdminNo");
reviewAdminNo.on("click", function(){
	$('#reviewAdminModal').modal('hide')
});


$(".img").click(function(){
	$("#photoBigModal").modal();
	var imgSrc = $(this).attr("src");
		$(".modalBox img").attr("src", imgSrc);
});
