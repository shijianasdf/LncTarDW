package beans;

import java.sql.Timestamp;

public class submit {
	   private int id;
	   private String diseasename;
	   private String regulator;
	   private String target;
	   private String regulatorymechanism;
	   private String regulationdiretion;
	   private String pubmedid;
	   private String evidence;
	   private String email;
	   private String drug;
	   private String influencedfunction;
	   private String expressionpattern;
	   private Timestamp submittime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getRegulatorymechanism() {
		return regulatorymechanism;
	}
	public void setRegulatorymechanism(String regulatorymechanism) {
		this.regulatorymechanism = regulatorymechanism;
	}
	public String getRegulationdiretion() {
		return regulationdiretion;
	}
	public void setRegulationdiretion(String regulationdiretion) {
		this.regulationdiretion = regulationdiretion;
	}
	public String getPubmedid() {
		return pubmedid;
	}
	public void setPubmedid(String pubmedid) {
		this.pubmedid = pubmedid;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDrug() {
		return drug;
	}
	public void setDrug(String drug) {
		this.drug = drug;
	}
	public String getInfluencedfunction() {
		return influencedfunction;
	}
	public void setInfluencedfunction(String influencedfunction) {
		this.influencedfunction = influencedfunction;
	}
	public String getExpressionpattern() {
		return expressionpattern;
	}
	public void setExpressionpattern(String expressionpattern) {
		this.expressionpattern = expressionpattern;
	}
	
	public Timestamp getSubmittime() {
		return submittime;
	}
	public void setSubmittime(Timestamp submittime) {
		this.submittime = submittime;
	}
	public submit(int id, String diseasename, String regulator, String target, String regulatorymechanism,
			String regulationdiretion, String pubmedid, String evidence, String email, String drug,
			String influencedfunction, String expressionpattern) {
		this.id = id;
		this.diseasename = diseasename;
		this.regulator = regulator;
		this.target = target;
		this.regulatorymechanism = regulatorymechanism;
		this.regulationdiretion = regulationdiretion;
		this.pubmedid = pubmedid;
		this.evidence = evidence;
		this.email = email;
		this.drug = drug;
		this.influencedfunction = influencedfunction;
		this.expressionpattern = expressionpattern;
	}
	public submit(String diseasename, String regulator, String target, String regulatorymechanism,
			String regulationdiretion, String pubmedid, String evidence, String email, String drug,
			String influencedfunction, String expressionpattern) {
		this.diseasename = diseasename;
		this.regulator = regulator;
		this.target = target;
		this.regulatorymechanism = regulatorymechanism;
		this.regulationdiretion = regulationdiretion;
		this.pubmedid = pubmedid;
		this.evidence = evidence;
		this.email = email;
		this.drug = drug;
		this.influencedfunction = influencedfunction;
		this.expressionpattern = expressionpattern;
	}
	public submit(){
		
	}   
	
}
