package bean;

public class JobProfile {
	private int profId;
	private int jobId;
	private String fileCv;
	
	public JobProfile() {
		super();
	}

	public JobProfile(int profId, int jobId, String fileCv) {
		super();
		this.profId = profId;
		this.jobId = jobId;
		this.fileCv = fileCv;
	}

	/**
	 * @return the profId
	 */
	public int getProfId() {
		return profId;
	}

	/**
	 * @param profId the profId to set
	 */
	public void setProfId(int profId) {
		this.profId = profId;
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

	/**
	 * @return the fileCv
	 */
	public String getFileCv() {
		return fileCv;
	}

	/**
	 * @param fileCv the fileCv to set
	 */
	public void setFileCv(String fileCv) {
		this.fileCv = fileCv;
	}
}
