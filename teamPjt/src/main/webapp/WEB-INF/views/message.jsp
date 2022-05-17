<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
       $(document).ready(function() {
           $(".dropdown-toggle").dropdown();
       });

    </script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
       integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
       integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
       crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
       integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
       crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css">
    
<style>
.modal.right .modal-dialog {
	position:absolute;
	width:100%;
    top: -10px;
	right:0px;
}

/* 이미지 */
/*이미지 콘테이너 1:1 비율*/
    .img-container{
        overflow: hidden;
    }
    .card_img{
        width: 200px;
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

</style>
<script>

$(document).ready (function () {
	$ (".modal a").not (".dropdown-toggle").on ("click", function () {
		$ (".modal").modal ("hide");
	});
});

</script>

</head>
<body>
	
<!-- Sidebar Right modal -->
<div class="modal fade right" id="sidebar-right" tabindex="-1" role="dialog">
<div class="modal-dialog" role="document">
	
	<div class="modal-content">
		<div class="modal-header">
		<div style="font-size: x-large; font : italic 1.5em TmonMonsori;">Messages</div>
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
		</div>
	    <div class="modal-body">
	        
	        
	        <!-- 들어가야하는 것 : 일단 회사측에서 보내는것 -->
	         
	        <table class="table">
			 <c:if test="${permitFunding.size()>0}">
				<c:forEach var="item" items="${permitFunding}">
				    <tr>
				      <th scope="col" colspan="3" style="border-bottom:2px solid black">${ item.funding_title } 이 펀딩목록에 올라갔습니다! 지금 확인해보세요</th>
				    </tr>
			 
			  		<tr>
				      <td>
				      	<div class="img-container" onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor:pointer;">
                                    <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top card_img" alt="funding_img">
                        </div>
				      </td>
				      <td>${ item.funding_category }</td>
				      <td>${ item.funding_end_date }</td>
				    </tr>
				    
			  	</c:forEach>
			</c:if>
			  
			</table>
				

			<hr>
	    
	    </div>
	</div>
	
</div>
</div>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>