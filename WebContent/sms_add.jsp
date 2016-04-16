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
		<title> 企业信息管理系统 - 短消息管理 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 短消息管理">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
		<script language="javascript">
			function validSmsAdd(theform){
				var username = theform.username.value;
				var message = theform.message.value;
				
				if(username ==""){
					alert("接受者不能为空！");
					return false;
				}
				if(message==""){
					alert("消息内容不能为空！");
					return false;
				}
				

				return true;
			}	
					

		</script>	
	</head>
	<body>
		<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
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
					//当前位置栏
					<table width="100%" class="position">
						<tr>
							<td>当前位置：短消息管理&gt;&gt;新增短消息</td>
							<td align="right"><a href="sms.do?method=list&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">返回短消息管理主页面</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//内容区域
					<form name="form1" action="sms.do?method=insert" method="post" onsubmit="return validSmsAdd(this);"><b></b>
							<input type="hidden" name="pageSize" value="${requestScope.pageSize}">
							<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
						<table border="0" width="100%">
							<tr>
								<td>接受者</td>
								<td><input type="text" name="username" maxlength="50" value="">
								</td>

							</tr>

							<tr>
								<td>消息内容</td>
								<td><textarea name="message" cols="60" rows="15"></textarea></td>
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