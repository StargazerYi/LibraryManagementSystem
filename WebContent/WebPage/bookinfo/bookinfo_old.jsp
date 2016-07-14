<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.LMS.ssh.beans.Book"
	import="com.opensymphony.xwork2.ActionContext"
	import="java.util.List"
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
    <meta charset="utf-8"/>
    <title>bookinfo</title>
    <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../bookinfo/bookinfo.css" />


</head>

<body>
    

<% Book book = (Book)ActionContext.getContext().get("bookInfo"); %>
<div id="content" role="main">

    
    <div class="container">

        <div class="row">
           <div class="nav">
                <div class="return col-md-1 col-md-offset-10"><a href="">return</a></div>
                <div class="userinfo col-md-1">
                  <form action="">
                      <button class="user-info-button"><span class="glyphicon glyphicon-user" aria-hidden="true">13331253</span></button>
                  </form>
                </div>

           </div> 
           <section class="sheet sheet--padding">

        <div class="container-fluid bookinfo col-md-12">
            <div class="col-md-6 ">
                <img src = <% out.print(getServletContext().getRealPath("upload")+"\\"+book.getPicture()); %> class="img-responsive" alt="Crew as a project management tool">
            </div>
            <div class="col-md-6">
               <div class="table-responsive">
                      <table class="table table-bordered table-striped">
                        <colgroup>
                          <col class="col-xs-1">
                          <col class="col-xs-7">
                        </colgroup>
                        <thead>
                          <tr>
                            <th></th>
                            <th>《<%=book.getBookName() %>》</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row">
                              <p>ISBN </p>
                            </th>
                            <td><%=book.getISBN() %></td>
                          </tr>
                          <tr>
                            <th scope="row">
                              <p>图书馆编号 </p>
                            </th>
                            <td><%=book.getBookId() %></td>
                          </tr>
                          <tr>
                            <th scope="row">
                              <p>状态</p>
                            </th>
                            <td><% 
                            	if(book.getFlag() == 1) {
  		 							out.println("书籍尚未借出");
  		 						} else if(book.getFlag() == 2) {
  		 							out.println("可以预约");
  		 						} else {
  		 							out.println("书籍已经被预约");}%>
  		 					</td>
                          </tr>
                          <tr>
                            <th scope="row">
                              <p>位置</p>
                            </th>
                            <td><%=book.getLocation() %></td>
                          </tr>
                          <tr>
                            <th scope="row">
                              <p>出版发行  </p>
                            </th>
                            <td><%=book.getPublisher() %></td>
                          </tr>
                          <tr>
                            <th scope="row">
                              <p>个人著者 </p>
                            </th>
                            <td><%=book.getAuthor() %></td>
                          </tr>
                          <tr>
                            <th scope="row">
                              <p>内容简介</p>
                            </th>
                            <td><%=book.getBookAbstract() %></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                </div>

</div>
            </div>
        </div>
    </section>

        </div>
    </div>

</div> <!-- close #content -->


    <script src="../jquery.js"></script>
    <!-- <script src="//api.filepicker.io/v2/filepicker.js"></script> -->
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../common.js"></script>
    <script src="../app.js"></script>

</body>
</html>
