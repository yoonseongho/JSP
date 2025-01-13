<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>판매현황</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<table border="1">
			<tr>
				<th>매장코드</th>
				<th>매장명</th>
				<th>매장별 판매액</th>
			</tr>
			<%
			Connection conn = null;
			ResultSet rs = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;

			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();

				String sql = "select " + "B.scode, " + "B.sname, " + "TO_CHAR(sum(A.cost * C.amount), '999,999,999') as cost "
				+ "from " + "tbl_product_01 A, " + "tbl_shop_01 B, " + "tbl_saleslist_01 C " + "where "
				+ "A.pcode = C.pcode " + "and B.scode = C.scode " + "group by " + "B.scode, B.sname";
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
			%>
			<tr>
				<th><%=rs.getString("scode")%></th>
				<th><%=rs.getString("sname")%></th>
				<th><%=rs.getString("cost")%></th>
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