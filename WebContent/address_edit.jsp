<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
	
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
			function validAddressEdit(theform){
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
								<td>当前位置：通讯录管理&gt;&gt;修改联系人</td>
								<td align="right"><a href="address.do?method=list&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">返回通讯录主页面</a></td>
								<td width="20"></td>
							</tr>
						</table>

						<form name="form1" action="address.do?method=update" method="post" onsubmit="return validAddressEdit(this);"><b></b>
						<input type="hidden" name="id" value="${requestScope.id}">
						<input type="hidden" name="pageSize" value="${requestScope.pageSize}">
						<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
						
						<table border="0" width="100%">
							<tr>
								<td>姓名</td>
								<td><input type="text" name="name" maxlength="50" value="${requestScope.name}">
								</td>
							</tr>

							<tr>
								<td>性别</td>
								<td><input type="text" name="sex" maxlength="10" value="${requestScope.sex}">
								</td>
							</tr>

							<tr>
								<td>手机</td>
								<td><input type="text" name="mobile" maxlength="20" value="${requestScope.mobile}">
								</td>
							</tr>

							<tr>
								<td>E-mail</td>
								<td><input type="text" name="email" maxlength="50" value="${requestScope.email}">
								</td>
							</tr>


							<tr>
								<td>QQ</td>
								<td><input type="text" name="qq" maxlength="20" value="${requestScope.qq}">
								</td>
							</tr>

							<tr>
								<td>工作单位</td>
								<td><input type="text" name="company" maxlength="50" value="${requestScope.company}">
								</td>
							</tr>

							<tr>
								<td>地址</td>
								<td><input type="text" name="address" maxlength="100" value="${requestScope.address}">
								</td>
							</tr>

							<tr>
								<td>邮编</td>
								<td><input type="text" name="postcode" maxlength="10" value="${requestScope.postcode}">
								</td>
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