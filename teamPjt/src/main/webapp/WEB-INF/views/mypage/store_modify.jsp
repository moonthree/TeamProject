<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        
 <!--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    
    
    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/funding_register.css">
 
</head>
<script type="text/javascript">
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      //object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
      object.value = object.value.slice(0, object.maxLength);
    }    
  }

</script>
<body>

    <c:import url="/header.do"></c:import>
<main id="wrapper">    
    <div class="container">
        <h2 class="rftitle">스토어 수량 추가</h2>
      
        <form name="store_option_update" id="store_option_update" >
        
        <input type="hidden" name="member_idx" id="member_idx" value="${login.member_idx}">
        <!-- 펀딩 카테고리  필드 -->
            <div class="form-group">
                <label for="exampleFormControlInput1">카테고리</label><br>
               <c:choose>
               
               		<c:when test="${store.store_category eq 0}"><strong>강아지</strong></c:when>
               		<c:when test="${store.store_category eq 1}"><strong>고양이</strong></c:when>
               		<c:when test="${store.store_category eq 2}"><strong>다른 동물</strong></c:when>
         
               </c:choose>
            </div>
            <!-- 스토어 타이틀 필드 -->
            <div class="form-group">
                <label>상품명</label>
                <input name="store_title" type="text" class="form-control" id="fTitle" placeholder="이름 입력"
                value="${store.store_title}" disabled="disabled">
            </div>
              
			 <!-- 스토어 옵션 필드 -->
             <div class="form-group">
                <label>제품 옵션</label>&nbsp;<span class="ftime">*현재 ${optionList.size()}개</span>
               
                <div id="div_main">
                    <table class="tablelist" id="Table" style='width:100%'>
                        <colgroup>
                            <col width="25%" />
                            <col width="20%" />
                            <col width="25%" />
                            <col width="15%" />
                            <col width="15%" />
                          
                        <tr style="text-align: center;">
                            <th scope="col">옵션명</th>
                            <th scope="col">금액</th>
                            <th scope="col">상세</th>
                            <th scope="col">현재 남은 수량</th>
                            <th scope="col">추가 수량</th>
                           
                        </tr>
                        
                        <c:if test="${optionList.size() > 0}">
                        	<c:forEach var="item" items="${optionList}" varStatus="status"> 
                        	<input type="hidden" name="option_idx" value="${item.store_option_idx }">
                        	<input type="hidden" name="store_option_plusss" value="0">
                        	
                        <tr>
                        <!-- 펀딩 옵션  name 맞춤-->
                            <td><input name="store_option_name" type="text" class="text"  style="width:100%;" placeholder="옵션명"  value="${item.store_option_name}" disabled="disabled"/></td>
                            <td><input name="store_option_price" type="number"  max="1000000000" class="text"  style="width:100%;"  placeholder="금액" value="${item.store_option_price}" disabled="disabled"/></td>
                            <td><input name="store_option_detail" type="text" class="text"  style="width:100%;" placeholder="상세" value="${item.store_option_detail}" disabled="disabled"/></td>
                            <td><input name="store_option_stock" type="number" max="10000" class="text"  style="width:100%;" placeholder="현재 수량" value="${item.store_option_stock}" disabled="disabled"/></td>
                           	<td align="center"><button type="button" class="btn btn-info"  onclick ="PlusFn(this)">추가</button>
                        </tr> 
                        	</c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>
          
            <div align="center">
            	<input type="button" class="btn btn-outline-success" value="등록" onclick="checkFn()" style="width: 80%; height: 50px;">
            </div>
        
        </form>
    </div>
</main>
    

<c:import url="/footer.do"></c:import>
</body>
<script type="text/javascript">

	  function PlusFn (obj){
		var Iam = $(obj);
		Iam.css('visibility','hidden');
	    var box = $(obj).parent();
	    var newP = document.createElement('p');
	    newP.innerHTML = "<input type='number' min='1' max='9999' class='temp' maxlength='4' oninput='maxLengthCheck(this)' name='store_option_plus'> <input type='button' value='취소' class='temp' onclick='remove(this)'>";
	    box.append(newP);
	}
	function remove(obj){
		var Iam = $(obj).parent();
		var parentt = $(obj).parent().parent();
		parentt.children("p").remove();
		parentt.last().children("button").css('visibility','visible');
		
	}
 
	
function checkFn() {
	var path = '<%= request.getContextPath()%>';
	var flag = true;
	var plus = $("input[name=store_option_plus]");
	var table_tr = $("input[name=store_option_plusss]").next();
	var length = plus.length;
	var plusArr = new Array(0,0,0,0,0);
	
	for(var j = 0; j<table_tr.length; j++){
		
		
		var p = table_tr.eq(j).children().eq(4).children("p");
		 if(table_tr.eq(j).children().eq(4).children("p").length != 0){
			console.log("하하"+j+" "+p.children(".temp").val());
			plusArr[j] = p.children(".temp").val();
			
		} else{
			
			plusArr[j] = 0;
		}
	}
	
	if(length >0){
		 	for(var i=0; i<length;i++){
				//console.log(plus.eq(i).val());
				if(plus.eq(i).val() == "" || plus.eq(i).val() == null){
					flag = false;
				}
				
			} 
			if(flag == true){
			
				var idx = $("input[name=option_idx]");
				var plusArr2 = new Array();
				 $("input[name=option_idx]").each(function(index, item){
					 plusArr2.push($(item).val());
				   });
		
				$.ajax({
					  url :path+'/store/store_modify.do',
					  type : 'post',
					  dataType : 'json',
					  traditional: true, // ajax 배열 넘기기 옵션!
					  data : {
					  	"option_idx" : plusArr2,
					  	"store_option_plus" : plusArr
					  },
					  success: function(data){
						  console.log(data);
						  if(data == 0){
							  alert("오류 발생");
							  location.href = path+"/mypage/mypage2.do";
						  }else{
							  alert("수량 추가 성공");
							  location.href= path+"/mypage/mypage2.do";
						  }
					  }
					}); 
				
			}else
				alert("수량에 빈 값이 존재합니다.");
	
	}else{
	alert("옵션에 대한 추가 버튼을 눌러서 수량을 추가하여 주세요");
}
	
}

</script>
</html>