package mypersonajes;

import java.util.ArrayList;
import java.util.List;


public class Main {
    
     public static void main(String[] args) {

        ManageDAOImpl m = new ManageDAOImpl();
        String separator = "-";
        for (int i = 0; i < 60; i++)
            separator += "-";
                
        m.listAll();           
        System.out.println(separator);
        
        m.printPersonajes(); 
        System.out.println(separator);
        
        List arguments;        
        arguments = m.listBattleargues(2);
        System.out.println(separator);
        
        for (int i  = 0; i < arguments.size(); i++)
             System.out.println(((Battleargue)arguments.get(i)).getArgument());       
        System.out.println(separator);
        
        List <Personajes> personajes = m.listPersonajes();
            
        for (int i  = 0; i < personajes.size(); i++)
             System.out.println(personajes.get(i).getName() +
                    "..." + personajes.get(i).getRace().getRace());
        
        //m.addPersonaj("Johny", 2, "axe", 100, 10, 2);
        
        m.printPersonajes(); 
        System.out.println(separator);
        
        //m.deletePersonajes(33);
    }
}
