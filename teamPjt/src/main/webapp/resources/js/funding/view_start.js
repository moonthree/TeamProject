/**
 * 
 */
 
  // 하단 탭들 새로고침해도 유지하는 기능
 	$('#myTab a').click(function(e) {
	  e.preventDefault();
	  $(this).tab('show');
	  
	  window.scrollTo(100, 100);
	});
	
	// store the currently selected tab in the hash value
	$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
	  var id = $(e.target).attr("href").substr(1);
	  window.location.hash = id;
	  window.scrollTo(100, 100);
	});
	
	// on load of the page: switch to the currently selected tab
	var hash = window.location.hash;
	$('#myTab a[href="' + hash + '"]').tab('show');
	
	
	$(document).ready(function() {
	    	// 부트스트랩 드랍다운 작동하게 해주는 자바스크립트
	        $(".dropdown-toggle").dropdown();
	        
	      	// 서포터 숫자 구하기
	    	$.ajax({
	    	    type: "POST",
	    	    url: "read_funding_form",
	    	    data:  $("#read_funding_form").serialize(),
	    	    success: function (data) {
	    	      $("#supportNum").text(data);
	    	    },	    
	        });
	        
	        var objParams = {
			member_idx : $('#member_idx').val(),
			funding_idx : $('#funding_idx').val()
			};
			//console.log(objParams)
	        
	        $.ajax({
				url : "selectZzim",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				async : false,
				data : objParams,
				success : function(result){
					//console.log(result.length)
					//$('#zzimLength').val(result.length)
					if(result.length == 0){
						document.getElementsByClassName("notZzim")[0].style.display = "none";
					}else{
						document.getElementsByClassName("doZzim")[0].style.display = "none";
					}
				},
				error : function(){
	                alert("자바스크립트 SELECT 찜 에러");
	            }   
			});
			
			
	    });
	    
	    
// 찜 등록 시작
var zzimBtn = $("#zzimBtn");

	zzimBtn.on("click", function(){
		
		var objParams = {
			member_idx : $(this).data('id'),
			funding_idx : $(this).data('id2'),
			store_idx : 0,
			zzim_category : 0
		};
		$.ajax({
			url : "insertZzim",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams,
			success : function(){
				//alert("찜 등록")
				document.getElementsByClassName("doZzim")[0].style.display = "none";
				document.getElementsByClassName("notZzim")[0].style.display = "block";
			},
			error : function(){
                alert("찜 등록 에러");
            }   
		});
			
	});

// 찜 취소 시작
var zzimDelBtn = $("#zzimDelBtn");
	zzimDelBtn.on("click", function(){
		var objParams = {
			member_idx : $(this).data('id'),
			funding_idx : $(this).data('id2'),
			store_idx : 0
		};
		
		console.log(objParams)
		$.ajax({
			url : "deleteZzim",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams,
			success : function(){
				//alert("찜 취소")
				document.getElementsByClassName("notZzim")[0].style.display = "none";
				document.getElementsByClassName("doZzim")[0].style.display = "block";
			},
			error : function(){
                alert("찜 취소 에러");
            }   
		});
	})
	
	
	//commufaq 더보기 누르면
$("#commuFaqMore").click(function(){
	$('#commuFaqMore').hide();
	$('.commuP2FaqDetail').hide();
	$('#commuFaqHide').show();
	$('#commuFaqFold').show();
});

//commufaq 접기 누르면
$("#commuFaqFold").click(function(){
	$('#commuFaqHide').hide();
	$('.commuP2FaqDetail').hide();
	$('#commuFaqFold').hide();
	$('#commuFaqMore').show();
});

//faq 접었다 폈다
$(".commuFaq01").click(function(){
	if($('.commuFaq01D').is(':visible')){
		$('.commuFaq01D').hide();
	}else{
		$('.commuP2FaqDetail').hide();
		$('.commuFaq01D').show();	
	}
})
$(".commuFaq02").click(function(){
	if($('.commuFaq02D').is(':visible')){
		$('.commuFaq02D').hide();
	}else{
		$('.commuP2FaqDetail').hide();
		$('.commuFaq02D').show();	
	}
})
$(".commuFaq03").click(function(){
	if($('.commuFaq03D').is(':visible')){
		$('.commuFaq03D').hide();
	}else{
		$('.commuP2FaqDetail').hide();
		$('.commuFaq03D').show();	
	}
})

$(".commuFaq04").click(function(){
	if($('.commuFaq04D').is(':visible')){
		$('.commuFaq04D').hide();
	}else{
		$('.commuP2FaqDetail').hide();
		$('.commuFaq04D').show();	
	}
})

$(".commuFaq05").click(function(){
	if($('.commuFaq05D').is(':visible')){
		$('.commuFaq05D').hide();
	}else{
		$('.commuP2FaqDetail').hide();
		$('.commuFaq05D').show();	
	}
})





	
	 // 페이지 로드시 이벤트 시작ssssssssssssssssssssss
 window.addEventListener('load', function () {
	 var login = document.getElementById('loginMember').value; // 로그인 한사람의 member_idx
	
	 var writeMember = document.getElementsByClassName("writeMember"); //커뮤 댓글 작성한 사람의 member_idx
	 var content = document.getElementsByClassName("commuContent"); //커뮤 댓글 내용 불러옴
	 
	  // 커뮤 로그인 한 아이디에 커뮤니티 글 작성한 게 있으면 작성하기 버튼 숨기고 수정하기 버튼 보임
  	 for (var i = 0; i < writeMember.length; i++) {
  		 if(writeMember[i].value == login){
  			document.getElementById('commuWriteBtn').style.display = "none"; // hide
  			document.getElementById('commuModifyBtn').style.display = "block"; // hide
  			
  		 }
  	 }
	  
	 // 커뮤 수정하기에 자기가 작성한 댓글 출력ssss
	 for (var i = 0; i < writeMember.length; i++) {
  		 if(writeMember[i].value == login){
			
  			var modifyContent = content[i].innerHTML
  			var trim = modifyContent.trim()
  			var trim2 = trim.replace(/&nbsp;/gi," ");
  			var trim3 = trim2.replace(/<br>/gi,"\n");
  			console.log(trim3)
  			$('#modifyText').text(trim3)
  		 }
  	 }
  	 
  	 // 커뮤 faq 더보기 숨기기sssssssss
  	 $('#commuFaqHide').hide();
  	 $('#commuFaqFold').hide();
  	 $('.commuP2FaqDetail').hide();
  	 
  	 //qna 자기 눌렀을 때 닫히기 위해서
  	 $('.hideQna').hide();
  	 $('.hideQna2').hide();
});