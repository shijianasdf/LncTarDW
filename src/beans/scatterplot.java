package beans;

public class scatterplot {
	private	String	rid	;
	private	String	regulator	;
	private	String	target	;
	private	String	acc	;
	private	String	blca	;
	private	String	brca	;
	private	String	cesc	;
	private	String	chol	;
	private	String	coad	;
	private	String	dlbc	;
	private	String	esca	;
	private	String	gbm	;
	private	String	hnsc	;
	private	String	kich	;
	private	String	kirc	;
	private	String	kirp	;
	private	String	laml	;
	private	String	lgg	;
	private	String	lihc	;
	private	String	luad	;
	private	String	lusc	;
	private	String	meso	;
	private	String	ov	;
	private	String	paad	;
	private	String	pcpg	;
	private	String	prad	;
	private	String	read	;
	private	String	sarc	;
	private	String	skcm	;
	private	String	stad	;
	private	String	tgct	;
	private	String	thca	;
	private	String	thym	;
	private	String	ucec	;
	private	String	ucs	;
	private	String	uvm	;
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
	public String getAcc() {
		return acc;
	}
	public void setAcc(String acc) {
		this.acc = acc;
	}
	public String getBlca() {
		return blca;
	}
	public void setBlca(String blca) {
		this.blca = blca;
	}
	public String getBrca() {
		return brca;
	}
	public void setBrca(String brca) {
		this.brca = brca;
	}
	public String getCesc() {
		return cesc;
	}
	public void setCesc(String cesc) {
		this.cesc = cesc;
	}
	public String getChol() {
		return chol;
	}
	public void setChol(String chol) {
		this.chol = chol;
	}
	public String getCoad() {
		return coad;
	}
	public void setCoad(String coad) {
		this.coad = coad;
	}
	public String getDlbc() {
		return dlbc;
	}
	public void setDlbc(String dlbc) {
		this.dlbc = dlbc;
	}
	public String getEsca() {
		return esca;
	}
	public void setEsca(String esca) {
		this.esca = esca;
	}
	public String getGbm() {
		return gbm;
	}
	public void setGbm(String gbm) {
		this.gbm = gbm;
	}
	public String getHnsc() {
		return hnsc;
	}
	public void setHnsc(String hnsc) {
		this.hnsc = hnsc;
	}
	public String getKich() {
		return kich;
	}
	public void setKich(String kich) {
		this.kich = kich;
	}
	public String getKirc() {
		return kirc;
	}
	public void setKirc(String kirc) {
		this.kirc = kirc;
	}
	public String getKirp() {
		return kirp;
	}
	public void setKirp(String kirp) {
		this.kirp = kirp;
	}
	public String getLaml() {
		return laml;
	}
	public void setLaml(String laml) {
		this.laml = laml;
	}
	public String getLgg() {
		return lgg;
	}
	public void setLgg(String lgg) {
		this.lgg = lgg;
	}
	public String getLihc() {
		return lihc;
	}
	public void setLihc(String lihc) {
		this.lihc = lihc;
	}
	public String getLuad() {
		return luad;
	}
	public void setLuad(String luad) {
		this.luad = luad;
	}
	public String getLusc() {
		return lusc;
	}
	public void setLusc(String lusc) {
		this.lusc = lusc;
	}
	public String getMeso() {
		return meso;
	}
	public void setMeso(String meso) {
		this.meso = meso;
	}
	public String getOv() {
		return ov;
	}
	public void setOv(String ov) {
		this.ov = ov;
	}
	public String getPaad() {
		return paad;
	}
	public void setPaad(String paad) {
		this.paad = paad;
	}
	public String getPcpg() {
		return pcpg;
	}
	public void setPcpg(String pcpg) {
		this.pcpg = pcpg;
	}
	public String getPrad() {
		return prad;
	}
	public void setPrad(String prad) {
		this.prad = prad;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getSarc() {
		return sarc;
	}
	public void setSarc(String sarc) {
		this.sarc = sarc;
	}
	public String getSkcm() {
		return skcm;
	}
	public void setSkcm(String skcm) {
		this.skcm = skcm;
	}
	public String getStad() {
		return stad;
	}
	public void setStad(String stad) {
		this.stad = stad;
	}
	public String getTgct() {
		return tgct;
	}
	public void setTgct(String tgct) {
		this.tgct = tgct;
	}
	public String getThca() {
		return thca;
	}
	public void setThca(String thca) {
		this.thca = thca;
	}
	public String getThym() {
		return thym;
	}
	public void setThym(String thym) {
		this.thym = thym;
	}
	public String getUcec() {
		return ucec;
	}
	public void setUcec(String ucec) {
		this.ucec = ucec;
	}
	public String getUcs() {
		return ucs;
	}
	public void setUcs(String ucs) {
		this.ucs = ucs;
	}
	public String getUvm() {
		return uvm;
	}
	public void setUvm(String uvm) {
		this.uvm = uvm;
	}
	public scatterplot(){
		
	}
	public scatterplot(String regulator, String target, String acc){
		this.regulator = regulator;
		this.target = target;
		this.acc = acc;
	}
	public scatterplot(String rid, String regulator, String target, String acc, String blca, String brca, String cesc,
			String chol, String coad, String dlbc, String esca, String gbm, String hnsc, String kich, String kirc,
			String kirp, String laml, String lgg, String lihc, String luad, String lusc, String meso, String ov,
			String paad, String pcpg, String prad, String read, String sarc, String skcm, String stad, String tgct,
			String thca, String thym, String ucec, String ucs, String uvm) {
		this.rid = rid;
		this.regulator = regulator;
		this.target = target;
		this.acc = acc;
		this.blca = blca;
		this.brca = brca;
		this.cesc = cesc;
		this.chol = chol;
		this.coad = coad;
		this.dlbc = dlbc;
		this.esca = esca;
		this.gbm = gbm;
		this.hnsc = hnsc;
		this.kich = kich;
		this.kirc = kirc;
		this.kirp = kirp;
		this.laml = laml;
		this.lgg = lgg;
		this.lihc = lihc;
		this.luad = luad;
		this.lusc = lusc;
		this.meso = meso;
		this.ov = ov;
		this.paad = paad;
		this.pcpg = pcpg;
		this.prad = prad;
		this.read = read;
		this.sarc = sarc;
		this.skcm = skcm;
		this.stad = stad;
		this.tgct = tgct;
		this.thca = thca;
		this.thym = thym;
		this.ucec = ucec;
		this.ucs = ucs;
		this.uvm = uvm;
	}

  
}
