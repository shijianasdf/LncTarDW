package actions;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import Config.RConfig;
import convJson.GsonTools;
import utils.GenerateTime;
import utils.RandomString;
import rconnUtils.RConn;


@SuppressWarnings("serial")
public class CaculateExpsetAction extends ActionSupport{
	private String lncRNA;
	private String target;
	private File readcount  ;
	private String readcountContentType;
	private String readcountFileName;
	private File array  ;
	private String arrayContentType;
	private String arrayFileName;
	private String datatype;
	//private WriteFile wf = new WriteFile();
	private String message;
	public String CaculateExpset() throws IOException{
		RConn rconn = null;
		RConnection re = null;
		try{
			rconn = new RConn();
			re = rconn.getRConn();
			String filepath = "";
			if(readcount != null){
				this.datatype = "rnaseq";
				GenerateTime st =new GenerateTime();
				RandomString rs=new RandomString();
				String time=st.generateTime("day");
				String randomstring = rs.getRandomString(5);
				String path = ServletActionContext.getServletContext().getRealPath("/upload").replaceAll("\\\\", "/")+"/";
				String filePath = path+time+"/"+randomstring+"/";
				System.out.println(filepath);
				File dirfile = new File(filePath);
				if(!dirfile.exists()||!dirfile.isDirectory()){
					boolean  creadok = dirfile.mkdirs();  //閻㈢喐鍨氶崥宥呯摟娑擄拷/upload閻ㄥ嫭鏋冩禒璺恒仚+ServletActionContext.getRequest().getSession().getId()
					if(!creadok){
						this.message="System error or in busy,please check your submits or wait for a few minutes and try again!";
						return ERROR;
					}
				}
				//鏂囦欢璺緞
				filepath=filePath+this.readcountFileName;
				System.out.println(filepath);
				System.out.println(this.target);
				System.out.println(this.lncRNA);
				File dest=new File(filepath);
				FileUtils.copyFile(this.readcount, dest);
			}else{
				this.datatype = "array";
				GenerateTime st =new GenerateTime();
				RandomString rs=new RandomString();
				String time=st.generateTime("day");
				String randomstring = rs.getRandomString(5);
				String path = ServletActionContext.getServletContext().getRealPath("/upload").replaceAll("\\\\", "/")+"/";
				String filePath = path+time+"/"+randomstring+"/";
				File dirfile = new File(filePath);
				if(!dirfile.exists()||!dirfile.isDirectory()){
					boolean  creadok = dirfile.mkdirs();  //閻㈢喐鍨氶崥宥呯摟娑擄拷/upload閻ㄥ嫭鏋冩禒璺恒仚+ServletActionContext.getRequest().getSession().getId()
					if(!creadok){
						this.message="System error or in busy,please check your submits or wait for a few minutes and try again!";
						return ERROR;
					}
				}
				//鏂囦欢璺緞
				filepath=filePath+this.arrayFileName;
				File dest=new File(filepath);
				FileUtils.copyFile(this.array, dest);	
			}
			if(this.datatype.equalsIgnoreCase("rnaseq")){
				//设置R变量
				re.assign("filepath", filepath);
				re.assign("lncRNA", this.lncRNA);
				re.assign("target", this.target);
				
				// source .R files
    		 	String sourceR="source('"+RConfig.caculatediff_deseq2+"')";
    		 	re.eval(sourceR); 
    		    
    		 	//执行R函数，返回list
    		 	RList rlde = re.eval(RConfig.execute_deseq2).asList();
    		 	ActionContext.getContext().put("project", GsonTools.createJsonString(rlde.at(9).asStrings())); //取list中的第10个元素
    		 	ActionContext.getContext().put("tumourNum", GsonTools.createJsonString(rlde.at(10).asStrings()));
    		 	ActionContext.getContext().put("normalNum", GsonTools.createJsonString(rlde.at(11).asStrings()));
    		 	if(!rlde.at(0).isNull()){
    		 		ActionContext.getContext().put("lncdiff", GsonTools.createJsonString(rlde.at(0).asString())); //取list中的第一个元素
    		 	}else{
    		 		ActionContext.getContext().put("lncdiff", "null");
    		 	}
    		 	if(!rlde.at(1).isNull()){
    		 		ActionContext.getContext().put("correlationheatmap", GsonTools.createJsonString(rlde.at(1).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("correlationheatmap", "null");
    		 	}
    		 	if(!rlde.at(2).isNull()){
    		 		ActionContext.getContext().put("scatterplot", GsonTools.createJsonString(rlde.at(2).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("scatterplot", "null");
    		 	}
    		 	if(!rlde.at(3).isNull()){
    		 		ActionContext.getContext().put("lncRNAcancerjson", GsonTools.createJsonString(rlde.at(3).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("lncRNAcancerjson", "null");
    		 	}
    		 	if(!rlde.at(4).isNull()){
    		 		ActionContext.getContext().put("lncRNAnormaljson", GsonTools.createJsonString(rlde.at(4).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("lncRNAnormaljson", "null");
    		 	}
    		 	if(!rlde.at(5).isNull()){
    		 		ActionContext.getContext().put("lncRNAyrange", GsonTools.createJsonString(rlde.at(5).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("lncRNAyrange", "null");
    		 	}
    		 	if(!rlde.at(6).isNull()){
    		 		ActionContext.getContext().put("targetcancerjson", GsonTools.createJsonString(rlde.at(6).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("targetcancerjson", "null");
    		 	}
    		 	if(!rlde.at(7).isNull()){
    		 		ActionContext.getContext().put("targetnormaljson", GsonTools.createJsonString(rlde.at(7).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("targetnormaljson", "null");
    		 	}
    		 	if(!rlde.at(8).isNull()){
    		 		ActionContext.getContext().put("targetyrange", GsonTools.createJsonString(rlde.at(8).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("targetyrange", "null");
    		 	}
    		 	if(!rlde.at(8).isNull()){
    		 		ActionContext.getContext().put("targetdiff", GsonTools.createJsonString(rlde.at(12).asString()));
    		 	}else{
    		 		ActionContext.getContext().put("targetdiff", "null");
    		 	}

			}else{
				re.assign("filepath", filepath);
				re.assign("lncRNA", this.lncRNA);
				re.assign("target", this.target);
				// source .R files
    		 	String sourceR="source('"+RConfig.caculatediff_limma+"')";
    		 	re.eval(sourceR); 
    		 	
    		 	//执行R函数，返回list
    		 	RList rlli = re.eval(RConfig.execute_limma).asList();
    		 	
    		 	ActionContext.getContext().put("project", GsonTools.createJsonString(rlli.at(9).asStrings())); //取list中的第10个元素
    		 	ActionContext.getContext().put("tumourNum", GsonTools.createJsonString(rlli.at(10).asStrings()));
    		 	ActionContext.getContext().put("normalNum", GsonTools.createJsonString(rlli.at(11).asStrings()));
    		 	if(!rlli.at(0).isNull()){
    		 		ActionContext.getContext().put("lncdiff", GsonTools.createJsonString(rlli.at(0).asString())); //取list中的第一个元素
    		 	}else{
    		 		ActionContext.getContext().put("lncdiff", "null");
    		 	}
    		 	if(!rlli.at(1).isNull()){
    		 		ActionContext.getContext().put("correlationheatmap", GsonTools.createJsonString(rlli.at(1).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("correlationheatmap", "null");
    		 	}
    		 	if(!rlli.at(2).isNull()){
    		 		ActionContext.getContext().put("scatterplot", GsonTools.createJsonString(rlli.at(2).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("scatterplot", "null");
    		 	}
    		 	if(!rlli.at(3).isNull()){
    		 		ActionContext.getContext().put("lncRNAcancerjson", GsonTools.createJsonString(rlli.at(3).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("lncRNAcancerjson", "null");
    		 	}
    		 	if(!rlli.at(4).isNull()){
    		 		ActionContext.getContext().put("lncRNAnormaljson", GsonTools.createJsonString(rlli.at(4).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("lncRNAnormaljson", "null");
    		 	}
    		 	if(!rlli.at(5).isNull()){
    		 		ActionContext.getContext().put("lncRNAyrange", GsonTools.createJsonString(rlli.at(5).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("lncRNAyrange", "null");
    		 	}
    		 	if(!rlli.at(6).isNull()){
    		 		ActionContext.getContext().put("targetcancerjson", GsonTools.createJsonString(rlli.at(6).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("targetcancerjson", "null");
    		 	}
    		 	if(!rlli.at(7).isNull()){
    		 		ActionContext.getContext().put("targetnormaljson", GsonTools.createJsonString(rlli.at(7).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("targetnormaljson", "null");
    		 	}
    		 	if(!rlli.at(8).isNull()){
    		 		ActionContext.getContext().put("targetyrange", GsonTools.createJsonString(rlli.at(8).asStrings()));
    		 	}else{
    		 		ActionContext.getContext().put("targetyrange", "null");
    		 	}
    		 	if(!rlli.at(8).isNull()){
    		 		ActionContext.getContext().put("targetdiff", GsonTools.createJsonString(rlli.at(12).asString()));
    		 	}else{
    		 		ActionContext.getContext().put("targetdiff", "null");
    		 	}
			}
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			rconn.closeRconn();
			re.close();
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
	public File getReadcount() {
		return readcount;
	}
	public void setReadcount(File readcount) {
		this.readcount = readcount;
	}
	public String getReadcountContentType() {
		return readcountContentType;
	}
	public void setReadcountContentType(String readcountContentType) {
		this.readcountContentType = readcountContentType;
	}
	public String getReadcountFileName() {
		return readcountFileName;
	}
	public void setReadcountFileName(String readcountFileName) {
		this.readcountFileName = readcountFileName;
	}
	public File getArray() {
		return array;
	}
	public void setArray(File array) {
		this.array = array;
	}
	public String getArrayContentType() {
		return arrayContentType;
	}
	public void setArrayContentType(String arrayContentType) {
		this.arrayContentType = arrayContentType;
	}
	public String getArrayFileName() {
		return arrayFileName;
	}
	public void setArrayFileName(String arrayFileName) {
		this.arrayFileName = arrayFileName;
	}
	/*public WriteFile getWf() {
		return wf;
	}
	public void setWf(WriteFile wf) {
		this.wf = wf;
	}*/
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDatatype() {
		return datatype;
	}
	public void setDatatype(String datatype) {
		this.datatype = datatype;
	}

}
