/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apppakage;

import static apppakage.mainscreen.jLabel1;
import javax.swing.ImageIcon;

/**
 *
 * @author Harshvardhan Patil
 */
public class SetWallpaper {
    public void setWallpaper()
    {
        Settings s=new Settings();
        
        if(s.ReadWallpaper().equals("w1")){
            ImageIcon i=new ImageIcon(getClass().getResource("/resources/one.jpg"));
        jLabel1.setIcon(i);
            
        }
        else if(s.ReadWallpaper().equals("w2")){
            ImageIcon i=new ImageIcon(getClass().getResource("/resources/two.jpg"));
        jLabel1.setIcon(i);
        
    }
    }
    
}
