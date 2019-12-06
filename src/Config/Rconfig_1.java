package Config;

import org.apache.struts2.ServletActionContext;

public class Rconfig_1 {
  public static String rHost="127.0.0.1";
  public static int rPort=0;

  public static String rfunction_path=ServletActionContext.getServletContext().getRealPath("/RFunctions").replaceAll("\\\\", "/")+"/";
  public static String get_Gene_hist_r_file="get_Gene_hist.R"; 
  public static String geneList_enrichment="geneList_enrichment.R";
  public static String compareTool_gene="compareToolgene.R";
  public static String basePath="/pub5/xiaoyun/BigData/KDT/";
  //根据gpa_id模式找出相应�?在文件夹，所以命名很重要
  public static String getRData_path(String gpa_id){
	  if(gpa_id.matches("^GPAHSA\\w+")){
		  if(gpa_id.matches("^GPAHSA1\\w+")){
			  return basePath+"GPA_Human_miRNA/";
		  }else if(gpa_id.matches("^GPAHSA2\\w+")){
			  return basePath+"GPA_Human_lncRNA/";
		  }else{
			  return basePath+"GPA_Human/";
		  } 
	  }else if(gpa_id.matches("^GPAMMU\\w+")){
		  if(gpa_id.matches("^GPAMMU1\\w+")){
			  return basePath+"GPA_Mus_miRNA/";
		  }else if(gpa_id.matches("^GPAMMU2\\w+")){
			  return basePath+"GPA_Mus_lncRNA/";
		  }else{
			  return basePath+"GPA_MUS/";
		  } 
	  }else{
		  //此处留作以后物种的扩�?
		  System.out.println("unkown organism");
		  return null;
	  }
  }
  
  public static String getRData_path(String organism,String gene_type){
	  if(organism.equalsIgnoreCase("Homo sapiens")){
		  if(gene_type.equalsIgnoreCase("miRNA")){
			  return basePath+"GPA_Human_miRNA/";
		  }else if(gene_type.equalsIgnoreCase("lncRNA")){
			  return basePath+"GPA_Human_lncRNA/";
		  }else{
			  return basePath+"GPA_Human/";
		  } 
	  }else if(organism.equalsIgnoreCase("Mus musculus")){
		  if(gene_type.equalsIgnoreCase("miRNA")){
			  return basePath+"GPA_Mus_miRNA/";
		  }else if(gene_type.equalsIgnoreCase("lncRNA")){
			  return basePath+"GPA_Mus_lncRNA/";
		  }else{
			  return basePath+"GPA_MUS/";
		  } 
	  }else{
		//此处留作以后物种的扩�?
		  System.out.println("unkown organism");
		  return null;
	  }
  }
  
  
}
