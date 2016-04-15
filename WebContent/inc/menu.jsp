<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
									<li><a href="action/address.jsp?method=list">通讯录管理</a></li>
									<li><a href="action/sms.jsp?method=list">短消息管理</a></li>
								</ul>
							</td>
						</tr>

						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="#">个人信息管理</a></li>
								</ul>

								<ul>
									<li><a href="action/schedule.jsp?method=list">日程安排</a></li>
									<li><a href="action/worklog.jsp?method=list">工作记录</a></li>
								</ul>
							</td>
						</tr>


						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="#">企业管理</a></li>
								</ul>

								<ul>
									<li><a href="action/notice.jsp?method=list">公司公告</a></li>
									<li><a href="action/meeting.jsp?method=list">工作会议</a></li>
								</ul>
							</td>
						</tr>

						<tr>
							<td>
								<ul class="ulnotab">
									<li><a href="action/logout.jsp">退出</a></li>
								</ul>
							</td>
						</tr>


					</table>
</body>
</html>