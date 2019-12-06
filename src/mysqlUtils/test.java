package mysqlUtils;

import java.util.ArrayList;

public class test {
	public static void main(String[] args) {
		SearchDbLikelyAndAccurateTable2 SDTA2 = new SearchDbLikelyAndAccurateTable2();
		String selectedCols = "select * ";
		ArrayList<String> likelyKeyValues = new ArrayList<String>();
		ArrayList<String> likelyKeyCols = new ArrayList<String>();
		ArrayList<String> AccurateKeyValues = new ArrayList<String>();
		ArrayList<String> AccurateKeyCols = new ArrayList<String>();
		ArrayList<String> conditionTypeList = new ArrayList<String>();
		
		String mysqlString = SDTA2.queryTableALT(selectedCols, likelyKeyCols, likelyKeyValues, AccurateKeyCols, AccurateKeyValues, conditionTypeList, "", "");
	    
	}
}
