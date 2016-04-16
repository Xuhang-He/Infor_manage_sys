<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title> 企业信息管理系统 - 工作会议 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 工作会议">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
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
							<td>当前位置：工作会议</td>
							<td align="right"><a href="meeting.do?method=add&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">新增工作会议</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//数据列表区域

					<table border="0" width="100%">
						<tr class="tableheader">
							<td>会议填写人</td>
							<td>会议开始时间</td>
							<td>会议结束时间</td>
							<td>会议地点</td>
							<td>会议标题</td>
							<td>会议内容</td>
							<td>操作</td>
						</tr>
						<c:forEach items ="${requestScope.list}" var="hash">
								<tr>
								<td>${hash.sender} </td>
								<td>${hash.starttime} </td>
								<td>${hash.endtime} </td>
								<td>${hash.address} </td>
								<td>${hash.title} </td>
								<td>${hash.content} </td>
								<td><a href="address.do?method=edit&id=${hash.id} 
								&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">修改</a>
									<a href="address.do?method=delete&id=${hash.id} 
								&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">删除</a>
								</td>
								
								
								</tr>
							</c:forEach>

						

					</table>
					//分页栏

					<form name="form1" action="meeting.do?method=list" method="post">
							<table border="0" width="100%" class="pager">
								<tr>
									<td align="left">每页记录数：<select name="pageSize"
										onchange="document.all.pageNo.value='1';document.all.form1.submit();">
										<option value="10"<c:if test="${requestScope.pageSize}==10 ">selected</c:if>>10</option>
											<option value="25"<c:if test="${requestScope.pageSize}==25 ">selected</c:if>>25</option>
											<option value="50"<c:if test="${requestScope.pageSize}==50 ">selected</c:if>>50</option>
											<option value="100"<c:if test="${requestScope.pageSize}==100 ">selected</c:if>>100</option>
											<option value="200"<c:if test="${requestScope.pageSize}==200 ">selected</c:if>>200</option>
											<option value="300"<c:if test="${requestScope.pageSize}==300 ">selected</c:if>>300</option>
											<option value="500"<c:if test="${requestScope.pageSize}==500 ">selected</c:if>>500</option>
									</select>
									</td>

									<td align="center">总记录数：${requestScope.rowCount}</td>
									<td align="right">
										<a href="javascript:document.all.pageNo.value='${requestScope.pageFirstNo}';
											document.all.form1.submit();">首页</a>	
										<a href="javascript:document.all.pageNo.value='${requestScope.pagePreNo}';
											document.all.form1.submit();">前一页</a>	
										<a href="javascript:document.all.pageNo.value='${requestScope.pageNextNo}';
											document.all.form1.submit();">后一页</a>	
										<a href="javascript:document.all.pageNo.value='${requestScope.pageLastNo}';
											document.all.form1.submit();">尾页</a>		
										<select name="pageNo" onchange="document.all.form1.submit();">
											<c:forEach var="i" begin ="1" end="${requestScope.pageCount}">
												<option value="${i }" <c:if test="${i} == ${requestScope.pageNo}">selected</c:if>>${i}</option>											
											 </c:forEach>
											
											
										</select>
									</td>
									<td width="20"></td>
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