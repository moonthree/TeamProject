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
<body>

    <c:import url="/header.do"></c:import>
<main id="wrapper">    
    <div class="container">
    <c:if test="${check eq 0}">
        <h2 class="rftitle">펀딩 제품 pdf 변경</h2>
    </c:if>
    <c:if test="${check eq 1}">
        <h2 class="rftitle">공지사항 사진 파일 변경</h2>
    </c:if>
        <form name="funding_file" id="funding_file" method="post" enctype="multipart/form-data">
        
        <input type="hidden" name="member_idx" id="member_idx" value="${login.member_idx}">
        <input type="hidden" name="funding_content" id="funding_content" value="" >
         <input type="hidden" name="funding_notice" id="funding_notice" value="" >
        <input type="hidden" name="funding_idx"  value="${funding_idx}" >
		 <input type="hidden" name="check"  value="${check}" >
        <!-- 펀딩 카테고리  필드 -->
            <div class="form-group">
                <label for="exampleFormControlInput1">카테고리</label><br>
               <c:choose>
               
               		<c:when test="${funding.funding_category eq 0}"><strong>강아지</strong></c:when>
               		<c:when test="${funding.funding_category eq 1}"><strong>고양이</strong></c:when>
               		<c:when test="${funding.funding_category eq 2}"><strong>다른 동물</strong></c:when>
         
               </c:choose>
            </div>
            <!-- 펀딩 타이틀 필드 -->
            <div class="form-group">
                <label>상품명</label>
                <input name="funding_title" type="text" class="form-control" id="fTitle" placeholder="이름 입력"
                value="${funding.funding_title}" disabled="disabled">
            </div>
               <!-- 펀딩 목표금액 필드 -->
            <div class="form-group">
                <label>펀딩 목표 금액</label>
                <input name="funding_target_price"  type="number" class="form-control" id="fTargetPrice" placeholder="가격 입력" min="0"
                value="${funding.funding_target_price}" disabled="disabled">
            </div>
            
			<!-- 펀딩 기간 필드 -->
            <div class="form-group">
                <label>펀딩 기간</label>&nbsp;<span class="ftime">*최소 15일 ~ 최대 6개월</span>
                <br>
                <!-- 펀딩 시작 기간 필드 -->
                펀딩 오픈 :
                <input name="funding_start_date" type="date"
                value="${funding.funding_start_date}" disabled="disabled">
                &nbsp;
                ~
                &nbsp;
                <!-- 펀딩 종료 기간 필드 -->
                펀딩 종료 :
                <input name="funding_end_date" type="date" value="${funding.funding_end_date}" disabled="disabled">
                
           			 </div>
                        <!-- 펀딩 프로젝트 상품 상세 pdf 필드 (pdf의 파일 이름이 들어갈 예정) -->
                        <c:choose>
                        	<c:when test="${check eq 0}">
                        <input type="hidden" name="flag" value="0">
			              <div class="form-group">
			                <label>프로젝트 계획</label>
			                <div class="input_description">PDF 파일로 등록하세요.</div>
			                <div class="form-inline">
			                	<div class="filebox" style="width: 100%;">
			                        <input name="funding_Detail_temp" type="file" class="form-control" id="funding_Detail_temp">
			                        <label for="funding_Detail_temp">등록하기</label> 
			                        <!-- <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;" onclick="FnThum(this)"> -->
			                        <input type="text" class="upload-detail-name" value="프로젝트 계획" placeholder="첨부파일" readonly style="display: inline-block;
			                        width: calc(100% - 130px);">
			                    </div>
			                </div>
			            </div>
			             <div align="center">
			            	<input type="button" class="btn btn-outline-success" value="미리보기" onclick="preiview(${funding_idx})" style="width: 40%; height: 50px;">
			            	<input type="button" class="btn btn-outline-success" value="등록" onclick="Fun_reg()" style="width: 40%; height: 50px;">
		            	</div>
   				</c:when>
   				<c:otherwise>
   				 <input type="hidden" name="flag" value="1">
   				<!--공지사항 변경  -->
	   			<div class="form-group">
		                <label>공지 등록</label>
		                <div class="input_description">__MB 이하의 JPG, JPEG, PNG 파일로 등록하세요.</div>
		                <div class="form-inline">
		                	<div class="filebox" style="width: 100%;">
		                        <input name="funding_Notice_temp" type="file" class="form-control" id="funding_Notice_temp">
		                        <label for="funding_Notice_temp">등록하기</label> 
		                        <!-- <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;" onclick="FnThum(this)"> -->
		                        <input type="text" class="upload-notice-name" value="공지 " placeholder="첨부파일" readonly style="display: inline-block;
		                        width: calc(100% - 130px);">
		                    </div>
		                </div>
	            </div>
	             <div align="center">
			            	<input type="button" class="btn btn-outline-success" value="미리보기" onclick="preiview2(${funding_idx})" style="width: 40%; height: 50px;">
			            	<input type="button" class="btn btn-outline-success" value="등록" onclick="Fun_reg2()" style="width: 40%; height: 50px;">
		          </div>
   				</c:otherwise>
                       </c:choose>
        
        </form>
    </div>
</main>

<c:import url="/footer.do"></c:import>
</body>
<script type="text/javascript">
var flag = false;
	function preiview(idx) {
		
		
		var theForm =  document.querySelector('form[name=funding_file]');
		//var notice_path = document.getElementById("funding_Notice_temp");
		var detail_path = document.getElementById("funding_Detail_temp");
		
		//var not_path = file_pathReader(notice_path);
		var det_path = file_pathReader(detail_path);

		//$("#funding_notice").val(not_path);
		$("#funding_content").val(det_path);
			
		var url = "funding_update_conetent.do";
		window.open("","popOpen","_blank");
		
	 	theForm.target = "popOpen";
	 	theForm.method= "post";
		theForm.action = url;
		theForm.submit();
		flag = true;
		
	}
	
	
	function Fun_reg() {
		if(flag == true){
		var fileName = $("#funding_Detail_temp").val();
		if(fileName == "" || fileName == null){
			alert("파일을 업로드 후 미리보기 버튼을 눌러주세요");
		}
		else{
			var theForm =  document.querySelector('form[name=funding_file]');
			theForm.method= "post";
			theForm.target="_self";
			theForm.action = "update_file.do";
			theForm.submit();
		}
		}else{
			alert("파일을 업로드 후 미리보기 버튼을 눌러주세요");
		}

} 
	
	
	
	
function file_pathReader(obj) {
		
		var filePath = obj.value;
		//전체경로를 \ 나눔.
		var filePathSplit = filePath.split('\\'); 
		
		return filePathSplit[2];
		
	}
	
$("#funding_Detail_temp").on('change',function(){
    var fileName = $("#funding_Detail_temp").val();
    $(".upload-detail-name").val(fileName);
});

</script>

<!-- 공지사항 변경 스크립트 -->
<script type="text/javascript">
var flag = false;
function preiview2(idx) {
	
	
	var theForm =  document.querySelector('form[name=funding_file]');
	
	var detail_path = document.getElementById("funding_Notice_temp");
	

	var det_path = file_pathReader(detail_path);

	
	$("#funding_notice").val(det_path);
		
	var url = "funding_update_notice.do";
	window.open("","popOpen","_blank");
	
 	theForm.target = "popOpen";
 	theForm.method= "post";
	theForm.action = url;
	theForm.submit();
	flag = true;
	
}


function Fun_reg2() {
	if(flag == true){
	var fileName = $("#funding_Notice_temp").val();
	if(fileName == "" || fileName == null){
		alert("파일을 업로드 후 미리보기 버튼을 눌러주세요");
	}
	else{
		var theForm =  document.querySelector('form[name=funding_file]');
		theForm.method= "post";
		theForm.target="_self";
		theForm.action = "update_file.do";
		theForm.submit();
	}
	}else{
		alert("파일을 업로드 후 미리보기 버튼을 눌러주세요");
	}

} 




function file_pathReader(obj) {
	
	var filePath = obj.value;
	//전체경로를 \ 나눔.
	var filePathSplit = filePath.split('\\'); 
	
	return filePathSplit[2];
	
}

$("#funding_Notice_temp").on('change',function(){
    var fileName = $("#funding_Notice_temp").val();
    $(".upload-notice-name").val(fileName);
});


</script>

</html>