package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CompanyRowMapper implements RowMapper<Company>{

	@Override
	public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		int comp_id = rs.getInt("comp_id");
		String contact_name = rs.getString("contact_name");
		String company_name = rs.getString("ompany_name");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		String image = rs.getString("image");
		String city = rs.getString("city");
		String contact_email = rs.getString("contact_email");
		
		return new Company(comp_id, contact_name, company_name, phone, address, image, city, contact_email);
	}
	
}
