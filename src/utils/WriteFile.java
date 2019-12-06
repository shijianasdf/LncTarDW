package utils;



import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import utils.GenerateTime;
import utils.RandomString;

public class WriteFile {
	FileWriter fw = null;
	private GenerateTime gt = new GenerateTime();
	private RandomString rs = new RandomString();
	public String writeFile(String inputStr, String rootPath) throws IOException{
		String timeToday = gt.generateTime("day");
		String dirPath = rootPath+timeToday+"/";
		File newPath = new File(dirPath);
		String filePath = dirPath+rs.getRandomString(10);
		try{
			if(!newPath.exists())
				newPath.mkdir();
			fw = new FileWriter(filePath);
			fw.write(inputStr);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			fw.close();
		}
		return filePath;
	}
}
