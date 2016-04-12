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
							<td>当前位置：短消息管理</td>
							<td align="right"><a href="sms_add.jsp">发送消息</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//数据列表区域

					<table border="0" width="100%">
						<tr class="tableheader">
							<td>接受者</td>
							<td>消息内容</td>
							<td>发送者</td>
							<td>是否阅读</td>
							<td>操作</td>
						</tr>
						<tr>
							<td>admin</td>
							<td>java高手真经讨论会</td>
							<td>admin</td>
							<td>0</td>
							<td><a href='sms.jsp?id=8'>设置已读</a> <a href="sms.jsp?id=8">删除</a></td>
						</tr>
					</table>
					//分页栏

					<form name="form1" action="sms.jsp" method="post">
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