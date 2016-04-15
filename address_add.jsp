<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>
<%
	String pageSize = (String) request.getAttribute("pageSize");
	String pageNo = (String) request.getAttribute("pageNo");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title> 企业信息管理系统 - 通讯录管理 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 通讯录管理">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
		<script language="javascript">
			function validAddressAdd(theform){
				var name = theform.name.value;
				var mobile = theform.mobile.value;
				var email = theform.email.value;
				if(name ==""){
					alert("姓名不能为空！");
					return false;
				}
				if(mobile==""){
					alert("电话不能为空！");
					return false;
				}
				if(email==""){
					alert("邮箱不能为空！");
					return false;
				}

				return true;
			}	
					

		</script>
	</head>
	<body>
		<table height="100%" width="100%" border="0" cellspacing="0"
			cellpadding="0">

				<tr>
					<td colspan="2" height="200">
						
						<%@ include file="inc/top.jsp" %>

					</td>

				</tr>

				<tr>
					<td width="160" bgcolor="#EEEEEE" valign="top" height="100%">
				
						<%@ include file="inc/menu.jsp" %>
					</td>

					<td align="left" valign="top">
						<table width="100%" class="position">
							<tr>
								<td>当前位置：通讯录管理&gt;&gt;新增联系人</td>
								<td align="right"><a href="action/address.jsp?method=list&pageSize=<%= pageSize %>&pageNo=<%= pageNo%>">返回通讯录主页面</a></td>
								<td width="20"></td>
							</tr>
						</table>

						<form name = "form1" action="action/address.jsp?method=insert" method="post" onsubmit="return validAddressAdd(this);">
							<input type="hidden" name="pageSize" value="<%=pageSize %>">
							<input type="hidden" name="pageNo" value="<%=pageNo %>">
							
							<table border="0" width="100%">
								<tr>
									<td>姓名</td>
									<td><input type="text" name="name" maxlength="50" value=""></td>
								</tr>

								<tr>
									<td>性别</td>
									<td><input type="text" name="sex" maxlength="50" value=""></td>
								</tr>

								<tr>
									<td>手机</td>
									<td><input type="text" name="mobile" maxlength="50" value=""></td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td><input type="text" name="email" maxlength="50" value=""></td>
								</tr>
								<tr>
									<td>QQ</td>
									<td><input type="text" name="qq" maxlength="50" value=""></td>
								</tr>
								<tr>
									<td>工作单位</td>
									<td><input type="text" name="company" maxlength="50" value=""></td>
								</tr>
								<tr>
									<td>地址</td>
									<td><input type="text" name="address" maxlength="50" value=""></td>
								</tr>

								<tr>
									<td>邮编</td>
									<td><input type="text" name="postcode" maxlength="10" value=""></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="提交"></td>
								</tr>

							</table>
						</form>
						
						
						

					</td>

				</tr>

				<tr>
					<td colspan="2" align="center">
					
						<%@ include file="inc/foot.jsp" %>
					</td>
				</tr>	


		</table>
	</body>
</html>	