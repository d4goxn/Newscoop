/*
 * @(#)FontSizeStyleAction.java
 *
 * Copyright (c) 2000,2001 Media Development Loan Fund
 *
 * CAMPSITE is a Unicode-enabled multilingual web content                     
 * management system for news publications.                                   
 * CAMPFIRE is a Unicode-enabled java-based near WYSIWYG text editor.         
 * Copyright (C)2000,2001  Media Development Loan Fund                        
 * contact: contact@campware.org - http://www.campware.org                    
 * Campware encourages further development. Please let us know.               
 *                                                                            
 * This program is free software; you can redistribute it and/or              
 * modify it under the terms of the GNU General Public License                
 * as published by the Free Software Foundation; either version 2             
 * of the License, or (at your option) any later version.                     
 *                                                                            
 * This program is distributed in the hope that it will be useful,            
 * but WITHOUT ANY WARRANTY; without even the implied warranty of             
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               
 * GNU General Public License for more details.                               
 *                                                                            
 * You should have received a copy of the GNU General Public License          
 * along with this program; if not, write to the Free Software                
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */


    /**
     * FontSizeStyleAction maps the html font size attribute into pixels,
     * and sets the size of a given text.
     * It is triggered by the corresponding menupoints
     */

import javax.swing.text.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

class FontSizeStyleAction extends StyledEditorKit.StyledTextAction{
    JTextPane text;
    String size;
    public FontSizeStyleAction(String action,JTextPane tp,String s){
        super(action);
        text=tp;
        size=new String(s);
    }
    
    public void actionPerformed(ActionEvent e){
        if (text!=null){
            int fontsize=12;
            AttributeSet attr=text.getCharacterAttributes();
            MutableAttributeSet ats=new SimpleAttributeSet();
            if (size.equals("1")) fontsize=8;
            if (size.equals("2")) fontsize=10;
            if (size.equals("3")) fontsize=12;
            if (size.equals("4")) fontsize=14;
            if (size.equals("5")) fontsize=18;
            if (size.equals("6")) fontsize=24;
            if (size.equals("7")) fontsize=36;
            StyleConstants.setFontSize(ats,fontsize);
            setCharacterAttributes(text,ats,false);
        }
    }
}