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
			store_idx : 0
		};
		$.ajax({
			url : "insertZzim",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams,
			success : function(){
				alert("찜 등록")
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
				alert("찜 취소")
				document.getElementsByClassName("notZzim")[0].style.display = "none";
				document.getElementsByClassName("doZzim")[0].style.display = "block";
			},
			error : function(){
                alert("찜 취소 에러");
            }   
		});
	})

 

 
 // 글 남기기 모달 카테고리 클릭 이벤트 시작

var div2 = document.getElementsByClassName("div2");
console.log(div2.length)

function handleClick(event) {
    console.log(event.target);
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나온다
    
    console.log(event.target.parentElement);

    if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
    } else {
        for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
        }

        event.target.classList.add("clicked");
    }
    
}

function init() {
    for (var i = 0; i < div2.length; i++) {
        div2[i].addEventListener("click", handleClick);
    }
}

init();
 // 글 남기기 모달 카테고리 클릭 이벤트 끝

 
 // 글 남기기 모달 글 작성 시작
var writeModal = $("#writeModal");
    var writeModalInput = writeModal.find("textarea[name='funding_detail_community_content']");
    var writeModalSubmit = $("#SubmitBtn");
    var writeModalCategory = "";
    var ModalCategory = "";

    writeModalSubmit.on("click", function(e){
    	console.log("abcd")
    	var writeModalValue = writeModalInput.val();
        console.log(writeModalValue);
        writeModalCategory = document.getElementsByClassName('clicked')[0].value
        modalCategory = document.getElementsByClassName('clicked')[0].innerText
        console.log(modalCategory)
        console.log(writeModalCategory)
		$('input[name=funding_detail_community_category]').attr('value',writeModalCategory);
        
        if(writeModalValue == ""){
        	alert("글을 작성해주세요")
        }else{
        	$.ajax({	
                url: "serialize",
                type: "POST",
                data: $("#commuform").serialize(),
           	   success: function(data){
                      //$('#result').text(data);
                      $('#writeModal').modal('hide')
                      
                      window.alert(modalCategory + ' 작성에 성공했습니다!')
                      
                      location.reload();
                  },
                  error: function(){
                      alert("serializeerr");
                  }   
            });	
        }      
    });
 // 글 남기기 모달 글 작성 끝
 
 
  // 수정하기 모달 글 수정 시작
var modifyModal = $("#modifyModal");
    var modifyModalInput = modifyModal.find("textarea[name='funding_detail_community_content']");
    var modifyModalModify = $("#commuModifyButton");
    var modifyModalCategory = "";
    var modifyCategory = "";

    modifyModalModify.on("click", function(e){
    	var modifyModalValue = modifyModalInput.val();
        console.log(modifyModalValue);
        modifyModalCategory = document.getElementsByClassName('clicked')[0].value
        modifyCategory = document.getElementsByClassName('clicked')[0].innerText
        console.log(modifyCategory)
        console.log(modifyModalCategory)
		$('input[name=funding_detail_community_category]').attr('value', modifyModalCategory);
        
        if(modifyModalValue == ""){
        	alert("글을 작성해주세요")
        }else{
        	$.ajax({	
                url: "commuModify",
                type: "POST",
                data: $("#modifyform").serialize(),
           	   success: function(){
					  
         			  $('#modifyModal').modal('hide')
                      window.alert('수정에 성공했습니다!')        
                      
                      
         			  location.reload();
         			        			  
                  },
                  error: function(){
                      alert("serializeerr");
                  }   
            });	
        }      
    });
 // 수정하기 모달 글 수정 끝
 
 
//수정하기 모달 글 삭제 시작
	var commuDeleteButton = $("#commuDeleteButton");
	commuDeleteButton.on("click", function(e){
		
		//삭제를 위해 임의로 넣어줌
		$('input[name=funding_detail_community_category]').attr('value', 0);
		
		$.ajax({	
            url: "commuDelete",
            type: "POST",
            data: $("#modifyform").serialize(),
       	   success: function(data){
                  //$('#result').text(data);
                  $('#modifyModal').modal('hide')
                  window.alert('삭제에 성공했습니다!')
                  location.reload();
              },
              error: function(){
                  alert("serializeerr");
              }   
        });	
		
	})
//수정하기 모달 글 삭제 끝


// qna 모달 작성 시작
var qnaModal = $("#qnaModal");
var qnaModalInput = qnaModal.find("textarea[name='funding_qna_content']");
var qnaModalSubmit = $("#qnaSubmitBtn");

	//댓글 등록 버튼을 누르면
	qnaModalSubmit.on("click", function(e){
    	var qnaModalValue = qnaModalInput.val().replace("\n", "<br>"); //개행처리
        console.log(qnaModalValue);
        
        //비밀글 적용 여부
        var checkbox = document.getElementById('cb1');
        var is_checked = checkbox.checked;
        console.log(is_checked)
        if(is_checked == true){
			$('input[name=funding_qna_secret]').attr('value', 1);
		}else{
			$('input[name=funding_qna_secret]').attr('value', 0);
		}
		
		//본문 작성 여부
		if(qnaModalValue == ""){
        	alert("글을 작성해주세요")
        	$("#funding_qna_content").focus();
        	return false;
        }
        
        console.log($("#funding_idx").val())
        console.log($("#member_idx").val())
        console.log($("#funding_qna_secret").val())
        
        var objParams = {
			funding_idx : $("#funding_idx").val(),
			member_idx : $("#member_idx").val(),
			funding_qna_secret : $("#funding_qna_secret").val(),
			parent_id : '0',
			depth : '0',
			funding_qna_content : qnaModalValue
		};
		console.log(objParams)
		
		$.ajax({
			url : "qnaInsert",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams,
			success : function(retVal){
				if(retVal.code != "OK"){
					alert("등록 실패!");
					return false;
				}else{
					alert(retVal.message);
					$('#qnaModal').modal('hide')
                  	location.reload();
				}
			},
			error : function(){
                      alert("ajax_error");
            }   
		});
   });
 // qna 모달 작성 끝
 
// qna 모 view 시작
var qnaViewContent = "";


$('.qnaViewModal2').click(function(){
	qnaViewContent = $(this).data('id');
		$('#qnaViewDiv').html(qnaViewContent);
	
});
// qna 모달 view 끝

// qna 모달 답변 시작
var qnaAnswerModal = $("#qnaAnswerModal");
var qnaAnswerInput = qnaAnswerModal.find("textarea[name='funding_qna_answer_content']");
var qnaAnswerSubmit = $("#qnaAnswerBtn");

//답변하기 버튼을 누르면
$('.doAnswer').click(function(){	
	parent_idx = $(this).data('id');
	parent_idx2 = $(this).data('id2');
	console.log(parent_idx)
	console.log(parent_idx2)
	$('input[name=funding_qna_idx]').attr('value', parent_idx);
	$('input[name=funding_qna_writer_idx]').attr('value', parent_idx2);
});


//답변 등록 버튼을 누르면
	qnaAnswerSubmit.on("click", function(){
		
    	var qnaAnswerValue = qnaAnswerInput.val().replace("\n", "<br>"); //개행처리
        console.log(qnaAnswerValue);
        
        //비밀글 적용 여부
        var checkbox = document.getElementById('cb2');
        var is_checked = checkbox.checked;
        console.log(is_checked)
        if(is_checked == true){
			$('input[name=funding_qna_secret]').attr('value', 1);
		}else{
			$('input[name=funding_qna_secret]').attr('value', 0);
		}
		
		//본문 작성 여부
		if(qnaAnswerValue == ""){
        	alert("글을 작성해주세요")
        	$("#funding_qna_Answer_content").focus();
        	return false;
        }
                
        var objParams = {
			funding_idx : $(".funding_idx").val(),
			member_idx : $(".answer_member_idx").val(),
			funding_qna_secret : $(".funding_qna_secret").val(),
			parent_id : $(".funding_qna_idx").val(),
			funding_qna_writer_idx : $(".funding_qna_writer_idx").val(),
			depth : '1',
			funding_qna_content : qnaAnswerValue
		};
		console.log(objParams)
		alert(objParams)
		console.log($("#qnaAnswerForm").serialize());
		
		$.ajax({
			url : "qnaInsert",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams,
			success : function(retVal){
				if(retVal.code != "OK"){
					alert("등록 실패!");
					return false;
				}else{
					alert("답변 등록 성공!");
				}
			},
			error : function(){
                      alert("답변 등록 ajax 에러");
            }   
		});
		
		$.ajax({	
            url: "qnaAnswerDone",
            type: "POST",
            data: $("#qnaAnswerForm").serialize(),
            
       	   success: function(){
                  //$('#result').text(data);
                  $('#qnaAnswerModal').modal('hide')
                  location.reload();
              },
              error: function(){
                  alert("serializeerr");
              }   
        });	
   });
// qna 모달 답변 끝

//제목을 눌러서 수정창으로 들어가면
$('.doModify').click(function(){	
	parent_id = $(this).data('id');
	funding_qna_num = $(this).data('id2');
	qna_writer_num = $(this).data('id3')
	console.log(parent_id)
	console.log(funding_qna_num)
	console.log(qna_writer_num)
	$('input[name=parent_id]').attr('value', parent_id);
	$('input[name=funding_qna_idx]').attr('value', funding_qna_num);
	$('input[name=funding_qna_writer_idx]').attr('value', qna_writer_num);
});


// qna 모달 수정 시작
var qnaModifyModal = $("#qnaModifyModal");
    var qnaModifyModalInput = qnaModifyModal.find("textarea[name='funding_qna_content']");
    var qnaModifyModalBtn = $("#qnaModifyBtn");

    qnaModifyModalBtn.on("click", function(){
    	var qnaModifyModalValue = qnaModifyModalInput.val();
        console.log(qnaModifyModalValue);
        
        var checkbox = document.getElementById('cb3');
        var is_checked = checkbox.checked;
        console.log(is_checked)
        if(is_checked == true){
			$('input[name=funding_qna_secret]').attr('value', 1);
		}else{
			$('input[name=funding_qna_secret]').attr('value', 0);
		}
        
        
        if(qnaModifyModalValue == ""){
        	alert("글을 작성해주세요")
        }else{
        	$.ajax({	
                url: "qnaModify",
                type: "POST",
                data: $("#qnaModifyForm").serialize(),
           	   success: function(){
                      //$('#result').text(data);
                      $('#qnaModifyModal').modal('hide')
                      window.alert('수정에 성공했습니다!')
                      location.reload();
                  },
                  error: function(){
                      alert("serializeerr");
                  }   
            });	
        }      
    });
// qna 모달 수정 끝

// qna 모달 삭제 시작
var qnaDeleteBtn = $("#qnaDeleteBtn");
	qnaDeleteBtn.on("click", function(){
		
		//삭제를 위해 임의로 넣어줌
		$('input[name=funding_qna_secret]').attr('value', 0);
		$('input[name=funding_qna_writer_idx]').attr('value', 0);
		
		$.ajax({	
            url: "qnaDelete",
            type: "POST",
            data: $("#qnaModifyForm").serialize(),
       	   success: function(){
                  $('#qnaModifyForm').modal('hide')
                  window.alert('삭제에 성공했습니다!')
                  location.reload();
              },
              error: function(){
                  alert("serializeerr");
              }   
        });	
		
	})

// qna 모달 삭제 끝
 
 // 페이지 로드시 이벤트 시작
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
	  
	 // 커뮤 수정하기에 자기가 작성한 댓글 출력
	 for (var i = 0; i < writeMember.length; i++) {
  		 if(writeMember[i].value == login){

  			var modifyContent = content[i].innerText
  			var trim = modifyContent.trim()
  			$('#modifyText').text(trim)
  		 }
  	 }
  	 
	
  	
});

