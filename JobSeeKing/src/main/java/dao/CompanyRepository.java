package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import bean.Company;
import bean.CompanyRowMapper;

@Repository
@ComponentScan("config")
public class CompanyRepository {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void saveCompany(Company company) {
		String sqlCompanyString = "insert into company(contact_name,company_name,phone,address,image,city,contact_email) values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlCompanyString, company.getContact_name(), company.getCompany_name(), company.getPhone(), company.getAddress(),
				company.getImage(), company.getCity(), company.getContact_email());
	}
	
	public Company findCompany (String username) {
		try {
			String sql = "select * from company where username=?";
			Company company = jdbcTemplate.queryForObject(sql,new Object[] {username}, new int[] {java.sql.Types.VARCHAR}, new CompanyRowMapper());
			return company;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	public int getCompId(String username) {
		String sql = "select comp_id from company where contact_email=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {username},new int[] {java.sql.Types.VARCHAR}, Integer.class);
	}
}
