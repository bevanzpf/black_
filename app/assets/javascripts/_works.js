var the_link = document.getElementById("<%=work.id%>");
the_link.onclick= function(){
var the_link = document.getElementById("<%=work.id%>");
  if (the_link.date-method == "delete"){
    the_link.href="\/likes\/<%=@like.id%>?work_id=<%=@work.id%>";
    the_span = the_link.childNodes;
    the_span.class="glyphicon glyphicon-star";
  }else{

  }
}
