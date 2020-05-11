package book;
import java.sql.*;
public class bookinfo {
	
	/*  掌握4个知识点
	 *  1. 熟悉jsp的语法和语句，下载程序调试修改
	 *  2. sql语句
	 *  3. jsp中的Bean概念
	 *  4.数据库的简单操作
	 */
	
	private String driverStr="net.ucanaccess.jdbc.UcanaccessDriver";
	private String connStr="jdbc:ucanaccess://d:\\ec\\tsgl\\book.mdb";	
    private Connection conn=null;
    private Statement stmt=null;
    public bookinfo()   /*构建函数*/
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
    	catch(Exception ex){System.out.println("执行更新错误！");}
    	return result;
    }
    public ResultSet executeQuery(String s)
    {
    	ResultSet rs=null;
    	try{rs=stmt.executeQuery(s);}
    	catch(Exception ex){System.out.println("执行查询错误！");}
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
