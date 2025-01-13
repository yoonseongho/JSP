<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<meta charset="UTF-8">
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>

	<section>
		<h3>참가자 등수 조회</h3>
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>총점</td>
				<td>평균</td>
				<td>등수</td>
			</tr>
			<%
			Connection conn = null;
			ResultSet rs = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();
				
				String sql = "select "
						+ "A.artist_id, "
						+ "A.artist_name, "
						+ "SUM(B.point) as SUM, "
						+ "TO_CHAR(SUM(B.point) / count(A.artist_id), '999.00') as AVG, "
						+ "RANK() OVER (ORDER BY SUM(B.point) DESC) rank "
						+ "from tbl_artist_201905 A, tbl_point_201905 B "
						+ "where A.artist_id = B.artist_id "
						+ "group by A.artist_id, A.artist_name";
				
				rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
			<tr>
				<td><%=rs.getString("artist_id") %></td>
				<td><%=rs.getString("artist_name") %></td>
				<td><%=rs.getString("sum") %></td>
				<td><%=rs.getString("AVG") %></td>
				<td><%=rs.getString("rank") %></td>
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