<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.jsp"></script>
<script type="text/javascript">
    $(function(){
        // 文件上传(文件域)的改变事件
        $(':file').change(function(event) {
            //  HTML5 js 对象的获取
            var files = event.target.files, file;
            if(files && files.length > 0){
                // 获取目前上传的文件
                file = files[0];
                // 文件的限定类型什么的道理是一样的
                if(file.size > 1024 * 1024 * 2) {
                    alert('图片大小不能超过 2MB!');
                    return false;
                }
                // file对象生成可用的图片
                var URL = window.URL || window.webkitURL;
                // 通过 file 生成目标 url
                var imgURL = URL.createObjectURL(file);
                // 用这个 URL 产生一个 <img> 将其显示出来
                $("img").attr('src', imgURL);
            }
        });
    });


</script>

</head>

<body>
<div class="wrap">
  <!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="${pageContext.request.contextPath}/Login.jsp" title="注销">登录</a></div>
    <div class="logout right"><a href="${pageContext.request.contextPath}/auction/DeleteUser.do" title="注销">注销</a></div>
  </div>
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
          <dl>
           
            <dd >
            <form action="${pageContext.request.contextPath}/auction/UpdateEnd.do" method="post" enctype="multipart/form-data" >
            <input  type="hidden" value="${sessionScope.auction.auction_id}"  class="inputh lf"  name="auction_id" />
              <label>名称：</label>
              <input type="text" class="inputh lf"  name="auction_name"  value="${sessionScope.auction.auction_name}"/>
              <div class="xzkbg spbg lf"></div>
              <label>起拍价：</label>
              <input type="text" class="inputh lf"  name="auction_start_price" value="${sessionScope.auction.auction_start_price}" />
              <div class="lf red laba">必须为数字</div>
            </dd>
            <dd>
              <label>底价：</label>
              <input type="text" class="inputh lf"  name="auction_upset"  value="${sessionScope.auction.auction_upset}" />
              <div class="lf red laba">必须为数字</div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input type="text" class="inputh lf"  name="auction_start_time"  value="${sessionScope.auction.auction_start_time}"/>
              <div class="lf red laba">格式：2011-05-05 12:30:00</div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input type="text" class="inputh lf" name="auction_end_time"  value="${sessionScope.auction.auction_end_time}" />
              <div class="lf red laba">格式：2011-05-05 12:30:00</div>
            </dd>
            <dd class="dds">
              <label>描述：</label>
              <textarea name="auction_desc" cols="" rows="" class="textarea">${sessionScope.auction.auction_desc}</textarea>
            </dd>
            <dd>
              <label>修改图片：</label>
              <div class="lf salebd"><a href="#"><img src="${pageContext.request.contextPath}/images/${sessionScope.auction.auction_pic}" width="100" height="100" /></a></div>
               <input name="photo" type="file" class="marg10"  />
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
                <a href="${pageContext.request.contextPath}/auction/SelectAll.do"/>
                    <input name="" type="submit" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb" />
                </a>
            </dd>
            </form>
          </dl>
    </div>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
