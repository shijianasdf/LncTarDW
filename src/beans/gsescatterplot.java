package beans;

public class gsescatterplot {
	private	int	id;
	private	String	rid;
	private	String	regulator;
	private	String	target;
	private String  gseid;
	private String  scatterdata;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRegulator() {
		return regulator;
	}
	public void setRegulator(String regulator) {
		this.regulator = regulator;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getGseid() {
		return gseid;
	}
	public void setGseid(String gseid) {
		this.gseid = gseid;
	}
	
	public String getScatterdata() {
		return scatterdata;
	}
	public void setScatterdata(String scatterdata) {
		this.scatterdata = scatterdata;
	}
	
	public gsescatterplot(String regulator, String target, String gseid, String scatterdata) {
		this.regulator = regulator;
		this.target = target;
		this.gseid = gseid;
		this.scatterdata = scatterdata;
	}
	
	public gsescatterplot(int id, String rid, String regulator, String target, String gseid, String scatterdata) {
		this.id = id;
		this.rid = rid;
		this.regulator = regulator;
		this.target = target;
		this.gseid = gseid;
		this.scatterdata = scatterdata;
	}
	public gsescatterplot(){
		
	}
	
}
