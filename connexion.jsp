<%@ page import = "java.sql.*"%>
<%
Connection conn = null;

 String DBNAME = "bd_dj791333";
 String DB_USERNAME = "dj791333";
 String DB_PASSWORD = "RanUHYQw";
try {
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://zeta2.labunix.uqam.ca:3306/"+DBNAME,DB_USERNAME,DB_PASSWORD);
   
}
catch(SQLException e) {
  System.out.println("Error!!!!!!" + e);
}
  
 %>