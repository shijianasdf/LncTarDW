package beans;

public class diffexpressedboxplot {
	private String gene;
	private String genename;
	private String cancer;
	private String normal;
	private String yrange;
	public String getGene() {
		return gene;
	}
	public void setGene(String gene) {
		this.gene = gene;
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
	public diffexpressedboxplot(){
		
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
	public diffexpressedboxplot(String gene, String genename, String cancer, String normal, String yrange) {
		this.gene = gene;
		this.genename = genename;
		this.cancer = cancer;
		this.normal = normal;
		this.yrange = yrange;
	}

    
    

	
}
