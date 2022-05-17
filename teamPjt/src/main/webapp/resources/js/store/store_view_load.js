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

//옵션 박스에서 x버튼을 누르면 옵션 박스를 숨김
$('.storeOptionBoxHide').on('click', function(){
	$(this).parents(".storeOptionBox").hide();
})
