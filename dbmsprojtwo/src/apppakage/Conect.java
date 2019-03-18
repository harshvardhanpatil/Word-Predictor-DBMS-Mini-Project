/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apppakage;

import static apppakage.mainscreen.jLabel14;
import static apppakage.mainscreen.jLabel15;
import static apppakage.mainscreen.jLabel16;
import static apppakage.mainscreen.jLabel17;
import static apppakage.mainscreen.jLabel18;
import static apppakage.mainscreen.jLabel23;
import static apppakage.mainscreen.jLabel24;
import static apppakage.mainscreen.jLabel25;
import static apppakage.mainscreen.jLabel26;
import static apppakage.mainscreen.jLabel27;

import static apppakage.mainscreen.setDev;
import static apppakage.mainscreen.uid;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Calendar;

/**
 *
 * @author Harshvardhan Patil
 */
public class Conect {
    public static Connection con;
    static String s=uid;
    /*creating tables in database*/ 
    Conect ()
    {
     s=uid;   
    }
    Conect (String str)
    {
     s=str;   
    }
    public static void createTable() throws Exception{
        try{
            con =  getConnection();
            String query1="CREATE TABLE IF NOT EXISTS NEW_WORDS"+s+"(WORDS VARCHAR(25) PRIMARY KEY,CNT INT)";
            String query2="CREATE TABLE IF NOT EXISTS PREDICTION"+s+"(PREV_WORD VARCHAR(25) REFERENCES NEW_WORDS"+s+"(WORDS),CURR_WORD VARCHAR(25) REFERENCES NEW_WORDS"+s+"(WORDS),N_CNT INT,PRIMARY KEY(PREV_WORD,CURR_WORD))";
            //NEW CODE HERE @ADI LIMBEKAR
            String query3="CREATE TABLE IF NOT EXISTS JW(J_WORDS VARCHAR(25) PRIMARY KEY,J_CNT INT)";
            String query4="CREATE TABLE IF NOT EXISTS JWP(J_PREV VARCHAR(25) REFERENCES JW(J_WORDS),J_CURR VARCHAR(25) REFERENCES JW(J_WORDS),JN_CNT INT,PRIMARY KEY(J_PREV,J_CURR))";
            //CODE ENDS
            PreparedStatement create = con.prepareStatement(query1);
            PreparedStatement create1 = con.prepareStatement(query2);
            //NEW CODE HERE @ADI LIMBEKAR
            PreparedStatement create2 = con.prepareStatement(query3);
            PreparedStatement create3 = con.prepareStatement(query4);
            //CODE ENDS
            create.executeUpdate();
            System.out.println("table1 created !");
            create1.executeUpdate();
            System.out.println("table2 created !");
            //NEW CODE HERE @ADI LIMBEKAR
            create2.executeUpdate();
                System.out.println("table3 created !");
            create3.executeUpdate();
                System.out.println("table4 created !");
            //CODE ENDS
        }catch(Exception e){
            System.out.println(e);
    }
        finally{
          System.out.println("Function complete...");    
        }
    }
  
   /*function get connection*/
    
    //edit your user name and passord and data base url here 
    public static Connection getConnection() throws Exception{
        try{
           /* String driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/wordp";
            String username="root";
            String password="2808";*/
            Class.forName("java.sql.DriverManager");

            //EDIT HERE
            //(URL,USERNAME,PASSWORD)
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordp","root","harshvardhan");

            System.out.println("Connected !!");
            return conn;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static void insertIntoNewWords(String str) throws SQLException
    {
        int n;
        String cs;
        setDev("Inside insert new word ");
        String sqlq ="SELECT * FROM jw WHERE J_WORDS='"+str+"'";
        PreparedStatement pst1=con.prepareStatement(sqlq);
        ResultSet rs1=pst1.executeQuery();
        if(rs1.next()) {
             cs=rs1.getString("j_words");
             setDev("WORD IN TABLE JW-->"+cs);
            return;
        }
        else{
        
        

        String sql1 ="SELECT CNT FROM new_words"+s+" WHERE WORDS='"+str+"'";
PreparedStatement pst=con.prepareStatement(sql1);
ResultSet rs=pst.executeQuery();
if(rs.next()) {
    cs=rs.getString("CNT");
    n=Integer.parseInt(cs);
    n++;
    setDev("value incremented:"+n);
    //if(rs.getString("").equals(time.getSelectedItem())) {
        //JOptionPane.showMessageDialog(null,"Time is already taken","",JOptionPane.INFORMATION_MESSAGE); 
    String query = "update new_words"+s+" set CNT = ? where WORDS = ?";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setInt   (1, n);
      preparedStmt.setString(2, str);

      // execute the java preparedstatement
      preparedStmt.executeUpdate();    
    }
 else {
    setDev("Inside else");
    // create a sql date object so we can use it in our INSERT statement
      Calendar calendar = Calendar.getInstance();
      java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());
      String query = " insert into new_words"+s+" (WORDS,CNT)"
        + " values (?, ?)";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1,str);
      preparedStmt.setString (2,"1");
      preparedStmt.execute();
    
    
        }
        }
        }

    
    
    
    
    //NEW CODE ADI LIMBEKAR
      /*@aditya limbekar*/
   /*inserting and updating prediction table */
    public static void insertIntoPrediction(String str,String str1) throws SQLException
    {
        int n;
        String cs;
        String cs1;
        String sqlq ="SELECT * FROM jw WHERE J_WORDS='"+str+"'";
        PreparedStatement pst1=con.prepareStatement(sqlq);
        ResultSet rs1=pst1.executeQuery();
        String sqlq1 ="SELECT * FROM jw WHERE J_WORDS='"+str1+"'";
        PreparedStatement pst11=con.prepareStatement(sqlq1);
        ResultSet rs2=pst11.executeQuery();
        if(rs1.next()||rs2.next()) {
             cs=rs1.getString("j_words");
             setDev("WORD IN TABLE JW-->"+cs);
            return;
        }
        else{
        
        setDev("Inside insert prediction ");
        String sql1 ="SELECT N_CNT FROM prediction"+s+" WHERE PREV_WORD='"+str+"' AND CURR_WORD='"+str1+"'";
PreparedStatement pst=con.prepareStatement(sql1);
ResultSet rs=pst.executeQuery();
if(rs.next()) {
    cs=rs.getString("N_CNT");
    n=Integer.parseInt(cs);
    n++;
    setDev("value incremented:"+n);
    //if(rs.getString("").equals(time.getSelectedItem())) {
        //JOptionPane.showMessageDialog(null,"Time is already taken","",JOptionPane.INFORMATION_MESSAGE); 
    String query = "update prediction"+s+" set N_CNT = ? where PREV_WORD = ? AND CURR_WORD= ? ";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setInt   (1, n);
      preparedStmt.setString(2, str);
      preparedStmt.setString(3, str1);

      // execute the java preparedstatement
      preparedStmt.executeUpdate();    
    }
 else {
    setDev("Inside else1");
    // create a sql date object so we can use it in our INSERT statement
      Calendar calendar = Calendar.getInstance();
      java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());

      // the mysql insert statement
      String query = " insert into prediction"+s+" (PREV_WORD,CURR_WORD,N_CNT)"
        + " values (?, ?, ?)";

      // create the mysql insert preparedstatement
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString(1,str);
      preparedStmt.setString(2,str1);
      preparedStmt.setString(3,"1");
      //preparedStmt.setDate   (3, startDate);
      //preparedStmt.setBoolean(4, false);
      //preparedStmt.setInt    (5, 5000);

      // execute the preparedstatement
      preparedStmt.execute();
    
    
}
        }
    }
    
     /*@aditya limbekar*/
    /*inserting and updating jw table */
     public static void insertIntoJw(String str) throws SQLException
    {
        int n;
        String cs;
        
        setDev("Inside insert jw ");
        String sql1 ="SELECT J_CNT FROM jw WHERE J_WORDS='"+str+"'";
PreparedStatement pst=con.prepareStatement(sql1);
ResultSet rs=pst.executeQuery();
if(rs.next()) {
    cs=rs.getString("J_CNT");
    n=Integer.parseInt(cs);
    n++;
    setDev("value incremented:"+n);
    //if(rs.getString("").equals(time.getSelectedItem())) {
        //JOptionPane.showMessageDialog(null,"Time is already taken","",JOptionPane.INFORMATION_MESSAGE); 
    String query = "update jw set J_CNT = ? where J_WORDS = ?";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setInt   (1, n);
      preparedStmt.setString(2, str);

      // execute the java preparedstatement
      preparedStmt.executeUpdate();    
    }
 
    }
     
     //NEW CODE @HARSHVARDHAN PATIL
     public static void retriveCur(String st) throws SQLException
     {
         
         setDev("inside retrive");
         String str[]=new String[5];
         int i=0;
        String sql1 ="SELECT WORDS FROM new_words"+s+" WHERE WORDS LIKE '"+st+"%' order by cnt desc"; 
        PreparedStatement pst=con.prepareStatement(sql1);
        //setDev("point 1");
        ResultSet rs=pst.executeQuery();
        //setDev("point 2");
        while(rs.next()&&i<5)
            {
                //setDev("point 3");
                str[i]=rs.getString(1);
                setDev(str[i]);
                i++;
                setDev(""+i);
                
            }  
        
            if(!str[0].equals("")){
                jLabel14.setText(str[0]);
                 jLabel14.show();
                
            }
            if(!str[1].equals("")){
                jLabel15.setText(str[1]);
                jLabel15.show();
                
            }
            if(!str[2].equals("")){
                jLabel16.setText(str[2]);
                jLabel16.show();
                
            }
            if(!str[3].equals("")){
                jLabel17.setText(str[3]);
                jLabel17.show();
                
            }
            if(!str[4].equals("")){
                jLabel18.setText(str[4]);
                jLabel18.show();
                
            }
        
     }
     //LATEST CODE @HARSH PATIL 23-10
     public static void retriveNext(String st) throws SQLException
     {
         setDev("inside retrive next");
         String str[]=new String[5];
         int i=0;
        String sql1 ="SELECT CURR_WORD FROM prediction"+s+" WHERE PREV_WORD='"+st+"' order by n_cnt desc"; 
        PreparedStatement pst=con.prepareStatement(sql1);
        //setDev("point 1");
        ResultSet rs=pst.executeQuery();
        //setDev("point 2");
        while(rs.next()&&i<5)
            {
                //setDev("point 3");
                str[i]=rs.getString(1);
                setDev(str[i]);
                i++;
                setDev(""+i);
                
            }  
        
            if(!str[0].equals("")){
                jLabel14.setText(str[0]);
                 jLabel14.show();
                
            }
            if(!str[1].equals("")){
                jLabel15.setText(str[1]);
                jLabel15.show();
                
            }
            if(!str[2].equals("")){
                jLabel16.setText(str[2]);
                jLabel16.show();
                
            }
            if(!str[3].equals("")){
                jLabel17.setText(str[3]);
                jLabel17.show();
                
            }
            if(!str[4].equals("")){
                jLabel18.setText(str[4]);
                jLabel18.show();
                
            }
        
        
     }
     
     
     
      public static void retriveCurjw(String st) throws SQLException
     {
         
         setDev("inside retrive java");
         String str[]=new String[5];
         int i=0;
        String sql1 ="SELECT J_WORDS FROM JW WHERE J_WORDS LIKE '"+st+"%' order by J_CNT desc"; 
        PreparedStatement pst=con.prepareStatement(sql1);
        setDev("point 1");
        ResultSet rs=pst.executeQuery();
        setDev("point 2");
        while(rs.next()&&i<5)
            {
                setDev("point 3");
                str[i]=rs.getString(1);
                setDev(str[i]);
                i++;
                setDev(""+i);
                
            }  
        
            if(!str[0].equals("")){
                jLabel23.setText(str[0]);
                 jLabel23.show();
                
            }
            if(!str[1].equals("")){
                jLabel24.setText(str[1]);
                jLabel24.show();
                
            }
            if(!str[2].equals("")){
                jLabel25.setText(str[2]);
                jLabel25.show();
                
            }
            if(!str[3].equals("")){
                jLabel26.setText(str[3]);
                jLabel26.show();
                
            }
            if(!str[4].equals("")){
                jLabel27.setText(str[4]);
                jLabel27.show();
                
            }
        
     }
     //LATEST CODE @HARSH PATIL 23-10
     public static void retriveNextjw(String st) throws SQLException
     {
         setDev("inside retrive next java ");
         String str[]=new String[5];
         int i=0;
        String sql1 ="SELECT j_curr FROM jwp WHERE J_PREV='"+st+"' order by jn_cnt desc"; 
        PreparedStatement pst=con.prepareStatement(sql1);
        setDev("point 1");
        ResultSet rs=pst.executeQuery();
        setDev("point 2");
        while(rs.next()&&i<5)
            {
                setDev("point 3");
                str[i]=rs.getString(1);
                setDev(str[i]);
                i++;
                setDev(""+i);
                
            }  
        
            if(!str[0].equals("")){
                jLabel23.setText(str[0]);
                 jLabel23.show();
                
            }
            if(!str[1].equals("")){
                jLabel24.setText(str[1]);
                jLabel24.show();
                
            }
            if(!str[2].equals("")){
                jLabel25.setText(str[2]);
                jLabel25.show();
                
            }
            if(!str[3].equals("")){
                jLabel26.setText(str[3]);
                jLabel26.show();
                
            }
            if(!str[4].equals("")){
                jLabel27.setText(str[4]);
                jLabel27.show();
                
            }
        
        
     }
     
     
     
     
     public static void clear() throws Exception{
        try{
            con =  getConnection();
            String query1="DELETE FROM NEW_WORDS"+s;
            String query2="DELETE FROM PREDICTION"+s;
            //NEW CODE HERE @ADI LIMBEKAR
           
            //CODE ENDS
            PreparedStatement create = con.prepareStatement(query1);
            PreparedStatement create1 = con.prepareStatement(query2);
            //NEW CODE HERE @ADI LIMBEKAR
            
            //CODE ENDS
            create.executeUpdate();
            System.out.println("table1 deleted");
            create1.executeUpdate();
            System.out.println("table2 deleted !");
            //NEW CODE HERE @ADI LIMBEKAR
            
            //CODE ENDS
        }catch(Exception e){
            System.out.println(e);
    }
        finally{
          System.out.println("Function complete...");    
        }
    }


  
   
    
}
