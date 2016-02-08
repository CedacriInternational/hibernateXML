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
    String personajName = request.getParameter("name");
    String personajRace = request.getParameter("race");
    String personajWeapon = request.getParameter("weapon");
    String personajHealth = request.getParameter("health");
    String personajDamage = request.getParameter("damage");
    String personajShield = request.getParameter("shield");
    
    String output = "";
    String color = "";
        
    if (personajName != null && personajRace != null && personajWeapon != null &&
        personajHealth != null && personajShield != null &&  personajDamage != null && personajIndex != null) 
    {
        try 
        {
            if (Integer.parseInt(personajRace) < 0) 
            {
                color = "style='color:red'";
                output = "Race is not valid!";
            }
            if (Integer.parseInt(personajHealth) < 0 || Integer.parseInt(personajHealth) > 300) 
            {
                color = "style='color:red'";
                output = "Health is not valid!";
            }
            else if (Integer.parseInt(personajShield) < 0 || Integer.parseInt(personajShield) > 30) 
            {
                color = "style='color:red'";
                output = "Shield is not valid!";
            }
            else if (Integer.parseInt(personajDamage) < 0 || Integer.parseInt(personajDamage) > 50) 
            {
                color = "style='color:red'";
                output = "Damage is not valid!";
            }
            else 
            {                       
                if (manager.findPersonajes(Integer.parseInt(personajIndex)))
                {
                    color = "style='color:green'";
                    output = "Personaj was updated!";   
                    manager.updatePersonaj(Integer.parseInt(personajIndex), personajName, Integer.parseInt(personajRace),
                                                    personajWeapon, Integer.parseInt(personajHealth), 
                                                    Integer.parseInt(personajDamage), Integer.parseInt(personajShield));
                }     
                else 
                {
                    color = "style='color:red'";
                    output = "Personaj was not found!";
                }      
            }
        } catch (NumberFormatException e) {
                color = "style='color:red;'";
                output = "Values are not acceptable!";
        }      
    } 
    else 
    {
        color = "style='color:red'";
        output = "Fields can't be empty!";
    }
    
    List personajes = manager.listPersonajes();
    List races = manager.listRaces();
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
    <%  } %>
        </table><br>

        <h2>Modify another one:</h2>
        <form action="edit.jsp" method="POST">
            <table>
                <tr>
                    <td>INDEX:</td>
                    <td><input type="text" name="index"></td>
                </tr>
                <tr>
                    <td>NAME:</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>RACE:</td>
                    <td>
                    <select name="race">
                 <%  
                    for (int i = 0; i < races.size(); i++) 
                    { %>
                        <option value="<%= ((Races)races.get(i)).getRaceId()%>"><%= ((Races)races.get(i)).getRace()%></option>
                 <% } %>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>WEAPON:</td>
                    <td><input type="text" name="weapon"></td>
                </tr>
                <tr>
                    <td>HEALTH:</td>
                    <td><input type="text" name="health"></td>
                </tr>
                <tr>
                    <td>DAMAGE:</td>
                    <td><input type="text" name="damage"></td>
                </tr>
                <tr>
                    <td>SHIELD:</td>
                    <td><input type="text" name="shield"></td>
                </tr>
            </table>
            <p <%= color%>><%= output%></p>
            <input type="submit" value="EDIT!">
        </form>
    </fieldset>
    <form action='index.jsp' method="post">
        <input type="submit" value='return to index'>  
    </form>           
</body>
</html>
