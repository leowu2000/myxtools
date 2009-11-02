<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>管理</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<script type="text/javascript">
</script>
</head>
<body>
<h1>系统用户</h1>
<div id="toolbar"></div>
<form id="listForm" name="listForm" action="" method="post">
${plist.pageInfo.html}
<table width="98%" id="the-table" align="center">
	<tr bgcolor="#E0F1F8" align="center" class="b_tr">
		<td>选择</td>
		<td>name</td>
		<td>age</td>
		<td>birth</td>
		<td>salary</td>
        <td>pic</td>
	</tr>
<c:forEach items="${plist.list}" var="item">
	<tr align="center">
		<td><input type="checkbox" name="check" value="${item.id}"></td>
		<td>${item.name }</td>
        <td>${item.age }</td>
        <td><fmt:formatDate value="${item.birth }" pattern="yyyy-MM-dd"/></td>
        <td>${item.salary }</td>
        <td>${item.pic }</td>
	</tr>
</c:forEach>			
</table>
</form>
<div id="dlg" class="x-hidden">
	<div class="x-window-header">Dialog</div>
	<div class="x-window-body" id="dlg-body">
		<form id="dataForm" name="dataForm" action="" method="post">
			<table>
				<tr>
					<td>登录名</td>
					<td><input type="text" id="username" name="username" style="width: 144"></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td>角色</td>
					<td><select>
							<option>系统管理员</option>
							<option>领导</option>
							<option>录入人员</option>
						</select></td>
				</tr>
				<tr>
					<td>权限</td>
					<td><input type="text" id="role" name="role" style="width: 144"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>
