<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>지점별 매출 현황</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<h3>지점별 매출 현황</h3>
		<table border="1">
			<tr>
				<th>지점 코드</th>
				<th>지점 명</th>
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

				String sql = "select " + "B.scode, " + "B.sname, "
				+ "'₩' || TO_CHAR(SUM(A.cost * C.amount), '999,999,999') as cost " + "from " + "TBL_PIZZA_01 A, "
				+ "TBL_SHOP_01 B, " + "TBL_SALELIST_01 C " + "where " + "A.pcode = C.pcode " + "and B.scode = C.scode "
				+ "group by " + "B.scode, B.sname " + "order by " + "B.scode, B.sname";
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