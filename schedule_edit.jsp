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
							<td>当前位置：日程安排&gt;&gt;修改日程安排</td>
							<td align="right"><a href="schedule.jsp">返回日程安排主页面</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//内容区域
					<form name="form1" action="schedule_edit.jsp" method="post" onsubmit="return validScheduleEdit(this);">
						<input type="hidden" name="id" value="9">
						<table border="0" width="100%">
							<tr>
								<td>年份</td>
								<td><input type="text" name="year" maxlength="4" value="2007">
								</td>
							</tr> 

							<tr>
								<td>月份</td>
								<td><input type="text" name="month" maxlength="2" value="12">
								</td>
							</tr> 

							<tr>
								<td>日期</td>
								<td><input type="text" name="day" maxlength="2" value="1">
								</td>
							</tr> 

							<tr>
								<td>安排内容</td>
								<td><textarea name="plan" cols="60" rows="15">java高手真经讨论会</textarea>
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
					//版权信息
					<hr><font face="仿宋">Copyright <span class=fontArial>&copy;</span>何旭杭版权所有</font>
				</td>
			</tr>
		</table>
	</body>
	
</html>	