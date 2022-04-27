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
<title>내 정보</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
    <div class="container" >
        <div class="row">
            <!--회원정보-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <h2>내 정보</h2>
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
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
                            <td>주소</td>
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
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                ***
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row"> 
                    <div class="col-sm-12" style="text-align: right;"><button type="button" class="btn btn-outline-dark" style="width: 100px;" onclick="location.href='my_info_modify.do'">정보 수정</button></div>
                </div>
            </div>

        </div>
    </div>
</main>
<c:import url="/footer.do"></c:import>
</body>

</html>