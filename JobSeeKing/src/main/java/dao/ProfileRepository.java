package dao;

import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import bean.JobProfile;
import bean.Profile;
import bean.ProfileCV;
import bean.ProfileCVRowMapper;
import bean.ProfileRowMapper;

@Repository
@ComponentScan("config")
public class ProfileRepository {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private JobProfileRepository jobProfileRepository;

	public ProfileRepository(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public Profile findProfileByUsername (String username) {
		try {
			String sql = "select * from profile where user_prof=?";
			Profile profile = jdbcTemplate.queryForObject(sql,new Object[] {username}, new int[] {java.sql.Types.VARCHAR}, new ProfileRowMapper());
			formatDob(profile);
			return profile;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	public List<ProfileCV> findProfileByJobId(int jobId) {
		String sql = "select p.*, j.file_cv from profile as p inner join job_profile as j on j.prof_id=p.prof_id where j.job_id=?";
		List<ProfileCV> listProfileCVs = jdbcTemplate.query(sql, new Object[] {jobId},new int[] {java.sql.Types.INTEGER}, new ProfileCVRowMapper());
		return listProfileCVs;
	}
	
	public int saveProfile(Profile profile, int jobId, String fileCv) {
		String sql = "insert into profile(name,phone,address,sex,dob,user_prof) values(?,?,?,?,?,?)";
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		int result = jdbcTemplate.update(connection -> {
			PreparedStatement ps = connection.prepareStatement(sql, new String[] {"prof_id"});
			ps.setString(1, profile.getName());
			ps.setString(2, profile.getPhone());
			ps.setString(3, profile.getPhone());
			ps.setString(4, profile.getSex());
			ps.setString(5, profile.getDob());
			ps.setString(6, profile.getUser_prof());
			return ps;
		}, keyHolder);
		if(result > 0) {
			int prof_id = keyHolder.getKey().intValue();
			JobProfile jobProfile = new JobProfile(prof_id, jobId, fileCv);
			jobProfileRepository.saveJobPrifile(jobProfile);
		}
		
		return result;
	}
	
	public int saveProfile(Profile profile) {
		String sql = "insert into profile(name,phone,address,sex,dob,user_prof) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, profile.getName(), profile.getPhone(), profile.getAddress(), profile.getSex(),
				formatDob(profile.getDob()), profile.getUser_prof());
	}
	
	void formatDob(Profile profile) {
		SimpleDateFormat inputFormatter = new SimpleDateFormat("yyyy/mm/dd");
        SimpleDateFormat outputFormatter = new SimpleDateFormat("dd/mm/yyyy");
        Date date = null;
		try {
			date = inputFormatter.parse(profile.getDob());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String formattedDate = outputFormatter.format(date);
        profile.setDob(formattedDate);
	}
	
	String formatDob(String dob) {
		SimpleDateFormat inputFormatter = new SimpleDateFormat("dd/mm/yyyy");
        SimpleDateFormat outputFormatter = new SimpleDateFormat("yyyy/mm/dd");
        Date date = null;
		try {
			date = inputFormatter.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return outputFormatter.format(date);
	}
}
