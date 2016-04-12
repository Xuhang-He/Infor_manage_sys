<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
	<head>
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
					
						//logo 图片栏
						<table height="200" background="images/banner.jpg" border="0" cellspacing="0" cellpadding="0" width="100%">
							<tr>
								<td></td>
							</tr>
						</table>

					</td>

				</tr>

				<tr>
					<td width="160" bgcolor="#EEEEEE" valign="top" height="100%">
				
							<table width="100%" bgcolor="#EEEEEE">

								<tr>
									<td>
										<ul class="ulnotab">
											<li><a href="welcome.html">首页面</a></li>
										</ul>
									</td>
								</tr>


								<tr>
									<td>
										<ul class="ulnotab">
											<li><a href="#">通信工具</a></li>
										</ul>
										<ul>
											<li><a href="address.html">通讯录管理</a></li>
											<li><a href="sms.html">短消息管理</a></li>
										</ul>
									</td>
								</tr>

								<tr>
									<td>
										<ul class="ulnotab">
											<li><a href="#">个人信息管理</a></li>
										</ul>

										<ul>
											<li><a href="schedule.html">日程安排</a></li>
											<li><a href="worklog.html">工作记录</a></li>
										</ul>
									</td>
								</tr>


								<tr>
									<td>
										<ul class="ulnotab">
											<li><a href="#">企业管理</a></li>
										</ul>

										<ul>
											<li><a href="notice.html">公司公告</a></li>
											<li><a href="meeting.html">工作会议</a></li>
										</ul>
									</td>
								</tr>

								<tr>
									<td>
										<ul class="ulnotab">
											<li><a href="login.html">退出</a></li>
										</ul>
									</td>
								</tr>


							</table>
					</td>

					<td align="left" valign="top">
						

						<table width="100%" class="position">
							<tr>
								<td>当前位置：通讯录管理&gt;&gt;修改联系人</td>
								<td align="right"><a href="address.html">返回通讯录主页面</a></td>
								<td width="20"></td>
							</tr>
						</table>

						<form name="form1" action="address_edit.html" method="post" onsubmit="return validAddressEdit(this);"><b></b>
						<input type="hidden" name="id" value="1">
						<table border="0" width="100%">
							<tr>
								<td>姓名</td>
								<td><input type="text" name="name" maxlength="50" value="lzb">
								</td>
							</tr>

							<tr>
								<td>性别</td>
								<td><input type="text" name="sex" maxlength="10" value="男">
								</td>
							</tr>

							<tr>
								<td>手机</td>
								<td><input type="text" name="mobile" maxlength="20" value="15988115530">
								</td>
							</tr>

							<tr>
								<td>E-mail</td>
								<td><input type="text" name="email" maxlength="50" value="lzb@163.com">
								</td>
							</tr>


							<tr>
								<td>QQ</td>
								<td><input type="text" name="qq" maxlength="20" value="252748108">
								</td>
							</tr>

							<tr>
								<td>工作单位</td>
								<td><input type="text" name="company" maxlength="50" value="IBM">
								</td>
							</tr>

							<tr>
								<td>地址</td>
								<td><input type="text" name="address" maxlength="100" value="北京">
								</td>
							</tr>

							<tr>
								<td>邮编</td>
								<td><input type="text" name="postcode" maxlength="10" value="100085">
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
					
						<hr><font face="仿宋">Copyright <span class=fontArial>&copy;</span>何旭杭版权所有</font>
					</td>
				</tr>	


		</table>
	</body>
</html>	