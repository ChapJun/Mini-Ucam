<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name = "value" type = "java.lang.String" required="true" %>

<%
	value = value.replace("<", "&lt;");
	value = value.replaceAll("\n", "\n<br>");
	value = value.replace("&", "&amp;");
	value = value.replace(" ", "&nbsp;");
%>

<%= value %>