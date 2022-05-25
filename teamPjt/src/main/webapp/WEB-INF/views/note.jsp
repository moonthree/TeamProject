<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css">
    
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
 
<style>
/* 이미지 */
/*이미지 콘테이너 1:1 비율*/
    .img-container{
        overflow: hidden;
    }
    .card_img{
        width: 150px;
        height:150px;
        object-fit: cover;
        transition: all 0.1s linear;
    }
    .card_img:hover{
        transform: scale(1.05);
    }
    .card{
        border: none; 
    }
/* 테이블 css */
table, tr, td{
 border:none;
}

/* textarea */
textarea{  
  overflow:hidden;
  padding:10px;
  margin: 10px 0px;
  width:410px;
  font-size:14px;
  display:block;
  border-radius:20px;
  border:1px solid #556677;
  resize: none;
}
.sticky {
    position: fixed;
    bottom: 0px;
    background: white;
}
@media screen and (min-height: 690px) { textarea { width:400px; } }

footer {
        height: 100px;
        position: relative;
        transform: translateY(100%);
    }
</style>
<script>
$("window").load(scrollDown);
</script>

</head>
<body>

<div style="background-color: #fa6463; height:50px; text-align:center; ">
	<div style=" color:white; margin-top:auto; font-size: 1.5em;">${ name }</div>
</div>
<div class="row">
		 <c:if test="${messages.size()>0}">
			<c:forEach var="item" items="${messages}">
			
			<!-- 왼쪽  -->
			<c:if test="${ item.from_member_idx ne member.member_idx }">
				<table class="table" style="border: none; margin-top:30px; text-align:left;">		
					    <tr>
					    	<th width="60px"><img src="<%=request.getContextPath()%>/resources/upload/${ item.member_photo }" class="login_profile_img" style="width:50px; height:50px; object-fit:cover;"></th>
					    	<td width="300px">
						    	<div style="background-color: #dcd6f2; border-radius: 20px; padding:10px" >
						    		${ item.message_content }
						    	</div>
					    	</td>
					    </tr>
					    <tr>
					      	<th>
		                    </th>
		                    <td style="text-align:right;">
								<fmt:parseDate var="time" value="${item.message_note_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						    	<fmt:formatDate value="${time}" pattern="yyyy.MM.dd a KK:mm:ss " /> 
					    	</td>
					    </tr>
				</table>
			</c:if>	    
		
			<!-- 오른쪽 -->
			<c:if test="${ item.from_member_idx eq member.member_idx }">
			    <table class="table" style="border: none; margin-top:30px; text-align:left;">
				    <tr>
				    	<th width="130px"></th>
				    	<td width="300px">
					    	<div style="background-color: #f5f5f5; border-radius: 20px; padding:10px" >
					    		${ item.message_content }
					    	</div>
				    	</td>
				    	<th width="60px"><img src="<%=request.getContextPath()%>/resources/upload/${ member.member_photo }" class="login_profile_img" style="width:50px; height:50px; object-fit:cover;"></th>
				    </tr>
				    <tr>
				    	<td></td>	
		                   <td style="text-align:right;">
							<fmt:parseDate var="time" value="${item.message_note_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					    	<fmt:formatDate value="${time}" pattern="yyyy.MM.dd a KK:mm:ss " /> 
				    	</td>
				    	<th>
		               	</th>
				    </tr>
			    </table>
	   		</c:if>
	   		
		  	</c:forEach>
		</c:if>
	<footer></footer>
</div>
<!-- 메세지 보내기  -->
<div class="row sticky">

<form id="messageFrm" action="sendMessage.do" method="post">
	<!-- funding_idx를 가지고 보낼 사람의 member_idx를 찾아야함 -->
	<input type="hidden" name="funding_idx" value="${ param.funding_idx }"/>
	<!-- 메세지 사이즈가 0인경우 message_idx만드는 작업을 해야함 insert -->
	<input type="hidden" name="countMessages" value="${ messages.size() }"/>
	
	<table>
		<tr>
			<td><img src="<%=request.getContextPath()%>/resources/image/message/image.png" width="25px" style="cursor:pointer;"></td>
			<td width="40px"><textarea rows='1' placeholder='메세지를 입력하세요' name="message_content"></textarea></td>
			<td><img src="<%=request.getContextPath()%>/resources/image/message/send.png" width="20px" onclick="document.getElementById('messageFrm').submit();" style="cursor:pointer;"></td>
		</tr>
	</table>
</form>

</div>
<script>
	var textarea = document.querySelector('textarea');
	textarea.addEventListener('keydown', autosize);       
	function autosize(){
	  var el = this;
	  setTimeout(function(){
	    el.style.cssText = 'height:auto; padding:0';
	    // for box-sizing other than "content-box" use:
	    // el.style.cssText = '-moz-box-sizing:content-box';
	    el.style.cssText = 'height:' + el.scrollHeight + 'px';
	  },0);
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>