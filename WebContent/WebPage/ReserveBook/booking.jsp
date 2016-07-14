<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
  import="com.LMS.model.beans.Book"
  import="com.opensymphony.xwork2.ActionContext"
  import="java.util.List"
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>预约书籍</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../ReserveBook/css/booking.css"> 
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/booking.js"></script>
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
            <a href="/LibraryManagementSys/WebPage/userinfo/userInfo?record.userId =<%out.print(session.getAttribute("userId"));%>">个人详细</a>
          </li>
          <li>
            <a href="/LibraryManagementSys/WebPage/power-search/psearch.jsp">高级搜索</a>
          </li>
          <li>
            <a href="/LibraryManagementSys/WebPage/Booksearch/search.jsp">搜索主页</a>
          </li>
        </ul>

        <ul class="nav nav-sidebar">
          <li>
            <a href="/LibraryManagementSys/WebPage/logout/logout.jsp">Logout</a>
          </li>

        </ul>
      </div>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h1>查询结果</h1>

      <table class="table table-striped table-hover">
        <!--表头-->
        <tr>
          <th>书名</th>
          <th>作者</th>
          <th>出版社</th>
          <th>ISBN号</th>
          <th>位置</th>
          <th>状态</th>
          <th>详情</th>
          <th>预约</th>
        </tr>
        <!--数据交互从这里开始-->
        <%
        List<Object> book = (List<Object>)ActionContext.getContext().getSession().get("book1");
        if(book != null && book.size() != 0) {
          for(int i = 0; i < book.size(); i++) {
            Book temp = (Book)book.get(i);
            out.println("<tr>");
            out.println("<td>"+temp.getBookName()+"</td>");
            out.println("<td>"+temp.getAuthor()+"</td>");
            out.println("<td>"+temp.getPublisher()+"</td>");
            out.println("<td>"+temp.getISBN()+"</td>");
            out.println("<td>"+temp.getLocation()+"</td>");
            if(temp.getFlag() == 1) {
              out.println("<td>书籍尚未借出</td>");
            } else if(temp.getFlag() == 2) {
              out.println("<td>可以预约</td>");
            } else {
              out.println("<td>书籍已经被预约</td>");
            }
            out.println("<td><form method='post' accept-charset='utf-8' action='bookInfo' novalidate>");
            out.println("<input type='bookId' name='book.bookId' id='bookId' value='"+temp.getBookId()+"' style='display:none' />");
            out.println("<input type='submit' name='bookbutton' class='btn btn-primary' value='查看详情'  />");
            out.println("</form></td>");
            out.println("<td><form method='post' accept-charset='utf-8' action='reserveBook' novalidate>");
            String userid = "";
            if(session.getAttribute("userId") != null)
              userid = (String)session.getAttribute("userId");
            out.println("<input type='userId' name='record.userId' id='userId' value='"+userid+"' style='display:none' />");
            out.println("<input type='bookId' name='record.bookId' id='bookId' value='"+temp.getBookId()+"' style='display:none' />");
            if(temp.getFlag()!=2) {
              out.println("<input type='submit' name='idbutton' class='btn btn-primary' value='预约' disabled='disabled' />");
            } else {
              out.println("<input type='submit' name='idbutton' class='btn btn-primary' value='预约' onclick='this.disabled=true'/>");
            }
            out.println("</form></td>");
            out.println("</tr>");
          }
        }
        %>
        <!--数据交互到这里结束-->

      </table>
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
                <h2 id="outputWords"></h2>
                <h4><%= ActionContext.getContext().get("status") %></h4> 
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
				$("#outputWords").html("添加失败")
			} else {
				$("#outputWords").html("添加成功")
			}
			$(function () { $('#myModal').modal({
		      keyboard: true
		   	})});
		}
	})
  </script>
</body>

</html>