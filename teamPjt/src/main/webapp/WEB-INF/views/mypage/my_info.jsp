<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 상세</title>
</head>
<body>
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
<style>
/*이미지 콘테이너 1:1 비율*/
    .img-container{
        overflow: hidden;
    }
    .card-img-top{
        width: 300px;
        height:200px;
        object-fit: cover;
        transition: all 0.1s linear;
    }
    .card-img-top:hover{
        transform: scale(1.05);
    }
    .card{
        border: none !important; 
    }
    @media screen and (max-width: 991.5px) { #outer { display: none; } }
</style>
<title>내 정보</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
        <div class="container" >
            <div class="row" style="width: 100%;">
                <!--회원정보-->
                <div class="col-lg-9 col-md-9 col-sm-12" style="margin-top: 10%;">
                    <h2>내 정보</h2>
                    <div class="row"> 
                        <div class="col-sm-12" style="text-align: right;"><button type="button" class="btn btn-outline-dark" style="width: 100px;" onclick="location.href='my_info_modify.do'">정보 수정</button></div>
                    </div>
                    <table class="table">
                        <thead class="table-light" style="border-bottom: 2px solid #22577E;">
                            <tr>
                                <th colspan="2">
                                    *** 님
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>이메일</td>
                                <td>***</td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td>
                                    ***
                                </td>
                            </tr>
                            <tr>
                                <td>배송지</td>
                                <td>
                                    ***
                                </td>
                            </tr>
                            <tr>
                                <td>선호 동물</td>
                                <td>
                                    ***
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
    
            </div>
            <!--펀딩 내역-->
            <div class="row mt-5" style="width: 100%;">
                <div class="col-xs-12">
                    <div><h5 style="margin-bottom: 30px; font-weight: 600; text-align: center;">펀딩 내역 ▷</h5></div>

                </div>
            </div>
            <div class="row" style="border-radius: 5px; padding: 20px; box-shadow: 1px 1px 100px 1px rgb(239, 239, 239);">
                
                <div class="col-md-12">
                    <div class="row g-3">
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px; border:none;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12" id="outer">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

            <!--스토어 내역-->
            <div class="row mt-5" style="width: 100%;">
                <div class="col-xs-12">
                    <div><h5 style="margin-bottom: 30px; font-weight: 600; text-align: center;" >스토어 내역 ▷</h5></div>

                </div>
            </div>
            <div class="row" style="border-radius: 5px; padding: 20px; box-shadow: 1px 1px 100px 1px rgb(239, 239, 239);">
                
                <div class="col-md-12">
                    <div class="row g-3">
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-12" id="outer">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">고양이 용품</div>
                                    <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                                    <p class="card-text" >먼지없는 에이스 고양이모래 아직도 안 써보셨어요?</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

        </div>

            
        </div>
        </div>
    </main>
<c:import url="/footer.do"></c:import>
</body>

</html>