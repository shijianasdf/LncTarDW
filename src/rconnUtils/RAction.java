package rconnUtils;



import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;


import rconnUtils.RConn;
import com.opensymphony.xwork2.ActionSupport;


import convJson.GsonTools;


@SuppressWarnings("serial")
public class RAction extends ActionSupport{
	private String disease;
	public String execute() throws REXPMismatchException{
		RConn rconn = null; //R���ӳأ���������������RConnection
		RConnection re = null; //R���Ӷ���
		try {
			rconn = new RConn(); 
			re = rconn.getRConn(); 
			String[] rr = re.eval("rnorm(10)").asStrings();//R��������������java����������
			String[] rm = re.eval("matrix(rnorm(100),nrow=10,ncol=10)").asStrings();//R�о��󷵻���,������չ��,java����������
			RList l = re.eval("list(shi=data.frame(id=1:10,name=1:10),jian=matrix(1:100,nrow=10))").asList();//R���б�������ע��:��Ԫ�ر����Ǿ���
			System.out.println(l.names);
			int[] a = l.at(1).asIntegers();
			//int[] b = l.at(0).asIntegers();
			System.out.println(GsonTools.createJsonString(a));
			//System.out.println(GsonTools.createJsonString(b));
			System.out.println(GsonTools.createJsonString(l));
			System.out.println(GsonTools.createJsonString(rr));
			System.out.println(GsonTools.createJsonString(rm));
		}catch(RserveException e){
			e.printStackTrace();
			return ERROR;
		}finally{
			rconn.closeRconn();
			re.close();
		}
		return SUCCESS;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	
	
}