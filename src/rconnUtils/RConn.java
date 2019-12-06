package rconnUtils;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import Config.RConfig;

public class RConn {
	//查看Rserve端口,windows：cd c:\windows\system32 --> netstat -nltp|grep Rserve
	//R CMD Rserve --RS-enable-remote 使得能够远程访问
	//使用默认端口6331，或者使用自己的端口,new RConnection(rconf.getrHost(),rconf.getrPort());	
	private RConnection re=null;
	public RConnection getRConn() throws RserveException{	
			System.out.println("Connect R Host:"+RConfig.rHost+",port:"+RConfig.rPort);
			if(RConfig.rPort==0){
				re = new RConnection(RConfig.rHost);
			}else{
				re = new RConnection(RConfig.rHost, RConfig.rPort);				
			}				
		    return re;
	}
	
	public void closeRconn(){
		this.re.close();		
	}
	
	public void closeRConn(RConnection re){
		re.close();		
	}
}
