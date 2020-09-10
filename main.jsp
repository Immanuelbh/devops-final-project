<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*, java.text.*" errorPage="" %>
<html>
    <head><title>Final Project</title></head>
    <body>
        <h1>Final Project - Devops - changed!</h1>
        <form>
            <fieldset style="width:20%; background-color: #ccffeb;">
                <legend><b><i>Today<i><b></legend>
                <h2>Current Date and Time is :</h2>
                <h3><% java.util.Date d = new java.util.Date();
                    out.println(d.toString()); %></h3>
            </fieldset>
        </form>
        <form>
            <fieldset style="width:20%; background-color:#e6ffe6;">
                <legend>Count visitors</legend>
                <%
                    Integer hitsCount = (Integer)application.getAttribute("hitCounter");
                    if (hitsCount == null || hitsCount == 0)
                    {
                        /* First visit */
                        out.println("Welcome to my website!!");
                        hitsCount = 1;
                    }
                    else
                    {
                        /* return visit */
                        out.println("Welcome back to my website!!");
                        hitsCount += 1;
                    }
                    application.setAttribute("hitCounter", hitsCount);
                %>
                <p>You are visitor number: <%= hitsCount%></p>
            </fieldset>
        </form>
        <form>
            <fieldset style="width:20%; background-color:#e6ffe6;">
                <legend>Auto refresh</legend>
                <h3>Set new refresh rate:</h3>
                <input type = "number" name = "refresh_rate_input"/>
                <input type = "submit" value = "Set" />
                <h3>current</h3>
                <% 
                String input = request.getParameter("refresh_rate_input");
                int refresh_rate;
                if (input != null) {
                    refresh_rate = Integer.parseInt(request.getParameter("refresh_rate_input"));
                }
                else {
                    refresh_rate = 10;
                }
                response.setIntHeader("Refresh", refresh_rate);
                out.println("This page will refresh every " + refresh_rate + "\n");
                %>
            </fieldset>
        </form>
        <h1>Submitted by Immanuel Ben Hefer 309991644</h1>
    </body>
</html>