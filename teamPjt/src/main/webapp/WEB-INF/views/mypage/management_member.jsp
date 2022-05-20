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
    
    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/management_member.css">


</head>
<body>
   <c:import url="/header.do"></c:import>
<main id="wrapper">
   <div class="container">
   
   <br>
<ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
            <li class="nav-item nav-pills viewtab" role="presentation" > 
                  <a id="alink1" class="nav-link active taaa" data-toggle="tab"  role="tab" href="#tab1"
                    aria-controls="tab1"  aria-selected="true">소비자</a>  
            </li>
            
            <li class="nav-item nav-pills viewtab" role="presentation">
      
                <a id="alink2" class="nav-link" data-toggle="tab"   role="tab" aria-controls="tab2" href="#tab2"
                    aria-selected="false"><span class="toptab">판매자</span></a>
            </li>
        </ul>
</div>

<!-- Tab panes -->
<div class="tab-content"  id="myTabContent">

<!-- 소비자  -->
  <div class="tab-pane fade active show" id="tab1" role="tabpanel"
                aria-labelledby="tab1-tab"> 
                 소비자 선택됨
      <table class="table">
                  <c:if test="${seller.size() == 0}">
                       <h3>등록된 소비자 계정이 없습니다.</h3>
                    </c:if>
                   <c:if test="${seller.size() > 0}">
                    <thead class="thead">
                        <tr>
                            <th scope="col" class="PMtable"></th>
                            <th scope="col" class="PMtable">회원번호</th>
                            <th class="tdtitle" scope="col" style="width : 15%">이름</th>
                            <th class="tdtitle" scope="col" style="width : 20%">이메일</th>
                            <th scope="col">
                                <div class="dropdown stateDropdown">
                                    <a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button"
                                        id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
                                        상태
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">전체</a>
                                        <a class="dropdown-item" href="#">회원</a>
                                        <a class="dropdown-item" href="#">탈퇴한 회원</a>
                                    </div>
                                </div>
                            </th>
                            <th scope="col">버튼</th>
                        </tr>
                    </thead>
                     <tbody>
                     <c:forEach var="seller" items="${seller}" varStatus="status_sell">
                        <tr>
                           <th>no.${status_sell.index+1}</th>
                            <th><span style="color:#106fc3;">${seller.member_idx}</span></th>
                            <td class="tdtitle">${seller.member_name}</td>
                            <td class="tdtitle">${seller.member_email}</td>
                            <td>회원</td>
                            <td>
                                <button type="button" class="btn btn-outline-danger">추방</button>
                            </td>
                        </tr> 
                      </c:forEach>
                      </c:if>
                    </tbody>
                </table>
              
               <!-- 소비자 페이징 기법 -->
              <div>
                 <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                      <c:if test="${pageMaker_sell.prev}">
                         <li class="page-item"><a class="page-link" href="management_member.do${pageMaker_sell.makeQuery1(pageMaker_sell.startPage - 1)}#tab1">이전</a></li>
                      </c:if> 
                  
                      <c:forEach begin="${pageMaker_sell.startPage}" end="${pageMaker_sell.endPage}" var="idx">
                         <li class="page-item"><a class="page-link" href="management_member.do${pageMaker_sell.makeQuery1(idx)}#tab1">${idx}</a></li>
                      </c:forEach>
                  
                      <c:if test="${pageMaker_sell.next && param.pageMaker_sell.endPage > 0}">
                         <li class="page-item"><a class="page-link" href="management_member.do${pageMaker_sell.makeQuery1(pageMaker_sell.endPage + 1)}#tab1">다음</a></li>
                      </c:if> 
                    </ul>
                </nav>
              </div>
            
     
  </div>
  <!-- 판매자  -->
  <div class="tab-pane fade" id="tab2" role="tabpanel"
                aria-labelledby="tab2-tab">
     판매자 선택됨
         <table class="table">
                 <c:if test="${company.size() == 0}">
                       <h3>등록된 판매자 계정이 없습니다.</h3>
                    </c:if>
                <c:if test="${company.size() >0}">
                     <thead class="thead">
                          <tr>
                            <th scope="col" class="PMtable"></th>
                            <th scope="col" class="PMtable">회원번호</th>
                            <th class="tdtitle" scope="col" style="width : 15%">이름</th>
                            <th class="tdtitle" scope="col" style="width : 20%">이메일</th>
                            <th scope="col">
                                <div class="dropdown stateDropdown">
                                    <a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                        data-toggle="dropdown" aria-expanded="false">
                                        상태
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">전체</a>
                                        <a class="dropdown-item" href="#">회원</a>
                                        <a class="dropdown-item" href="#">탈퇴한 회원</a>
                                    </div>
                                </div>
                            </th>
                            <th scope="col">버튼</th>
                        </tr>
                    </thead>        
                    <tbody> 
                    <c:forEach var="company" items="${company}" varStatus="status_com">
                        <tr>
                           <th>no.${status_com.index+1}</th>
                            <th><span style="color:#106fc3;">${company.member_idx}</span></th>
                            <td class="tdtitle">${company.member_name}</td>
                            <td class="tdtitle">${company.member_email}</td>
                            <td>회원</td>
                            <td>
                                <button type="button" class="btn btn-outline-danger">추방</button>
                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                    </tbody>
                </table>
              
                <!-- 판매자 페이징 기법 -->
              <div>
                 <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                      <c:if test="${pageMaker_company.prev}">
                         <li class="page-item"><a class="page-link" href="management_member.do${pageMaker_company.makeQuery1(pageMaker_company.startPage - 1)}#tab2">이전</a></li>
                      </c:if> 
                  
                      <c:forEach begin="${pageMaker_company.startPage}" end="${pageMaker_company.endPage}" var="idx2">
                         <li class="page-item"><a class="page-link" href="management_member.do${pageMaker_company.makeQuery1(idx2)}#tab2">${idx2}</a></li>
                      </c:forEach>
                  
                      <c:if test="${pageMaker_company.next && pageMaker_company.endPage > 0}">
                         <li class="page-item"><a class="page-link" href="management_member.do${pageMaker_company.makeQuery1(pageMaker_company.endPage + 1)}#tab2">다음</a></li>
                      </c:if> 
                    </ul>
                </nav>
            </div>
            
         </div>
</div>

</main>
<c:import url="/footer.do"></c:import>
<script type="text/javascript">


$('#myTab #alink1').click(function(e) {
	e.preventDefault();
	history.replaceState({}, null, location.pathname);
	loaction.href=location.pathname;
//	window.location.reload();
    $(this).tab('show');
    window.scrollTo(100, 100);
  });
  
$('#myTab #alink2').click(function(e) {
    e.preventDefault();
    history.replaceState({}, null, location.pathname);
    loaction.href=location.pathname;
    $(this).tab('show');
    window.scrollTo(100, 100);
  });
  
  
  
  // store the currently selected tab in the hash value
  $("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
    var id = $(e.target).attr("href").substr(1);
    window.location.hash = id;
    window.scrollTo(100, 100);
  });
  
  // on load of the page: switch to the currently selected tab
  var hash = window.location.hash;
  $('#myTab a[href="' + hash + '"]').tab('show'); 

</script>
</body>
</html>