<html>
    <head><title>JSPApp</title></head>
    <body>
        <form>
            <fieldset style="width:20%; background-color: #ccffeb;">
                <legend><b><i>JSP Application<i><b></legend>
                <h3>Current Date and Time is :</h3>
                <% java.util.Date d = new java.util.Date();
                out.println(d.toString()); %>
            </fieldset>
        </form>
        <form>
            <fieldset style="width:20%; background-color:#e6ffe6;">
                <legend>Count visitor</legend>
                <%
                    Integer hitsCount =
                    (Integer)application.getAttribute("hitCounter");
                    if( hitsCount ==null || hitsCount == 0 )
                    {
                        /* First visit */
                        out.println("Welcome to my website!!");
                        hitsCount = 1;
                    }
                    else
                    {
                        /* return visit */
                        out.println("Welcome to my website!!");
                        hitsCount += 1;
                    }
                    application.setAttribute("hitCounter", hitsCount);
                %>
                <p>You are visitor number: <%= hitsCount%></p>
            </fieldset>
        </form>
        <center>
            <form>
                <fieldset style="width:20%; background-color:#e6ffe6;">
                    <legend>Auto refresh</legend>
                    <h2>Auto Refresh Example</h2>
                    <%
                       // Set refresh, autoload time as 1 seconds
                       response.setIntHeader("Refresh", 1);
                       // Get current time
                       Calendar calendar = new GregorianCalendar();
                       String am_pm;
                       int hour = calendar.get(Calendar.HOUR);
                       int minute = calendar.get(Calendar.MINUTE);
                       int second = calendar.get(Calendar.SECOND);
                       if(calendar.get(Calendar.AM_PM) == 0)
                          am_pm = "AM";
                       else
                          am_pm = "PM";
                       String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
                       out.println("Crrent Time: " + CT + "\n");
                    %>
                </fieldset>
            </form>
        </center>
    </body>
</html>