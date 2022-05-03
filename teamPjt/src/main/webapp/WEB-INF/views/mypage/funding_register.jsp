<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    
    <!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".dropdown-toggle").dropdown();
        });
    </script>
    
    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/funding_register.css">
</head>
<body>
    <c:import url="/header.do"></c:import>
<main id="wrapper">    
    <div class="container">
        <h2 class="rftitle">펀딩 상품 등록</h2>
      
        <form action="funding_view.do" method="post">
        <!-- 펀딩 카테고리  필드 -->
            <div class="form-group">
                <label for="exampleFormControlInput1">카테고리</label><br>
                <select name="funding_category" id="fCategory">
                    <option  value="0">강아지</option>
                    <option value="1">고양이</option>
                    <option value="2">기타</option>
                </select>
            </div>
            <!-- 펀딩 타이틀 필드 -->
            <div class="form-group">
                <label>상품명</label>
                <input name="funding_title" type="text" class="form-control" id="fTitle" placeholder="이름 입력">
            </div>
               <!-- 펀딩 목표금액 필드 -->
            <div class="form-group">
                <label>펀딩 목표 금액</label>
                <input name="funding_target_price"  type="number" class="form-control" id="fTargetPrice" placeholder="가격 입력" min="0">
            </div>
			 <!-- 펀딩 옵션 필드 -->
             <div class="form-group">
                <label>제품 옵션</label>&nbsp;<span class="ftime">*최대 5개</span>
                <button type="button" class="btn btn-outline-secondary" id="ADD">옵션 추가</button>
                <div id="div_main">
                    <table class="tablelist" id="Table" style='width:100%'>
                        <colgroup>
                            <col width="25%" />
                            <col width="25%" />
                            <col width="25%" />
                            <col width="25%" />
                        </colgroup>
                        <tr style="text-align: center;">
                            <th scope="col">옵션명</th>
                            <th scope="col">금액</th>
                            <th scope="col">상세</th>
                            <th scope="col">수량</th>
                        </tr>
                        <tr>
                        <!-- 펀딩 옵션  name 맞춤-->
                            <td><input name="funding_option_name" type="text" class="text" name="name1" style="width:100%;" placeholder="옵션명" /></td>
                            <td><input name="funding_option_price" type="number" min="0" class="text" name="name2" style="width:100%;"  placeholder="금액"/></td>
                            
                            <td><input name="funding_option_price" type="text" class="text" name="name3" style="width:100%;" placeholder="상세" /></td>
                            <td><input name="funding_option_stock" type="text" class="text" name="name4" style="width:100%;" placeholder="수량" /></td>
                        </tr>
                    </table>
                    <textarea id="template" style="display:none;">
                            <tr id="addRow">
                                <td><input type="text" class="text"    name="name1"   style="width:100%;"  placeholder="옵션명"/></td>            
                                <td><input type="text" min="0" class="text"    name="name2"   style="width:100%;"  placeholder="금액"/></td>
                                <td><input type="text" class="text"    name="name3"  style="width:100%;"   placeholder="상세"/></td>
                                <td><input type="text" class="text" name="name4" style="width:100%;" placeholder="수량" /></td>
                            </tr>
                    </textarea>
                </div>
            </div>

			<!-- 펀딩 기간 필드 -->
            <div class="form-group">
                <label>펀딩 기간</label>&nbsp;<span class="ftime">*최소 15일 ~ 최대 6개월</span>
                <br>
                <!-- 펀딩 시작 기간 필드 -->
                펀딩 오픈 :
                <input name="funding_start_date" type="date" id="start">
                &nbsp;
                ~
                &nbsp;
                <!-- 펀딩 종료 기간 필드 -->
                펀딩 종료 :
                <input name="funding_end_date" type="date" id="end">
                
            </div>
            
            
            <!-- 펀딩 썸네일 필드 (사진의 제목이 들어갈 것 같다.) -->
            <div class="form-group">
                <label>썸네일</label>
                <div class="form-inline">
                    <input name="funding_thumbnail" type="file" class="form-control" id="" placeholder="썸네일 등록" style="width: 68%;"> &nbsp;
                    <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;">
                </div>
            </div>
             <!-- 펀딩 프로젝트 상품 상세 pdf 필드 (pdf의 파일 이름이 들어갈 예정) -->
            <div class="form-group">
                <label>프로젝트 계획</label>
                <div class="form-inline">
                    <input type="file" class="form-control" id="" placeholder="프로젝트 계획 등록" style="width: 68%;"> &nbsp;
                    <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;">
                </div>
            </div>
            <div class="form-group">
                <label>공지 등록</label>
                <div class="form-inline">
                    <input type="file" class="form-control" id="" placeholder="공지 등록" style="width: 68%;"> &nbsp;
                    <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;">
                </div>
            </div>
            
            <br>
       		<br>
         <input  type="submit" class="btn btn-outline-secondary" value="미리보기" style="width: 49%; height: 50px;">
         <input type="button" class="btn btn-outline-success" value="등록" style="width: 49%; height: 50px;">
        </form>
        <!-- 
        <br>
        <br>
        <input class="btn btn-outline-secondary" value="미리보기" style="width: 49%; height: 50px;"> 
        <input type="button" class="btn btn-outline-success" value="등록" style="width: 49%; height: 50px;">
        -->
    </div>
</main>
<c:import url="/footer.do"></c:import>
</body>

<script>
    let date = new Date()
    document.getElementById('start').value = date.toISOString().substring(0, 10);
    document.getElementById('start').min = date.toISOString().substring(0, 10);
    document.getElementById('start').max = date.toISOString().substring(0, 10);
    date.setDate(date.getDate() + 15);
    document.getElementById('end').value = date.toISOString().substring(0, 10);
    document.getElementById('end').min = date.toISOString().substring(0, 10);
    date.setMonth(date.getMonth() + 6)
    document.getElementById('end').max = date.toISOString().substring(0, 10);
    console.log(date)

    
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

</html>