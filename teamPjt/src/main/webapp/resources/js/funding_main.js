/**
 * 
 */

$(document).ready(function() {
	$(".dropdown-toggle").dropdown();
	$('#condition').on('change', function(){
		this.form.submit()
		/*var a = $("#condition option:selected").val();
		alert(a)
		$.ajax({
            url: "main_cat.do",
            method: "GET",
            data: "pageNum=" + currentPage + "&condition=" + a,
            success:function(data){
				alert('성공'+ currentPage + a)
				location.href="main_cat.do?condition="+a 
			},
			fail:function(){
				alert('실패')
			}
        })*/
	})
	let category_val = '';
	let condition_val = '';
	$("#dogCategory").click(function(){
		category_val = 'dog';
		$('select.category option[value='+ category_val +']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "main.do",
            method: "GET",
            data: "categorySelect=dog&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="main.do?categorySelect=dog&condition=sortNew";
            }
        });
	});
	$("#catCategory").click(function(){
		category_val = 'cat';
		$('select.category option[value='+ category_val +']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "main.do",
            method: "GET",
            data: "categorySelect=cat&condition=sortNew",
            success:function(){
                console.log("성공");
                location.href="main.do?categorySelect=cat&condition=sortNew";
            }
        });
	});
	$("#otherCategory").click(function(){
		category_val = 'other';
		$('select.category option[value='+category_val+']').attr('selected','selected');
		condition_val = $("#condition").value;
		if(condition_val = 'undifined'){
			$('select.condition option[value= sortNew ]').attr('selected','selected');
		}
		$.ajax({
            url: "main.do",
            method: "GET",
            data: "categorySelect=other&condition=sortNew",
            success:function(){
                console.log("성공");
                
                location.href="main.do?categorySelect=other&condition=sortNew" 
                
            }
        });
	});
	let chosenCategory = $("#categorySelect option:selected").text();
	document.getElementById("chosenCategory").innerText = chosenCategory;
});



/*//스크롤 처리 이벤트
    //페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
    let currentPage=1;
    //현재 페이작 로딩중인지 여부를 저장할 변수이다.
    let isLoading = false;
    
    let totalPageCount = document.getElementById('totalPageCount').value
    console.log(totalPageCount)

    //웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
    $(window).on("scroll", function(){
        //위로 스크롤된 길이
        let scrollTop=$(window).scrollTop();
        //웹 브라우저 창의 높이
        let windowHeight = $(window).height();
        //문서 전체의 높이
        let documentHeight=$(document).height();
        //바닥까지 스크롤 되었는 지 여부를 알아낸다.
        let isBottom = scrollTop+windowHeight + 10 >= documentHeight;

        if(isBottom){
            //만일 현재 마지막 페이지라면
            if(currentPage == totalPageCount || isLoading){
				alert('종료');
                return; //함수를 여기서 끝낸다.
                
            }
            //현재 로딩 중이라고 표시한다.
            isLoading = true;
            //로딩바를 띄우고
            $(".back-drop").show();
            //요청할 페이지 번호를 1 증가시킨다.
            currentPage++;
            //추가로 받아올 페이지를 서버에 ajax요청을 하고
            console.log("inscroll" + currentPage);
            GetList(currentPage);
        }
    });

//카드 리스트를 가져오는 함수
    const GetList = function(currentPage){
        console.log("inGetList"+currentPage);
        var selected = $("#condition option:selected").val();
        var categorySelected = $("#categorySelect option:selected").val();
        alert(categorySelected)

        $.ajax({
            url: "main_infinite.do",
            method: "GET",
            //검색 기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다. 안그러면 검색결과만 나와야 하는데 다른 것들으 덧붙여져 나온다.
            data: "pageNum=" + currentPage + "&categorySelect="+categorySelected+ "&condition="+selected,
            //ajax_page.jsp의 내용이 data로 들어온다.
            success:function(data){
                //console.log(data);
                //응답된 문자열은 html 형식이다.(picture/ajax_page.jsp에 응답내용이 있다.)
                //해당 문자열을 c.card-list-container div에 html로 해석하라고 추가한다.
                $(".card-list-container").append(data);
                //로딩바를 숨긴다.
                $(".back-drop").hide();
                //로딩중이 아니라고 표시힌다.
                isLoading=false;
                console.log("ajax");
            }
                

        });
    }*/