package bean;

public class Role {
	private int role_id;
	private String username;
	private String role_desc;
	
	public Role(int role_id, String username, String role_desc) {
		super();
		this.role_id = role_id;
		this.username = username;
		this.role_desc = role_desc;
	}
	/**
	 * @return the role_id
	 */
	public int getRole_id() {
		return role_id;
	}
	/**
	 * @param role_id the role_id to set
	 */
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the role_desc
	 */
	public String getRole_desc() {
		return role_desc;
	}
	/**
	 * @param role_desc the role_desc to set
	 */
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
}