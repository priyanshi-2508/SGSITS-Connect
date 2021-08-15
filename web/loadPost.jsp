<%@page import="com.sgsits.connect.entities.User"%>
<%@page import="com.sgsits.connect.dao.LikeDao"%>
<%@page import="java.util.*"%>
<%@page import="com.sgsits.connect.entities.Post"%>
<%@page import="com.sgsits.connect.helper.ConnectionProvider"%>
<%@page import="com.sgsits.connect.dao.PostDAO"%>
<%--<%@include file="js/myjs.js" %>--%>
<div class="row">
<%
    User ur = (User)session.getAttribute("currentUser");
    
        Thread.sleep(500);
        PostDAO d=new PostDAO(ConnectionProvider.getConnection());
        int cid=Integer.parseInt(request.getParameter("cid"));
        ArrayList<Post> posts=null;

        if(cid==0){
        posts=d.getAllPost();
        }
        else{
            posts=d.getAllPostByCategory(cid);
        }
        if(posts.size()==0){
            out.println("<h3 class='display-3 text-center'> No post in this category.. </h3>");
            return;
        }
        for(Post p : posts){
    
%>
<div class="col-md-6 mt-2">
    <div class="card">
            <%
                String s=p.getpPic();
                if(s==""){
            %>
            <img class="card-img-top" src="https://images.pexels.com/photos/261662/pexels-photo-261662.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500">
            <%    
            }
            else{
            %>
            <img class="card-img-top" src="blog_pic/<%=p.getpPic()%>">
            <%
            }
            %> 
        <div class="card-body">
            <b  class="card-title"><%=p.getTitle().toUpperCase()%></b>
            <p><%= p.getpContent() %></p>
            <pre><%= p.getpCode() %></pre>
        </div>
        <div class="card-footer bg-dark text-center">
             <%
                                         LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                         %>
            
            <a href="#" onclick="doLike(<%= p.getPid()%>,<%= ur.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"><span class="like-counter"></i><%= ld.countLikeOnPost(p.getPid()) %></span></a>
            <a href="showBlog.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>
            <a href="#" class="btn btn-outline-light btn-sm"><i class="	fa fa-comments"><span> 20</span></i></a>
            
        </div>
    </div>
</div>
<%
}


%>
</div>