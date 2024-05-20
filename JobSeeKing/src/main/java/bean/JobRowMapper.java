package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class JobRowMapper implements RowMapper<Job>{

	@Override
	public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		int jobId = rs.getInt("job_id");
		String title = rs.getString("title");
		String description = rs.getString("description");
		String jobRequire = rs.getString("job_require");
		String interest = rs.getNString("interest");
		int quantity = rs.getInt("quantity");
		double maxSalary = rs.getDouble("max_salary");
		double minSalary = rs.getDouble("min_salary");
		String profession = rs.getString("profession");
		String dueDate = rs.getString("due_date");
		boolean confirm = rs.getBoolean("confirm");
		int compId = rs.getInt("comp_id");
		String city = rs.getString("city");
		String fee = rs.getString("fee");
		
		return new Job(jobId, title, description, jobRequire, interest, quantity, 
				maxSalary, minSalary, profession, dueDate, confirm, city, compId, fee);
	}
}
