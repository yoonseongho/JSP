<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<h3>오디션 등록</h3>
		<form name="form1" method="post" action="action.jsp">
			<table border="1" style="text-align: left;">
				<tr>
					<td>참가번호</td>
					<td><input type="text" name="artist_id" value="" />*참가번호는(A000)4자리입니다</td>
				</tr>
				<tr>
					<td>참가자명</td>
					<td><input type="text" name="artist_name" value="" /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth_y" maxlength="4" />년 <input type="text"
						name="birth_m" maxlength="2" />월 <input type="text" name="birth_d" maxlength="2" />일</td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name="artist_gender" value="M" />남성 <input
						type="radio" name="artist_gender" value="F" />여성</td>
				</tr>
				<tr>
					<td>특기</td>
					<td><select name="talent">
							<option value="" disabled selected>특기선택</option>
							<option value="1">[1]보컬</option>
							<option value="2">[2]댄스</option>
							<option value="3">[3]랩</option>
					</select></td>
				</tr>
				<tr>
					<td>소속사</td>
					<td><input type="text" name="agency" value="" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" onclick="return insertCheck()" value="오디션 등록" /> <input
						onclick="return resetCheck()" type="reset" value="다시쓰기" /></td>
				</tr>
			</table>
		</form>
	</section>

	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>