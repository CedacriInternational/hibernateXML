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

<body>
    <form action="fight.jsp" method="POST">
        <fieldset>
        <legend>Welcome to the FIGHT CLUB! The first rule of the FIGHT CLUB: You do not talk about FIGHT CLUB</legend>
          
        <table border="1">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>RACE</th>
                <th>WEAPON</th>
                <th>HEALTH</th>
                <th>DAMAGE</th>
                <th>SHIELD</th>
            </tr>                         
            <%  
            List personajes = manager.listPersonajes();
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
        </table><br><br>
             
        <select name="firstWarrior">
            
             <% for (int i  = 0; i < personajes.size(); i++) 
                { %>
                    <option value="<%= i %>" >
                <%= ((Personajes)personajes.get(i)).getName()%> ... <%= ((Personajes)personajes.get(i)).getRace().getRace()%>
                    </option>
             <% } %>
            </select>

            <select name="secondWarrior">
             <% for (int i  = 0; i < personajes.size(); i++) 
                { %>
                    <option value="<%= i %>" >
                <%= ((Personajes)personajes.get(i)).getName()%> ... <%= ((Personajes)personajes.get(i)).getRace().getRace()%>
                    </option>
             <% } %>			
            </select>	
            <input type="submit" value="Let's Fight">
        </fieldset>
    </form>
</body>
</html>


