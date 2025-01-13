<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
    
<%
	
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = Util.getConnection();
		String sql = "INSERT INTO tbl_saleslist_01 (saleno, pcode, saledate, scode, amount) VALUES (?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, saleno);
		pstmt.setString(2, pcode);
		pstmt.setString(3, saledate);
		pstmt.setString(4, scode);
		pstmt.setString(5, amount);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("select_01.jsp");
%>