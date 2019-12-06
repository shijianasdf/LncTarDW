package actions;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import beans.scatterplot;
import convJson.GsonTools;
import utils.SimpleFactory;

@SuppressWarnings("serial")
public class ScatterSearchAction extends ActionSupport{
	private String regulator;
	private String target;
	private String cancertype;
	private String scatterdata;
	//private String gsescatterdata;
	public String ScatterSearch(){
		String hql = "select new scatterplot(regulator,target," + this.cancertype.toLowerCase() + ") from scatterplot where regulator = '"+this.regulator+"' and target = '"+this.target+"'";
		ArrayList<scatterplot> as = (ArrayList<scatterplot>)new SimpleFactory<scatterplot>("scatterplot").query(hql);
		this.scatterdata = GsonTools.createJsonString(as); //regulator target scatterdata
    	return SUCCESS;
	}

	/*public String getGsescatterdata() {
		return gsescatterdata;
	}

	public void setGsescatterdata(String gsescatterdata) {
		this.gsescatterdata = gsescatterdata;
	}*/

	public String getScatterdata(){
		return scatterdata;
	}

	public void setScatterdata(String scatterdata) {
		this.scatterdata = scatterdata;
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

	public String getCancertype() {
		return cancertype;
	}

	public void setCancertype(String cancertype) {
		this.cancertype = cancertype;
	}
	
	
}
