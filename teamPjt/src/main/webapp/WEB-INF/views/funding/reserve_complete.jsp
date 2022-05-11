<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<style>
    main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }
    .card {
        border-radius: 2px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    }
    
</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
    <main>
    <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
                <div><h3 style="text-align: center; font-weight: bold;">${read.funding_title}</h3></div>
                <div style="margin-top: 30px; padding: 30px 50px; background-color: #E9EFC0;" class="card">
                    <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">펀딩 예약 정보</div>
                    <div>
                        <ul style="padding-left: 60px; list-style: disc; line-height: 2; font-size: 13pt;">
                            <li>
                               	펀딩 예약이 완료되었습니다.
                            </li>
                            <li>
					                          프로젝트 성공 종료 시 ${read.funding_end_date}에 결제됩니다.
                            </li>
                            <li>
								결제 성공 시 !배송날짜!${read.funding_express_date} 중순 발송 예정입니다.
                            </li>
                        </ul>
                    </div>
                    <div style="display: inline-block; text-align: center;">
                        <button type="button" class="btn btn-success" style="height: 60px; width: 250px; font-size: 15pt; font-weight: bold; margin: 10px 30px;">펀딩 내역 보기</button>
                        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/main.do'" class="btn btn-success" style="height: 60px; width: 250px; font-size: 15pt; font-weight: bold; margin: 10px 30px;">펀딩 홈 가기</button>
                    </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xs-12" style="width: 100%; margin-top: 100px;">
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">취향 맞춤 펀딩 프로젝트</div>
                <article>
                <div class="row">
                  <div class="col-lg-4 col-md-12">
                      <div class="card">
                      <img  style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAzMjNfMjYg%2FMDAxNjQ4MDI1NzI3ODUx.vzt2n8yQnjwEGoaBwNh5w-sWSoLsYNzKKe2PPUwHnG8g.4NpNElrFsZl3YMKWdwj94k8amFqu0B-D6XSfMJhaEZcg.JPEG.bryam%2F1_%25283%2529.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-lg-4 col-md-12">
                     <div class="card">
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEwMTZfMTky%2FMDAxNjAyODE3ODE5NDAw.lRnreU9Br7iCfOLs_Y7MG5dKCk0EaF-b-zQW6COrlWgg.fl-h-0x7OyDK2VX83_AqxZGhqSsgJrZCW9mM-UPsgfkg.JPEG.luckystar_00%2F%25BA%25B0%25BB%25E7%25C1%25F8%25B0%25FC_%25B9%25DD%25B7%25C1%25B5%25BF%25B9%25B01.jpg&type=sc960_832" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                    <div class="col-lg-4 col-md-12">
                     <div class="card">
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150715_105%2Fcodn9_1436957170912RkyPh_JPEG%2Fhttps3A2F2F41.media.tumblr.com2Fd3b5a3b8793fe1111ce4a544299fb3bb2Ftumblr_ne.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-4 col-md-12">
                     <div class="card">
                      <img  style="height: 200px; width: auto;" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Ff4%2F9c%2F7c%2Ff49c7ced21fad4c5a70ac61940c4a435.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                    <div class="col-lg-4 col-md-12">
                     <div class="card" >
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDhfMTAg%2FMDAxNjI1NzEwMDg0ODg4.aL9dS24RZ4Sp468CjTNI50iGF4vRlF_3xAraXo3OCVog.KA7XiKJw4wu11PlLNjX-pkK5Nz6iccYwsAy9PUqFnJMg.JPEG.lsb1933%2FIMG_8113.JPG&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                    <div class="col-lg-4 col-md-12">
                     <div class="card" >
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAzMjNfMjYg%2FMDAxNjQ4MDI1NzI3ODUx.vzt2n8yQnjwEGoaBwNh5w-sWSoLsYNzKKe2PPUwHnG8g.4NpNElrFsZl3YMKWdwj94k8amFqu0B-D6XSfMJhaEZcg.JPEG.bryam%2F1_%25283%2529.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  </div>
                  </article>
            </div>
        </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
</html>