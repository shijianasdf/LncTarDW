package utils;



import java.io.File;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;

import utils.GenerateTime;
import utils.RandomString;

public class Upload {
	private GenerateTime gt = new GenerateTime();
	private RandomString rs = new RandomString();
	
	public ArrayList<String> upload(File[] upload, String[] uploadFileName, String rootPath){
		ArrayList<String> destPath = new ArrayList<String>();
		String timeToday = gt.generateTime("day");
		String newDirPath = rootPath+timeToday+"/";
		//System.out.println(newDirPath);
		File newPath = new File(newDirPath);
		try {
			if(!newPath.exists())
				newPath.mkdir();
			for(int i=0;i<upload.length;i++){
				String randomFileName = uploadFileName[i].replace(" ", "_")+rs.getRandomString(5);
	   			File dest = new File(newDirPath, randomFileName);
	   			String filePath = newDirPath+randomFileName;
	   			//System.out.println(filePath);
				FileUtils.copyFile(upload[i], dest);	//完成文件上传
				System.out.println("upload file "+i+" complete");
				destPath.add(filePath);
			}
   		}
   		catch(Exception e){
    		e.printStackTrace();
    	}
		return destPath;
	}
}
