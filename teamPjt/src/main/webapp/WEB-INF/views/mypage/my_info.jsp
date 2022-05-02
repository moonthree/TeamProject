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
/* Profile Section */

.profile {
    padding: 5rem 0;
}

.profile::after {
    content: "";
    display: block;
    clear: both;
}

.profile-image {
    float: left;
    display: flex;
    margin-right: 3rem;
}

.profile-image .profile_img{
    width: 150px; 
    height: 150px; 
    border-radius: 70%;
}
.setting_img{
    width: 30px; 
    height: 30px; 
}
.profile-user-settings,
.profile-stats,
.profile-bio {
    float: left;
    width: calc(66.666% - 2rem);
}

.profile-user-settings {
    margin-top: 1.5rem;
}

.profile-user-name {
    display: inline-block;
    font-size: 3rem;
    font-weight: 500;
}

.profile-edit-btn {
    font-size: 1rem;
    font-weight: 600;
    line-height: 1.8;
    border: 0.1rem solid #dbdbdb;
    border-radius: 0.3rem;
    padding: 0 1rem;
}

    /*이미지 콘테이너 1:1 비율*/
    .img-container{
        overflow: hidden;
    }
    .card_img{
        width: 300px;
        height:200px;
        object-fit: cover;
        transition: all 0.1s linear;
    }
    .card_img:hover{
        transform: scale(1.05);
    }
    .setting_img:hover{
        transform: scale(1.1);
        cursor: pointer;

    }
    .card{
        border: none; 
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
                <div class="col-lg-9 col-md-9 col-sm-12">
                    
            <!--회원정보-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <h2>내 정보</h2> 
                <div class="profile">
                    <div class="profile-image">
                        <img src="dog.jpg" alt="" class="profile_img">
                        <img src="../resources/image/mypage/setting.png" alt="설정" class="setting_img"  onclick="location.href='my_info_modify.do'" style="cursor:pointer;">
                        
                    </div>
                    <div class="profile-user-settings">
                        <h1 class="profile-user-name">홍길동</h1>
                        <h5>일반 회원</h5>
                        <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog" aria-hidden="true"></i></button>
                    </div>
                </div>
                    <table class="table" style="border-top: 2px solid #22577E;">
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
                    <div><h5 style="margin-bottom: 30px; font-weight: 600; text-align: center;" >펀딩 내역 ▷</h5></div>
                </div>
            </div>
            <div class="row" style="border-radius: 5px; padding: 20px; box-shadow: 1px 1px 100px 1px rgb(239, 239, 239);">
                
                <div class="col-md-12">
                    <div class="row g-3">
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <div class="card">
                                <div class="img-container">
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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
                                    <img src="../resources/image/cat5.png" class="card-img-top card_img" alt="funding_img">
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