package beans;

public class geodiffexpressedboxplot {
	private String id;
	private String rid;
	private String type;
	private String genename;
	private String cancer;
	private String normal;
	private String yrange;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
    
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCancer() {
		return cancer;
	}
	public void setCancer(String cancer) {
		this.cancer = cancer;
	}
	public String getNormal() {
		return normal;
	}
	public void setNormal(String normal) {
		this.normal = normal;
	}
	public geodiffexpressedboxplot(){
		
	}
	
	public String getGenename() {
		return genename;
	}
	public void setGenename(String genename) {
		this.genename = genename;
	}
    
	public String getYrange() {
		return yrange;
	}
	public void setYrange(String yrange) {
		this.yrange = yrange;
	}
	public geodiffexpressedboxplot(String id, String rid, String type, String genename, String cancer, String normal,
			String yrange) {
		this.id = id;
		this.rid = rid;
		this.type = type;
		this.genename = genename;
		this.cancer = cancer;
		this.normal = normal;
		this.yrange = yrange;
	}
	

    
    

	
}
