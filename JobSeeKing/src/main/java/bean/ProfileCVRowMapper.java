package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProfileCVRowMapper implements RowMapper<ProfileCV>{

	@Override
	public ProfileCV mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		int prof_id = rs.getInt("prof_id");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		String sex = rs.getString("sex");
		String dob = rs.getString("dob");
		String user_prof = rs.getString("user_prof");
		String file_cv = rs.getString("file_cv");
		return new ProfileCV(prof_id, name, phone, address, sex, dob, user_prof, file_cv);
	}
	
}
