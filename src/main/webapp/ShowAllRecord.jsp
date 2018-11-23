<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
    function add() {
        var a = $("#sale").val();/* 输的值 */
        var oldprice = $("#oldprice").html();/* 最高竞价 */
        alert("最高竞价:"+oldprice+",看看人家,你还在犹豫什么???");
        var stateprice = $("#stateprice").html();/* 起拍价 */

        alert('你出的价格:'+a)
    	     
        var desc = $("#desc").html("不能低于最高竞拍价");/* 不符合要求的提示框 */
    	     
        if(oldprice == ""&& oldprice == 0){
            if(a >= stateprice){
                alert("竞拍成功!!!")
                return true ;
            }
            var desc = $("#desc").html("不能低于最高竞拍价");/* 不符合要求的提示框 */
            return false;
        }else{
            if(a > oldprice){
                return true ;
            }
            var desc = $("#desc").html("不能低于最高竞拍价");/* 不符合要求的提示框 */
            return false;
        }
    	    	
    }
</script>

</head>

<body>
<div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="${pageContext.request.contextPath}/Login.jsp" title="注销">登录</a></div>
    <div class="logout right"><a href="${pageContext.request.contextPath}/auction/DeleteUser" title="注销">注销</a></div>
  </div>
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${requestScope.auction.auction_name}</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${requestScope.auction.auction_desc}</li>
      </ul>      
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno">${requestScope.auction.auction_start_time}</li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno">${requestScope.auction.auction_end_time}</li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li class="borderno" id="stateprice">${requestScope.auction.auction_start_price}</li>
      </ul>
  </div>
  <div class="rg borders"><img src="${pageContext.request.contextPath}/images/${requestScope.auction.auction_pic}"  width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
  <form action="${pageContext.request.contextPath}/record/AddRecord" method="post">
       <p>
       <label for="sale">出价: </label>
       <input type="hidden" value="${requestScope.auction.auction_id}"  name="auction_id"/>
       <input type="text"  class="inputwd" id="sale" value="${requestScope.auction.auction_start_price}" name="auction_price"/>
       <input id="price" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom"  onclick="return add()"/>
       </p>
       <p class="f14 red" id="desc"></p>
   </form>
  </div>
  <div class="top10">
      <a href="#">
          <input name="" type="submit" value="刷 新" class="spbg buttombg f14" />
      </a>
    <a href="${pageContext.request.contextPath}/auction/SelectAll">
          <input name="" type="submit" value="返回列表" class="spbg buttombg f14" />
    </a>
  </div>
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font">
      <ul class="rows even strong">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
      <c:forEach items="${requestScope.list}" var="p">
      <ul class="rows">
        <li>${p.buytime}</li>
        <li id="oldprice">${p.price}</li>
        <li class="borderno">${p.name}</li>
      </ul>
      </c:forEach>
  </div>
  </div>
<!-- main end-->
</div>
</body>
</html>
