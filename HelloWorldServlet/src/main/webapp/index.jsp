<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Info - JSP</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <style>
            table{
                width: 100%;
            }
            th,td{
                width: 20%;
                text-align: left;
                border: 0.5px solid black;
                border-style: ridge;
            }
            th{
                border: 2px solid black;
            }
        </style>
        <div style="text-align: center;">
            <h1><b>Student Info</b></h1>
            <h3>Focus on your studies !!!!</h3>
        </div>
        
        <%@ page import="java.io.*, java.sql.*, java.util.*, java.awt.*, jakarta.servlet.ServletException, jakarta.servlet.http.*" %>
        
        <% 
        String url = "jdbc:mysql://localhost:3306/wtl06";
		String uname = "root";
		String password = "*****";
        %>
        <div style="width: 100%; display: inline-flex;flex-direction: row; padding-top: 50px; font-size: 18px;">
            <div style="width: 40%; padding-left: 15%;">
                <form action="HelloServlet" method="post">
                    <label for="stud_id">Roll No:</label><br>
                    <input required type="text" id="stud_id" name="stud_id"><br><br>
                    <label for="stud_name">Name:</label><br>
                    <input required type="text" id="stud_name" name="stud_name"><br><br>
                    <div style="display: inline-flex;flex-direction: row;">
                        <label for="stud_class">Class:</label><br>
                        <select style="height: 20px; margin-left: 5px; width: 40px;" required id="stud_class" name="stud_class">
                            <%
	                        out.print("<option value='FE'>FE</option>");
                            out.print("<option value='SE'>SE</option>");
                            out.print("<option value='TE'>TE</option>");
                            out.print("<option value='BE'>BE</option>");
	                        %>
                        </select>
                        <div style="padding-left: 50px;"></div>
                        <label for="stud_div">Divison:</label><br>
                        <select style="height: 20px; margin-left: 5px; width: 40px;" required id="stud_div" name="stud_div">
                            <%
	                        for(int i=1;i<13;i++){
	                        	out.print("<option value='"+Integer.toString(i)+"'>"+Integer.toString(i)+"</option>");
	                        }
	                        %>
                        </select>
                    </div><br><br>
                    <label for="stud_city">City:</label><br>
                    <input required type="text" id="stud_city" name="stud_city"><br><br>
                    <button name="edit" value="edit" type="submit" style='background-color:transparent; border: none;'>
	                    <i class='fa fa-edit' style='font-size:32px;'></i>
	                </button>
                </form>
            </div>
            <div style="width: 60%;">
                <table>
                    <tr>
                        <th>Roll (ID)</th>
                        <th>Name</th>
                        <th>Class</th>
                        <th>Div</th>
                        <th>City</th>
                        <th></th>
                    </tr>
                    <%
                    try{
                    	Connection connection = DriverManager.getConnection(url, uname, password);
            			Statement statement = connection.createStatement();
            			ResultSet responseData= statement.executeQuery("SELECT * FROM students_info");
            			while(responseData.next()){
            				out.println(
                            		"<tr>"+
        	                            "<td>"+Integer.toString(responseData.getInt("stud_id"))+"</td>"+
        	                            "<td>"+responseData.getString("stud_name")+"</td>"+
        	                            "<td>"+responseData.getString("stud_class")+"</td>"+
        	                            "<td>"+Integer.toString(responseData.getInt("stud_div"))+"</td>"+
        	                            "<td>"+responseData.getString("stud_city")+"</td>"+
        	                            "<td>"+
        	                                //"<button style='background-color:"+ "transparent; border: none;'>"+
        	                                   // "<i class='fa fa-edit' style='font-size:24px;'></i>"+
        	                                //"</button>"+
        	                               	"<form action='HelloServlet' method='post'>"+
        	                                "<button type='submit' name='delete' value='"+Integer.toString(responseData.getInt("stud_id"))+"' style='background-color: transparent; border: none;'>"+
        	                                    "<i class='fa fa-trash' style='font-size:26px; color:crimson;'></i>"+
        	                                "</button>"+
        	                                "</form>"+
        	                            "</td>"+
        	                        "</tr>"
                            		);
            			}
                    }catch(SQLException e){
                    	out.print(e);
                    }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
