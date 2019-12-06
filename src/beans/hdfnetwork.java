package beans;

public class hdfnetwork {
	private String rid;
	private String diseasename;
	private String regulator;
	private String regulatorentrezid;
	private String regulatorensembleid;
	private String regulatoraliases;
	private String target;
	private String targetentrezid;
	private String targetensembleid;
	private String targetaliases;
	private String regulatorymechanism;
	private String influencedfunction;
	private String drugs;
	private String searchregulatorymechanism;
	private String diseasecategory;
	private String diseasename2;
	
	public String getRegulatorentrezid() {
		return regulatorentrezid;
	}
	public void setRegulatorentrezid(String regulatorentrezid) {
		this.regulatorentrezid = regulatorentrezid;
	}
	public String getRegulatorensembleid() {
		return regulatorensembleid;
	}
	public void setRegulatorensembleid(String regulatorensembleid) {
		this.regulatorensembleid = regulatorensembleid;
	}
	public String getRegulatoraliases() {
		return regulatoraliases;
	}
	public void setRegulatoraliases(String regulatoraliases) {
		this.regulatoraliases = regulatoraliases;
	}
	public String getTargetentrezid() {
		return targetentrezid;
	}
	public void setTargetentrezid(String targetentrezid) {
		this.targetentrezid = targetentrezid;
	}
	public String getTargetensembleid() {
		return targetensembleid;
	}
	public void setTargetensembleid(String targetensembleid) {
		this.targetensembleid = targetensembleid;
	}
	public String getTargetaliases() {
		return targetaliases;
	}
	public void setTargetaliases(String targetaliases) {
		this.targetaliases = targetaliases;
	}
	public String getSearchregulatorymechanism() {
		return searchregulatorymechanism;
	}
	public void setSearchregulatorymechanism(String searchregulatorymechanism) {
		this.searchregulatorymechanism = searchregulatorymechanism;
	}
	public String getDiseasecategory() {
		return diseasecategory;
	}
	public void setDiseasecategory(String diseasecategory) {
		this.diseasecategory = diseasecategory;
	}
	public String getDiseasename2() {
		return diseasename2;
	}
	public void setDiseasename2(String diseasename2) {
		this.diseasename2 = diseasename2;
	}
	public String getRid(){
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getDiseasename() {
		return diseasename;
	}
	public void setDiseasename(String diseasename) {
		this.diseasename = diseasename;
	}
	public String getRegulator() {
		return regulator;
	}
	public void setRegulator(String regulator) {
		this.regulator = regulator;
	}
	public String getRegulatorymechanism() {
		return regulatorymechanism;
	}
	public void setRegulatorymechanism(String regulatorymechanism) {
		this.regulatorymechanism = regulatorymechanism;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getInfluencedfunction() {
		return influencedfunction;
	}
	public void setInfluencedfunction(String influencedfunction) {
		this.influencedfunction = influencedfunction;
	}
	public String getDrugs() {
		return drugs;
	}
	public void setDrugs(String drugs) {
		this.drugs = drugs;
	}
	public hdfnetwork(){
		
	}
	public hdfnetwork(String rid, String diseasename, String regulator, String regulatorentrezid,
			String regulatorensembleid, String regulatoraliases, String target, String targetentrezid,
			String targetensembleid, String targetaliases, String regulatorymechanism, String influencedfunction,
			String drugs, String searchregulatorymechanism, String diseasecategory, String diseasename2) {
		this.rid = rid;
		this.diseasename = diseasename;
		this.regulator = regulator;
		this.regulatorentrezid = regulatorentrezid;
		this.regulatorensembleid = regulatorensembleid;
		this.regulatoraliases = regulatoraliases;
		this.target = target;
		this.targetentrezid = targetentrezid;
		this.targetensembleid = targetensembleid;
		this.targetaliases = targetaliases;
		this.regulatorymechanism = regulatorymechanism;
		this.influencedfunction = influencedfunction;
		this.drugs = drugs;
		this.searchregulatorymechanism = searchregulatorymechanism;
		this.diseasecategory = diseasecategory;
		this.diseasename2 = diseasename2;
	}
	
	public hdfnetwork(String diseasename, String regulator, String regulatorymechanism,String target, 
			          String influencedfunction, String drugs){
		this.diseasename = diseasename;
		this.regulator = regulator;
		this.regulatorymechanism = regulatorymechanism;
		this.target = target;
		this.influencedfunction = influencedfunction;
		this.drugs = drugs;
	}
	
	
	
	
	
}
