package bean;

public class JobCompany {
	private int job_id;
	private String title;
	private String description;
	private String job_require;
	private String interest;
	private int quantity;
	private Double max_salary;
	private Double min_salary;
	private String profession;
	private String due_date;
	private boolean confirm;
	private String company_name;
	private String image;
	private String city;
	private String fee;
	
	public JobCompany() {
		super();
	}

	public JobCompany(int job_id, String title, String description, String job_require, String interest, int quantity,
			Double max_salary, Double min_salary, String profession, String due_date, boolean confirm,
			String company_name, String image, String city, String fee) {
		super();
		this.job_id = job_id;
		this.title = title;
		this.description = description;
		this.job_require = job_require;
		this.interest = interest;
		this.quantity = quantity;
		this.max_salary = max_salary;
		this.min_salary = min_salary;
		this.profession = profession;
		this.due_date = due_date;
		this.confirm = confirm;
		this.company_name = company_name;
		this.image = image;
		this.city = city;
		this.fee = fee;
	}

	/**
	 * @return the job_id
	 */
	public int getJob_id() {
		return job_id;
	}

	/**
	 * @param job_id the job_id to set
	 */
	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}
	
	public String getFee() {
		return fee;
	}

	/**
	 * @param job_id the job_id to set
	 */
	public void setFee(String fee) {
		this.fee = fee;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the job_require
	 */
	public String getJob_require() {
		return job_require;
	}

	/**
	 * @param job_require the job_require to set
	 */
	public void setJob_require(String job_require) {
		this.job_require = job_require;
	}

	/**
	 * @return the interest
	 */
	public String getInterest() {
		return interest;
	}

	/**
	 * @param interest the interest to set
	 */
	public void setInterest(String interest) {
		this.interest = interest;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the max_salary
	 */
	public Double getMax_salary() {
		return max_salary;
	}

	/**
	 * @param max_salary the max_salary to set
	 */
	public void setMax_salary(Double max_salary) {
		this.max_salary = max_salary;
	}

	/**
	 * @return the min_salary
	 */
	public Double getMin_salary() {
		return min_salary;
	}

	/**
	 * @param min_salary the min_salary to set
	 */
	public void setMin_salary(Double min_salary) {
		this.min_salary = min_salary;
	}

	/**
	 * @return the profession
	 */
	public String getProfession() {
		return profession;
	}

	/**
	 * @param profession the profession to set
	 */
	public void setProfession(String profession) {
		this.profession = profession;
	}

	/**
	 * @return the due_date
	 */
	public String getDue_date() {
		return due_date;
	}

	/**
	 * @param due_date the due_date to set
	 */
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	/**
	 * @return the confirm
	 */
	public boolean isConfirm() {
		return confirm;
	}

	/**
	 * @param confirm the confirm to set
	 */
	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	/**
	 * @return the company_name
	 */
	public String getCompany_name() {
		return company_name;
	}

	/**
	 * @param company_name the company_name to set
	 */
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
}