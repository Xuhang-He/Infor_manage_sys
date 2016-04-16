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
		<title> 企业信息管理系统 - 注册 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 注册窗口">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
			<script language="javascript">
			
			function validRegister(theform){
					var username = theform.username.value;
					var password1 = theform.password1.value;
					var password2 = theform.password2.value;
					if (username==""){
						alert("用户名不能为空！");
						return false;
					}

					if (password1==""|| password2=="") {
						alert("密码不能为空！");
						return false;
					}
					if (password1!=password2) {
						alert("两次密码输入不同");
						return false;
					}

					return true;

				}
				
				
				
				var XMLHttpReq=false;
				//创建一个XMLHttprequest对象
				
				function createXMLHttpRequest(){
					if(window.XMLHttpRequest){// Mozilla
						XMLHttpReq= new XMLHttpRequest();
					}
					else if(window.ActiveXObject){
						try{
							XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
						}catch(e){
						try{
							XMLHttpReq= new ActiveXObject("Microsoft.XMLHTTP");
						}catch(e){

						}	
						}
					}
				}
				
				
				
				// 发送请求函数
				function send(url){
					createXMLHttpRequest();
					XMLHttpReq.open("GET",url,true);
					XMLHttpReq.onreadystatechange=parse;
					XMLHttpReq.send(null);

				}
				

				

				
				//解析
				function parse(){
					if(XMLHttpReq.readyState==4){//对象状态
						if(XMLHttpReq.status==200){
							var res=XMLHttpReq.responseXML.getElementsByTagName("content")[0].firstChild.data;
							if(res=="ok"){
								document.getElementById("status").innerHTML="该用户名可以使用";
							}else{
								document.getElementById("status").innerHTML=res;
								window.alert(res);
							}
						}else{
							window.alert("所请求的页面有异常");
						}
					}
				}
				


				//身份验证
				function checkUsername(){
					var username = document.getElementById("username").value;
					if(username==""){
						alert("请输入用户名！");
						return false;
					}else{

						send('ajax.do?username='+username);
					}
				}
				


				

				

			</script>

	</head>
	<body bgcolor="#52BDFE">
		<table height ="100%" width="100%">
			<tr>
		<td align="center">
		<table width="572" height="307" background ="images/login.jpg">
			<tr>
				<td width="60%"></td>
				<td>
					<form name="form1" action="register.do" method="post" onsubmit="return validRegister(this);">
						<table width="200" border="0">
							<tr>
								<td colspan="2">
								<div id="status"> 注册新用户</div>
								</td>	
							</tr>
							
							<tr>
								<td>*用户名</td>
								<td><input type="text" name="username" Id="username" size="15" onchange="checkUsername();"></td>
							</tr>

							<tr>
								<td>*密码</td>
								<td><input type="password" name="password1" size="15"></td>
							</tr>

							<tr>
								<td>*确认密码</td>
								<td><input type="password" name="password2" size="15"></td>
							</tr>

							<tr>
								<td>E-mail</td>
								<td><input type="text" name="email" size="15"></td>

							</tr>

							<tr>
								<td colspan="2"><a href="login.jsp">返回登录页面</a><input type="submit" name="submit" value="提交注册"></td>
							</tr>

						</table>	
					</form>	
				</td>	
		</table>	
		</td>	
			</tr>	
		</table>	
		
	</body>
</html>		

