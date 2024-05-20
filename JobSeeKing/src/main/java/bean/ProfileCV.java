package bean;

public class ProfileCV {
	private int prof_id;
	private String name;
	private String phone;
	private String address;
	private String sex;
	private String dob;
	private String user_prof;
	private String file_cv;
	
	public ProfileCV() {
		super();
	}

	public ProfileCV(int prof_id, String name, String phone, String address, String sex, String dob, String user_prof,
			String file_cv){
		super();
		this.prof_id = prof_id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.sex = sex;
		this.dob = dob;
		this.user_prof = user_prof;
		this.file_cv = file_cv;
	}

	/**
	 * @return the prof_id
	 */
	public int getProf_id() {
		return prof_id;
	}

	/**
	 * @param prof_id the prof_id to set
	 */
	public void setProf_id(int prof_id) {
		this.prof_id = prof_id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the dob
	 */
	public String getDob() {
		return dob;
	}

	/**
	 * @param dob the dob to set
	 */
	public void setDob(String dob) {
		this.dob = dob;
	}

	/**
	 * @return the user_prof
	 */
	public String getUser_prof() {
		return user_prof;
	}

	/**
	 * @param user_prof the user_prof to set
	 */
	public void setUser_prof(String user_prof) {
		this.user_prof = user_prof;
	}

	/**
	 * @return the file_cv
	 */
	public String getFile_cv() {
		return file_cv;
	}

	/**
	 * @param file_cv the file_cv to set
	 */
	public void setFile_cv(String file_cv) {
		this.file_cv = file_cv;
	}
}
