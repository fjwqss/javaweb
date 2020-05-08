package book;
import java.sql.*;
public class bookinfo {
	
	//private String driverStr="com.mysql.jdbc.Driver";
	//private String connStr="jdbc:mysql://localhost:3306/bookinfo?characterEncoding=gb2312";//���ݿ���
    //private String dbusername="root";
    //private String dbpassword="123456";//��������ݿ�һ��	
	//private String driverStr="sun.jdbc.odbc.JdbcOdbcDriver";
	//private String connStr="jdbc:odbc:book";
	
	private String driverStr="net.ucanaccess.jdbc.UcanaccessDriver";
	private String connStr="jdbc:ucanaccess://d:\\ec\\tsgl\\book.mdb";	
    private String dbusername="";
    private String dbpassword="";
    private Connection conn=null;
    private Statement stmt=null;
    public bookinfo()
    {
    	try{
    		Class.forName(driverStr);
    		conn = DriverManager.getConnection(connStr);    		
    		stmt = conn.createStatement();
    	}
    	catch(Exception ex){System.out.println( ex.toString() );}
    }
    public int executeUpdate(String s)
    {
    	int result=0;
    	try{result=stmt.executeUpdate(s);}
    	catch(Exception ex){System.out.println("ִ�и��´���");}
    	return result;
    }
    public ResultSet executeQuery(String s)
    {
    	ResultSet rs=null;
    	try{rs=stmt.executeQuery(s);}
    	catch(Exception ex){System.out.println("ִ�в�ѯ����");}
    	return rs;
    }
    public void close()
    {
    	try{
    		stmt.close();
    		conn.close();
    	}
    	catch(Exception e){}
    }
 
}
