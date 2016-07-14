<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
  import="org.apache.struts2.ServletActionContext"
  import="com.opensymphony.xwork2.ActionContext"
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
  <meta charset="utf-8">

  <title>添加书籍</title>

  <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="../navbar/navbar.css" />
  <link rel="stylesheet" type="text/css" href="../addNewBook/css/addNewBook.css" />
  <script src="../addNewBook/js/addNewBook.js"></script>
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
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 m-t-3">
                <div class="card">
                    <div class="card-block">
                      <!--   <a href="/" class="image-link m-a-2" style="display: block;text-align: center;">
                            <img style="width: 100px;" src="" alt="Our Logo">
                        </a> -->
                            <div class="p-a-1">
                                <form method="post" accept-charset="utf-8" action="upLoad" enctype="multipart/form-data" novalidate>
                                   <!--  <div style="display:none;">
                                        <input type="hidden" name="_method" value="POST" class="form-control">
                                        <input type="hidden" name="_csrfToken" class="form-control">
                                    </div> -->
                                    <div class="form-group bookName">
                                        <label for="bookName">书名</label>
                                        <input type="text" name="book.bookName" placeholder="BookName" tabindex="1" required="required" class="form-control form-control-lg" id="bookName" pattern="\d{1,15}" title="输入不能为空" />                                
                                    </div> 
                                    <div class="form-group bookCover">
                                        <label for="bookPicture">封面</label>
                                        <input type="file" name="upload" placeholder="选择文件..." tabindex="2" required="required" class="form-control form-control-lg" id="bookCover" pattern="\d{1,15}" title="输入不能为空"/>
                                    </div>
                                    <div class="form-group ISBN">
                                        <label for="ISBN">ISBN号</label>
                                        <input type="text" name="book.ISBN" placeholder="ISBN" tabindex="3" required="required" class="form-control form-control-lg" id="ISBN" pattern="\d{1,15}" title="输入不能为空"/>
                                    </div>           
                                    <div class="form-group author">
                                        <label for="author">作者</label>
                                        <input type="text" name="book.Author" placeholder="author" tabindex="4" required="required" class="form-control form-control-lg" id="author" pattern="\d{1,15}" title="输入不能为空"/>
                                    </div>
                                    <div class="form-group price">
                                        <label for="password">价格</label>
                                        <input type="text" name="book.Price" placeholder="price" tabindex="5" required="required" class="form-control form-control-lg" id="price" pattern="\d{1,15}" title="输入不能为空" >
                                    </div>                    
                                  <div class="form-group publisher">
                                        <label for="password">出版社</label>
                                        <input type="text" name="book.Publisher" placeholder="publisher" required="required" tabindex="6" class="form-control form-control-lg" id="publisher" pattern="\d{1,15}" title="输入不能为空"/>
                                    </div>    
                          
                          <div class="form-group location">
                                        <label for="location">书籍所在书架位置</label>
                                        <input type="text" name="book.location" placeholder="location" tabindex="7" required="required" class="form-control form-control-lg" id="location" pattern="\d{1,15}" title="输入不能为空"/>
                                    </div>

                                    <div class="form-group bookAbstract">
                                        <label for="bookAbstract">书籍介绍</label>
                                        <input type="text" name="book.bookAbstract" placeholder="bookAbstract" tabindex="8" required="required" class="form-control form-control-lg" id="bookAbstract" pattern="\d{1,15}" title="输入不能为空"/>
                                    </div>

                                    <!-- <input type="hidden" name="redirect" id="redirect" value="/" class="form-control">   -->
                                    <input type="submit" value="书籍入库" class="btn btn-primary btn-block" tabindex="3" />
                
                               <!--  <div style="display:none;">
                                    <input type="hidden" name="_Token[fields]" class="form-control">
                                    <input type="hidden" name="_Token[unlocked]" value="" class="form-control">
                                </div> -->
                                </form>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框控制（Modal） -->

      </div>
    </div>
  </div>
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