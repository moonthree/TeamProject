/**
 * 
 */
$(document).ready(function() {
	// input file 파일 첨부시 fileCheck 함수 실행
	$("#input_file").on("change", fileCheck);
	$("#input_file_modify").on("change", fileCheck2);
	
});



//리뷰 삭제 시작
var reviewDelBtn = $("#reviewDelBtn");
	reviewDelBtn.on("click", function(){
		
		$.ajax({	
            url: "reviewDel",
            type: "POST",
            data: $("#reviewDelForm").serialize(),
       	   success: function(){
                  $('#reviewDeleteModal').modal('hide')
                  window.alert('삭제에 성공했습니다!')
                  location.reload();
              },
              error: function(){
                  alert("삭제 에러");
              }   
        });	
		
	})
var reviewDelNo = $("#reviewDelNo");
reviewDelNo.on("click", function(){
	$('#reviewDeleteModal').modal('hide')
});
//리뷰 삭제 끝

$('input[type=radio][name=store_review_star]').change(function() {
    if (this.value == '5') {
        $(".myformSpan").text("최고");
    }
    else if (this.value == '4') {
        $(".myformSpan").text("좋음");
    }
    else if (this.value == '3') {
        $(".myformSpan").text("보통");
    }
    else if (this.value == '2') {
        $(".myformSpan").text("별로");
    }
    else if (this.value == '1') {
        $(".myformSpan").text("나쁨");
    }
});
/*var modifyReview = $(".modifyReview");
var modify_photo_size = ""
var content_files_modify = new Array();	
modifyReview.on('click', function(){
	modify_photo_size = $('.modify_photo_size').val();
	var filesGet = Array.prototype.slice.call(filesModify)
	if(modify_photo_size == 0){
		filesModify = 0;
	}else if(modify_photo_size == 5){
		filesModfiy
	}
});*/

//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작
//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작
//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작//리뷰 등록 시작
/**
 * 첨부파일로직
 */
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
    $('#btn-upload-modify').click(function (m) {
		m.preventDefault();
	    $('#input_file_modify').click();
	});
});
// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 5;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

function fileCheck(e) {
    var files = e.target.files;   
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    console.log(filesArr)
    // 파일 개수 확인 및 제한
    if (fileCount >= totalCount) {
      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    // 각각의 파일 배열담기 및 기타ssssss
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
      };
      reader.readAsDataURL(f);
    }); 
    for (var image of e.target.files) { 
		var reader = new FileReader(); reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			img.setAttribute('height', '135px');
			img.setAttribute('width', '135px');
			img.setAttribute('id', 'file'+fileNum)
			img.setAttribute('onclick', 'fileDelete(\'file' + fileNum + '\')');
			img.setAttribute('style', 'margin:0px 12px 10px 0px')
			document.querySelector("#articlefileChange").appendChild(img); 
    }; 
    console.log(image); 
    reader.readAsDataURL(image);
    fileNum ++;
    $("#input_file_num").text(fileCount);
    }
    //초기화 한다.
    $("#input_file").val("");
  }
// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no-1].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
	$("#input_file_num").text(fileCount);
    console.log(content_files);
} 
  

/*
 * 폼 submit 로직sssss
 */
var reviewWriteModal = $("#reviewWriteModal");
var reviewWriteModal_store_idx = $('#reviewWriteModal_store_idx').val();
var reviewWriteModal_member_idx = $('#reviewWriteModal_member_idx').val();
var rwm_store_order_idx = $('#rwm_store_order_idx').val();
var optionSize = $('#optionSize').val();
var option = ""
for(var i=0; i<optionSize; i++){
	option += $('#rwm_option'+[i]).val();
}
console.log(option)
	function registerAction(){
		
	var store_review_star = $(':radio[name="store_review_star"]:checked').val();
	var reviewWriteModalContent = reviewWriteModal.find("textarea[name='store_review_content']");
	var reviewWriteModalContent2 = reviewWriteModalContent.val();
	
	var form = $("form")[0];        
 	var formData = new FormData(form);
		formData.append("store_idx", reviewWriteModal_store_idx)
		formData.append("member_idx", reviewWriteModal_member_idx)
		formData.append("store_order_idx", rwm_store_order_idx)
		formData.append("store_review_star", store_review_star)
		formData.append("store_review_content", reviewWriteModalContent2)
		formData.append("store_review_option", option)
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("article_file", content_files[x]);
			}
		}
   /*
   * 파일업로드 multiple ajax처리ss
   */    
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "file-upload",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
				$('#reviewWriteModal').modal('hide')
   	    		alert("리뷰 등록에 성공했습니다.");
   	    		location.reload();
			} else
				alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     return false;
   	      }
   	    });
   	    return false;
	}
	
// 수정          수정                     수정          수정                   수정          수정 
// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCountModify = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCountModify = 5;

//파일 고유 넘버
var fileNumModify = 0;
// 첨부파일 배열
var content_files_Modify = new Array();
  
  function fileCheck2(m) {
    var filesModify = m.target.files;   
    // 파일 배열 담기
    var filesArrModify = Array.prototype.slice.call(filesModify);
    // 파일 개수 확인 및 제한
    if (fileCountModify >= totalCountModify) {
      alert('파일은 최대 '+totalCountModify+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCountModify = fileCountModify + filesArrModify.length;
    }
    // 각각의 파일 배열담기 및 기타ssssss
    filesArrModify.forEach(function (f) {
      var readerModify = new FileReader();
      readerModify.onload = function (m) {
        content_files_Modify.push(f);
      };
      readerModify.readAsDataURL(f);
    }); 
    for (var image of m.target.files) { 
		var readerModify = new FileReader(); readerModify.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			img.setAttribute('height', '135px');
			img.setAttribute('width', '135px');
			img.setAttribute('id', 'file2'+fileNumModify)
			img.setAttribute('onclick', 'fileDeleteModify(\'file2' + fileNumModify + '\')');
			img.setAttribute('style', 'margin:0px 12px 10px 0px')
			document.querySelector("#articlefileChangeModify").appendChild(img); 
    }; 
    console.log(image); 
    readerModify.readAsDataURL(image);
    fileNumModify ++;
    $("#input_file_num_modify").text(fileCountModify);
    }
    //초기화 한다.
    $("#input_file_modify").val("");
  }
function fileDeleteModify(fileNumModify){
    var no = fileNumModify.replace(/[^0-9]/g, "");
    content_files_Modify[no-1].is_delete = true;
	$('#' + fileNumModify).remove();
	fileCountModify --;
	$("#input_file_num").text(fileCountModify);
    console.log(content_files_Modify);
}
	
	
	var reviewModifyModal = $("#reviewModifyModal");
	function modifyAction(){
		
	var store_review_star = $(':radio[name="store_review_star"]:checked').val();
	var reviewWriteModalContent = reviewModifyModal.find("textarea[name='store_review_content']");
	var reviewWriteModalContent2 = reviewWriteModalContent.val();
	
	var form = $("form")[0];        
 	var formData = new FormData(form);
		formData.append("store_idx", reviewWriteModal_store_idx)
		formData.append("member_idx", reviewWriteModal_member_idx)
		formData.append("store_order_idx", rwm_store_order_idx)
		formData.append("store_review_star", store_review_star)
		formData.append("store_review_content", reviewWriteModalContent2)
		formData.append("store_review_option", option)
		for (var x = 0; x < content_files_Modify.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files_Modify[x].is_delete){
				console.log(content_files_Modify[x]);
				 formData.append("article_file2", content_files_Modify[x]);
			}
		}
   
 // 파일업로드 multiple ajax처리ss
       
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "modify_review",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
				$('#reviewModifyModal').modal('hide')
   	    		alert("리뷰 수정에 성공했습니다.");
   	    		location.reload();
			} else
				alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     return false;
   	      }
   	    });
   	    return false;
	}
	
//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝
//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝
//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝