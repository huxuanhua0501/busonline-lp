<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
  <head>
    <title>sidebar-menu.html</title>
	<meta charset="utf-8">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <div id="sidebar" class="sidebar responsive"  th:fragment="sidebar-menu">
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
		</script>
		
		<ul class="nav nav-list">
			 
			<li  th:each="map : ${session.erp_crm_role_perms}"  th:class="${map.perm.id} eq ${request_pid }?'open':''" >
				<a href="#" class="dropdown-toggle">
					<i th:class="${map.perm.id} eq 100?'menu-icon  fa fa-heart':(${map.perm.id} eq 200?'menu-icon fa fa-mobile-phone':(${map.perm.id} eq 300?'menu-icon fa fa-list':(${map.perm.id} eq 400?'menu-icon fa fa-money':(${map.perm.id} eq 500?'menu-icon  fa fa-user':'menu-icon fa fa-list'))))"></i>
					<span class="menu-text" th:text="${map.perm.dispName}">
						UI &amp; Elements
					</span>

					<b class="arrow fa fa-angle-down"></b>
				</a>

				<b class="arrow"></b>

				<ul class="submenu">
					<li th:each="subpm : ${map.sublist}" th:class="${subpm.id} eq ${request_id }?'active':''">
						<a href="users/alluser.html" th:href="@{${ subpm.url}+'?pid='+${map.perm.id }+'&id='+${subpm.id }}">
							<i class="menu-icon fa fa-caret-right"></i>
							<span th:text="${subpm.dispName }">用户列表</span>
						</a>

						<b class="arrow"></b>
					</li>
				</ul>
			</li>
			
		</ul><!-- /.nav-list -->

		<!-- #section:basics/sidebar.layout.minimize -->
		<!--  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
		</div>-->

		<!-- /section:basics/sidebar.layout.minimize -->
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
		</script>
	</div>
    <div class="main-content">
    	<div class="main-content-inner">
    		<div class="breadcrumbs" id="breadcrumbs" th:fragment="breadcrumbs">
				<script type="text/javascript">
					try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				</script>
			
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#" th:text="${request_pdesc }"></a>
					</li>
					<li class="active" th:text="${request_desc }">活动管理</li>
				</ul><!-- /.breadcrumb -->
		
			<!-- /section:basics/content.searchbox -->
			</div>
    	</div>
    </div>
  </body>
</html>
