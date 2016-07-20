<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>巴士在线电子屏管理系统</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" href="../../css/datepicker.min.css" th:href="@{${session.resources}+'/css/datepicker.min.css'}"/>
<link rel="stylesheet" href="../../css/ui.jqgrid.min.css"
	th:href="@{${session.resources}+'/css/ui.jqgrid.min.css'}" />
<link rel="stylesheet" href="../../css/bootstrap.min.css"
	th:href="@{${session.resources}+'/css/bootstrap.min.css'}" />
<link rel="stylesheet" href="../../css/font-awesome.css"
	th:href="@{${session.resources}+'/css/font-awesome.min.css'}" />
<link rel="stylesheet" href="../../css/base.css"
	th:href="@{${session.resources}+'/css/base.css'}" />
<!-- page specific plugin styles -->
<!-- text fonts -->
<link rel="stylesheet" href="../../css/ace-fonts.css"
	th:href="@{${session.resources}+'/css/ace-fonts.min.css'}" />

<!-- ace styles -->
<link rel="stylesheet" href="../../css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style"
	th:href="@{${session.resources}+'/css/ace.min.css'}" />
	<link rel="stylesheet" href="../../css/common.css" th:href="@{${session.resources}+'/css/common.css'}"  />
<link rel="stylesheet" href="../../css/ace-part2.css"  th:href="@{${session.resources}+'/css/ace-part2.css'}" class="ace-main-stylesheet" />
</head>

<body class="no-skin">
	<!-- #section:basics/navbar.layout -->
	<div id="navbar" class="navbar navbar-default"
		th:replace="base/navbar :: navbar-container">此处是顶部导航栏</div>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<!-- #section:basics/sidebar -->
		<div id="sidebar" class="sidebar responsive"
			th:replace="base/sidebar-menu :: sidebar-menu">此处是侧边导航栏</div>

		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs"
					th:replace="base/sidebar-menu :: breadcrumbs">此处是书签导航条</div>

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div id="query-form" class="deline"></div>
							<div class="row">
								<div class="col-md-12">
									<button type="button" id="pointActualize"
										class="btn btn-primary">指定实施顾问</button>

									<button type="button" id="sub_button" class="btn btn-primary">确定分配</button>
								</div>
								</div>
								<table id="grid-table"></table>
								<div id="grid-pager"></div>

								<!-- PAGE CONTENT ENDS -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.page-content -->
					<div id="notip" th:replace="actualize/edit :: notip">此处是弹出层</div>
				</div>
			</div>
			<!-- /.main-content -->
			<div class="footer" th:replace="base/navbar :: footer">此处是网站页脚</div>


			<a href="#" id="btn-scroll-up"
				class="btn-scroll-up btn btn-sm btn-inverse"> <i
				class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i> </a>
		</div>
		<!-- /.main-container -->

		<script src="../../js/jquery1x.min.js"
			th:src="@{${session.resources} + '/js/jquery1x.min.js'}"></script>
		<script src="../../js/bootstrap.min.js"
			th:src="@{${session.resources} + '/js/bootstrap.min.js'}"></script>
		<script src="../../js/jquery-ui.custom.min.js"
			th:src="@{${session.resources} + '/js/jquery-ui.custom.min.js'}"></script>
<script src="../../js/popLayer.js" th:src="@{${session.resources} + '/js/popLayer.js'}"></script>

		<script src="../../js/ace.min.js"
			th:src="@{${session.resources} + '/js/ace.min.js'}"></script>
		<script src="../../js/ace.sidebar.js"
			th:src="@{${session.resources} + '/js/ace.sidebar.js'}"></script>
		<script src="../../js/ace.submenu-hover.js"
			th:src="@{${session.resources} + '/js/ace.submenu-hover.js'}"></script>



<script src="../../js/date-time/bootstrap-datepicker.min.js" th:src="@{${session.resources} + '/js/date-time/bootstrap-datepicker.min.js'}"></script>
		<script src="../../js/jqGrid/jquery.jqGrid.min.js"
			th:src="@{${session.resources} + '/js/jqGrid/jquery.jqGrid.min.js'}"></script>
		<script src="../../js/jqGrid/i18n/grid.locale-en.js"
			th:src="@{${session.resources} + '/js/jqGrid/i18n/grid.locale-cn.js'}"></script>
		<script src="./js/actualizes.js"
			th:src="@{${session.resources} + '/js/actualizes.js'}"></script>
		 

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {

			})
		</script>
</body>
</html>