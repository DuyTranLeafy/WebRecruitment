package bean;

import java.sql.ResultSet;
import java.sql.SQLException;


import org.springframework.jdbc.core.RowMapper;

public class RoleRowMapper implements RowMapper<Role> {
	
	@Override
	public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		int role_id = rs.getInt("role_id");
		String role_desc = rs.getString("role_desc");
		String username = rs.getString("username");
		
		return new Role(role_id,username, role_desc);
	}
	
}