<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>통합매출조회</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<h3>통합매출조회</h3>
		<table border="1">
			<tr>
				<th>매출전표번호</th>
				<th>지점</th>
				<th>판매일자</th>
				<th>피자코드</th>
				<th>피자명</th>
				<th>판매수량</th>
				<th>매출액</th>
			</tr>
			<%
			Connection conn = null;
			ResultSet rs = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;

			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();

				String sql = "select " + "C.saleno, " + "B.scode || '-' || B.sname as sname, "
				+ "TO_CHAR(C.saledate, 'yyyy-mm-dd') saledate, " + "A.pcode, " + "A.pname, " + "C.amount, "
				+ " '₩' || TO_CHAR(A.cost * C.amount, '999,999,999') count " + "from " + "TBL_PIZZA_01 A, "
				+ "TBL_SHOP_01 B, " + "TBL_SALELIST_01 C " + "where " + "A.pcode = C.pcode " + "and B.scode = C.scode "
				+ "order by " + "C.saleno";
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
			%>
			<tr>
				<th><%=rs.getString("saleno")%></th>
				<th><%=rs.getString("sname")%></th>
				<th><%=rs.getString("saledate")%></th>
				<th><%=rs.getString("pcode")%></th>
				<th><%=rs.getString("pname")%></th>
				<th><%=rs.getString("amount")%></th>
				<th><%=rs.getString("count")%></th>
			</tr>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</table>
	</section>

	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>