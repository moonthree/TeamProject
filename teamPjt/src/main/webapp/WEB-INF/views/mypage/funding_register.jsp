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
    <div class="container">
        <h2 class="rftitle">펀딩 상품 등록</h2>
        <form>
            <div class="form-group">
                <label for="exampleFormControlInput1">카테고리</label><br>
                <select name="fCategory" id="fCategory">
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>
            </div>
            <div class="form-group">
                <label>상품명</label>
                <input type="text" class="form-control" id="fTitle" placeholder="이름 입력">
            </div>
            <div class="form-group">
                <label>펀딩 목표 금액</label>
                <input type="number" class="form-control" id="fTargetPrice" placeholder="가격 입력" min="0">
            </div>

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
                            <td><input type="text" class="text" name="name1" style="width:100%;" placeholder="옵션명" /></td>
                            <td><input type="number" class="text" name="name2" style="width:100%;"  placeholder="금액"/></td>
                            <td><input type="text" class="text" name="name3" style="width:100%;" placeholder="상세" /></td>
                            <td><input type="text" class="text" name="name4" style="width:100%;" placeholder="수량" /></td>
                        </tr>
                    </table>
                    <textarea id="template" style="display:none;">
                            <tr id="addRow">
                                <td><input type="text" class="text"    name="name1"   style="width:100%;"  placeholder="옵션명"/></td>            
                                <td><input type="text" class="text"    name="name2"   style="width:100%;"  placeholder="금액"/></td>
                                <td><input type="text" class="text"    name="name3"  style="width:100%;"   placeholder="상세"/></td>
                                <td><input type="text" class="text" name="name4" style="width:100%;" placeholder="수량" /></td>
                            </tr>
                    </textarea>
                </div>
            </div>

            <div class="form-group">
                <label>펀딩 기간</label>&nbsp;<span class="ftime">*최소 15일 ~ 최대 6개월</span>
                <br>
                펀딩 오픈 :
                <input type="date" id="start">
                &nbsp;
                ~
                &nbsp;
                펀딩 종료 :
                <input type="date" id="end">
                
            </div>
            
            <div class="form-group">
                <label>썸네일</label>
                <div class="form-inline">
                    <input type="text" class="form-control" id="" placeholder="썸네일 등록"
                        style="width: 68%;"> &nbsp;
                    <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;">
                </div>
            </div>
            <div class="form-group">
                <label>프로젝트 계획</label>
                <div class="form-inline">
                    <input type="text" class="form-control" id="" placeholder="프로젝트 계획 등록" style="width: 68%;"> &nbsp;
                    <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;">
                </div>
            </div>
            <div class="form-group">
                <label>공지 등록</label>
                <div class="form-inline">
                    <input type="text" class="form-control" id="" placeholder="공지 등록" style="width: 68%;"> &nbsp;
                    <input type="button" class="btn btn-outline-secondary" value="업로드" style="width: 30%;">
                </div>
            </div>
        </form>
        <br>
        <br>
        <input type="button" class="btn btn-outline-secondary" value="미리보기" style="width: 49%; height: 50px;">
        <input type="button" class="btn btn-outline-success" value="등록" style="width: 49%; height: 50px;">
    </div>
    <div style="height: 300px; background-color: antiquewhite; margin-top: 50px;">
        footer자리
    </div>
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