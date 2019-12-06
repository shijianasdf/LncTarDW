package Config;

import org.apache.struts2.ServletActionContext;

public class Configs {
	// /bkDir/Software/tomcat7/webapps/LnChrom/tmpFiles
	//public static String filePath=ServletActionContext.getServletContext().getRealPath("/RFunctions").replaceAll("\\\\", "/")+"/";

	//public static String filePath="D:"+"/";
	
	public static String filePath="/pub5/xiaoyun/Software/tomcat7/sourceData/LncTarD/"; //69服务器
	
	//public static String filePath="/pub1/Software/apache-tomcat-6.0.44/webapps/LncTarD_data/"; //BD服务器
	
	public static String dbName = "LnChrom";
	
	public static String regionSearchFun = "";
	
	public static String usersubmit = "usersubmit";

}
