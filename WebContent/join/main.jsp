<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
 function fn_process(){
	 <%-- 멤버변수 선언시 var를 사용함 --%> 
    var _id=$("#t_id").val();
    var pwd=$("#pwd").val();
    var pwd2=$("#pwd2").val();
    var name=$("#name").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    <%-- ajax호출 하는 부분--%>
    $.ajax({
    	<%-- http 전송 method를 지정한다. GET, POST --%>
       type:"post",
       <%-- 동기식&비동기식 (false/true) --%>
       async:true,  
       <%--호출 URL. GET 방식일경우 URL 뒤에 파라미터를 붙여서 사용해도 된다. --%>
       url:"http://localhost:8090/pilot/mp",
       <%--  Ajax를 통해 호출한 페이지의 Return 형식이다. 형식에 따라 xml, json, html, text 등을 사용하면 된다. --%>
       dataType:"text",
       <%-- data 아이디, 암호, 확인, 이름을 담는다  --%>
       data: {id:_id, pwd:pwd, pwd2:pwd2, name:name},
       <%-- success(요청이 성공했을 때 호출함): function의 (data에 담긴것(아디이.이름.암호 및 확인, textStatus--%>
       success:function (data,textStatus){
    	   //alert(data);
    	  $('#message').text("");
    	  $('#pwdMessage').text("");
          if(data =='not_usable_id'){
       	   	$('#message').text("사용할 수 없는 ID입니다.");
       		$('#pwdMessage').text("암호와 확인이 일치합니다.");
       	   //$('#btnDuplicate').prop("disabled", true);
          }else if(data == 'not_usable_pwd'){
       	   	$('#pwdMessage').text("암호와 확인이 일치하지 않습니다.");
          }else if(data == 'not_usable') {
        	$('#message').text("사용할 수 없는 ID입니다.");
        	$('#pwdMessage').text("암호와 확인이 일치하지 않습니다.");
          }else if(data == 'usable') {
        	$('#message').text("사용할 수 있는 ID입니다.");
        	$('#pwdMessage').text("암호와 확인이 일치합니다.");
        	// 호출합니다 = list.jsp?name을 + 한글깨짐방지를위해 encode로 (name)을 
        	location.href = "list.jsp?name=" + encodeURIComponent(name);
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       }
    });  //end ajax	 
 }	
</script>
</head>
<body>
	<form method="post" action="Mlist.jsp">
		<img src='../img/user_2.png' width='18' height='18'> &nbsp;<input type="text" id="t_id" placeholder="아이디" /> <span id="message"></span> <br>
		<img src='../img/card.png' width='18' height='18'> &nbsp;<input type="text" id="name" placeholder="이름"> <br> 
		<img src='../img/lock2.png' width='18' height='18'> &nbsp;<input type="password" id="pwd" placeholder="암호" /> <br> 
		<img src='../img/lock3.png' width='18' height='18'> &nbsp;<input type="password" id="pwd2" placeholder="암호확인" /> <span id="pwdMessage"></span> <br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btnDuplicate" value="가입"
			onClick="fn_process()" /> <br> <br>
	</form>

</body>
</html>