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
		<h3>멘토점수조회</h3>
		<table border="1">
			<tr>
				<td>채점번호</td>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>점수</td>
				<td>평점</td>
				<td>멘토</td>
			</tr>
			<%
			Connection conn = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();

				String sql = "select " + "C.serial_no, " + "A.artist_id, " + "A.artist_name, "
				+ "substr(artist_birth, 1, 4) as year, " + "substr(artist_birth, 5, 2) as mon, "
				+ "substr(artist_birth, 7, 2) as day, " + "C.point, " + "case when C.point >= 90 then 'A' "
				+ "when C.point >= 80 then 'B' " + "when C.point >= 70 then 'C' " + "when C.point >= 60 then 'D' "
				+ "else 'F' end score, " + "B.mento_name " + "from " + "tbl_artist_201905 A, " + "tbl_mento_201905 B, "
				+ "tbl_point_201905 C " + "where " + "A.artist_id = C.artist_id " + "and B.mento_id = C.mento_id "
				+ "order by C.serial_no, A.artist_id";

				rs = stmt.executeQuery(sql);

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("serial_no")%></td>
				<td><%=rs.getString("artist_id")%></td>
				<td><%=rs.getString("artist_name")%></td>
				<td><%=rs.getString("year")%>년<%=rs.getString("mon")%>월<%=rs.getString("day")%>일</td>
				<td><%=rs.getString("score")%></td>
				<td><%=rs.getString("point")%></td>
				<td><%=rs.getString("mento_name")%></td>
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