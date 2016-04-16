<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>

<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title> 企业信息管理系统 - 工作记录 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 工作记录">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
		<script language="javascript">
			function validWorklogAdd(theform){
				var year = theform.year.value;
				var month = theform.month.value;
				var day = theform.day.value;
				var title = theform.title.value;
				var description= theform.description.value;
				
				if(year ==""){
					alert("年份不能为空！");
					return false;
				}
				if(month==""){
					alert("月份不能为空！");
					return false;
				}
				if(day ==""){
					alert("日期不能为空！");
					return false;
				}
				if(title==""){
					alert("记录标题不能为空！");
					return false;
				}
				if(description==""){
					alert("记录内容不能为空！");
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
							<td>当前位置：工作记录&gt;&gt;新增工作记录</td>
							<td align="right"><a href="worklog.do?method=list&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">返回工作记录主页面</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//内容区域
					<form name="form1" action="worklog.do?method=insert" method="post" onsubmit="return validWorklogAdd(this);"><b></b>
						<input type="hidden" name="pageSize" value="${requestScope.pageSize}">
						<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
						<table border="0" width="100%">
							<tr>
								<td>年份</td>
								<td><input type="text" name="year" maxlength="4" value="">
								</td>
							</tr>

							<tr>
								<td>月份</td>
								<td><input type="text" name="month" maxlength="2" value="">
								</td>
							</tr>

							<tr>
								<td>日期</td>
								<td><input type="text" name="day" maxlength="2" value="">
								</td>
							</tr>

							<tr>
								<td>记录标题</td>
								<td><input type="text" name="title" maxlength="100" value="">
								</td>
							</tr>

							<tr>
								<td>记录内容</td>
								<td><textarea name="description" cols="60" rows="15"></textarea>
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