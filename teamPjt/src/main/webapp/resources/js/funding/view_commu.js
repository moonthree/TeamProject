/**
 * 
 */
 
 
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



//관리자 - 커뮤 삭제를 삭제 확인창으로 들어가면
$('#adminDoDel').click(function(){	
	member_idx = $(this).data('id');
	$('input[id=adminDel2]').attr('value', member_idx);
});

// 관리자 커뮤 삭제 모달
var commuAdminBtn = $("#commuAdminBtn");
	commuAdminBtn.on("click", function(){
		
		$.ajax({	
            url: "commuDelete",
            type: "POST",
            data: $("#commuAdminForm").serialize(),
       	   success: function(){
                  $('#commuAdminModal').modal('hide')
                  window.alert('삭제에 성공했습니다!')
                  location.reload();
              },
              error: function(){
                  alert("삭제 에러");
              }   
        });	
		
	})
var commuAdminNo = $("#commuAdminNo");
	commuAdminNo.on("click", function(){
		 $('#commuAdminModal').modal('hide')
	});
