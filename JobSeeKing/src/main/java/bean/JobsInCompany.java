package bean;

public class JobsInCompany {
    private int comp_id;
    private String image;
    private String company_name;
    private int job_post_count;

    // Getters and Setters
    public String getCompanyName() {
        return company_name;
    }

    public void setCompanyName(String company_name) {
        this.company_name = company_name;
    }

    public int getJobPostCount() {
        return job_post_count;
    }

    public void setJobPostCount(int jobPostCount) {
        this.job_post_count = jobPostCount;
    }

    public int getComp_id() {
        return comp_id;
    }

    public void setComp_id(int comp_id) {
        this.comp_id = comp_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
