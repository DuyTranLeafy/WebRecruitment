package bean;

public class Job {
	private int jobId;
	private String title;
	private String description;
	private String jobRequire;
	private String interest;
	private int quantity;
	private double maxSalary;
	private double minSalary;
	private String profession;
	private String dueDate;
	private boolean confirm;
	private String city;
	private int compId;
	private String fee;
	
	
	public Job() {
	}

	
	public Job(int jobId, String title, String description, String jobRequire, String interest, int quantity,
			double maxSalary, double minSalary, String profession, String dueDate, boolean confirm, String city,
			int compId, String fee) {
		super();
		this.jobId = jobId;
		this.title = title;
		this.description = description;
		this.jobRequire = jobRequire;
		this.interest = interest;
		this.quantity = quantity;
		this.maxSalary = maxSalary;
		this.minSalary = minSalary;
		this.profession = profession;
		this.dueDate = dueDate;
		this.confirm = confirm;
		this.city = city;
		this.compId = compId;
		this.fee = fee;
	}


	/**
	 * @return the jobId
	 */
	public int getJobId() {
		return jobId;
	}


	/**
	 * @param jobId the jobId to set
	 */
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	public String getFee() {
		return fee;
	}


	/**
	 * @param jobId the jobId to set
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
	 * @return the jobRequire
	 */
	public String getJobRequire() {
		return jobRequire;
	}


	/**
	 * @param jobRequire the jobRequire to set
	 */
	public void setJobRequire(String jobRequire) {
		this.jobRequire = jobRequire;
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
	 * @return the maxSalary
	 */
	public double getMaxSalary() {
		return maxSalary;
	}


	/**
	 * @param maxSalary the maxSalary to set
	 */
	public void setMaxSalary(double maxSalary) {
		this.maxSalary = maxSalary;
	}


	/**
	 * @return the minSalary
	 */
	public double getMinSalary() {
		return minSalary;
	}


	/**
	 * @param minSalary the minSalary to set
	 */
	public void setMinSalary(double minSalary) {
		this.minSalary = minSalary;
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
	 * @return the dueDate
	 */
	public String getDueDate() {
		return dueDate;
	}


	/**
	 * @param dueDate the dueDate to set
	 */
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
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
	 * @return the compId
	 */
	public int getCompId() {
		return compId;
	}


	/**
	 * @param compId the compId to set
	 */
	public void setCompId(int compId) {
		this.compId = compId;
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