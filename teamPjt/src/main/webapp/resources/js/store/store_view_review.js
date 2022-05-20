/**
 * 
 */
 
/*리뷰 등록 별점 클릭시 이벤트sssssss*/
$('input[type=radio][name=store_review_star]').change(function() {
    if (this.value == '5') {
        $("#myformSpan").text("최고");;
    }
    else if (this.value == '4') {
        $("#myformSpan").text("좋음");;
    }
    else if (this.value == '3') {
        $("#myformSpan").text("보통");;
    }
    else if (this.value == '2') {
        $("#myformSpan").text("별로");;
    }
    else if (this.value == '1') {
        $("#myformSpan").text("나쁨");;
    }
});

$(".img").click(function(){
	$("#photoBigModal").modal();
	var imgSrc = $(this).attr("src");
		$(".modalBox img").attr("src", imgSrc);
});
