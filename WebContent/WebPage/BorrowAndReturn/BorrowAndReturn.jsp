<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="org.apache.struts2.ServletActionContext"
	import="com.opensymphony.xwork2.ActionContext"
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">

  <title>navbar</title>

  <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../navbar/navbar.css" />
  <link rel="stylesheet" type="text/css" href="../BorrowAndReturn/css/manage.css" />
</head>

<body>

  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">图书馆书籍管理系统</a>
      </div>
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-3 col-md-2 sidebar z-depth-1 sidebar-font">
       <ul class="nav nav-sidebar">
          <li>
            <a href="/LibraryManagementSys/WebPage/BorrowAndReturn/BorrowAndReturn.jsp">登记借书/还书</a>
          </li>
          <li>
            <a href="/LibraryManagementSys/WebPage/manageList/findBorrowRecord">查询借书记录</a>
          </li>
          <li>
            <a href="/LibraryManagementSys/WebPage/manageList/findReserveRecord">查询预约记录</a>
          </li>
          <li>
            <a href="/LibraryManagementSys/WebPage/addNewBook/addNewBook.jsp">添加书籍</a>
          </li>
        </ul>

        <ul class="nav nav-sidebar">
          <li>
            <a href="/LibraryManagementSys/WebPage/logout/logout.jsp">Logout</a>
          </li>
        </ul>
      </div>
      <div class="col-sm-7 col-sm-offset-0 col-md-12 col-md-offset-0 main">
        <div class="outings">
              <div class="col-md-12 col-md-offset-2 userinfo-content">
                <ul id="userinfo-myTab" class="nav nav-tabs">
                  <li class="active">
                    <a href="#userinfo-booking-tab" data-toggle="tab">借书</a>
                  </li>
                  <li>
                    <a href="#userinfo-booked-tab" data-toggle="tab">还书</a>
                  </li>

                </ul>
                <!-- tab框 -->
                <div id="user-info-myTabContent" class="tab-content">
                  <!-- 预订框 -->
                  <div class="tab-pane fade in active" id="userinfo-booking-tab">
                    <div class="panel panel-default ">

                   <div class="inner">
        			<div class="h2">登记借书</div>
      				 <form method="post" accept-charset="utf-8" action="borrowAndreturn" novalidate>
      					<div class="form-group">
        				<div id="bookIdType">
          				<label for="bookIdInput" class="col-sm-2 control-label" id="bookId">书籍ID</label>
          				<input name="record.bookId" class="form-control" id="bookIdInput" placeholder="bookId">
      					</div>
     					<div id="bookIdType">
         				<label for="bookIdInput" class="col-sm-2 control-label" id="bookId">用户ID</label>
          				<input name="record.userId" class="form-control" id="bookIdInput" placeholder="userId">
      					</div>
      					<div id="bookIdType">
         				<label for="bookIdInput" class="col-sm-2 control-label" id="bookId" style='display:none' >动作类型</label>
          				<input name="actionType" class="form-control" id="bookIdInput" value = "borrow" placeholder="actionType" style='display:none'>
      					</div>
      					<button type="submit" class="btn btn-primary" id="submit-button">修改</button>
     					</div>
    					</form>
    					</div>
                    </div>
                  </div>

                  <!-- 已借框 -->
                  <div class="tab-pane fade" id="userinfo-booked-tab">
                    <div class="panel panel-default ">
           			 <div class="inner">
        			<div class="h2">登记还书</div>
      				 <form method="post" accept-charset="utf-8" action="borrowAndreturn" novalidate>
      					<div class="form-group">
        				<div id="bookIdType">
          				<label for="bookIdInput" class="col-sm-2 control-label" id="bookId">书籍ID</label>
          				<input name="record.bookId" class="form-control" id="bookIdInput" placeholder="bookId">
      					</div>
      					<div id="bookIdType">
         				<label for="bookIdInput" class="col-sm-2 control-label" id="bookId" style='display:none'>动作类型</label>
          				<input name="actionType" class="form-control" id="bookIdInput" value = "return" placeholder="actionType" style='display:none'>
      					</div>
      					<button type="submit" class="btn btn-primary" id="submit-button">修改</button>
     					</div>
    					</form>
    					</div>
                    </div>
                  </div>
                </div>

              </div>
   		</div>
   
    <!-- 模态框控制（Modal） -->
    <div class="successFlag" id="unsuccess" style="display:none">${status}</div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
       aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
          <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal" aria-hidden="true">
                      &times;
                </button>
             </div>
             <div class="modal-body">
              <!-- 预约成功/失败信息及代码 -->
              <h4><%= ActionContext.getContext().get("status") %></h4> 
                <h2 id="outputWords"></h2>
             </div>
             <div class="modal-footer">
                <button type="button" class="btn btn-default" 
                   data-dismiss="modal">关闭
                </button>
             </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal -->
    </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="../jquery.js"></script>
  <script src="../bootstrap/js/bootstrap.js"></script>
 <script type="text/javascript">
  $(document).ready(function(){
		$('body').css({"overflow-x":"auto","overflow-y":"auto"})
		if($("div.successFlag").html()=="0" || $("div.successFlag").html()=="1") {
			if($("div.successFlag").html()=="0") {
				$("#outputWords").html("失败")
			} else {
				$("#outputWords").html("成功")
			}
			$(function () { $('#myModal').modal({
		      keyboard: true
		   	})});
		}
	})
  	</script>
</body>

</html>