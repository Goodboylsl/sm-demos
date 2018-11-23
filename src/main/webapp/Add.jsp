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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
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

/* ---------------------------------------表单提交----------------------------------------------------- */
function checkForm() {
	var name = checkName();
	var statePrice = checkStatePrice();
     var endPrice = checkEndPrice();
    	var stateTime = checkStateTime();
    	var endTime = checkEndTime();
    	var desc = checkDesc();
    	
    	if(name && statePrice && endPrice && stateTime && endTime && desc){
    		return true ;
    	}else{
    		return false;
    	}
}


/* ---------------------------------------用户名------------------------------------------------------ */
	  function checkName() {
		  var inputName = $("#inputName").val();
		  var spanName = $("#spanName");
		  if(inputName.length >1 && inputName.length<=10){
			  spanName.html("该用户名可用");
			  return true;
		  }else{
			  spanName.html("该用户名不可用");
			  return false;
		  }
	}
/* ---------------------------------------起始价------------------------------------------------------ */
	  function checkStatePrice() {
		  var inputStatePrice = $("#inputStatePrice").val();
		  var spanStatePrice = $("#spanStatePrice");
		  if(inputStatePrice.length >1 && inputStatePrice.length<=5){
			  spanStatePrice.html("必须为数字");
			  return true;
		  }else{
			  spanStatePrice.html("输入不是数字");
			  return false;
		  }
	}
 /* -------------------------------------------原价-------------------------------------------------- */
	  function checkEndPrice() {
		  var inputEndPrice = $("#inputEndPrice").val();
		  var spanEndPrice = $("#spanEndPrice");
		  if(inputEndPrice.length >1 && inputEndPrice.length<=10){
			  spanEndPrice.html("必须为数字");
			  return true;
		  }else{
			  spanEndPrice.html("输入不是数字");
			  return false;
		  }
	}  
/* --------------------------------------------拍卖开始时间------------------------------------------------- */
	  function checkStateTime() {
		  var inputStateTime = $("#inputStateTime").val();
		  var spanStateTime = $("#spanStateTime");
		  if(inputStateTime.length >1 && inputStateTime.length<=20){
			  spanStateTime.html("格式：2010-05-05 12:30:00");
			  return true;
		  }else{
			  spanStateTime.html("该时间格式不符合要求，不可用");
			  return false;
		  }
	}
/* --------------------------------------拍卖截止时间------------------------------------------------------- */
	  function checkEndTime() {
		  var inputEndTime = $("#inputEndTime").val();
		  var spanEndTime = $("#spanEndTime");
		  if(inputEndTime.length >1 && inputEndTime.length<=20){
			  spanEndTime.html("格式：2010-05-05 12:30:00");
			  return true;
		  }else{
			  spanEndTime.html("该时间格式不符合要求，不可用");
			  return false;
		  }
	}
/* ----------------------------------------拍品描述----------------------------------------------------- */	  
	  function checkDesc() {
		  var inputDesc = $("#inputDesc").val();
		  var spanDesc = $("#spanDesc");
		  if(inputDesc.length >1 && inputDesc.length<=100){
			  spanDesc.html("该描述可用");
			  return true;
		  }else{
			  spanDesc.html("该描述超出最大长度，不可用");
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
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
          <dl>
            <dd >
            <form action="${pageContext.request.contextPath}/auction/Add" method="post"  enctype="multipart/form-data" onsubmit="return checkForm()">
              <label>名称：</label>
              <input type="text" class="inputh lf" value="" name="auction_name" onblur="checkName()" id="inputName"/><span id="spanName" style="color: red"></span>
              <div class="xzkbg spbg lf"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input type="text" class="inputh lf" value=""  name="auction_start_price" onblur="checkStatePrice()" id="inputStatePrice"/><span id="spanStatePrice" style="color: red"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input type="text" class="inputh lf" value=""  name="auction_upset" onblur="checkEndPrice()" id="inputEndPrice"/><span id="spanEndPrice" style="color: red"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input type="text" class="inputh lf" value="" name="auction_start_time" onblur="checkStateTime()" id="inputStateTime"/><span id="spanStateTime" style="color: red"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input type="text" class="inputh lf" value=""  name="auction_end_time" onblur="checkEndTime()" id="inputEndTime"/><span id="spanEndTime" style="color: red"></span>
              <div class="lf red laba"></div>
            </dd>
            <dd class="dds">
              <label>拍卖品图片：</label>
               <div class="lf salebd"><a href="#"><img src="${pageContext.request.contextPath}/images/ad20.jpg" width="100" height="100" /></a></div>
              <input name="photo" type="file" class="offset10 lf"  />
             
            </dd>
             <dd class="dds">
              <label>描述：</label>
              <textarea name="auction_desc" cols="" rows="" class="textarea" onblur="checkDesc()" id="inputDesc"></textarea><span id="spanDesc" style="color: red"></span>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs buttomb f14 lf" />
                <a href="${pageContext.request.contextPath}/auction/SelectAll">
                    <input name="" type="button" value="取 消" class="spbg buttombg buttombgs buttomb f14 lf" />
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
