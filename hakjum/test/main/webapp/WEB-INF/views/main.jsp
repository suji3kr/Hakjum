<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<script>
	const update =() =>{
		location.href = "/member/update";
	}
	const logout =() =>{
		location.href = "/member/logout";
	}
</script>
<body>
<h2> ${sessionScope.loginEmail}님 환영합니다 🪐 </h2>
<button onclick="update()">정보 수정하기 ✒</button>
<button onclick="logout()">로그아웃 📲</button>
</body>
</html>