package actions;

import java.util.ArrayList;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.correlationheatmap;
import beans.diffexpressedboxplot;
import beans.diffexpression;
import beans.hdfregulatoryd;
import convJson.GsonTools;
import utils.SimpleFactory;

@SuppressWarnings("serial")
public class SearchAction extends ActionSupport{
	private String lncRNA;
	private String target;
	private String message;
	public String Search(){
		//ArrayList<hdfregulatory> as = (ArrayList<hdfregulatory>)new SimpleFactory<hdfregulatory>("hdfregulatory").query("from hdfregulatory where rid like '%"+this.rid+"%'"); //正常是用=来检索，但是rid字段有脏东西，等号检索不出来，所以用模糊搜索
		ArrayList<hdfregulatoryd> as = (ArrayList<hdfregulatoryd>)new SimpleFactory<hdfregulatoryd>("hdfregulatoryd").query("from hdfregulatoryd where regulator = '"+this.lncRNA+"' and target = '"+this.target+"'");
		if(as.size() == 0){
			this.message = this.lncRNA+" did not regulate the "+this.target;
			return ERROR;
		}else{
			String rid = as.get(0).getRid();
			//TCGA 差异表达
			ArrayList<diffexpression> regexp = (ArrayList<diffexpression>)new SimpleFactory<diffexpression>("diffexpression").query("from diffexpression where  genename = '"+this.lncRNA+"'");
			ArrayList<diffexpression> tarexp = (ArrayList<diffexpression>)new SimpleFactory<diffexpression>("diffexpression").query("from diffexpression where  genename = '"+this.target+"'");
			ActionContext.getContext().put("diffregexp",regexp);
			ActionContext.getContext().put("difftarexp",tarexp);

			/*还有regulator和target表达相关性热图  TCGA*/
			ActionContext.getContext().put("correlationheatmap",GsonTools.createJsonString((ArrayList<correlationheatmap>)new SimpleFactory<correlationheatmap>("correlationheatmap").query("from correlationheatmap where rid = '" +rid+ "'")));
			
			/*还有regulator和target在TCGA差异表达boxplot要展示 */
			ActionContext.getContext().put("regboxdata",GsonTools.createJsonString((ArrayList<diffexpressedboxplot>)new SimpleFactory<diffexpressedboxplot>("diffexpressedboxplot").query("from diffexpressedboxplot where  genename = '"+this.lncRNA+"'")));
			ActionContext.getContext().put("tarboxdata",GsonTools.createJsonString((ArrayList<diffexpressedboxplot>)new SimpleFactory<diffexpressedboxplot>("diffexpressedboxplot").query("from diffexpressedboxplot where  genename = '"+this.target+"'")));
		}
		
		return SUCCESS;
	}
	public String getLncRNA() {
		return lncRNA;
	}
	public void setLncRNA(String lncRNA) {
		this.lncRNA = lncRNA;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

}
