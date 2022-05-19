/**
 * 
 */
 
 // 커뮤, 공지 등등 탭들 새로고침해도 유지하는 기능
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
	// 부트스트랩 드랍다운 작동하게 해줌
    $(".dropdown-toggle").dropdown();
    
    // input file 파일 첨부시 fileCheck 함수 실행
	$("#input_file").on("change", fileCheck);
	
	//찜 관련 시작
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
	//찜 관련 끝
			
	   
    
    //옵션 박스들 숨기기
    $('.storeOptionBox').hide();
    
    //셀렉트 박스에서 옵션을 선택하면
    $('#storeOptionSelect').on('change', function(){
		/*
		1. 셀렉트 박스에서 선택된 값을 selected 변수에 저장하고
		2. 옵션의 개수 만큼 for문을 돌리면서
		3. selected 변수에 저장된 값과 옵션 박스의 값을 비교하여
		4. 동일한 값을 찾으면 해당 박스를 보이게함
		5. 생성된 박스를 삭제 후 다시 동일한 박스를 선택할 때 
		   change가 먹지 않아서 박스 생성이 안되는 현상을 방지하기 위하여 
		   셀렉트 박스에서 선택된 값을 다시 default인 상품명으로 변경하고 break;
		   
		6. 만약 이미 생성된 박스를 클릭했다면 alert를 띄우고 5번 과정을 진행한 후 break;
		*/
		var selected = ""
		selected = this.value;
		for(var i=0; i<3; i++){
			var selectedBox = $('.storeOptionText')[i].innerHTML
			if(selected == selectedBox){
				if($('.box'+[i]).is(':visible')){
					alert('이미 선택된 상품입니다.')
					document.getElementById("storeOptionSelect").value = 'default';
					break;
				}else{
					$('.box'+[i]).show();
					document.getElementById("storeOptionSelect").value = 'default';
					break;	
				}
			}
		}
	});
    
});//end of $(document).ready(function() 

//옵션 박스에서 x버튼을 누르면 옵션 박스를 숨김sss
$('.storeOptionBoxHide').on('click', function(){
	$(this).parents(".storeOptionBox").hide();
})




// 찜 등록 시작
var zzimBtn = $("#zzimBtn");

	zzimBtn.on("click", function(){
		
		var objParams2 = {
			member_idx : $(this).data('id'),
			store_idx : $(this).data('id2'),
			funding_idx : $(this).data('id3')
		};
		console.log(objParams2)
		$.ajax({
			url : "insertZzim2",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams2,
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
var zzimBtn2 = $("#zzimBtn2");

	zzimBtn2.on("click", function(){
		
		var objParams2 = {
			member_idx : $(this).data('id'),
			store_idx : $(this).data('id2'),
		};
		console.log(objParams2)
		$.ajax({
			url : "insertZzim2",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false,
			data : objParams2,
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
			funding_idx : 0,
			store_idx : $(this).data('id2')
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

	function registerAction(){
		
	var store_review_star = $(':radio[name="store_review_star"]:checked').val();
	var reviewWriteModalContent = reviewWriteModal.find("textarea[name='store_review_content']");
	var reviewWriteModalContent2 = reviewWriteModalContent.val();
	
	var form = $("form")[0];        
 	var formData = new FormData(form);
		formData.append("store_idx", reviewWriteModal_store_idx)
		formData.append("member_idx", reviewWriteModal_member_idx)
		formData.append("store_review_star", store_review_star)
		formData.append("store_review_content", reviewWriteModalContent2)
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("article_file", content_files[x]);
			}
		}
   /*
   * 파일업로드 multiple ajax처리
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
//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝
//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝
//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝//리뷰 등록 끝