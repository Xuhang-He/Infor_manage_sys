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
		<title> 企业信息管理系统 - 工作记录 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 工作记录">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" height="200">
					
					<table height="200" background="images/banner.jpg" border="0" cellspacing ="0" cellpadding="0" width="100%">
						<tr>
							<td>
							</td>
						</tr>
					</table>
				</td>	
			</tr>

			<tr>
				<td width="160" bgcolor="#EEEEEE" valign="top" height="100%">
					//菜单栏
					<table width="100%" bgcolor="#EEEEEE">

						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="welcome.jsp">首页面</a></li>
								</ul>
							</td>
						</tr>


						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="#">通信工具</a></li>
								</ul>
								<ul>
									<li><a href="address.jsp">通讯录管理</a></li>
									<li><a href="sms.jsp">短消息管理</a></li>
								</ul>
							</td>
						</tr>

						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="#">个人信息管理</a></li>
								</ul>

								<ul>
									<li><a href="schedule.jsp">日程安排</a></li>
									<li><a href="worklog.jsp">工作记录</a></li>
								</ul>
							</td>
						</tr>


						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="#">企业管理</a></li>
								</ul>

								<ul>
									<li><a href="notice.jsp">公司公告</a></li>
									<li><a href="meeting.jsp">工作会议</a></li>
								</ul>
							</td>
						</tr>

						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="login.jsp">退出</a></li>
								</ul>
							</td>
						</tr>


					</table>
				</td>
				<td align="left" valign="top">
					//当前位置栏
					<table width="100%" class="position">
						<tr>
							<td>当前位置：工作记录</td>
							<td align="right"><a href="worklog_add.jsp">新增工作记录</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//数据列表区域

					<table border="0" width="100%">
						<tr class="tableheader">
							<td>年份</td>
							<td>月份</td>
							<td>日期</td>
							<td>日志标题</td>
							<td>日志内容</td>
							<td>记录时间</td>
							<td>操作</td>
						</tr>
						<tr>
							<td>2007</td>
							<td>8</td>
							<td>30</td>
							<td>javaweb</td>
							<td>java高手真经讨论会</td>
							<td>2007-08-30 17:40:00</td>
							<td><a href='worklog_edit.jsp?id=9'>修改</a> <a href="worklog.jsp?id=8">删除</a></td>
						</tr>

						
					</table>
					//分页栏

					<form name="form1" action="worklog.jsp" method="post">
						<table border="0" width="100%" class="pager">
							<tr>
								<td align="left">每页记录数： <select name ="pagesize"
									onchange="document.all.pageNo.value='1';document.all.form1.submit();">
									<option value="10">10</option>
									<option value="25" selected="selected">25</option>
									<option value="50">50</option>
									<option value="100">100</option>
									<option value="200">200</option>
									<option value="300">300</option>
									<option value="500">500</option>


								</select></td>

								<td align="center">总记录数：1</td>
								<td align="right">
									<a href="javascript:document.all.pageNo.value='1';document.all.form1.submit();">首页</a>
									<a href="javascript:document.all.pageNo.value='1';document.all.form1.submit();">前一页</a>
									<a href="javascript:document.all.pageNo.value='1';document.all.form1.submit();">后一页</a>
									<a href="javascript:document.all.pageNo.value='1';document.all.form1.submit();">尾页</a>
									<select name="pageNo" onchange="document.all.form1.submit();">
										<option value="1" selected="selected">1</option>
									</select></td>
									<td width="20"></td>	
							</tr>
						</table>
					</form>

				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					//版权信息
					<hr><font face="仿宋">Copyright <span class=fontArial>&copy;</span>何旭杭版权所有</font>
				</td>
			</tr>
		</table>
	</body>
	
</html>	