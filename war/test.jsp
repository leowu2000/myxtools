<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title><spring:message code="app.title"/></title>
  <link rel="stylesheet" href="<c:url value="/_css/style.css"/>" type="text/css" media="screen"/>
</head>
<body>
<jsp:include page="/WEB-INF/view/_inc/menu.jsp"/>
 
<h2><spring:message code="api.add"/></h2>
 
<c:url var="saveUrl" value='/api/save' context='/dispatcher'/>
<form:form action="${saveUrl}" commandName="api" method="post">
  <form:hidden path="key"/>
 
  <div>Name: <form:input path="name"/></div>
  <div>Description: <form:textarea path="description" rows="3" cols="40"/></div>
  <div>Url: <form:input path="url"/></div>
  <div>Company: <form:input path="company"/></div>
  <div>Created: <fmt:formatDate value="${api.created}" type="both" dateStyle="full"/></div>
  <div>Last Updated: <fmt:formatDate value="${api.lastUpdated}" type="both" dateStyle="full"/></div>
 
  <div>Data formats:
      <%--@elvariable id="availableDataFormats" type="java.lang.Array"--%>
    <form:checkboxes path="dataFormats" items="${availableDataFormats}"/>
  </div>
 
  <div>Protocols: <%--@elvariable id="availableProtocols" type="java.lang.Array"--%>
    <form:checkboxes path="protocols" items="${availableProtocols}"/></div>
 
  <input type="submit" value="save"/> <a href="<c:url value="/apis" context="/dispatcher"/>">cancel</a>
 
</form:form>
 
</body>
</html>