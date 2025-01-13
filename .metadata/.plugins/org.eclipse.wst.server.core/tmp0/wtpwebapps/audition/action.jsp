<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String artist_id = request.getParameter("artist_id");
	String artist_name = request.getParameter("artist_name");
	String birth_y = request.getParameter("birth_y");
	String birth_m = request.getParameter("birth_m");
	String birth_d = request.getParameter("birth_d");
	String artist_birth = birth_y + birth_m + birth_d;
	String talent = request.getParameter("talent");
	String artist_gender = request.getParameter("artist_gender");
	String agency = request.getParameter("agency");
	System.out.println("Agency 입력값: [" + agency + "], 길이: " + agency.length());

	
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	try {
	
	conn = Util.getConnection();
	
	String sql = "INSERT INTO tbl_artist_201905 (artist_id, artist_name, artist_birth, artist_gender, talent, agency) VALUES (?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, artist_id);
	pstmt.setString(2, artist_name);
	pstmt.setString(3, artist_birth);
	pstmt.setString(4, artist_gender);
	pstmt.setString(5, talent);
	pstmt.setString(6, agency);
	
	pstmt.executeUpdate();
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("select_01.jsp");
%>