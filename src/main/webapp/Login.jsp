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
                /* 刷新验证码用 */
                function Change() {
					$("#imgVcode").prop("src","getKaptcha.do?d="+new Date().getTime())
				}
</script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
 <div class="main">
   <div class="sidebar">
     <p><img src="${pageContext.request.contextPath }/images/img1.jpg" width="443" height="314" alt="" /></p>
   </div>
   <div class="sidebarg">
     <form action="${pageContext.request.contextPath }/user/Login" method="post" target='_blank'>
    <div class="login">
      <dl>
        <dt class="blues">用户登陆</dt>
        <dd><label for="name">用户名：</label><input type="text" class="inputh" value="常用邮箱" id="name" name="user_name"/></dd>
        <dd><label for="password">密 码：</label><input type="text" class="inputh" value="密码" id="password" name="user_password"/></dd>
        <dd>
           <label class="lf" for="passwords">验证码：</label>
           <input type="text" class="inputh inputs lf" value="验证码" id="passwords" name="passwords"/>
           <span class="wordp lf"><img src="getKaptcha.do" width="96" height="27" alt="" id="imgVcode"/></span>
           <span class="blues lf"><a href="javacscript:void(0)" onclick="Change()">看不清</a></span>
        </dd>
        <dd>
           <input name=""  type="checkbox" id="rem_u"  />
           <span for="rem_u">下次自动登录</span>
        </dd>
        <dd class="buttom">
           <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf" />
           <a href="${pageContext.request.contextPath}/register.jsp">
               <input name="" type="submit" value="注 册" class="spbg buttombg f14 lf" />
           </a>
           <span class="blues  lf"><a href="javacscript:void(0)" title="" onclick="yzms()">忘记密码?</a></span>
           <div class="cl"></div>
        </dd>
       
      </dl>
    </div>
    </form>
   </div>
  <div class="cl"></div>
 </div>
<!-- main end-->
 
<!-- footer begin-->
</div>
 <!--footer end-->
</div>
</body>
</html>
