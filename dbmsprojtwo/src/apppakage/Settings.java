/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apppakage;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Harshvardhan Patil
 */
public class Settings {
    public static Properties prop=new Properties();
    public void WriteWallpaper(String wallID)
    {
        try{
            prop.setProperty("Wallpaper", wallID);
            prop.store(new FileOutputStream("config.properties"),null);
        }
        catch(IOException e)
        {
            
        }
    }
    public String ReadWallpaper()
    {
        String line="";
        try{
            prop.load(new FileInputStream("config.properties"));
            line=prop.getProperty("Wallpaper");
            
        }
        catch(IOException e)
        {
            
        }
        return line;
    }
    
    
}
