<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	const deleteMember =(id)=> {
		console.log(id);
		location.href ="/member/delete?id="+id;
	}
</script>
<body>
	<table>
        <tr>
            <th>ID</th>
            <th>학번</th>
            <th>Pass</th>
            <th>name</th>
            <th>국어</th>
            <th>영어</th>
            <th>수학</th>
            <th>조회</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
			<tr>
				<td>${member.boardID}</td>
				<td>
					<a href="/member?id=${member.boardID}">${member.boardHakbun}</a>
				</td>
		
				<td>${member.boardPass}</td>
				<td>${member.boardName}</td>
				<td>${member.boardKo}</td>
				<td>${member.boardEg}</td>
				<td>${member.boardMath}</td>
				<td>
					<a href="/member?id=${member.boardID}">조회</a>
				</td>
				<td>
					<button onclick="deleteMember('${member.boardID}')">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>