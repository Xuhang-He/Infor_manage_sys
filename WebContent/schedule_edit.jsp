<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>
<% 
	String pageSize =(String) request.getAttribute("pageSize");
	String pageNo = (String) request.getAttribute("pageNo");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title> 企业信息管理系统 - 日程安排 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 日程安排">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
		<script language="javascript">
			function validScheduleEdit(theform){
				var year = theform.year.value;
				var month = theform.month.value;
				var day = theform.day.value;
				var plan = theform.plan.value;
				
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
				if(plan==""){
					alert("安排内容不能为空！");
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
							<td>当前位置：日程安排&gt;&gt;修改日程安排</td>
							<td align="right"><a href="schedule.do?method=list&pageSize=<%= pageSize %>&pageNo=<%=pageNo %>">返回日程安排主页面</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//内容区域
					<form name="form1" action="schedule.do?method=update" method="post" onsubmit="return validScheduleEdit(this);">
						<input type="hidden" name="id" value="<%=request.getAttribute("id") %>">
						<input type="hidden" name="pageSize" value="<%=request.getAttribute("pageSize")%>">
						<input type="hidden" name="pageNo" value="<%=request.getAttribute("pageNo")%>">
						
						<table border="0" width="100%">
							<tr>
								<td>年份</td>
								<td><input type="text" name="year" maxlength="4" value="<%=request.getAttribute("year")%>">
								</td>
							</tr> 

							<tr>
								<td>月份</td>
								<td><input type="text" name="month" maxlength="2" value="<%=request.getAttribute("month")%>">
								</td>
							</tr> 

							<tr>
								<td>日期</td>
								<td><input type="text" name="day" maxlength="2" value="<%=request.getAttribute("day")%>">
								</td>
							</tr> 

							<tr>
								<td>安排内容</td>
								<td><textarea name="plan" cols="60" rows="15"><%=request.getAttribute("plan")%></textarea>
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