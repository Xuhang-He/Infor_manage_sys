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
		<title> 企业信息管理系统 - 公司会议 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 公司会议">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
		<script language="javascript">
			function validMeetingAdd(theform){
				var starttime = theform.starttime.value;
				var address = theform.address.value;
				var title = theform.title.value;
				
				if(starttime ==""){
					alert("会议开始时间不能为空！");
					return false;
				}
				if(address ==""){
					alert("会议地址不能为空！");
					return false;
				}
				if(title ==""){
					alert("会议标题不能为空！");
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
							<td>当前位置：公司会议&gt;&gt;新增公司会议</td>
							<td align="right"><a href="action/meeting.jsp?method=list&pageSize=<%= pageSize %>&pageNo=<%= pageNo%>">返回公司会议主页面</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//内容区域
					<form name="form1" action="action/meeting.jsp?method=insert" method="post" onsubmit="return validMeetingAdd(this);"><b></b>
						<input type="hidden" name="pageSize" value="<%=pageSize %>">
							<input type="hidden" name="pageNo" value="<%=pageNo %>">
						<table border="0" width="100%">
							<tr>
								<td>会议开始时间</td>
								<td><input type="text" name="starttime" maxlength="100" value="">
								</td>
							</tr>

							<tr>
								<td>会议结束时间</td>
								<td><input type="text" name="endtime" maxlength="100" value="">
								</td>
							</tr>

							<tr>
								<td>会议地点</td>
								<td><input type="text" name="address" maxlength="100" value="">
								</td>
							</tr>

							<tr>
								<td>会议标题</td>
								<td><input type="text" name="title" maxlength="100" value="">
								</td>
							</tr>

							<tr>
								<td>会议内容</td>
								<td><textarea name="content" cols="60" rows="15"></textarea>
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