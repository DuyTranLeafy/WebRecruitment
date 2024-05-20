package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import bean.JobProfile;
import bean.JobProfileRowMapper;

@Repository
@ComponentScan("config")
public class JobProfileRepository {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JobProfileRepository(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public JobProfile findJobProfile (int profId, int jobId) {
		try {
			String sql = "select * from job_profile where prof_id=? and job_id=?";
			JobProfile jobProfile = jdbcTemplate.queryForObject(sql,new Object[] {profId, jobId}, new int[] {java.sql.Types.INTEGER, java.sql.Types.INTEGER}, new JobProfileRowMapper());
			return jobProfile;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	public int saveJobPrifile(JobProfile jobProfile) {
		String sql = "insert into job_profile(prof_id, job_id, file_cv) values(?,?,?)";
		return jdbcTemplate.update(sql, jobProfile.getProfId(), jobProfile.getJobId(), jobProfile.getFileCv());
	}
}
