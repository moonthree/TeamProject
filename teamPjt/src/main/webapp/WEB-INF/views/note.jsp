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
.box {
	width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
}
</style>
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
				    	<th width="60px">
				    	<div class="box">
				    		<img src="<%=request.getContextPath()%>/resources/upload/${ photo }" class="login_profile_img" style="width:50px; height:50px; object-fit:cover;">
				    	</div>	
				    	</th>
				    	
				    	<td width="300px">
					    	<div style="background-color: #dcd6f2; border-radius: 20px; padding:10px" >
					    		
					    		<c:if test="${ item.c_or_p eq 'c'}">${ item.message_content }</c:if>
					    		<c:if test="${ item.c_or_p eq 'p'}">
					    			<img src="../resources/upload/message/${item.message_idx}/${item.message_content}" alt="message_img" class="message_img" width="200px"
					    			onclick="window.open('photoCloseUp.do?message_idx=${item.message_idx}&message_content=${item.message_content}','Popup', 'width=1280,height=720');">
					    		</c:if>
					    		
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
					    		
					    		<c:if test="${ item.c_or_p eq 'c'}">${ item.message_content }</c:if>
						    	<c:if test="${ item.c_or_p eq 'p'}">
						    		<img src="../resources/upload/message/${item.message_idx}/${item.message_content}" alt="message_img" class="message_img" width="200px">
						    	</c:if>
						    		
					    	</div>
				    	</td>
				    	<th width="60px">
				    		<div class="box">
				    			<img src="<%=request.getContextPath()%>/resources/upload/${ member.member_photo }" class="login_profile_img" style="width:50px; height:50px; object-fit:cover;">
				  			</div>
				  		</th>
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

<form id="messageFrm" name="aaa" action="sendMessage.do" method="post" enctype="multipart/form-data">
	<!-- funding_idx를 가지고 보낼 사람의 member_idx를 찾아야함 -->
	<input type="hidden" name="funding_idx" value="${ param.funding_idx }"/>
	<input type="hidden" name="store_idx" value="${ param.store_idx }"/>
	
	<!-- 메세지 사이즈가 0인경우 message_idx만드는 작업을 해야함 insert -->
	<input type="hidden" name="countMessages" value="${ messages.size() }"/>
	<input type="hidden" name="message_idx" value="${param.message_idx }"/>
	<!-- 여기서 판매자인지 소비자인지 또 나눠줘야함  그러기 위해서는 funding_idx로 member_idx가져와 비교하는 작업이 필요-->
		<!-- 소비자일때 -->
		<c:if test="${ isSeller ne member.member_idx }">
		<input type="hidden" name="to_member_idx" value="${ member.member_idx }"/>
		</c:if>
		<!-- 판매자일떄 -->
		<c:if test="${ isSeller eq member.member_idx }">
		<input type="hidden" name="to_member_idx" value="${ messages[0].from_member_idx }"/>
		</c:if>
	<table>
		<tr>
			<td>
				<label for="ex_file">
					<img src="<%=request.getContextPath()%>/resources/image/message/image.png" width="25px" style="cursor:pointer;">
				</label>
				<input type="file" accept="image/*" id="ex_file" name="fff" onchange=aa(); style="display:none;">
			</td>
			<td width="40px"><textarea rows='1' placeholder='메세지를 입력하세요' name="message_content"></textarea></td>
			<td><img src="<%=request.getContextPath()%>/resources/image/message/send.png" width="20px" onclick="document.getElementById('messageFrm').submit();" style="cursor:pointer;"></td>
		</tr>
	</table>
</form>
<script> 
	function aa(){ 
		if(document.aaa.fff.value != ""){ 
			document.aaa.action = "sendMessage.do"; 
			document.aaa.submit(); 
		} 
	}
</script> 
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