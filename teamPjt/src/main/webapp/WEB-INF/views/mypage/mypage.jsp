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
<title>마이페이지</title>
<script>
// Acc
$(document).on("click", ".menu div", function() {
  var numberIndex = $(this).index();

  if (!$(this).is("active")) {
    $(".menu div").removeClass("active");
    $("ul li").removeClass("active");

    $(this).addClass("active");
    $("ul").find("li:eq(" + numberIndex + ")").addClass("active");

    
  }
});
</script>

<style>

@import url('https://fonts.googleapis.com/css?family=Oswald');

main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
}

:root {
  --base-color: #303F9F;
  --second-color: #3F51B5;
  --third-color: #cf1414cc;
  --green-color: #6aaa91;
  --site: #303F9F;
  --light: #fff;
}


body {
  position: relative;
  font-family: 'Oswald', sans-serif;
  background: var(--light);
}

.grid {
  list-style: none;
  margin-left: -40px;
}

.gc {
  box-sizing: border-box;
  display: inline-block;
  margin-right: -.25em;
  min-height: 1px;
  padding-left: 40px;
  vertical-align: top;
}

.gc--1-of-3 {
  width: 33.33333%;
}

.gc--2-of-3 {
  width: 66.66666%;
}

.naccs {
  position: relative;
  max-width: 100%;
}

.menu div {
  padding: 15px 20px 15px 40px;
  margin-bottom: 10px;
  color: var(--green-color);
  background: --;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  position: relative;
  vertical-align: middle;
  font-weight: 700;
  transition: 1s all cubic-bezier(0.075, 0.82, 0.165, 1);
}

.menu div:hover {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.menu div span.light {
  height: 10px;
  width: 10px;
  position: absolute;
  top: 24px;
  left: 15px;
  background-color: var(--green-color);
  border-radius: 100%;
  transition: 1s all cubic-bezier(0.075, 0.82, 0.165, 1);
}

.menu div.active span.light {
  background-color: --third-color;
  left: 0;
  height: 100%;
  width: 3px;
  top: 0;
  border-radius: 0;
}

.menu div.active {
  color: var(--third-color);
  padding: 15px 20px 15px 20px;
}

ul.nacc {
  position: relative;
  height: 0px;
  list-style: none;
  margin: 0;
  padding: 0;
  transition: .5s all cubic-bezier(0.075, 0.82, 0.165, 1);
}

ul.nacc li {
  opacity: 0;
  transform: translateX(50px);
  position: absolute;
  list-style: none;
  transition: 1s all cubic-bezier(0.075, 0.82, 0.165, 1);
}

ul.nacc li.active {
  transition-delay: .3s;
  z-index: 2;
  opacity: 1;
  transform: translateX(0px);
}

ul.nacc li p {
  margin: 0;
}



</style>
</head>
<body>
<%-- <%@include file ="../header.jsp" %> --%>
<c:import url="/header.do"></c:import>
<main>
	<div style="text-align:center;">
		<table style="border:1px solid black; text-align : center; font-size : 20px;">
			<thead>		
				<tr>
					<td style="width:20%"><a href="mypage2.do">마이페이지2</a></td>
					<td style="width:20%"><a href="funding_register.do">펀딩 등록 페이지</a></td>
					<td style="width:20%"><a href="approval.do">상품 승인 페이지(관리자)</a></td>
					<td style="width:20%"><a href="management_product.do">상품 관리 페이지(관리자)</a></td>
					<td style="width:20%"><a href="management_member.do">회원 관리 페이지(관리자)</a></td>
				</tr>
			</thead>
		</table>
	</div>
    <div class="container" >
        <!--회원정보 & 갯수-->
        <div class="row" style="margin-top: 10%;">
            <div class="col-md-3 col-sm-12" >
              <div style="box-shadow: 0px 0px 20px 5px rgba(0,0,0,0.05); border-radius: 10px;">
                <div class="row"> 
                    <div class="col-sm-12">
                      <button type="button" class="btn" onclick="location.href='my_info.do'"><h5>***님 ></h5></button>
                      &nbsp;&nbsp;abcd@naver.com
                    </div>
                </div>
              
              <table class="table">
                <tbody>
                  <tr>
                      <td>이름</td>
                      <td>***</td>
                  </tr>
                  <tr>
                      <td>전화번호</td>
                      <td>***</td>
                  </tr>
                  <tr>
                      <td>이메일</td>
                      <td>***</td>
                  </tr>
                </tbody>
              </table>

              </div>
                  
            </div>
              
              <div class="col-md-9 cols-sm-12">
                <div class="container" style="width: 90%;">
                  
                  <div class="row row-cols-3 row-cols-md-3">
                    <div class="col">
                      <div class="card">
                        <div class="card-body" style=" height: 200px; text-align: center; background-color: #e3efe7;">
                          <h5 class="card-title display-2">0</h5>
                          <strong class="card-text" style="font-size: x-large;">펀딩</strong>
                        </div>
                      </div>
                    </div>
                    <div class="col">
                      <div class="card">
                        <div class="card-body" style=" height: 200px; text-align: center; background-color: #e3efe7;">
                          <h5 class="card-title display-2">3</h5>
                          <strong class="card-text" style="font-size: x-large;">상품</strong>
                        </div>
                      </div>
                    </div>
                    <div class="col">
                      <div class="card">
                        <div class="card-body" style=" height: 200px; text-align: center; background-color: #e3efe7;">
                          <h5 class="card-title display-2">3</h5>
                          <strong class="card-text" style="font-size: x-large;">찜</strong>
                        </div>
                      </div>
                    </div>
      
                  </div>

                </div>
              </div>

            </div>

            <!-- 펀딩내역 & 주문 내역 & 찜 목록 -->
            <div class="row mt-5">
              <div class="col-md-3 col-sm-12">
                <div class="menu">
                  <div class="active"><span class="light"></span><span>펀딩 내역</span></div>
                  <div><span class="light"></span><span>주문 내역</span></div>
                  <div><span class="light"></span><span>찜 목록</span></div>
                </div>
                <!--공지사항 & 고객센터-->
                <div class="row">
                  <div class="col-md-6 col-sm-6">
                    <button type="button" class="btn" style="background-color: white;">공지사항</button>
                  </div>
                  <div class="col-md-6 col-sm-6" style="text-align: right;">
                    <button type="button" class="btn" style="background-color: white;">고객센터</button>
                  </div>
                </div>
              </div>
              
            <div class="col-md-1 col-sm-12"></div>
            <!--펀딩&스토어&찜-->
            <div class="col-md-7 col-sm-12" style="margin-left: 30px;">
              <!--아코디언 탭-->
              <div class="naccs">
                <div class="grid">
                  <ul class="nacc">
                    <li class="active">
                      <!--펀딩 내역-->
                        <div class="row" style="border-top: 2px solid #4E944F;"> 
                          <div class="col-md-8"><br><h5>펀딩 내역</h5></div>
                          <div class="col-md-4" style="text-align: right;"><br><button type="button" class="btn btn-light mb-3" onclick="location.href='info_funding.do'">내역 ></button></div>
                        </div>
              <div class="row g-3">
                  <div class="col-lg-4 col-md-12 col-sm-12">
                      <div class="card" onclick="location.href='info_funding_detail.do'" style="cursor:pointer;">
                        <img src="../resources/image/funding_main/dog123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                        <div class="card-body">
                          <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                        </div>
                      </div>
                  </div>
                  <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="card" onclick="location.href='info_funding_detail.do'" style="cursor:pointer;">
                      <img src="../resources/image/funding_main/dog123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                      <div class="card-body">
                        <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="card" onclick="location.href='info_funding_detail.do'" style="cursor:pointer;">
                      <img src="../resources/image/funding_main/dog123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                      <div class="card-body">
                        <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                      </div>
                    </div>
                  </div>
              </div>
              <br>
                    </li>
                    <li>
                      <!--주문내역-->
                <div class="row" style="border-top: 2px solid #4E944F;"> 
                  <div class="col-md-8"><br><h5>주문 내역</h5></div>
                  <div class="col-md-4" style="text-align: right;"><br><button type="button" class="btn btn-light mb-3">내역 ></button></div>
                </div>
                <div class="row g-3">
                  <div class="col-lg-4 col-md-12 col-sm-12">
                      <div class="card">
                        <img src="../resources/image/funding_main/dog123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                        <div class="card-body">
                          <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                        </div>
                      </div>
                  </div>
                  <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="card">
                      <img src="../resources/image/funding_main/dog123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                      <div class="card-body">
                        <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="card">
                      <img src="../resources/image/funding_main/dog123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                      <div class="card-body">
                        <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                      </div>
                    </div>
                  </div>
              </div>
              <br>
                    </li>
                    <li>
                    <!--찜내역-->
                    <div class="row" style="border-top: 2px solid #4E944F;"> 
                      <div class="col-md-8"><br><h5>찜 목록</h5></div>
                      <div class="col-md-4" style="text-align: right;"><br><button type="button" class="btn btn-light mb-3" onclick="location.href='info_zzim.do'">내역 ></button></div>
              </div>
              <div class="row g-3">
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="card" onclick="location.href='info_funding_detail.do'" style="cursor:pointer;">
                      <img src="../resources/image/funding_main/cat123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                      <div class="card-body">
                        <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                      </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="card" onclick="location.href='info_funding_detail.do'" style="cursor:pointer;">
                    <img src="../resources/image/funding_main/cat123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                    <div class="card-body">
                      <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="card" onclick="location.href='info_funding_detail.do'" style="cursor:pointer;">
                    <img src="../resources/image/funding_main/cat123.png" class="card-img-top embed-responsive-item" alt="funding_img">
                    <div class="card-body">
                      <p class="card-text">[5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                    </div>
                  </div>
                </div>
            </div>
              <br>
                    </li>
                  </ul>
                
                </div>
              </div>
        </div>
    </div>
    </div>
</main>
<c:import url="/footer.do"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>