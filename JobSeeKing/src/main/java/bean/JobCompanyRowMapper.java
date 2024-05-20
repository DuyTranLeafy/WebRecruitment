package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class JobCompanyRowMapper implements RowMapper<JobCompany> {

	@Override
	public JobCompany mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		int job_id = rs.getInt("job_id");
		String title = rs.getString("title");
		String description = rs.getString("description");
		String job_require = rs.getString("job_require");
		String interest = rs.getString("interest");
		int quantity = rs.getInt("quantity");
		Double max_malary = rs.getDouble("max_salary");
		Double min_malary = rs.getDouble("min_salary");
		String profession = rs.getString("profession");
		String due_date = rs.getString("due_date");
		boolean confirm = rs.getBoolean("confirm");
		String company_name = rs.getString("company_name");
		String image = rs.getString("image");
		String city = rs.getString("city");
		String fee = rs.getString("fee");

		return new JobCompany(job_id, title, description, job_require, interest, quantity, max_malary, min_malary,
				profession, due_date, confirm, company_name, image, city, fee);

	}
}