<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>수정</title>
	<style>
@font-face {
    font-family: 'establishRetrosansOTF';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/establishRetrosansOTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
		}</style>
	<script>
		const update =() => {
			const passwordDB ='${member.memberPassword}';
			const password = document.getElementById("memberPassword").value;
			if (passwordDB == password){
				document.updateForm.submit();
			}else{
				alert("비밀 번호가 일치하지 않습니다 ❗❕❗");
			}
		}
	</script>
</head>
<body>
	<form action="/member/update" method="post" name="updateForm">  <!-- 변경가능할떄는 disable없이 -->
		id: <input type ="text" value="${member.id}"disabled>
		 <input type="hidden" name="id" value="${member.id}">
		<p>이 메 일 : <input type="text" name="memberEmail" value="${member.memberEmail}" disabled></p>
		<p>비밀번호 : <input type="text" name="memberPassword" id="memberPassword" ></p> 
		<p>이   름 : <input type="text" name="memberName" value="${member.memberName}" disabled></p>
		<p>나   이 : <input type="text" name="memberAge" value="${member.memberAge}" ></p>
		<p>전화번호 : <input type="text" name="memberMobile" value="${member.memberMobile}" ></p>
		<input type="button" value="수정" onclick="update()">
	</form>
</body>
</html>