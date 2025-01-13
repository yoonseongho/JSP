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
				<th>비번호</th>
				<th>상품코드</th>
				<th>판매날짜</th>
				<th>매장코드</th>
				<th>상품명</th>
				<th>판매수량</th>
				<th>총판매액</th>
			</tr>
			<%
			Connection conn = null;
			ResultSet rs = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;

			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();

				String sql = "select " + "C.saleno, " + "A.pcode, " + "TO_CHAR(C.saledate, 'yyyy-mm-dd') as saledate, "
				+ "B.scode, " + "A.name, " + "C.amount, " + "TO_CHAR(A.cost * C.amount, '999,999,999') as cost " + "from "
				+ "tbl_product_01 A, " + "tbl_shop_01 B, " + "tbl_saleslist_01 C " + "where " + "A.pcode = C.pcode "
				+ "and B.scode = C.scode " + "order by " + "C.saleno";
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
			%>
			<tr>
				<td>
                    <a style="text-decoration: none; color: black;" href="update.jsp?saleno=<%=rs.getString("saleno")%>">
                        <%=rs.getString("saleno")%>
                    </a>
                </td>
				<th><%=rs.getString("pcode")%></th>
				<th><%=rs.getString("saledate")%></th>
				<th><%=rs.getString("scode")%></th>
				<th><%=rs.getString("name")%></th>
				<th><%=rs.getString("amount")%></th>
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