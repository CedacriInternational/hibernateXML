<%@page import="java.util.List"%>
<%@page import="mypersonajes.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>

<jsp:useBean id="manager" class="mypersonajes.ManageDAOImpl" scope="application" />
    
<%
    String personajIndex = request.getParameter("index");
    String output = "";
    String color = "";
                
    if (personajIndex != null) 
    {     
        int index = Integer.parseInt(personajIndex);
        try {                    
            if (manager.findPersonajes(index))
            {
                manager.deletePersonajes(index);
                color = "style='color:green'";
                output = "Personaj was terminated!";
            }
            else
            {
                color = "style='color:red'";
                output = "Personaj was'n found!"; 
            }
        } catch (NumberFormatException e) {
            color = "style='color:red;'";
            output = "insert number to delete!";
            e.printStackTrace();
        } 
    }
    
    List personajes = manager.listPersonajes();
 %>
  
<body>
    <fieldset>
    <legend>OUR HEROES ARE:</legend>
        <table border="1">
            <tr>
                <th>nr.</th>
                <th>NAME</th>
                <th>RACE</th>
                <th>WEAPON</th>
                <th>HEALTH</th>
                <th>DAMAGE</th>
                <th>SHIELD</th>
            </tr>       
        <%  
        for (int i = 0; i < personajes.size(); i++) 
        { %>
            <tr>
                
                <td><%= ((Personajes)personajes.get(i)).getPersonajId()%></td>
                <td><%= ((Personajes)personajes.get(i)).getName()%></td>
                <td><%= ((Personajes)personajes.get(i)).getRace().getRace()%></td>
                <td><%= ((Personajes)personajes.get(i)).getWeapon()%></td>
                <td><%= ((Personajes)personajes.get(i)).getHealth()%></td>
                <td><%= ((Personajes)personajes.get(i)).getDamage()%></td>
                <td><%= ((Personajes)personajes.get(i)).getShield()%></td>
            </tr>
     <% } %> 
      
        </table><br>

        <h2>Kill another one:</h2>
        <form action="delete.jsp" method="POST">
            <label>Insert Index</label>
            <input type="text" name="index">
            <p <%= color%>><%= output%></p>
            <input type="submit" value="DELETE!">
        </form>
    </fieldset>
    <form action='index.jsp' method="post">
        <input type="submit" value='return to index'>  
    </form>        

</body>

</html>
