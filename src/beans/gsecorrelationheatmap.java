package beans;

public class gsecorrelationheatmap {
	private String rid;
    private String heatmapdata;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getHeatmapdata() {
		return heatmapdata;
	}
	public void setHeatmapdata(String heatmapdata) {
		this.heatmapdata = heatmapdata;
	}
	public gsecorrelationheatmap(String rid, String heatmapdata) {
		this.rid = rid;
		this.heatmapdata = heatmapdata;
	}
	public gsecorrelationheatmap(){
		
	}
}
