

import java.io.*;
import java.sql.*;
import java.util.*;
import java.awt.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class HelloServlet
 */

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/wtl06";
		String uname = "root";
		String password = "Dh@050701$";
		
		String stud_id=request.getParameter("stud_id");
		String stud_name=request.getParameter("stud_name");
		String stud_class=request.getParameter("stud_class");
		String stud_div=request.getParameter("stud_div");
		String stud_city=request.getParameter("stud_city");
		try{
    		Connection connection = DriverManager.getConnection(url, uname, password);
			Statement statement = connection.createStatement();
			if(request.getParameter("delete")!=null) {
				statement.execute("DELETE FROM students_info WHERE stud_id="+request.getParameter("delete"));
			}else if(statement.executeQuery("SELECT * FROM students_info WHERE stud_id="+stud_id)!=null) {
				statement.execute("DELETE FROM students_info WHERE stud_id="+stud_id);
				statement.execute(
						"INSERT INTO students_info VALUES ("+
						stud_id+", '"+
						stud_name+"', '"+
						stud_class+"', "+
						stud_div+", '"+
						stud_city+"')"
						);
			}
			else {
			statement.execute(
					"INSERT INTO students_info VALUES ("+
					stud_id+", '"+
					stud_name+"', '"+
					stud_class+"', "+
					stud_div+", '"+
					stud_city+"')"
					);
			}
    	}catch(SQLException e){
        	e.printStackTrace();
        }
		doGet(request, response);
	}

}