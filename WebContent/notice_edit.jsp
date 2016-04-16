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
		<title> 企业信息管理系统 - 公司公告 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 公司公告">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
		<script language="javascript">
			function validNoticeEdit(theform){
				var title = theform.title.value;
				
				
				if(title ==""){
					alert("公告标题不能为空！");
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
							<td>当前位置：公司公告&gt;&gt;修改公司公告</td>
							<td align="right"><a href="notice.do?method=list&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">返回公司公告主页面</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//内容区域
					<form name="form1" action="notice.do?method=update" method="post" onsubmit="return validNoticeEdit(this);">
						<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
						<input type="hidden" name="pageSize" value="<%=request.getAttribute("pageSize")%>">
						<input type="hidden" name="pageNo" value="<%=request.getAttribute("pageNo")%>">
						<table border="0" width="100%">
							<tr>
								<td>公告填写人</td>
								<td><input type="text" name="sender" maxlength="4" value="${requestScope.sender}" readonly="readonly">
								</td>
							</tr> 

							<tr>
								<td>公告标题</td>
								<td><input type="text" name="title" maxlength="100" value="${requestScope.title}">
								</td>
							</tr> 

							

							<tr>
								<td>公告内容</td>
								<td><textarea name="content" cols="60" rows="15">${requestScope.content}</textarea>
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