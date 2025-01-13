<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>상품별 매출 현황</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<h3>상품별 매출 현황</h3>
		<table border="1">
			<tr>
				<th>피자 코드</th>
				<th>피자 명</th>
				<th>총매출액</th>
			</tr>
			<%
			Connection conn = null;
			ResultSet rs = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;

			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();

				String sql = "SELECT " + "A.pcode, " + "A.pname, "
				+ "'₩' || TO_CHAR(SUM(A.cost * C.amount), '999,999,999') AS sales " + "FROM " + "TBL_PIZZA_01 A, "
				+ "TBL_SHOP_01 B, " + "TBL_SALELIST_01 C " + "WHERE " + "A.pcode = C.pcode " + "AND B.scode = C.scode "
				+ "GROUP BY " + "A.pcode, A.pname " + "ORDER BY " + "sales desc";
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
			%>
			<tr>
				<th><%=rs.getString("pcode")%></th>
				<th><%=rs.getString("pname")%></th>
				<th><%=rs.getString("sales")%></th>
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