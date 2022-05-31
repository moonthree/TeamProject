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
<script>
    $(function () {
    $('.chips__choice .chip').on("click", function () {
        $('.chips__choice .chip').removeClass('chip--active');
        $(this).addClass("chip--active");
    });
    $('.chips__filter .chip').on("click", function () {
        $(this).toggleClass("chip--active");
    });
});
    
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
<!-- 펀딩 성공 후 스토어 신청일 경우 --> 
<c:if test="${check eq 1}">
         	 <div class="container">
        <h2 class="rftitle">스토어 상품 등록</h2>
        <form name="store_upload" id="store_upload" action="store_register.do"  method="post" enctype="multipart/form-data">
        
         <input type="hidden" name="member_idx" id="member_idx" value="${login.member_idx}">
         <input type="hidden" name="store_notice" id="store_notice" value="" >
         <input type="hidden" name="store_thumbnail" id="store_thumbnail" value="" >
         <input type="hidden" name="store_content" id="store_content" value="" >
         <input type="hidden" name="funding_idx" id="funding_idx" value="${funding_idx}" >
         
        <div class="info">
            <h3>기본 정보</h3>
            <p>프로젝트를 대표할 주요 기본 정보를 입력하세요.</p>
            <!-- 스토어 타이틀 필드 -->
            <div class="form-group">
                <label>기존 프로젝트 제목</label>
                <input name="store_title" type="text" class="form-control" id="fTitle" placeholder="제목 입력" value="${funding.funding_title}">
            </div>
           
            <!-- 스토어 썸네일 필드 (사진의 제목이 들어갈 것 같다.) -->
            <div class="form-group">
                <label>대표 이미지</label>
                <div class="input_description">__MB 이하의 JPG, JPEG, PNG 파일로 등록하세요.</div>
                <div class="form-inline">
                    <div class="filebox" style="width: 100%;">
                        <input name="store_thumbnail_temp" type="file" class="form-control" id="store_thumbnail_temp">
                        <label for="store_thumbnail_temp">등록하기</label> 
                        <input type="text" class="upload-thumbnail-name" value="대표 이미지" placeholder="첨부파일" readonly style="display: inline-block;
                        width: calc(100% - 130px);">
                    </div>
                </div>
            </div>
            <!-- 스토어 카테고리  필드 -->
            <div class="form-group">
                <label for="exampleFormControlInput1">상품 카테고리</label>
                <div class="chips__choice" style="margin: 10px;">

                <c:if test="${funding.funding_category eq 0 }">
                	 <input type="radio" class="btn_category" name="store_category" value="0" id="btn_01" checked>
                    <label for="btn_01">
                        <div class="chip chip--active">강아지</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="1" id="btn_02">
                    <label for="btn_02">
                        <div class="chip">고양이</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="2" id="btn_03">
                    <label for="btn_03">
                        <div class="chip">다른 동물들</div>
                    </label>
                </c:if>
                
                  <c:if test="${funding.funding_category eq 1 }">
                	 <input type="radio" class="btn_category" name="store_category" value="0" id="btn_01">
                    <label for="btn_01">
                        <div class="chip">강아지</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="1" id="btn_02"checked>
                    <label for="btn_02">
                        <div class="chip chip--active">고양이</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="2" id="btn_03">
                    <label for="btn_03">
                        <div class="chip">다른 동물들</div>
                    </label>
                </c:if>
                
                 <c:if test="${funding.funding_category eq 2 }">
                	 <input type="radio" class="btn_category" name="store_category" value="0" id="btn_01">
                    <label for="btn_01">
                        <div class="chip ">강아지</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="1" id="btn_02">
                    <label for="btn_02">
                        <div class="chip">고양이</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="2" id="btn_03" checked>
                    <label for="btn_03">
                        <div class="chip chip--active">다른 동물들</div>
                    </label>
                </c:if>
                    
                </div>
            </div>
           
        </div>

        <div class="info">
            <h3>옵션 정보</h3>
            <p>구매자에게 제공할 옵션 내용을 입력하세요. 스토어 쇼핑몰에 등록할 상품의 옵션을 작성하세요. 첫번째 옵션내용이 메인 옵션으로 자동저장됩니다.</p>
			 <!-- 펀딩 옵션 필드 -->
            <div class="form-group">
                <label>제품 옵션</label>
                <div class="input_description">* 최대 5개까지의 옵션을 추가할 수 있습니다.(금액 최대 : 999,999,999원, 수량 최대: 9,999 )</div>
                
                <div id="div_main">
                    <table class="tablelist" id="Table" style='width:100%'>
                    	<c:forEach items="${optionList}" var="item">
                        <tr style="border-top: 2px solid #333C83;">

                            <th scope="row">옵션명</th>
                            <td colspan="3">
                                <input name="store_option_name" type="text" class="text" " style="width:100%;" placeholder="옵션명" value="${item.funding_option_name}" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">금액</th>
                            <td>
                                <input name="store_option_price" type="number" min="1" max="1000000000" class="text" style="width:100%;" maxlength="9" oninput="maxLengthCheck(this)"  placeholder="금액" value="${item.funding_option_price}"/>
                            </td>
                            <th scope="row">수량</th>
                            <td>
                                <input type="number" class="text" name="store_option_stock" min="1" max="10000" style="width:100%;" maxlength="4" oninput="maxLengthCheck(this)" placeholder="입력없을 시 자동으로 100개로 고정됩니다." value="100" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상세</th>
                            <td colspan="3">
                                <input name="store_option_detail" type="text" class="text"  style="width:100%;" placeholder="상세" value="${item.funding_option_detail}" />
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <textarea id="template" style="display:none;">
                        <tr id="addRow" style="border-top: 2px solid #333C83;">
                            <th scope="row">옵션명</th>
                            <td colspan="3">
                                <input name="store_option_name" type="text" class="text" name="name1" style="width:100%;" placeholder="옵션명을 입력하세요." />
                            </td>
                        </tr>
                        <tr id="addRow">
                            <th scope="row">금액</th>
                            <td>
                                <input name="store_option_price" type="number" min="1" max="1000000000" class="text" maxlength="9" oninput="maxLengthCheck(this)" style="width:100%;"  placeholder="금액을 입력하세요."/>
                            </td>
                            <th scope="row">수량</th>
                            <td>
                                <input type="number" class="text" name="store_option_stock" min="1" max="10000"  maxlength="4" oninput="maxLengthCheck(this)"style="width:100%;" placeholder="수량을 입력하세요." />
                            </td>
                        </tr>
                        <tr id="addRow">
                            <th scope="row">상세</th>
                            <td colspan="3">
                                <input name="store_option_detail" type="text" class="text"  style="width:100%;" placeholder="상세정보를 입력하세요." />
                            </td>
                        </tr>
                    </textarea>
                    <button type="button" class="btn btn-outline-secondary" id="ADD" style="margin: 15px;">+ 옵션 추가</button>
                </div>
            </div>
            <div class="form-group">
                <label>배송비</label>
                <div class="input_description">배송비 추가 예정 (최대 9,999원)</div>
                <!-- 배송비 -->
                <input name="store_express_fee"  type="number" class="form-control" id="fTargetPrice" placeholder="배송비를 입력하세요" min="0" max="9999" maxlength="4" oninput="maxLengthCheck(this)" style="width: calc(100% - 37px); display: inline;">
                <span style="line-height: 20px; width: 37px; text-align: center; margin: 0px 7px auto;">원</span>
            </div>
        </div>
            
        <div class="info">
            <h3>프로젝트 계획 및 정책</h3>
            <p>스토어 쇼핑몰 특성상, 교환/펀딩금반환/AS 정책을 고지하여야 합니다.<br>구매자에게 하는 약속인 만큼, 프로젝트 오픈 후에는 수정이 불가하니 신중하게 작성하세요.</p>
            <!-- 스토어 프로젝트 상품 상세 pdf 필드 (pdf의 파일 이름이 들어갈 예정) -->
            <div class="form-group">
                <label>프로젝트 계획</label>
                <div class="input_description">jpg파일,png파일로 (사진 파일) 등록하세요..</div>
                <div class="form-inline">
                	<div class="filebox" style="width: 100%;">
                        <input name="store_Detail_temp" type="file" class="form-control" id="store_Detail_temp">
                        <label for="store_Detail_temp">등록하기</label> 
                        <!-- <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;" onclick="FnThum(this)"> -->
                        <input type="text" class="upload-detail-name" value="프로젝트 계획" placeholder="첨부파일" readonly style="display: inline-block;
                        width: calc(100% - 130px);">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>공지 등록</label>
                <div class="input_description">__MB 이하의 JPG, JPEG, PNG 파일로 등록하세요.</div>
                <div class="form-inline">
                	<div class="filebox" style="width: 100%;">
                        <input name="store_Notice_temp" type="file" class="form-control" id="store_Notice_temp">
                        <label for="store_Notice_temp">등록하기</label> 
                        <!-- <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;" onclick="FnThum(this)"> -->
                        <input type="text" class="upload-notice-name" value="공지 " placeholder="첨부파일" readonly style="display: inline-block;
                        width: calc(100% - 130px);">
                    </div>
                </div>
            </div>
        </div>
        
		<div style="margin-top: 50px;">
         <input type="button" onclick="Fn_prieview_store()" class="btn btn-outline-secondary"  value="미리보기" style="width: 49%; height: 50px;">
         <input type="button" class="btn btn-outline-success" value="등록" onclick="Fun_store()" style="width: 49%; height: 50px;">
		</div>
        </form>
    </div>
         	 
         	 
</c:if>


<!-- 스토어 단독 상품 등록  -->
<c:if test="${check ne 1}">
	
         	 
    <div class="container">
        <h2 class="rftitle">스토어 상품 등록</h2>
        <form name="store_upload" id="store_upload" action="store_register.do"  method="post" enctype="multipart/form-data">
        
         <input type="hidden" name="member_idx" id="member_idx" value="${login.member_idx}">
         <input type="hidden" name="store_notice" id="store_notice" value="" >
         <input type="hidden" name="store_thumbnail" id="store_thumbnail" value="" >
         <input type="hidden" name="store_content" id="store_content" value="" >
         <input type="hidden" name="funding_idx" id="funding_idx" value="0" >
		
        <div class="info">
            <h3>기본 정보</h3>
            <p>프로젝트를 대표할 주요 기본 정보를 입력하세요.</p>
            <!-- 스토어 타이틀 필드 -->
            <div class="form-group">
                <label>프로젝트 제목</label>
                <input name="store_title" type="text" class="form-control" id="fTitle" placeholder="제목을 입력하세요">
            </div>
           
            <!-- 스토어 썸네일 필드 (사진의 제목이 들어갈 것 같다.) -->
            <div class="form-group">
                <label>대표 이미지</label>
                <div class="input_description">__MB 이하의 JPG, JPEG, PNG 파일로 등록하세요.</div>
                <div class="form-inline">
                    <div class="filebox" style="width: 100%;">
                        <input name="store_thumbnail_temp" type="file" class="form-control" id="store_thumbnail_temp">
                        <label for="store_thumbnail_temp">등록하기</label> 
                        <input type="text" class="upload-thumbnail-name" value="대표 이미지" placeholder="첨부파일" readonly style="display: inline-block;
                        width: calc(100% - 130px);">
                    </div>
                </div>
            </div>
            <!-- 스토어 카테고리  필드 -->
            <div class="form-group">
                <label for="exampleFormControlInput1">상품 카테고리</label>
                <div class="chips__choice" style="margin: 10px;">
                    <input type="radio" class="btn_category" name="store_category" value="0" id="btn_01" checked>
                    <label for="btn_01">
                        <div class="chip chip--active">강아지</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="1" id="btn_02">
                    <label for="btn_02">
                        <div class="chip">고양이</div>
                    </label>
                    <input type="radio" class="btn_category" name="store_category" value="2" id="btn_03">
                    <label for="btn_03">
                        <div class="chip">다른 동물들</div>
                    </label>
                </div>
            </div>
           
        </div>

        <div class="info">
            <h3>옵션 정보</h3>
            <p>구매자에게 제공할 옵션 내용을 입력하세요. 스토어 쇼핑몰에 등록할 상품의 옵션을 작성하세요. 첫번째 옵션내용이 메인 옵션으로 자동저장됩니다.</p>
			 <!-- 펀딩 옵션 필드 -->
            <div class="form-group">
                <label>제품 옵션</label>
                <div class="input_description">* 최대 5개까지의 옵션을 추가할 수 있습니다.(금액 최대 : 999,999,999원, 수량 최대: 9,999 )</div>
                
                <div id="div_main">
                    <table class="tablelist" id="Table" style='width:100%'>
                        <tr style="border-top: 2px solid #333C83;">

                            <th scope="row">옵션명</th>
                            <td colspan="3">
                                <input name="store_option_name" type="text" class="text" style="width:100%;" placeholder="옵션명" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">금액</th>
                            <td>
                                <input name="store_option_price" type="number" min="0" max="1000000000" class="text"  maxlength="9" oninput="maxLengthCheck(this)" style="width:100%;"  placeholder="금액"/>
                            </td>
                            <th scope="row">수량</th>
                            <td>
                                <input type="number" class="text" name="store_option_stock" min="0" max="10000"   maxlength="4" oninput="maxLengthCheck(this)"style="width:100%;" placeholder="수량"  />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상세</th>
                            <td colspan="3">
                                <input name="store_option_detail" type="text" class="text"  style="width:100%;" placeholder="상세" />
                            </td>
                        </tr>
                    </table>
                    <textarea id="template" style="display:none;">
                        <tr id="addRow" style="border-top: 2px solid #333C83;">
                            <th scope="row">옵션명</th>
                            <td colspan="3">
                                <input name="store_option_name" type="text" class="text" name="name1" style="width:100%;" placeholder="옵션명" />
                            </td>
                        </tr>
                        <tr id="addRow">
                            <th scope="row">금액</th>
                            <td>
                                <input name="store_option_price" type="number" min="0" max="1000000000" class="text"  maxlength="9" oninput="maxLengthCheck(this)" style="width:100%;"  placeholder="금액"/>
                            </td>
                            <th scope="row">수량</th>
                            <td>
                                <input type="number" class="text" name="store_option_stock" min="0" max="10000"  maxlength="4" oninput="maxLengthCheck(this)"style="width:100%;" placeholder="수량" />
                            </td>
                        </tr>
                        <tr id="addRow">
                            <th scope="row">상세</th>
                            <td colspan="3">
                                <input name="store_option_detail" type="text" class="text" name="name3" style="width:100%;" placeholder="상세" />
                            </td>
                        </tr>
                    </textarea>
                    <button type="button" class="btn btn-outline-secondary" id="ADD" style="margin: 15px;">+ 옵션 추가</button>
                </div>
            </div>
            <div class="form-group">
                <label>배송비</label>
                <div class="input_description">배송비 추가 예정 (최대 9,999원)</div>
                <!-- 배송비 -->
                <input name="store_express_fee"  type="number" class="form-control" id="fTargetPrice" placeholder="배송비를 입력하세요." max="9999" maxlength="4" oninput="maxLengthCheck(this)" min="0" style="width: calc(100% - 37px); display: inline;">
                <span style="line-height: 20px; width: 37px; text-align: center; margin: 0px 7px auto;">원</span>
            </div>
        </div>
            
        <div class="info">
            <h3>프로젝트 계획 및 정책</h3>
            <p>스토어 쇼핑몰 특성상, 교환/펀딩금반환/AS 정책을 고지하여야 합니다.<br>구매자에게 하는 약속인 만큼, 프로젝트 오픈 후에는 수정이 불가하니 신중하게 작성하세요.</p>
            <!-- 스토어 프로젝트 상품 상세 pdf 필드 (pdf의 파일 이름이 들어갈 예정) -->
            <div class="form-group">
                <label>프로젝트 계획</label>
                <div class="input_description">jpg파일, png파일로 (사진 파일) 등록하세요..</div>
                <div class="form-inline">
                	<div class="filebox" style="width: 100%;">
                        <input name="store_Detail_temp" type="file" class="form-control" id="store_Detail_temp">
                        <label for="store_Detail_temp">등록하기</label> 
                        <!-- <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;" onclick="FnThum(this)"> -->
                        <input type="text" class="upload-detail-name" value="프로젝트 계획" placeholder="첨부파일" readonly style="display: inline-block;
                        width: calc(100% - 130px);">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>공지 등록</label>
                <div class="input_description">__MB 이하의 JPG, JPEG, PNG 파일로 등록하세요.</div>
                <div class="form-inline">
                	<div class="filebox" style="width: 100%;">
                        <input name="store_Notice_temp" type="file" class="form-control" id="store_Notice_temp">
                        <label for="store_Notice_temp">등록하기</label> 
                        <!-- <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;" onclick="FnThum(this)"> -->
                        <input type="text" class="upload-notice-name" value="공지 " placeholder="첨부파일" readonly style="display: inline-block;
                        width: calc(100% - 130px);">
                    </div>
                </div>
            </div>
        </div>
        
		<div style="margin-top: 50px;">
         <input type="button" onclick="Fn_prieview_store()" class="btn btn-outline-secondary"  value="미리보기" style="width: 49%; height: 50px;">
         <input type="button" class="btn btn-outline-success" value="등록" onclick="Fun_store()" style="width: 49%; height: 50px;">
		</div>
        </form>
    </div>
</c:if>
    
</main>
    
<c:import url="/footer.do"></c:import>
</body>

<script>

     var count = 0;
     console.log(count);
     // 추가 버튼 클릭시
     $('#ADD').bind('click', function aaaa() {                
         count++;
         //조건식
         if (count < 5) {
             //alert(btn_count);
             //설정해둔 템블
             var template = $("#template");
             //해당 테이블에 어펜드 템플값을 넣어줌
             $("#Table").append($(template).val());

         } else {
             alert("더 이상 생성할 수 없습니다.");

         }
     });
      
</script>

<script type="text/javascript">
        $(document).ready(function () {
            $(".dropdown-toggle").dropdown();
        });
</script>
    
<script type="text/javascript">
	var flagg = false;
	function Fn_prieview_store(){
		var path = '<%=request.getContextPath()%>';
		var midx = $("#member_idx").val();
		if(midx == null || midx == "" || midx == 0 ){
			alert('로그아웃 되었습니다. 로그인 먼저 해주세요.');
			location.href= path+'/member/login.do';
		}
		else{
			
			var form_control = $("#store_upload input.form-control");
			var flag = true;
			for(var i=0; i<form_control.length; i++){	
				
				 if("" == $(form_control[i]).val() || null == $(form_control[i]).val()){

					flag = false;
					}  
			}
			if(flag == false){
				alert("입력하지 않은 양식이 존재합니다.");
			}
			
			else{
			
			var theForm =  document.querySelector('form[name=store_upload]');
			var notice_path = document.getElementById("store_Notice_temp");
			var thumnail_path = document.getElementById("store_thumbnail_temp");
			var detail_path = document.getElementById("store_Detail_temp");
			
		
			var thum_path = file_pathReader(thumnail_path);
			var not_path = file_pathReader(notice_path);
			var det_path = file_pathReader(detail_path);
			
			if(thum_path == not_path || thum_path == det_path || not_path == det_path){
				alert('파일들의 이름이 같습니다. 다른 이름으로 업로드 해주세요!');
				
				
			}else{

			$("#store_thumbnail").val(thum_path);
			$("#store_notice").val(not_path);
			$("#store_content").val(det_path);
			
			var url = "store_preview.do";
			window.open("","popOpen","_blank");
			flagg = true;
		 	theForm.target = "popOpen";
			theForm.action = url;
			theForm.submit();
			}
			}
		}
		
	}
	
	function Fun_store() {
		
 		var path = '<%=request.getContextPath()%>';
		var midx = $("#member_idx").val();
		
			if(midx == null || midx == "" || midx == 0 ){
				alert('로그아웃 되었습니다. 로그인 먼저 해주세요.');
				location.href= path+'/member/login.do';
			}
			
			else{
				
				if(flagg == false){
					alert("파일 업로드 후 미리보기 버튼을 클릭해 주세요");
					
				}
				else{
					
					var theForm =  document.querySelector('form[name=store_upload]');
					theForm.target="_self";
					theForm.action = "store_register.do";
					
					theForm.submit();
				}
			
			} 
	}
	function file_pathReader(obj) {
		
		var filePath = obj.value;
		//전체경로를 \ 나눔.
		var filePathSplit = filePath.split('\\'); 
		
		return filePathSplit[2];
	}
	
	
	// 파일 이름
    $("#store_thumbnail_temp").on('change',function(){
        var fileName = $("#store_thumbnail_temp").val();
        $(".upload-thumbnail-name").val(fileName);
    });
	
    $("#store_Detail_temp").on('change',function(){
        var fileName = $("#store_Detail_temp").val();
        $(".upload-detail-name").val(fileName);
    });
    
    $("#store_Notice_temp").on('change',function(){
        var fileName = $("#store_Notice_temp").val();
        $(".upload-notice-name").val(fileName);
    });

</script>


</html>