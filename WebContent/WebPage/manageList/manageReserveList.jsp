<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="org.apache.struts2.ServletActionContext"
	import="com.opensymphony.xwork2.ActionContext"
	import="com.LMS.model.beans.Book"
	import="com.LMS.model.beans.Record"
	import="java.util.List"
	import="java.util.Map"
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
  <meta charset="utf-8">

  <title>预约记录</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../manageList/css/manageList.css"> 
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="../manageList/js/manageList.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../navbar/navbar.css" />

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
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<h1>预约记录</h1>

      <table class="table table-striped table-hover">
        <!--表头-->
        <tr>
          <th>书名</th>
          <th>书籍ID</th>
          <th>预约人ID</th>
          <th>预约时间</th>
          <th>预约期限</th>
          <th>状态</th>
          <th>书籍详情</th>
          <th>预约人详情</th>
        </tr>
        <!--数据交互从这里开始-->
       <%
        List<Object> resultRecord = (List<Object>)ActionContext.getContext().getSession().get("Recordlist");
        Map<String, Book> bookmap = (Map<String, Book>)ActionContext.getContext().getSession().get("bookmap");
        if(resultRecord != null && bookmap != null) {
      	  for(int i = 0; i < resultRecord.size();i++) {
      		Record record = (Record)resultRecord.get(i);
      		Book book = bookmap.get(record.getBookId());
      		if(record.getType() == 1) {
      	  		out.println("<tr><td><a>《"+book.getBookName()+"》</a></td>");
      	  		out.println("<td>"+book.getBookId()+"</td>");
      	  		out.println("<td>"+record.getUserId()+"</td>");
      	  		out.println("<td>"+record.getBeginTime()+"</td>");
      	  		if(record.getEndTime() != null )
      	  			out.println("<td>"+record.getEndTime()+"</td>");
      	  		else
      	  		out.println("<td>无</td>");
      	  		if(record.getFlag() == 0) {
      	  			out.println("<td id='time-exceed' >过期</td>");
      	  		} else if(record.getFlag() == 1) {
      	  			out.println("<td>等待</td>");
      	  		} else {
      	  			out.println("<td>激活</td>");
      	  		}
      	  		out.println("<td><form method='post' accept-charset='utf-8' action='bookInfo' novalidate>");
      	  		out.println("<input type='bookId' name='book.bookId' id='bookId' value='"+record.getBookId()+"' style='display:none' />");
      	  		out.println("<input type='submit' name='bookbutton' class='btn btn-primary' value='查看详情' /></form></td>");
      	  		out.println("<td><form method='post' accept-charset='utf-8' action='userInfo' novalidate>");
      	  		out.println("<input type='userId' name='record.userId' id='userId' value='"+record.getUserId()+"' style='display:none' />");
      	  		out.println("<input type='submit' name='bookbutton' class='btn btn-primary' value='查看详情' /></form></td></tr>"); 	  		
      		}
      	  }
        }
        %>
        <!--数据交互到这里结束-->

      </table>
    
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="../jquery.js"></script>
  <script src="../bootstrap/js/bootstrap.js"></script>

</body>

</html>