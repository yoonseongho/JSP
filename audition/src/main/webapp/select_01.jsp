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
	<h1>참가자목록조회</h1>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
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
						+ "artist_id, "
						+ "artist_name, "
						+ "substr(artist_birth, 1, 4) birth_y, "
						+ "substr(artist_birth, 5, 2) birth_m, "
						+ "substr(artist_birth, 7, 2) birth_d, "
						+ "artist_gender, "
						+ "talent, "
						+ "agency "
					+ "from tbl_artist_201905";
				
				rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString("artist_id") %></td>
			<td><%=rs.getString("artist_name") %></td>
			<td><%=rs.getString("birth_y") %>년<%=rs.getString("birth_m") %>월<%=rs.getString("birth_d") %>일</td>
			<td><%=rs.getString("artist_gender") %></td>
			<td><%=rs.getString("talent") %></td>
			<td><%=rs.getString("agency") %></td>
		</tr>
		<%
			}
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>