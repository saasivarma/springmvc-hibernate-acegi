<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<c:url value='/img/sz.ico'/>" rel="icon">
    <title>教学管理系统</title>

    <link href="<c:url value='/css/business.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/bootstrap-table.css'/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
	<%@ include file="header.jsp"%>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="${ctx}/user/main.html"><i class="icon-tasks"></i> 全部功能</a></li>
          </ul>

          <ul class="nav nav-sidebar">
            <li class="active">
              <a href="${ctx}/super/create-profile.html"><i class="icon-search"></i> 学校基础信息创建<span class="sr-only">(current)</span></a>
            </li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${ctx}/super/create-subject.html"><i class="icon-edit"></i> 教学科目信息创建</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${ctx}/super/import-teacher.html"><i class="icon-signin"></i> 教师信息导入</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${ctx}/super/import-student.html"><i class="icon-signin"></i> 学生信息导入</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          	<h1 class="page-header">学校基础信息创建</h1>
			<div id="sch-step3" class="panel panel-success">
			  <div class="panel-heading">
			  	<ol style="list-style:none;display:block;width:auto;margin:0px auto">
					<li style="padding-left:90px;display:inline">1.学校信息设置</li>
					<li style="padding-left:90px;display:inline">2.年级信息设置</li>
			 		<li style="padding-left:90px;display:inline"><font color="red"><strong>3.班级信息设置</strong></font></li>
			 		<li style="padding-left:90px;display:inline">4.确认</li>
				  </ol>
			  </div>
			  <div class="panel-body">
		      <div class="row row-offcanvas row-offcanvas-center" style="height:auto">
		      <table data-toggle="table">
			    <thead>
			    <tr>
			        <th data-field="name">班级代码</th>
			        <th data-field="stargazers_count">班级名称</th>
			        <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
			    </tr>
			    </thead>
			    <tbody>
	              <c:forEach items="${clazzList}" var="item">
	               <tr>
	                 <td>${item.clz_SchoolRoll.code}</td>
	                 <td>${item.clazz.name}</td>
	               </tr>
	               </c:forEach>
	             </tbody>
				</table>
				<!-- 
		     	<div class="table-responsive">
		          <table class="table">
		            <thead>
		             <tr>
		               <th>班级代码</th>
		               <th>班级名称</th>
		               <th>操作</th>
		             </tr>
		            </thead>
		            <tbody>
		              <c:forEach items="${clazzList}" var="item">
		               <tr>
		                 <td style="padding:4px 0px 0px 4px">${item.clz_SchoolRoll.code}</td>
		                 <td style="padding:4px 0px 0px 4px">${item.clazz.name}</td>
		                 <td style="padding:0px">
			                 <div class="btn-group btn-group-sm" role="group" aria-label="Small button group">
						      <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#${item.clz_SchoolRoll.code}">修改</button>
						      <button type="button" class="btn btn-danger" onclick="deleteGrd()">删除</button>
						     </div>
		                 </td>
		               </tr>
		               <tr>
		               	<td colspan="3">
		               		<div id="${item.clz_SchoolRoll.code}" class="bs-callout bs-callout-danger collapse">
			               		<div class="col-sm-8 col-sm-offset-2">
			               		<div class="panel panel-default well" >
					                <div class="panel-heading">
					                    <div class="panel-title" style="text-align: left;"><i class="icon-edit"></i> 班级信息修改</div>
					                </div>
					                <div class="panel-body" >
					                <form class="form-horizontal" action="" method="POST">
										<div class="control-group">
								          <label class="control-label" for="appCode">班级代码</label>
								          <div class="controls">
								          	<input name="grdId" type="text" value="item.appid" style="display:none">
								            <input id="grdCode" name="appCode" type="text" placeholder="${item.clz_SchoolRoll.code}" class="input-xlarge" value="${item.clz_SchoolRoll.code}" disabled="disabled">
								          </div>
								        </div>
									    <div class="control-group">
								          <label class="control-label" for="appName">班级名称</label>
								          <div class="controls">
								            <input id="grdName" name="grdName" type="text" placeholder="${item.clazz.name}" class="input-xlarge" value="${item.clazz.name}">
								          </div>
								        </div>
									
								        <div class="control-group">
								          <label class="control-label"></label>
								          <div class="controls">
								            <button class="btn btn-danger" type="submit">提交修改</button>
								          </div>
								        </div>
							 	 	</form>
							 	 	</div>
							 	 </div>
								</div>
							</div>
						</td>
		               </tr>
		               </c:forEach>
		            </tbody>
		          </table>
		      	</div>
		      	 -->
		      </div>
		      </div>
		      <div class="panel-footer">
			  <form id="step3-form" class="form-horizontal" method="POST" action="${ctx}/super/profile/step3.html">
				  <div class="form-group" style="margin-bottom:0px">
	                   <div class="col-sm-6 col-sm-offset-5">
                           <div class="btn-group" role="group" aria-label="...">
			              	  <button type="button" class="btn btn-danger" onclick="javascript:history.back(-1);">上一步</button>
			              	  <button type="button" class="btn btn-success" onclick="next('step3')">下一步</button>
						   </div>
                       </div>
	               </div>
			  </form>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
	<script src="<c:url value='/js/jquery.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap-table.js'/>"></script>
    <script src="<c:url value='/js/bootstrap-table-zh-CN.js'/>"></script>
    <script src="<c:url value='/js/holder.js'/>"></script>
    <script src="<c:url value='/js/ie10-viewport-bug-workaround.js'/>"></script>
    <script src="<c:url value='/js/jquery.form.js'/>"></script>
    <script src="<c:url value='/js/business.js'/>"></script>
    <script>
		$(document).ready(function(){
			$("#main").addClass("active");
		});
		function actionFormatter(value, row, index) {
		    return [
		        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
		        '<i class="glyphicon glyphicon-edit"></i>',
		        '</a>',
		        '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
		        '<i class="glyphicon glyphicon-remove"></i>',
		        '</a>'
		    ].join('');
		};
		window.actionEvents = {
		    'click .edit': function (e, value, row, index) {
		        alert('You click edit icon, row: ' + JSON.stringify(row));
		        console.log(value, row, index);
		    },
		    'click .remove': function (e, value, row, index) {
		        alert('You click remove icon, row: ' + JSON.stringify(row));
		        console.log(value, row, index);
		    }
		};
	</script>
  </body>
</html>
