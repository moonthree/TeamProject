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
        url: "reviewLikeAdminDel",
        type: "POST",
        data: $("#reviewAdminForm").serialize(),
   	   success: function(){
          },
          error: function(){
              alert("추천 에러");
          }   
    });	
    
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
	var rating = $(this).data('id1');
	var content = $(this).data('id2');
	var date = $(this).data('id3');
	var option = $(this).data('id4');
	var name = $(this).data('id5');
	var photo = $(this).data('id6');
	var photo2 =""
	if(photo == ""){
		photo2 = "../resources/image/111.png"
	}else{
		photo2 = "../resources/upload/"+photo
	}
	
	$(".modalBox img").attr("src", imgSrc);
	$(".rbmodal").val(rating);
	$(".rn_modal").text(name);
	$(".rg_modal").text(date);
	$(".ro_modal").text(option);
	$(".rc_modal").text(content);
	$(".rp_modal").attr("src", photo2);
	
	
		
});
