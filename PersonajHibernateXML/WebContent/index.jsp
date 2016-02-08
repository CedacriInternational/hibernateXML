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
<fieldset>
<legend>OUR HEROES ARE:</legend>
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
        for (int i  = 0; i < personajes.size(); i++) 
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
    <%  } %>
    </table><br>

    <p style="font-size:20px">Choose your will:</p>
    <form action="controller.jsp" method="POST">
        <select name="action">
            <optgroup label="Client">
                <option value="fightClub.jsp" selected>TO BATTLEFIELD</option>
            </optgroup>
            <optgroup label="Administrator">
                <option value="add.jsp">ADD PERSONAJ</option>
                <option value="delete.jsp">DELETE PERSONAJ</option>
                <option value="edit.jsp">EDIT PERSONAJ</option>
            </optgroup>
        </select>
        <input type="submit" value="OK">
    </form>
</fieldset>
</body>
</html>
