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
<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title> 企业信息管理系统 - 公司公告 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 公司公告">
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
							<td>当前位置：公司公告</td>
							<td align="right"><a href="notice.do?method=add&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">新增公告</a></td>
							<td width="20"></td>
						</tr>
					</table>
					//数据列表区域

					<table border="0" width="100%">
						<tr class="tableheader">
							<td>公告填写人</td>
							<td>公告标题</td>
							<td>公告内容</td>
							<td>公告时间</td>
							<td>操作</td>
						</tr>
						<% 
							
							List<Hashtable<String,String>> list=(List<Hashtable<String,String>>) request.getAttribute("list");
							Iterator<Hashtable<String,String>> it = list.iterator();
							while(it.hasNext()){
								Hashtable<String,String> hash = it.next();
								String id = hash.get("id");
								
						
								
							%>
							<tr >
								<td><%=hash.get("sender")%></td>
								<td><%=hash.get("title")%></td>
								<td><%=hash.get("content")%></td>
								<td><%=hash.get("sendtime")%></td>
								
								<td><a href="notice.do?method=edit&id=<%= id %>
								&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">修改</a>
									<a href="notice.do?method=delete&id=<%= id %>
								&pageSize=${requestScope.pageSize}&pageNo=${requestScope.pageNo}">删除</a>
								</td>
							</tr>
							<%
								} 
							%>

						

					</table>
					//分页栏

					<form name="form1" action="notice.do?method=list" method="post">
							<table border="0" width="100%" class="pager">
								<tr>
									<td align="left">每页记录数：<select name="pageSize"
										onchange="document.all.pageNo.value='1';document.all.form1.submit();">
										<option value="10"<%if(pageSize.equals("10")){ %>
											selected="selected"<%} %>
										>10</option>
										<option value="25"<%if(pageSize.equals("25")){ %>
											selected="selected"<%} %>
										>25</option>
										<option value="50"<%if(pageSize.equals("50")){ %>
											selected="selected"<%} %>
										>50</option>
										<option value="100"<%if(pageSize.equals("100")){ %>
											selected="selected"<%} %>
										>100</option>
										<option value="200"<%if(pageSize.equals("200")){ %>
											selected="selected"<%} %>
										>200</option>
										<option value="300"<%if(pageSize.equals("300")){ %>
											selected="selected"<%} %>
										>300</option>
										<option value="500"<%if(pageSize.equals("500")){ %>
											selected="selected"<%} %>
										>500</option>
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
											<%
												int pageCount=(Integer) request.getAttribute("pageCount");
											%>
											<%
												for(int i=1;i<=pageCount;i++){
											%>
											<option value="<%=i %>"<%if(pageNo.equals(i+"")){ %>
											 selected="selected" <%} %>><%=i %></option>
											<%
												} 
											%>
											
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