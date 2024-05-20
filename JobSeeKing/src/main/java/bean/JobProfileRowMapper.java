package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class JobProfileRowMapper implements RowMapper<JobProfile>{

	@Override
	public JobProfile mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		int profId = rs.getInt("prof_id");
		int jobId = rs.getInt("job_id");
		String fileCv = rs.getString("file_cv");
		return new JobProfile(profId, jobId, fileCv);
	}
	
}
