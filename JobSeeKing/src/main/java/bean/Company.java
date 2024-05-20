package bean;

public class Company {
	private int comp_id;
	private String contact_name;
	private String company_name;
	private String phone;
	private String address;
	private String image;
	private String city;
	private String contact_email;
	
	public Company() {
		super();
	}

	public Company(int comp_id, String contact_name, String company_name, String phone, String address, String image,
			String city, String contact_email) {
		super();
		this.comp_id = comp_id;
		this.contact_name = contact_name;
		this.company_name = company_name;
		this.phone = phone;
		this.address = address;
		this.image = image;
		this.city = city;
		this.contact_email = contact_email;
	}

	/**
	 * @return the comp_id
	 */
	public int getComp_id() {
		return comp_id;
	}

	/**
	 * @param comp_id the comp_id to set
	 */
	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}

	/**
	 * @return the contact_name
	 */
	public String getContact_name() {
		return contact_name;
	}

	/**
	 * @param contact_name the contact_name to set
	 */
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
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

	/**
	 * @return the contact_email
	 */
	public String getContact_email() {
		return contact_email;
	}

	/**
	 * @param contact_email the contact_email to set
	 */
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
}