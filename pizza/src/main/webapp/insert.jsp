<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출번표등록</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<h3>매출번표등록</h3>
		<form name="form1" method="post" action="action.jsp">
			<table border="1">
				<tr>
					<td>매출전표번호</td>
					<td><input type="text" name="saleno" value="" /></td>
				</tr>
				<tr>
					<td>지점코드</td>
					<td><input type="text" name="scode" value="" /></td>
				</tr>
				<tr>
					<td>판매일자</td>
					<td><input type="date" name="saledate" value="" /></td>
				</tr>
				<tr>
					<td>피자코드</td>
					<td><select name="pcode">
							<option value="" selected disabled hidden="">피자선택</option>
							<option value="AA01">[AA01] 고르골졸라피자</option>
							<option value="AA02">[AA02] 피즈피자</option>
							<option value="AA03">[AA03] 페퍼로니피자</option>
							<option value="A004">[AA04] 콤비네이션피자</option>
							<option value="A005">[AA05] 고구마피자</option>
							<option value="A006">[AA06] 포테이토피자</option>
							<option value="A007">[AA07] 불고기피자</option>
							<option value="A008">[AA08] 나폴리피자</option>
					</select></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="text" name="amount" value="" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="전표등록" onclick="return insertCheck()" /> <input
						type="reset" value="다시쓰기" onclick="return resetCheck()" /></td>
				</tr>
			</table>
		</form>
	</section>

	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>