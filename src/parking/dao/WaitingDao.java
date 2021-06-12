package parking.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import parking.model.Waiting;

public class WaitingDao {
	 public int insertWaiting(Waiting waiting) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO waiting" +
	            "  (name,email,phone,location,in_time,out_time,vehicle_number) VALUES " +
	            " (?,?,?,?,?,?,?);";
	        int result = 0;
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/parking?", "root", "");
	        		
	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	            preparedStatement.setString(1, waiting.getName());
	            preparedStatement.setString(2, waiting.getEmail());
	            preparedStatement.setString(3, waiting.getPhone());
	            preparedStatement.setString(4, waiting.getLocationName());
	            preparedStatement.setString(5, waiting.getInTime());
	            preparedStatement.setString(6, waiting.getOutTime());
	            preparedStatement.setString(7, waiting.getVehicleNumber());

	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            // process sql exception
	        }
	        System.out.println(result);
	        return result;
	    }

	    @SuppressWarnings("unused")
		private void printSQLException(SQLException ex) {
	        for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
}
