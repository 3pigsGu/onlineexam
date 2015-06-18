<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>教师管理</title>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/head.css">
<link rel="stylesheet" type="text/css" href="css/list_main.css">
<script type="text/javascript" src="script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="script/admin/teacher.js"></script>
<script src="script/time.js"></script>
<script src="script/tips.js"></script>
</head>
<body>
	<!--头部-->
	<jsp:include page="share/head.jsp"></jsp:include>

	<!--中间主体部分-->
	<div class="main">
		<!--年级-->
		<div class="list" id="teacher_list">
			<!--搜索框-->
			<div class="search form-inline">
				<form action="admin/teacher/list" method="post" onsubmit="return search(this);">
					教职工号:<input type="text" name="id">
					姓名:<input type="text" name="name">
					<input type="submit" value="搜索">
				</form>
			</div>
			<!--操作按钮-->
			<div class="operation_btn">
				<button class="btn btn-danger btn-sm" onclick="deleteTeacheres();">删除</button>
				<button class="btn btn-success btn-sm"
					onclick="toggleTeacherAdd(true);">添加教师</button>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="10%">
							<input type="checkbox" onchange="chooseAll(this);" id="checkAll">
							<label for="checkAll">全选</label></th>
						<th width="35%">教职工号</th>
						<th width="35%">姓名</th>
						<th width="30%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.records}" var="teacher">
						<tr>
							<td><input type="checkbox" name="cb"></td>
							<td>${teacher.id}</td>
							<td>${teacher.name}</td>
							<td>
								<button class="btn btn-danger" onclick="deleteTeacher(this);">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--分页-->
		<div class="page">
			<!-- 用于javascript提交，搜索内容 -->
			<input type="hidden" id="search_content" value="${name}">
			<script type="text/javascript">
				function page(pageCode) {
					var search = document.getElementById("search_content").value;
					window.location.href = "admin/teacher/list?pn=" + pageCode + "&name=" + search;
				}
			</script>
			<jsp:include page="../share/page.jsp"></jsp:include>
		</div>
	</div>
	
	<!--班级添加-->
	<div class="modal_window teacher_window form-control" id="teacher_add">
		<!--标题-->
		<div class="modal_window_title">
			添加教师: <img src="images/error.png" onclick="toggleTeacherAdd(false);">
		</div>
		<form action="admin/teacher/add" method="post" onsubmit="return addTeacher(this);">
			<table>
				<tr>
					<td>教职工号:</td>
					<td>
						<input type="text" name="id">
					</td>
				</tr>
				<tr>
					<td>教师姓名:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><span class="error" id="teacher_add_error">&nbsp;</span>
					</td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input type="submit" value="提交"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>