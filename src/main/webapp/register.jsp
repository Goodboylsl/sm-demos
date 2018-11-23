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
<script type="text/javascript" src="<s:url value="/js/jquery-1.8.3.js" />"></script>
<script type="text/javascript">
             function Change() {
					$("#imgVcode").prop("src","getKaptcha.do?d="+new Date().getTime())
				}
</script>
</head>

<body>
<div class="wrap">
  <!-- main begin-->
      <div class="zclf login logns">
        <h1  class="blue">用户注册</h1>
          <dl>
            <dd>
            <form action="${pageContext.request.contextPath}/user/Register.do" method="post">
              <label> <small>*</small>用户名</label>
              <input type="text" class="inputh lf" name="user_name" />
             <div class="lf red laba">用户名要求不低于6个字符</div>
            </dd>
            <dd>
              <label> <small>*</small>密码</label>
              <input type="text" class="inputh lf" name="user_password" />
              <div class="lf red laba">密码要求不低于6个字符</div>
            </dd>
            <dd>
              <label> <small>*</small>身份证号</label>
              <input type="text" class="inputh lf" name="user_card_no" />
              <div class="lf red laba">身份证号必填</div>
            </dd>
            <dd>
              <label> <small>*</small>电话</label>
              <input type="text" class="inputh lf" name="user_tel" />
              <div class="lf red laba">电话号码必填</div>
            </dd>
            <dd>
              <label> <small>*</small>住址</label>
              <input type="text" class="inputh lf" name="user_address" />
            </dd>
            <dd>
              <label> <small>*</small>邮政编码</label>
              <input type="text" class="inputh lf" name="user_post_number" />
            </dd>
            <dd>
              <label> <small>*</small>密码找回问题</label>
              <input type="text" class="inputh lf" name="user_question" />
            </dd>
            <dd>
              <label> <small>*</small>密码找回答案</label>
              <input type="text" class="inputh lf" name="user_answer" />
            </dd>
            <dd class="hegas">
              <label> <small>*</small>验证码</label>
              <input type="text" class="inputh inputs lf" name="passwords"  id="imgVcode"/>
               <span class="wordp lf"><img src="getKaptcha.do" width="96" height="27" alt="" /></span>
               <span class="blues lf"><a href="javacscript:void(0)" title="" onclick="Change()">看不清</a></span>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
               <input name=""  type="checkbox" id="rem_u"   />
              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
              <input name="" type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
            </dd>
          </dl>
    </div>
</form>
</div>
 
</div>
</body>
</html>
