<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Toolbar</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <script type="text/javascript">
</script>
</head>
  <body>
<table width="98%" id="the-table" align="center">
    <tr bgcolor="#E0F1F8" align="center" class="b_tr">
        <td>选择</td>
        <td>id</td>
        <td>plugins</td>
    </tr>
<c:forEach items="${list}" var="item">
    <tr align="center">
        <td><input type="checkbox" name="check" value="${item.id}"></td>
        <td>${item.id }</td>
        <td>${item.plugins }</td>
    </tr>
</c:forEach>            
</table>
  </body>
</html>
