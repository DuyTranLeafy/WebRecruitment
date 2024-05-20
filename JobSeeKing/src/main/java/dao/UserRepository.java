package dao;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import bean.Company;
import bean.Role;
import bean.RoleRowMapper;
import bean.User;
import bean.UserRowMapper;

@Repository
@ComponentScan("config")
public class UserRepository {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public UserRepository(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void saveEmployer(String username, String password, Company company, String role) {
		String sql = "insert into users(username,password) values(?,?)";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePassword = passwordEncoder.encode(password);
		if(jdbcTemplate.update(sql, username, encodePassword) > 0) {
			companyRepository.saveCompany(company);
			String sqlRoleString = "insert into users_roles(username,role_desc) values(?,?)";
			jdbcTemplate.update(sqlRoleString, username, role);
		}
	}
	
	public void saveUser(String username, String password, String role) {
		String sql = "insert into users(username,password) values(?,?)";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePassword = passwordEncoder.encode(password);
		if(jdbcTemplate.update(sql, username, encodePassword) > 0) {
			String sqlRoleString = "insert into users_roles(username,role_desc) values(?,?)";
			jdbcTemplate.update(sqlRoleString, username, role);
		}
	}
	
	public int updatePassword(String username, String password) {
		String sql = "update users set password=? where username=?";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePassword = passwordEncoder.encode(password);
		return jdbcTemplate.update(sql, encodePassword, username);
	}
	
	public User findByUsername (String username) {
		try {
			String sql = "select username, password from users where username=?";
			User user = jdbcTemplate.queryForObject(sql,new Object[] {username}, new int[] {java.sql.Types.VARCHAR}, new UserRowMapper());
			String stringRole = getRoleByUsername(username);
			GrantedAuthority authority = new SimpleGrantedAuthority(stringRole);
			user.setAuthorities(Arrays.asList(authority));
			return user;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	public String getRoleByUsername(String username) {
		String roleSql = "select * from users_roles where username=?";
		Role role = jdbcTemplate.queryForObject(roleSql, new Object[] {username}, new int[] {java.sql.Types.VARCHAR}, new RoleRowMapper());
		String stringRole = role.getRole_desc();
		return stringRole;
	}
}