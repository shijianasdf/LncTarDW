package beans;

public class sampleannotation {
	private String sampleid;
	private String cancertype;
	private String sampletype;
	
	public String getSampleid() {
		return sampleid;
	}

	public void setSampleid(String sampleid) {
		this.sampleid = sampleid;
	}

	public String getCancertype() {
		return cancertype;
	}

	public void setCancertype(String cancertype) {
		this.cancertype = cancertype;
	}

	public String getSampletype() {
		return sampletype;
	}

	public void setSampletype(String sampletype) {
		this.sampletype = sampletype;
	}

	public sampleannotation(){
		
	}

	public sampleannotation(String sampleid, String cancertype, String sampletype) {
		this.sampleid = sampleid;
		this.cancertype = cancertype;
		this.sampletype = sampletype;
	}
	
}
