package controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.ApplyForm;
import bean.Company;
import bean.Job;
import bean.JobCompany;
import bean.JobProfile;
import bean.JobsInCompany;
import bean.Profile;
import bean.ProfileCV;
import bean.RegistrationForm;
import dao.CompanyRepository;
import dao.JobProfileRepository;
import dao.JobRepository;
import dao.ProfileRepository;
import dao.UserRepository;

@org.springframework.stereotype.Controller
@ComponentScan("dao")
@MultipartConfig
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int VISIBLE_PAGES = 5;
	@Autowired
	private JobRepository jobRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private JobProfileRepository jobProfileRepository;

	@Autowired
	private ProfileRepository profileRepository;
	
	/**
	 * redirect to home page
	 * @param isLoggedin
	 * @return ModelAndView object
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public ModelAndView homePage(@RequestParam(value = "loggedin", required = false) String isLoggedin,
                                 @RequestParam(value = "name", required = false) String name) {
        List<JobCompany> jobs = jobRepository.getJobList();
        List<JobCompany> jobs_premium = jobRepository.getJobListPremium();
        List<JobsInCompany> topCompanies = jobRepository.getTopCompanies();
		
        ModelAndView modelAndView;
        
        if (isLoggedin != null && isLoggedin.equals("employer")) {
            modelAndView = new ModelAndView("home_employer");
            modelAndView.addObject("joblist", jobs);
        	modelAndView.addObject("joblist_premium", jobs_premium);
            modelAndView.addObject("name", name);
            modelAndView.addObject("topCompanies", topCompanies);
        } 
        else if (isLoggedin != null && isLoggedin.equals("admin")) {
            modelAndView = new ModelAndView("home_admin");
            modelAndView.addObject("joblist", jobs);
        	modelAndView.addObject("joblist_premium", jobs_premium);
            modelAndView.addObject("name", name);
            modelAndView.addObject("topCompanies", topCompanies);
        }
        else if (isLoggedin != null && isLoggedin.equals("user")) {
            modelAndView = new ModelAndView("home_user");
            modelAndView.addObject("joblist", jobs);
        	modelAndView.addObject("joblist_premium", jobs_premium);
            modelAndView.addObject("name", name);
            modelAndView.addObject("topCompanies", topCompanies);
        }
        else {
        	modelAndView = new ModelAndView("home");
        	modelAndView.addObject("joblist", jobs);
        	modelAndView.addObject("joblist_premium", jobs_premium);
            modelAndView.addObject("topCompanies", topCompanies);
        }
        return modelAndView;
    }
	@RequestMapping(value = { "/aboutus" }, method = RequestMethod.GET)
	public ModelAndView aboutPage() {
		ModelAndView modelAndView = new ModelAndView("aboutus");
		return modelAndView;
	}
	/**
	 * redirect to login page
	 * @param user
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage(@RequestParam(value = "user", required = false) String user,
			@RequestParam(value = "success", required = false) String success) {
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("user", user);
		modelAndView.addObject("success", success);
		return modelAndView;
	}
	
	/**
	 * authorize user
	 * @param currentPage
	 * @param principal
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public ModelAndView loginSuccess(@RequestParam(value = "currentPage", required = false) Integer currentPage,
			Principal principal) {
		if (currentPage == null) {
			currentPage = 1;
		}

		String username = "";
		if (principal != null && principal.getName() != null) {
			username = principal.getName();
		}

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals("USER"))) {
			ModelAndView modelAndView = new ModelAndView("employee");
			setModelAndView(currentPage, username, modelAndView);
			modelAndView.addObject("user", "USER");
			return modelAndView;
		} else if (authentication.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals("ADMIN"))) {
			ModelAndView modelAndView = new ModelAndView("admin");
			List<JobCompany> listJobNotConfirm = jobRepository.getJobListNotConfirm();
			List<JobCompany> listJobExpire = jobRepository.getJobListExpire();
			modelAndView.addObject("listJobNotConfirm", listJobNotConfirm);
			modelAndView.addObject("listJobExpire", listJobExpire);
			modelAndView.addObject("name", username);
			return modelAndView;
		} else if (authentication.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals("EMPLOYER"))) {
			ModelAndView modelAndView = new ModelAndView("employer");
			List<JobCompany> listJobs = jobRepository.getJobList(username);
			modelAndView.addObject("listJobs", listJobs);
			modelAndView.addObject("name", username);
			return modelAndView;
		} else {
			return new ModelAndView("login");
		}
	}
	/**
	 * redirect to jobs page for admin and employer
	 * @param currentPage
	 * @param user
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/job", method = RequestMethod.GET)
	public ModelAndView getJobs(@RequestParam(value = "currentPage", required = false) Integer currentPage,
			@RequestParam(value = "user", required = false) String user,
			@RequestParam(value = "username", required = false) String username) {
		if (currentPage == null) {
			currentPage = 1;
		}

		ModelAndView modelAndView = new ModelAndView("jobs");
		setModelAndView(currentPage, username, modelAndView);
		modelAndView.addObject("user", user);
		return modelAndView;
	}

	private void setModelAndView(Integer currentPage, String username, ModelAndView modelAndView) {
		List<JobCompany> listJobs = jobRepository.getJobPerPage(currentPage);
		int totalPages = jobRepository.getTotalPage();
		int startPage = Math.max(currentPage - VISIBLE_PAGES / 2, 1);
		int endPage = Math.min(startPage + VISIBLE_PAGES - 1, totalPages);
		modelAndView.addObject("totalPages", totalPages);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("listJobs", listJobs);
		modelAndView.addObject("name", username);
	}
	

//	@RequestMapping(value = "/admin", method = RequestMethod.GET)
//	public String adminPage() {
//
//		return "admin";
//	}
	/**
	 * redirect to register page
	 * @param user
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage(@RequestParam(value = "user", required = false) String user,
			@RequestParam(value = "error", required = false) String error) {
		if (user.equals("USER")) {
			ModelAndView modelAndView = new ModelAndView("register-user");
			modelAndView.addObject("error",error);
			return modelAndView;
		} else if (user.equals("EMPLOYER")) {
			ModelAndView modelAndView = new ModelAndView("register-employer", "registrationForm", new RegistrationForm());
			modelAndView.addObject("error",error);
			return modelAndView;
		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	public boolean validate(String username) {
		// TODO Auto-generated method stub
		String regrexEmail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
		
		return username.matches(regrexEmail);
	}
	
	/**
	 * register for user
	 * @param username
	 * @param password
	 * @param repeatPassword
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/register-user", method = RequestMethod.POST)
	public ModelAndView doRegisterUser(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("repeatPassword") String repeatPassword) {
		if(!validate(username)) {
			ModelAndView modelAndView = new ModelAndView("redirect:/register");
			modelAndView.addObject("error", "Email không đúng.");
			modelAndView.addObject("user", "USER");
			return modelAndView;
		}
		if (!password.equals(repeatPassword)) {
			ModelAndView modelAndView = new ModelAndView("redirect:/register");
			modelAndView.addObject("error", "Password và repeat password khác nhau.");
			modelAndView.addObject("user", "USER");
			return modelAndView;
		}

		if (userRepository.findByUsername(username) != null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/register");
			modelAndView.addObject("error", "Email đã tồn tại.");
			modelAndView.addObject("user", "USER");
			return modelAndView;
		}

		ModelAndView modelAndView = new ModelAndView("redirect:/login");
		modelAndView.addObject("success", "Đăng ký thành công!");
		modelAndView.addObject("user", "USER");
		userRepository.saveUser(username, password, "USER");
		return modelAndView;

	}
	
	/**
	 * register for employer
	 * @param username
	 * @param password
	 * @param repeatPassword
	 * @return ModelAndView object
	 * @throws IOException 
	 */
	@RequestMapping(value = "/register-employer", method = RequestMethod.POST)
	public ModelAndView doRegisterEmployer(HttpServletRequest servletRequest, HttpServletResponse response,
			@ModelAttribute("registrationForm") RegistrationForm form) throws IOException {
		String username = form.getUsername();
		String password = form.getPassword();
		String repeatPassword = form.getRepeatPassword();
		String contactName = form.getContactName();
		String phone = form.getPhone();
		String companyName = form.getCompanyName();
		String address = form.getAddress();
		String city = form.getCity();
		
		if(!validate(username)) {
			ModelAndView modelAndView = new ModelAndView("redirect:/register");
			modelAndView.addObject("error", "Email không đúng.");
			modelAndView.addObject("user", "EMPLOYER");
			return modelAndView;
		}
		if (!password.equals(repeatPassword)) {
			ModelAndView modelAndView = new ModelAndView("redirect:/register");
			modelAndView.addObject("error", "Password và repeat password khác nhau.");
			modelAndView.addObject("user", "EMPLOYER");
			return modelAndView;
		}

		if (userRepository.findByUsername(username) != null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/register");
			modelAndView.addObject("error", "Email đã tồn tại.");
			modelAndView.addObject("user", "EMPLOYER");
			return modelAndView;
		}

		MultipartFile multipartFile = form.getImage();
		String fileName = null;
		if (multipartFile != null) {
			fileName = multipartFile.getOriginalFilename();
			File imageFile = new File(servletRequest.getServletContext().getRealPath("/resources/img"), fileName);
			System.out.println(imageFile.getAbsolutePath());
			try {
				multipartFile.transferTo(imageFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
			}
		}

		Company company = new Company(0, contactName, companyName, phone, address, fileName, city, username);
		ModelAndView modelAndView = new ModelAndView("redirect:/login");
		modelAndView.addObject("success", "Đăng kí Nhà tuyển dụng thành công!");
		modelAndView.addObject("user", "EMPLOYER");
		userRepository.saveEmployer(username, password, company, "EMPLOYER");
		return modelAndView;

	}
	/**
	 * delete job by employer
	 * @param jobId
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/employer-delete", method = RequestMethod.POST)
	public String deleteJobByEmployer(@RequestParam(value = "jobID", required = false) Integer jobId) {
		jobRepository.deleteJob(jobId);
		return "redirect:/loginSuccess";
	}
	
	/**
	 * delete expire job by employer
	 * @param jobId
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/admin-delete", method = RequestMethod.POST)
	public String deleteJobByAdmin() {
		jobRepository.deleteJobExpire();
		return "redirect:/loginSuccess";
	}
	
	/**
	 * confirm job by employer
	 * @param jobId
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String confirm(@RequestParam(value = "jobID", required = false) int jobId) {
		jobRepository.confirmJob(jobId);
		return "redirect:/loginSuccess";
	}
	
	/**
	 * redirect to recruitment page
	 * @param username
	 * @return  ModelAndView object
	 */
	@RequestMapping(value = "/recruitment", method = RequestMethod.GET)
	public ModelAndView recruitment(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "error", required = false) String error) {
		ModelAndView modelAndView = new ModelAndView("recruitment", "jobCompany", new JobCompany());
		modelAndView.addObject("username", username);
		modelAndView.addObject("success", success);
		modelAndView.addObject("error", error);
		return modelAndView;
	}
	
	/**
	 * recruit employee
	 * @param username
	 * @param jobCompany
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/recruitment", method = RequestMethod.POST)
	public ModelAndView doRecruitment(@RequestParam(value = "username", required = false) String username,
	                                 @ModelAttribute("jobCompany") JobCompany jobCompany) {
	    String title = jobCompany.getTitle();
	    String description = jobCompany.getDescription();
	    String jobRequire = jobCompany.getJob_require();
	    String interest = jobCompany.getInterest();
	    int quantity = jobCompany.getQuantity();
	    double maxSalary = jobCompany.getMax_salary();
	    double minSalary = jobCompany.getMin_salary();
	    String profession = jobCompany.getProfession();
	    String dueDate = transferDate(jobCompany.getDue_date());
	    boolean confirm = false;
	    String city = jobCompany.getCity();
	    String fee = jobCompany.getFee();
	    int compId = companyRepository.getCompId(username);
	    Job job = new Job(0, title, description, jobRequire, interest, quantity, maxSalary, minSalary, profession,
	            dueDate, confirm, city, compId, fee);
	    int result = jobRepository.saveJob(job);
	    ModelAndView modelAndView;

	    if (result > 0) {
	       
	            modelAndView = new ModelAndView("redirect:/recruitment");
	            modelAndView.addObject("success", "Lưu tin thành công! Vui lòng đợi xét duyệt!");
	            modelAndView.addObject("username", username);
	        
	    } else {
	        // Lưu tin không thành công
	        modelAndView = new ModelAndView("redirect:/recruitment");
	        modelAndView.addObject("error", "Lưu tin không thành công.");
	        modelAndView.addObject("username", username);
	    }

	    return modelAndView;
	}
	
	/**
	 * redirect to apply page
	 * @param jobId
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public ModelAndView apply(@RequestParam(value = "jobID", required = false) Integer jobId,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "error", required = false) String error) {
		ModelAndView modelAndView = new ModelAndView("apply", "applyForm", new ApplyForm());
		Profile profile = profileRepository.findProfileByUsername(username);
		if (profile != null) {
			modelAndView.addObject("profile", profile);
		}
		modelAndView.addObject("jobID", jobId);
		modelAndView.addObject("username", username);
		modelAndView.addObject("success", success);
		modelAndView.addObject("error", error);
		return modelAndView;
	}
	

	
	/**
	 * apply job for user
	 * @param username
	 * @param jobId
	 * @param servletRequest
	 * @param form
	 * @return ModelAndView object
	 * @throws IOException 
	 */
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public ModelAndView doApply(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "jobID", required = false) Integer jobId, HttpServletRequest servletRequest,
			HttpServletResponse response, @ModelAttribute("applyForm") ApplyForm form) throws IOException {
		String name = form.getName();
		String phone = form.getPhone();
		String address = form.getAddress();
		String sex = form.getSex();
		String dob = transferDate(form.getDob());

		MultipartFile multipartFile = form.getFileCV();
		String fileName = null;
		if (multipartFile != null) {
			fileName = multipartFile.getOriginalFilename();
			String uploadPathDir = servletRequest.getServletContext().getRealPath("/resources/file_cv/");
			File uploadDir = new File(uploadPathDir);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			File uploadFile = new File(uploadDir, fileName);
			System.out.println(uploadFile.getAbsolutePath());
			try {
				multipartFile.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
			}
		}
		
		ModelAndView modelAndView = new ModelAndView("redirect:/apply");
		Profile profile = profileRepository.findProfileByUsername(username);
		int result = 0;
		if (profile != null) {
			if (jobProfileRepository.findJobProfile(profile.getProf_id(), jobId) == null) {
				JobProfile jobProfile = new JobProfile(profile.getProf_id(), jobId, fileName);
				result = jobProfileRepository.saveJobPrifile(jobProfile);
				if (result > 0) {
					modelAndView.addObject("success", "Ứng tuyển thành công!");
				}
			} else {
				modelAndView.addObject("error", "Việc làm đã ứng tuyển!");
			}
		} else {
			Profile newProfile = new Profile(0, name, phone, address, sex, dob, username);
			result = profileRepository.saveProfile(newProfile, jobId, fileName);
			if (result > 0) {
				modelAndView.addObject("success", "Ứng tuyển thành công!");
			} else {
				modelAndView.addObject("error", "Ứng tuyển không thành công!");
			}
		}
		modelAndView.addObject("jobID", jobId);
		modelAndView.addObject("username", username);
		return modelAndView;
	}
	/**
	 * redirect to job detail page
	 * @param jobId
	 * @param username
	 * @param user
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam(value = "jobID", required = false) Integer jobId,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "user", required = false) String user) {
		ModelAndView modelAndView = new ModelAndView();
		if(user.equals("NONE")) {
			modelAndView.setViewName("job-detail1");
		}else {
			modelAndView.setViewName("job-detail");
		}
		JobCompany job = jobRepository.findJobById(jobId);
		modelAndView.addObject("job", job);
		modelAndView.addObject("username", username);
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	/**
	 * redirect to candidate page
	 * @param jobId
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/candidate", method = RequestMethod.GET)
	public ModelAndView candidate(@RequestParam(value = "jobID", required = false) Integer jobId,
			@RequestParam(value = "username", required = false) String username) {
		ModelAndView modelAndView = new ModelAndView("candidate");
		List<ProfileCV> profileCVs = profileRepository.findProfileByJobId(jobId);
		modelAndView.addObject("profileCVs", profileCVs);
		modelAndView.addObject("username", username);
		return modelAndView;
	}
	
	/**
	 * redirect to search page
	 * @param search
	 * @param currentPage
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value = "search", required = false) String search,
			@RequestParam(value = "currentPage", required = false) Integer currentPage,
			@RequestParam(value = "username", required = false) String username) {
		if (currentPage == null) {
			currentPage = 1;
		}
		ModelAndView modelAndView = new ModelAndView("search");
		List<JobCompany> listJobs = jobRepository.findJobByNameOrProfession(currentPage, search);
		int totalPages = jobRepository.getTotalPageSearch(search);
		int startPage = Math.max(currentPage - VISIBLE_PAGES / 2, 1);
		int endPage = Math.min(startPage + VISIBLE_PAGES - 1, totalPages);
		modelAndView.addObject("totalPages", totalPages);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("listJobs", listJobs);
		modelAndView.addObject("name", username);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	/**
	 * redirect to forgot password page
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public ModelAndView forgotPassword(@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "error", required = false) String error) {
		ModelAndView modelAndView = new ModelAndView("forgotpassword");
		modelAndView.addObject("success", success);
		modelAndView.addObject("error", error);
		return modelAndView;
	}
	/**
	 * handle forgot password feature
	 * @param username
	 * @param request
	 * @return ModelAndView object
	 * @throws IOException 
	 */
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public ModelAndView doForgotPassword(@RequestParam(value = "username", required = false) String username,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
		if (userRepository.findByUsername(username) == null) {
			modelAndView.addObject("error", "Email không đúng.");
		}else if(username.equals("")) {
			modelAndView.addObject("error", "Email không đúng.");
		}
		else {
			modelAndView.addObject("success", "Email đã được gửi.");
			String senderEmail = "tranvanbaoduy2012@gmail.com";
			String senderPassword = System.getenv("EMAIL_SENDER_PASSWORD");
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");

			Session mailSession = Session.getInstance(properties, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(senderEmail, senderPassword);
				}
			});

			MimeMessage message = new MimeMessage(mailSession);

			try {
				message.setFrom(new InternetAddress(senderEmail));
				message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(username));
				message.setSubject("Create new password");
				String createPasswordLink = "http://35.176.141.75:82" + request.getContextPath()
						+ "/restore-password?username=" + username;
				String emailContent = "Please access path below to restore password:\n" + createPasswordLink
						+ "\n\nBest regards!";
				message.setText(emailContent);
				Transport.send(message);
				modelAndView.addObject("success", "Đã gửi email khôi phục mật khẩu. Vui lòng kiểm tra!");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
			}
		}
		return modelAndView;
	}
	
	/**
	 * redirect to restore password page
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/restore-password", method = RequestMethod.GET)
	public ModelAndView restorePassword(@RequestParam(value = "username", required = false) String username) {
		ModelAndView modelAndView = new ModelAndView("restorepassword", "username", username);
		return modelAndView;
	}
	/**
	 * handle restore password feature
	 * @param username
	 * @param password
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/restore-password", method = RequestMethod.POST)
	public ModelAndView doRestorePassword(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password) {
		if (password == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/restorepassword");
			modelAndView.addObject("error", "Vui lòng điền mật khẩu.");
			return modelAndView;
		} else {
			if (userRepository.updatePassword(username, password) > 0) {
				String role = userRepository.getRoleByUsername(username);
				ModelAndView modelAndView = new ModelAndView("redirect:/login");
				if(role.equals("USER")) {
					modelAndView.addObject("user", "USER");
				}else if (role.equals("EMPLOYER")) {
					modelAndView.addObject("user", "EMPLOYER");
				}
				modelAndView.addObject("success", "Tạo mật khẩu thành công!");
				return modelAndView;
			} else {
				ModelAndView modelAndView = new ModelAndView("redirect:/restorepassword");
				modelAndView.addObject("error", "Tạo mật khẩu thất bại!");
				return modelAndView;
			}
		}
	}
	
	/**
	 * redirect to profile page
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/profile-manager", method = RequestMethod.GET)
	public ModelAndView profile(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "error", required = false) String error) {
		ModelAndView modelAndView = new ModelAndView("profile");
		modelAndView.addObject("success", success);
		modelAndView.addObject("error", error);
		modelAndView.addObject("username", username);
		Profile profile = profileRepository.findProfileByUsername(username);
		if (profile != null) {
			modelAndView.addObject("profile", profile);
		} else {
			modelAndView.addObject("profile", new Profile());
		}
		return modelAndView;
	}
	
	/**
	 * save profile
	 * @param profile
	 * @param username
	 * @return ModelAndView object
	 */
	@RequestMapping(value = "/profile-manager", method = RequestMethod.POST)
	public ModelAndView doProfile(@ModelAttribute(value = "profile") Profile profile,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "userProf", required = false) String userProf) {

		ModelAndView modelAndView = new ModelAndView("redirect:/profile-manager");
		modelAndView.addObject("username", username);
		if (!userProf.equals("")) {
			modelAndView.addObject("error", "Hồ sơ đã có trong danh sách.");
		} else {
			profile.setUser_prof(username);
			int result = profileRepository.saveProfile(profile);
			if (result > 0) {
				modelAndView.addObject("success", "Lưu hồ sơ thành công!");
			} else {
				modelAndView.addObject("error", "Lưu hồ sơ thất bại.");
			}
		}
		return modelAndView;
	}

	String transferDate(String dateStr) {
		SimpleDateFormat inputFormatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat outputFormatter = new SimpleDateFormat("yyyy/MM/dd");
		Date date = null;
		try {
			date = inputFormatter.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return outputFormatter.format(date);
	}
}