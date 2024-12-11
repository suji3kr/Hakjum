<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>

	<title>index</title>
	
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'establishRetrosansOTF';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/establishRetrosansOTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;}
</style>
</head>
<body>
	<form action="/member/save" method="post">
		<p>I D : <input type="text" name="boardID" placeholder="아이디"></p>
		<p>학번: 
			<input type="text" name="boardHakbun" placeholder="학번 (2024XXXX)" id="memberHakbun" onblur="HakbunCheck()" pattern="2024\d{4}">
		</p>
		<p id="check-result"></p>   <!-- 학번 검증 결과를 보여줄 자리 -->
		
		<p>비밀번호: 
			<input type="password" name="boardPass" placeholder="비밀번호">
		</p>

		<p>이름: 
			<input type="text" name="boardName" placeholder="이름">
		</p>

		<p>국어: 
			<input type="number" name="boardKo" placeholder="국어 점수 (0~100)" min="0" max="100">
		</p>

		<p>영어: 
			<input type="number" name="boardEg" placeholder="영어 점수 (0~100)" min="0" max="100">
		</p>

		<p>수학: 
			<input type="number" name="boardMath" placeholder="수학 점수 (0~100)" min="0" max="100" required>
		</p>

		<input type="submit" value="🌼 입력 🌼">
		<input type="reset" value="초기화 -!">
	</form>
</body>

<script>
// 이메일 입력값을 가져오고,
// 입력값을 서버로 전송하고 똑같은 이메일이 있는지 체크한 후
// 사용 가능 여부를 이메일 입력창 아래에 표시
    const HakbunCheck = () => {
        const ID = document.getElementById("boardId").value;
        const checkResult = document.getElementById("check-result");
        console.log("입력한 아이디", id);
        $.ajax({
            // 요청방식: post, url: "Hakbun-check", 데이터: 학번
            type: "post",
            url: "/member/Hakbun-check",
            data: {
                "boardID": id
            },
            success: function(res) {
                console.log("요청성공", res);
                if (res == "ok") {
                	console.log("사용가능한 아이디");
                	checkResult.style.color = "green"; // 텍스트 색을 초록색으로 설정
                	checkResult.style.fontFamily = "establishRetrosansOTF"; // 폰트 패밀리를 설정
                	checkResult.innerHTML = "사용가능한 아이디 🌼"; // 텍스트를 업데이트

                } else {
                    console.log("이미 사용중인 아이디");
                    checkResult.style.color = "red";
                    checkResult.style.fontFamily = "establishRetrosansOTF"; // 폰트 패밀리를 설정
                    checkResult.innerHTML = "이미 사용중인 아이디 🥀";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>

</html>