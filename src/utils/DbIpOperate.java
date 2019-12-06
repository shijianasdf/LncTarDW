package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DbIpOperate
{
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private int rsInt=0;
	/*
	 * mysql -uroot -ppassWordis204!
	 * use ipRecorder;  //该数据库中有2个表格，一个gpa(ip,count,country,lastTime)，另一个ip2country(这个表格是下载得到的，记录ipScore对应国家名)
	 * create table gpa(`ipAddr` varchar(32),`count` varchar(32),`country` varchar(128),`lastTime` DATETIME(4));
	 * 
	 * 
	 */
	public boolean ifIpExist(Connection conn,String searchName) throws Exception
	{
		boolean ifExist = false;
		pstmt = conn.prepareStatement("select count from ipRecorder.gpa where ipAddr='"+searchName+"';");
		rs = pstmt.executeQuery();
		while (rs.next())
		{
			ifExist = true;
		}
		return ifExist;
	}
	//閼惧嘲绶眎pScore
		public long getIpScore(Connection conn,String ipAddr) throws Exception
		{
			long w = Integer.valueOf(ipAddr.split("\\.")[0]);
			long x = Integer.valueOf(ipAddr.split("\\.")[1]);
			long y = Integer.valueOf(ipAddr.split("\\.")[2]);
			long z = Integer.valueOf(ipAddr.split("\\.")[3]);
			long ipScore = 16777216*w+65536*x+256*y+z;
			return ipScore;
		}

		
		public String getIp2Country(Connection conn,String ipScore) throws Exception{
			String country = "";
			pstmt = conn.prepareStatement("select fullName from ipRecorder.ip2country where begin<'"+ipScore+"' and end>'"+ipScore+"';");
			rs = pstmt.executeQuery();
			while (rs.next()){
				country = rs.getString(1);
			}
			return country;
		}
	public int getIpCount(Connection conn,String searchName) throws Exception
	{
		int count=0;
		pstmt = conn.prepareStatement("select count from ipRecorder.gpa where ipAddr='"+searchName+"';");
		rs = pstmt.executeQuery();
		while (rs.next())
		{
			count = rs.getInt(1);
		}
		return count;
	}
	//鐠佸墽鐤唅p閻ㄥ嫯顔囪ぐ鏇礉閻€劋绨拠顨唒妫ｆ牗顐肩拋鍧楁６閻ㄥ嫭妞傞崐娆欑礉閸忚泛鐤勯崣顖欎簰閸滃畱hangeIpCount()閸氬牆鑻�
	public String setIpCount(Connection conn,String ipAddr,String country) throws Exception
	{
		System.out.println("insert into ipRecorder.MeSiC values('"+ipAddr+"',1,'"+country+"',NOW());");
		pstmt = conn.prepareStatement("insert into ipRecorder.gpa values('"+ipAddr+"',1,'"+country+"',NOW());");
		rsInt = pstmt.executeUpdate();
		System.out.println("rsInt is : "+rsInt);
		String str = "insert data";
		return str;
	}
	//閺�鐟板綁鐠囶殕p閻ㄥ嫯顔囪ぐ鏇犲Ц閹緤绱濋崠鍛鐠佸潡妫跺▎鈩冩殶count閿涘苯鎷扮拋鍧楁６閺冨爼妫�
	public String changeIpCount(Connection conn,String searchName,int count) throws Exception
	{
		pstmt = conn.prepareStatement("update ipRecorder.gpa set count='"+count+"' where ipAddr='"+searchName+"';");
		rsInt = pstmt.executeUpdate();
		System.out.println("rsInt is : "+rsInt);
		pstmt = conn.prepareStatement("update ipRecorder.gpa set lastTime=NOW() where ipAddr='"+searchName+"';");
		rsInt = pstmt.executeUpdate();
		System.out.println("rsInt is : "+rsInt);
		String str = "update data";
		return str;
	}
}