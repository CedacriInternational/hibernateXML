<%@page import="java.util.Random"%>
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
    List <Personajes> personajes = manager.listPersonajes();
    
    int first = Integer.parseInt(request.getParameter("firstWarrior"));
    int second = Integer.parseInt(request.getParameter("secondWarrior")); 
    
    int firstRace = personajes.get(first).getRaceId();
    int secondRace = personajes.get(second).getRaceId();
      
    List <Battleargue> firstArguments = manager.listBattleargues(firstRace);
    List <Battleargue> secondArguments = manager.listBattleargues(secondRace);;
    
    Random random = new Random();
%>

<body>
    <h3>The second rule of the FIGHT CLUB: You do not ever talk about FIGHT CLUB</h3>
    <table>
        <tr>
            <th>Warrior</th>
            <th>Opponent</th>
            <th>Epic Speech</th>
            <th>Warrior</th>
            <th>Opponent</th>
            <th>Epic Speech</th>
        </tr>
    <%  while (personajes.get(first).getHealth() > 0 && personajes.get(second).getHealth() > 0)
        {  %>
            <tr>
         <% if (personajes.get(first).getHealth() > 0)
            { %>	
                <td> <%= personajes.get(first).getName() %>(<%= personajes.get(first).getHealth() %>) hits</td>
                <td> <%= personajes.get(second).getName() %>: </td>
            <%  if (personajes.get(first).level() > firstArguments.size()-1)
                { %>
                    <td> <%= firstArguments.get(random.nextInt(firstArguments.size()-1)).getArgument() %> </td>
            <%  }
                else
                {  %>
                    <td> <%= firstArguments.get(personajes.get(first).level()).getArgument() %> </td> 
            <%  }
            	
                personajes.get(second).setHealth(
                         personajes.get(second).getHealth() - 
                        (personajes.get(first).getDamage() - 
                         personajes.get(second).getShield()));
            }	
            if (personajes.get(second).getHealth() > 0)
            {  %>	
                <td> <%= personajes.get(second).getName() %>(<%= personajes.get(second).getHealth() %>) hits</td>
                <td> <%= personajes.get(first).getName() %>: </td>
            <%  if (personajes.get(second).level() > secondArguments.size()-1)
                { %>
                    <td> <%= secondArguments.get(random.nextInt(secondArguments.size()-1)).getArgument() %> </td>
            <%  }
                else
                {  %>    
                    <td> <%= secondArguments.get(personajes.get(second).level()).getArgument() %> </td> 
            <%  }	
                personajes.get(first).setHealth(
                        personajes.get(first).getHealth() - 
                        (personajes.get(second).getDamage() - 
                        personajes.get(first).getShield()));		
            }  %>
            </tr>
    <%  } %>
	
	 </table>
	 
     <% if (personajes.get(first).getHealth() > 0)
        { %>
            <label><%= personajes.get(first).getName() %>  wins!</label>
     <% }	
        else 
        { %>
            <label><%= personajes.get(second).getName() %>  wins!</label>
     <% } %>
     
     <%
        /*manager.updatePersonaj(personajes.get(first));
        manager.updatePersonaj(personajes.get(second));*/
     %>

     <br><br>	 
     <form action='index.jsp' method="post">
        <input type="submit" value='return to index'>  
    </form>  
</body>
</html>
