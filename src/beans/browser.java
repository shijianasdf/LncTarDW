package beans;

public class browser{
    private String id;
    private String pId;
    private String name;
    private String target;
    private String open;
    private String icon;
	
    public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
    public browser(){
    	
    }
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	 
	    
	
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}



	
		public browser(String id, String pId, String name, String target, String open,String icon){
		    this.id = id;
			this.pId = pId;
			this.name = name;
			this.target = target;
			this.open = open;
			this.icon= icon;
		}
}
