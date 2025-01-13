<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>판매등록</title>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>

<section>
	<form name="form1" method="post" action="action.jsp">
		<h3>판매등록</h3>
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td><input type="text" name="saleno" value="" /></td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td><input type="text" name="pcode" value="" /></td>
			</tr>
			<tr>
				<td>판매날짜</td>
				<td><input type="date" name="saledate" value="" /></td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td><input type="text" name="scode" value="" /></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="amount" value="" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="등록" />
					<input type="reset" value="다시쓰기" />
				</td>
			</tr>
		</table>
	</form>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>