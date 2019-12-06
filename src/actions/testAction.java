package actions;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import convJson.GsonTools;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;;
public class testAction {

	public static void main(String[] args) throws REXPMismatchException {
		// TODO Auto-generated method stub
		RConnection connection = null;
		System.out.println("平均值");
		try {
			//创建对象
			connection = new RConnection();
			connection.assign("a", "");
			connection.assign("b", "shijian");
			String s = connection.eval("paste(a,b,sep='-')").asString();
			System.out.println(s); //java赋予空字符串，R还是认为空字符串处理
			String vetor="c(1,2,3,4)";
			
			connection.eval("value <- NULL");
			if(connection.eval("value").isNull()){
				String ss = GsonTools.createJsonString(connection.eval("value")) ;
				System.out.println("是null"); 
				System.out.println(ss); 
			}
			
			
			connection.eval("meanVal<-mean("+vetor+")");
	
			//System.out.println("the mean of given vector is="+mean);
			double mean=connection.eval("meanVal").asDouble();
			System.out.println("the mean of given vector is="+mean);
			//connection.eval(arg0)
			
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("执行脚本");
		connection.close();
	}
}
