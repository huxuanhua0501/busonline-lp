<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
  <head>
    <title>navbar.html</title>
	<meta charset="utf-8">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
  </head>
  
  <body>
  <div id="navbar" class="navbar navbar-default" th:fragment="navbar-container">
  <input type="hidden" id="ctx" th:value="${#ctx.httpServletRequest.contextPath }" />
    <script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
		function updatePWD(){
			$.popLayer({
		    	title : '修改密码',
		    	button:[{id:'confirm',style:'btn-primary',value:'确定'},{id:'cancel',style:'btn-default',value:'取消'}],
		    	content:'<div class="modal-body"><div class="row"><div class="col-md-6 col-md-offset-3"><label class="col-md-4 control-label">当前密码</label><input id="oldPWD" class="col-md-8" type="password" placeholder="当前密码" /></div></div><div class="row"><div class="col-md-6 col-md-offset-3"><label class="col-md-4 control-label">新密码</label><input id="newPWD" class="col-md-8" type="password" placeholder="新密码" /></div></div><div class="row"><div class="col-md-6 col-md-offset-3"><label class="col-md-4 control-label">确认密码</label><input id="newPWD2" class="col-md-8" type="password" placeholder="确认密码" /></div></div></div>'
		    });
		    
		    $("#confirm").click(function(){
		    	var oldPWD=$("#oldPWD").val().trim();
				var newPWD=$("#newPWD").val().trim();
				var newPWD2=$("#newPWD2").val().trim();
				if(oldPWD==""){
					alert("请输入当前密码！");
					$("#oldPWD").focus();
					return false;
				}
				if(newPWD==""){
					alert("请输入新密码！");
					$("#newPWD").focus();
					return false;
				}
				if(newPWD2==""){
					alert("请输入确认密码！");
					$("#newPWD").focus();
					return false;
				}
				if(newPWD!=newPWD2){
					alert("两次输入的密码不一致，请重新输入！");
					$("#newPWD").focus();
					return false;
				}
				//修改密码
				$.ajax({
					type: "GET",
		            url: getRootPath()+"/auth/updatePwd",
		            data: {oldPwd:oldPWD, newPwd:newPWD},
		            dataType: "json",
		            async:false,
		            success: function(data){
		            	if(data.result=="success"){
		            		alert(data.msg);
		            		location.href=getRootPath()+data.url;
		            	}else{
		            		alert(data.msg);
		            	}
		            },
		            error:function(){
		            	alert("error");
		            }
				});
				
		    });

		}
		function loginOut(){
			//修改密码
				$.ajax({
					type: "GET",
		            url: getRootPath()+"/auth/loginOut",
		            dataType: "json",
		            async:false,
		            success: function(data){
		            	location.href=getRootPath()+data.url;
		            },
		            error:function(){
		            	alert("error");
		            }
				});
		}
		
		
		function getRootPath(){
		    return $("#ctx").val();
		}
		
	</script>
    <div class="navbar-container" id="navbar-container">
		<!-- #section:basics/sidebar.mobile.toggle -->
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>
		</button>

		<!-- /section:basics/sidebar.mobile.toggle -->
		<div class="navbar-header pull-left">
			<!-- #section:basics/navbar.layout.brand -->
			<a href="#" class="navbar-brand">
				<small>
					<i class="fa fa-leaf"></i>
					电商运营系统
				</small>
			</a>
		</div>

		<!-- #section:basics/navbar.dropdown -->
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<!-- #section:basics/navbar.user_menu -->
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<span class="user-info">
							<small>欢迎,</small>
							<span th:text="${session.erp_crm_loginInfo.crmUser.name }">Jason</span>
						</span>

						<i class="ace-icon fa fa-caret-down"></i>
					</a>

					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li>
							<a href="#" onclick="updatePWD()">
								<i class="ace-icon fa fa-cog"></i>
								修改密码
							</a>
						</li>

						<li class="divider"></li>

						<li>
							<a href="#" onclick="loginOut()">
								<i class="ace-icon fa fa-power-off"></i>
								注销
							</a>
						</li>
					</ul>
				</li>

				<!-- /section:basics/navbar.user_menu -->
			</ul>
		</div>

		<!-- /section:basics/navbar.dropdown -->
	</div><!-- /.navbar-container -->
  </div> 
    <div class="footer" th:fragment="footer">
		<div class="footer-inner">
			<!-- #section:basics/footer -->
			<div class="footer-content">
				<span class="bigger-120">
					<span class="blue bolder">Amssy</span>
					电商运营系统 &copy; 2014-2015
				</span>
			</div>
			<!-- /section:basics/footer -->
		</div>
	</div>
  </body>
</html>