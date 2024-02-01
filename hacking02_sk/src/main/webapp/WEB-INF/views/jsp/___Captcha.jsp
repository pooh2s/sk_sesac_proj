<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/jsp/___Captcha">
	<input name="name1"><br/>
	'<%=request.getParameter("name1")%>'
	<input name="name2"><br/>  
	${request.getParameter("name2")} 
</form>
 

 





















<div id="div_id_capcha_1" class="div_class_capcha" style="z-index: 300; border-radius: 35px;">
   <div id="div_id_capcha_2" class="">
       <img id="" src="" style="display: block;">
       <a href="" class="" onclick=""></a>
       <a href="" class="" onclick="" id="">
           <span>문자입력 음성</span>
       </a>
<!--    </div> -->
   <div id="soundPlay" style="display:none;"></div>
   <div class="validationTxt">
       <span>문자를 입력해주세요</span>
       <input type="text" id="txtCapcha" name="txtCapcha" value="" maxlength="8"  style="text-transform:uppercase;">
       <div class="div_class_replace" style="color: red; display: block;">
       		<font id="font_id_새로운문자입력">새로운 문자로 다시 인증해주세요</font>	
       	</div>
   </div>
   <div class="capchaBtns">
       <a href="" onclick="입력완료();">입력완료</a>
        </div>
    </div>
</div>

<script>
window.addEventListener('load',(e)=>{
	div_id_captcha_1.style.cssText = 'width: ' + window.innerWidth / 4 + 'px;'
	div_id_captcha_1.style.cssText = 'height: ' + window.innerHeight / 3 + 'px;'	
})
</script>

</body>
</html>