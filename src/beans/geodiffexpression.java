package beans;

public class geodiffexpression {
	private String id;
	private String rid;
	private String target;
	private String gseid;
	private String tmeanexp;
	private String tlog2foldchange;
	private String tpadj;
	private String regulator;
	private String rmeanexp;
	private String rlog2foldchange;
	private String rpadj;
	private String control;
	private String cases;
	
	public geodiffexpression(){
		
	}
	
	public geodiffexpression(String id, String rid, String target, String gseid, String tmeanexp,
			String tlog2foldchange, String tpadj, String regulator, String rmeanexp, String rlog2foldchange,
			String rpadj, String control, String cases) {
		this.id = id;
		this.rid = rid;
		this.target = target;
		this.gseid = gseid;
		this.tmeanexp = tmeanexp;
		this.tlog2foldchange = tlog2foldchange;
		this.tpadj = tpadj;
		this.regulator = regulator;
		this.rmeanexp = rmeanexp;
		this.rlog2foldchange = rlog2foldchange;
		this.rpadj = rpadj;
		this.control = control;
		this.cases = cases;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getTmeanexp() {
		return tmeanexp;
	}

	public void setTmeanexp(String tmeanexp) {
		this.tmeanexp = tmeanexp;
	}

	public String getTlog2foldchange() {
		return tlog2foldchange;
	}

	public void setTlog2foldchange(String tlog2foldchange) {
		this.tlog2foldchange = tlog2foldchange;
	}

	public String getTpadj() {
		return tpadj;
	}

	public void setTpadj(String tpadj) {
		this.tpadj = tpadj;
	}

	public String getRegulator() {
		return regulator;
	}

	public void setRegulator(String regulator) {
		this.regulator = regulator;
	}

	public String getRmeanexp() {
		return rmeanexp;
	}

	public void setRmeanexp(String rmeanexp) {
		this.rmeanexp = rmeanexp;
	}

	public String getRlog2foldchange() {
		return rlog2foldchange;
	}

	public void setRlog2foldchange(String rlog2foldchange) {
		this.rlog2foldchange = rlog2foldchange;
	}

	public String getRpadj() {
		return rpadj;
	}

	public void setRpadj(String rpadj) {
		this.rpadj = rpadj;
	}

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
	public String getGseid() {
		return gseid;
	}
	public void setGseid(String gseid) {
		this.gseid = gseid;
	}
	public String getControl() {
		return control;
	}
	public void setControl(String control) {
		this.control = control;
	}
	public String getCases() {
		return cases;
	}
	public void setCases(String cases) {
		this.cases = cases;
	}
	
}
