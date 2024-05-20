package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import bean.Job;
import bean.JobCompany;
import bean.JobCompanyRowMapper;
import bean.JobsInCompany;

@Repository
@ComponentScan("config")
public class JobRepository {
	private static final Integer JOBS_PER_PAGE = 10;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<JobsInCompany> getTopCompanies() {
		String sql = "SELECT c.comp_id, c.image, c.company_name, COUNT(j.job_id) AS job_post_count FROM company c JOIN job j ON c.comp_id = j.comp_id "
				+ "GROUP BY c.comp_id, c.company_name, c.image ORDER BY job_post_count DESC LIMIT 10;";

		List<JobsInCompany> jobCompanies = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(JobsInCompany.class));
		return jobCompanies;
	}
	
	public JobRepository(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<JobCompany> findJob (String name) {
		List<JobCompany> jobs = new ArrayList<>();
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) > 0 and confirm=1 order by j.job_id desc";
		List<JobCompany> results = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(JobCompany.class));
		for(JobCompany job : results) {
			if(job.getTitle().contains(name) || job.getProfession().contains(name)) {
				jobs.add(job);
			}
		}
		return jobs;
	}
	
	public int getTotalPage() {
		String sql = "select count(*) from job where datediff(due_date, now()) > 0 and confirm=1";
		int totalJobs = jdbcTemplate.queryForObject(sql, Integer.class);
		return (int) Math.ceil((double)totalJobs/JOBS_PER_PAGE);
	}
	
//	void setAttributeJob(JobCompany job) {
//		String require = job.getJob_require();
//		String[] arrayRequire = require.split("\\.(?=[^.]*$)");
//		String requireResult = "";
//		for(String str : arrayRequire) {
//			requireResult = requireResult + str + ".\n";
//		}
// 		job.setJob_require(requireResult);
// 		
//		String interest = job.getInterest();
//		String[] arrayInterest = interest.split("\\.(?=[^.]*$)");
//		String interestResult = "";
//		for(String str : arrayInterest) {
//			interestResult = interestResult + str + ".\n";
//		}
//		job.setInterest(interestResult);
//	}
	
	void setDueDate(JobCompany job) {
		SimpleDateFormat inputFormatter = new SimpleDateFormat("yyyy/mm/dd");
        SimpleDateFormat outputFormatter = new SimpleDateFormat("dd/mm/yyyy");
        Date date = null;
		try {
			date = inputFormatter.parse(job.getDue_date());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String formattedDate = outputFormatter.format(date);
        job.setDue_date(formattedDate);
	}
	
	public List<JobCompany> getJobPerPage(Integer currentPage) {
		int offset = (currentPage - 1)*JOBS_PER_PAGE;
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) > 0 and confirm=1 order by j.job_id desc limit ? offset ?";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new Object[] {JOBS_PER_PAGE, offset},new int[] {java.sql.Types.INTEGER, java.sql.Types.INTEGER}, new JobCompanyRowMapper());
		if(jobs != null) {
			for(JobCompany job : jobs) {
				setDueDate(job);
			}
		}
		return jobs;
	}
	
	public List<JobCompany> findJobByNameOrProfession(Integer currentPage, String name) {
		int offset = (currentPage - 1)*JOBS_PER_PAGE;
		List<JobCompany> result = new ArrayList<>();
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) > 0 and confirm=1 and (j.title like concat('%',?,'%') or j.profession like concat('%',?,'%')) order by j.job_id desc";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new Object[] {name, name},new int[] {java.sql.Types.VARCHAR, java.sql.Types.VARCHAR}, new JobCompanyRowMapper());
		if(jobs != null) {
			int minIndex = Math.min(jobs.size(), offset + JOBS_PER_PAGE);
			for(int i = offset; i < minIndex; i++) {
				setDueDate(jobs.get(i));
				result.add(jobs.get(i));
			}
		}
		return result;
	}
	
	public int getTotalPageSearch(String name) {
		int totalPage = 0;
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) > 0 and confirm=1 and (j.title like concat('%',?,'%') or j.profession like concat('%',?,'%')) order by j.job_id desc";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new Object[] {name, name},new int[] {java.sql.Types.VARCHAR, java.sql.Types.VARCHAR}, new JobCompanyRowMapper());
		if(jobs != null) {
			totalPage = (int) Math.ceil((double)jobs.size()/JOBS_PER_PAGE);
		}
		return totalPage;
	}
	
	public List<JobCompany> getJobList() {
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) > 0 and confirm=1 order by j.job_id desc limit 10";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(JobCompany.class));
		if(jobs != null) {
			for(JobCompany job : jobs) {
				setDueDate(job);
			}
		}
		return jobs;
	}
	
	public List<JobCompany> getJobListPremium() {
	    String sql = "select j.*, c.company_name, c.image " +
	                 "from job as j " +
	                 "inner join company as c on j.comp_id = c.comp_id " +
	                 "where datediff(j.due_date, now()) > 0 " +
	                 "and j.confirm = 1 " +
	                 "and j.fee = 'premium' " +
	                 "order by j.job_id desc " +
	                 "limit 10";
	    List<JobCompany> jobs = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(JobCompany.class));
	    if (jobs != null) {
	        for (JobCompany job : jobs) {
	            setDueDate(job);
	        }
	    }
	    return jobs;
	}
	
	public List<JobCompany> getJobListNotConfirm() {
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) > 0 and confirm=0 order by j.job_id desc";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(JobCompany.class));
		if(jobs != null) {
			for(JobCompany job : jobs) {
				setDueDate(job);
			}
		}
		return jobs;
	}
	
	public List<JobCompany> getJobListExpire() {
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where datediff(j.due_date, now()) <= 0 order by j.job_id desc";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(JobCompany.class));
		if(jobs != null) {
			for(JobCompany job : jobs) {
				setDueDate(job);
			}
		}
		return jobs;
	}
	
	public List<JobCompany> getJobList(String username) {
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where c.contact_email=? and datediff(j.due_date, now()) > 0 order by j.job_id desc";
		List<JobCompany> jobs = jdbcTemplate.query(sql, new Object[] {username},new int[] {java.sql.Types.VARCHAR}, new JobCompanyRowMapper());
		if(jobs != null) {
			for(JobCompany job : jobs) {
				setDueDate(job);
			}
		}
		return jobs;
	}
	
	public void deleteJob(int jobId) {
		String sql = "delete from job where job_id=?";
		jdbcTemplate.update(sql, jobId);
	}
	
	public JobCompany findJobById(int jobId) {
		String sql = "select j.*, c.company_name, c.image from job as j inner join company as c on j.comp_id=c.comp_id where j.job_id=?";
		JobCompany job = jdbcTemplate.queryForObject(sql, new Object[] {jobId},new int[] {java.sql.Types.INTEGER}, new JobCompanyRowMapper());
		setDueDate(job);
		return job;
	}
	
	public void deleteJobExpire() {
		String sql = "delete from job where datediff(due_date, now()) <= 0";
		jdbcTemplate.update(sql);
	}
	
	public void confirmJob(int jobId) {
		String sql = "update job set confirm=1 where job_id=?";
		jdbcTemplate.update(sql, jobId);
	}
	
	public int saveJob(Job job) {
		String sql = "insert into job(title,description,job_require,interest,quantity,max_salary,min_salary,profession,due_date,confirm,city,comp_id, fee) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, job.getTitle(), job.getDescription(), job.getJobRequire(), job.getInterest(), job.getQuantity(),
				job.getMaxSalary(), job.getMinSalary(), job.getProfession(), job.getDueDate(), job.isConfirm(),job.getCity(), job.getCompId(), job.getFee());
	}
	/**
	 * @return the jobsPerPage
	 */
	public static Integer getJobsPerPage() {
		return JOBS_PER_PAGE;
	}
}