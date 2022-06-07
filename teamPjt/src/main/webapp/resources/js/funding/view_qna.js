/**
 * 
 */
 
 
// qna 모달 작성 시작
var qnaModal = $("#qnaModal");
var qnaModalInput = qnaModal.find("textarea[name='funding_qna_content']");
var qnaModalSubmit = $("#qnaSubmitBtn");

	//댓글 등록 버튼을 누르면
	qnaModalSubmit.on("click", function(){
    	var qnaModalValue = qnaModalInput.val().replace(/\n/gi, "<br>"); //개행처리
    	var qnaModalValue2 = qnaModalValue.replace(/ /gi,"&nbsp;");
        
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
		if(qnaModalValue2 == ""){
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
			funding_qna_content : qnaModalValue2
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
/*var qnaViewContent = "";


$('.qnaViewModal2').click(function(){
	qnaViewContent = $(this).data('id');
		$('#qnaViewDiv').html(qnaViewContent);
	
});*/
// qna 모달 view 끝

// qna 모달 답변 시작
var qnaAnswerModal = $("#qnaAnswerModal");
var qnaAnswerInput = qnaAnswerModal.find("textarea[name='funding_qna_answer_content']");
var qnaAnswerSubmit = $("#qnaAnswerBtn");

//답변하기 버튼을 누르면
$('.doAnswer').click(function(){	
	funding_qna_idx = $(this).data('id');
	funding_qna_writer_idx = $(this).data('id2');
	console.log(funding_qna_idx)
	console.log(member_idx)
	$('input[name=funding_qna_idx]').attr('value', funding_qna_idx);
	$('input[name=funding_qna_writer_idx]').attr('value', funding_qna_writer_idx);
});


//답변 등록 버튼을 누르면
	qnaAnswerSubmit.on("click", function(){
		
    	var qnaAnswerValue = qnaAnswerInput.val().replace(/\n/gi, "<br>"); //개행처리
    	console.log(qnaAnswerValue);
    	var qnaAnswerValue2 = qnaAnswerValue.replace(/ /gi,"&nbsp;");
        console.log(qnaAnswerValue2);
        //비밀글 적용 여부e=funding_qna_secret]').attr('value', 1);
		$('input[name=funding_qna_secret]').attr('value', 0);
		
		
		//본문 작성 여부
		if(qnaAnswerValue == ""){
        	alert("글을 작성해주세요")
        	$("#funding_qna_Answer_content").focus();
        	return false;
        }
                
        var objParams = {
			funding_idx : $(".qna_funding_idx").val(),
			member_idx : $(".answer_member_idx").val(),
			funding_qna_secret : $(".funding_qna_secret").val(),
			parent_id : $(".funding_qna_idx").val(),
			funding_qna_writer_idx : $(".funding_qna_writer_idx").val(),
			depth : '1',
			funding_qna_content : qnaAnswerValue2
		};
		/*console.log(objParams)
		alert(objParams)
		console.log($("#qnaAnswerForm").serialize());*/
		
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

//제목을 눌러서 답변 수정창으로 들어가면
$('.doQnaAnswerModify').click(function(){	
	parent_id = $(this).data('id');
	funding_qna_num = $(this).data('id2');
	qna_writer_num = $(this).data('id3');
	funding_idx = $(this).data('id4');
	/*console.log(parent_id);
	console.log(funding_qna_num);
	console.log(qna_writer_num);*/
	$('input[name=parent_id]').attr('value', parent_id);
	$('input[name=funding_qna_idx]').attr('value', funding_qna_num);
	$('input[name=funding_qna_writer_idx]').attr('value', qna_writer_num);
	
	var objParams = {
			funding_qna_idx : funding_qna_num,
			funding_idx : funding_idx
		};
		
		$.ajax({
			url: "qnaList",
			type: "POST",
			async : false,
			data: objParams,
			success: function(data){
				//window.alert('qnaListForm 성공')
				//console.log(data)
				var answer = data[0].funding_qna_content
				var answer2 = answer.toString(); //숫자만 작성되어 있으면 .replace 함수가 오류나서 toString 처리
				var answer3 = answer2.replace(/<br>/gi, "\n"); //개행처리
				var answer4 = answer3.replace(/&nbsp;/gi," ");
				$('#funding_qna_answer_modify').text(answer4);
				
			},
			error: function(){
				alert("답변 수정 버튼 에러")
			}
		})
	
});


// qna 모달 답변 수정 시작ssssssssss
var qnaAnswerModifyModal = $("#qnaAnswerModifyModal");
    var qnaAnswerModifyInput = qnaAnswerModifyModal.find("textarea[name=funding_qna_content]");
    var qnaAnswerModifyModalBtn = $("#qnaAnswerModifyBtn");

    qnaAnswerModifyModalBtn.on("click", function(){
		var qnaAnswerModifyModalValue = qnaAnswerModifyInput.val().replace(/\n/gi, "<br>"); //개행처리
    	console.log(qnaAnswerModifyModalValue);
    	var qnaAnswerModifyModalValue2 = qnaAnswerModifyModalValue.replace(/ /gi,"&nbsp;");
        console.log(qnaAnswerModifyModalValue2);
        
		$('input[name=funding_qna_secret]').attr('value', 0);
		
        if(qnaAnswerModifyModalValue2 == ""){
        	alert("글을 작성해주세요")
        }else{
        	$.ajax({	
                url: "qnaAnswerModify",
                type: "POST",
                data: $("#qnaAnswerModifyForm").serialize(),
           	   success: function(){
                      //$('#result').text(data);
                      $('#qnaAnswerModifyModal').modal('hide')
                      window.alert('수정에 성공했습니다!')
                      location.reload();
                  },
                  error: function(){
                      alert("답변 수정 에러");
                  }   
            });	
        }      
    });
// qna 모달 답변 수정 끝





//수정 버튼을 눌러서 수정창으로 들어가면
$('.doModify').click(function(){	
	parent_id = $(this).data('id');
	funding_qna_num = $(this).data('id2');
	qna_writer_num = $(this).data('id3')
	funding_qna_content = $(this).data('id4')
	var funding_qna_content2 = funding_qna_content.toString(); //숫자만 작성되어 있으면 .replace 함수가 오류나서 toString 처리
	var funding_qna_content3 = funding_qna_content2.replace(/<br>/gi, '\n'); //엔터 개행처리
	var funding_qna_content4 = funding_qna_content3.replace(/&nbsp;/gi," "); //띄어쓰기 개행처리
	/*console.log(parent_id)
	console.log(funding_qna_num)
	console.log(qna_writer_num)*/
	$('input[name=parent_id]').attr('value', parent_id);
	$('input[name=funding_qna_idx]').attr('value', funding_qna_num);
	$('input[name=funding_qna_writer_idx]').attr('value', qna_writer_num);
	$('#funding_qna_modify').text(funding_qna_content4);
});


// qna 모달 수정 시작sssssssswqfdqwd
var qnaModifyModal = $("#qnaModifyModal");
    var qnaModifyModalInput = qnaModifyModal.find("textarea[name=funding_qna_content]");
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



// qna 모달 삭제 시작sssss
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
                  alert("삭제 에러");
              }   
        });	
		
	})

// qna 모달 삭제 끝sss



// 관리자 - qna 삭제를 위해 삭제 버튼을 누르고 삭제 모달로 들어가면ssss
$('.qnaAdminDoDel').click(function(){
	funding_qna_idx = $(this).data('id');
	$('input[name=funding_qna_idx]').attr('value',funding_qna_idx);
});

// 관리자 qna 삭제 모달
var qnaAdminBtn = $("#qnaAdminBtn");
	qnaAdminBtn.on("click", function(){
		$.ajax({	
            url: "qnaDelete",
            type: "POST",
            data: $("#qnaAdminForm").serialize(),
       	   success: function(){
                  $('#qnaAdminModal').modal('hide')
                  window.alert('삭제에 성공했습니다!')
                  location.reload();
              },
              error: function(){
                  alert("삭제 에러");
              }   
        });	
		
	});
// 관리자 qna 삭제 모달에서 아니오 누르면 
var qnaAdminNo = $("#qnaAdminNo");
	qnaAdminNo.on("click", function(){
		 $('#qnaAdminModal').modal('hide')
	});
	
//qna 답변 대기일 때 제목을 누르면	
$('.noshowQna').click(function(){
	var funding_qna_idx = $(this).data('id');
	$('input[name=funding_qna_idx]').attr('value', funding_qna_idx);
	var funding_qna_content = $(this).data('id2');
	var funding_qna_content2 = funding_qna_content.toString(); //숫자만 작성되어 있으면 .replace 함수가 오류나서 toString 처리
	var funding_qna_content3 = funding_qna_content2.replace(/\n/gi, "<br>"); //엔터 개행처리
	var funding_qna_content4 = funding_qna_content3.replace(/ /gi,"&nbsp;"); //띄어쓰기 개행처리
	
	
	$(".answer").remove();
	$(".tr"+funding_qna_idx).after('<tr class="answer" style="background-color : #f7f8fa;"><td style="border-bottom:none;"></td><td>'+funding_qna_content4+'</td><td></td><td></td></tr>')
	
	$('.noshowQna').hide();
	$('.hideQna2').show();
});
$('.hideQna2').click(function(){
	$(".answer").remove();
	$('.hideQna2').hide();
	$('.noshowQna').show();
})
	
	
//qna 답변 완료일 때 제목을 누르면ssssSS
$('.showQna').click(function(){
	var funding_qna_idx = $(this).data('id');
	$('input[name=funding_qna_idx]').attr('value', funding_qna_idx);
	var funding_qna_content = $(this).data('id2');
	var funding_qna_content2 = funding_qna_content.toString(); //숫자만 작성되어 있으면 .replace 함수가 오류나서 toString 처리
	var funding_qna_content3 = funding_qna_content2.replace(/\n/gi, "<br>"); //엔터 개행처리
	var funding_qna_content4 = funding_qna_content3.replace(/ /gi,"&nbsp;"); //띄어쓰기 개행처리
	
	var funding_idx = $(this).data('id3');
	$('input[name=funding_idx]').attr('value', funding_idx);
	var objParams = {
			funding_qna_idx : $(".funding_qna_idx").val(),
			funding_idx : $(".funding_idx").val()
		};
		
		$.ajax({
			url: "qnaList",
			type: "POST",
			async : false,
			data: objParams,
			success: function(data){
				//window.alert('qnaListForm 성공')
				//console.log(data)
				var answer = data[0].funding_qna_content
				var answer2 = answer.replace(/\n/gi, "<br>"); //개행처리
				var answer3 = answer2.replace(/ /gi,"&nbsp;");
				var name = data[0].memberVO.member_business_name
				var date = data[0].funding_qna_regdate
				var date2 = date.substring(0, 11);
				$(".answer").remove();
				$(".tr"+funding_qna_idx).after
				('<tr class="answer" style="background-color : #f7f8fa; border-bottom: 1px solid #eaeced"><td style="border-top:none;"></td><td><span style="color : #c2c2c2;">ㄴ</span><span style="font-size: 12px; background-color : #a3a9b3; color: #f3f4f6; padding: 3px; border-radius:5px;">답변</span>&nbsp;'+answer3+'</td><td>판매자</td><td>'+date2+'</td></tr>')
				$(".tr"+funding_qna_idx).after
				('<tr class="answer" style="background-color : #f7f8fa; border-top: 1px solid #eaeced"><td style="border-bottom:none;"></td><td style="border-bottom: 1px solid #eaeced">'+funding_qna_content4+'</td><td style="border-bottom: 1px solid #eaeced"></td><td style="border-bottom: 1px solid #eaeced"></td></tr>')
				
			},
			error: function(){
				alert("qnaListForm 에러")
			}
			
		})
		
		$('.showQna').hide();
		$('.hideQna').show();
		//1.ajax 통신ㄴㄴㄴㄴsssssssssssssssssssss
		//1번이 success 됐을때 답변 그리기
});
$('.hideQna').click(function(){
	$(".answer").remove();
	$('.hideQna').hide();
	$('.showQna').show();
})