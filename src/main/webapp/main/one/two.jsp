<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/javascript" src="../../js/jquery1x.min.js"></script> 
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="../../js/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="../../js/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
	<link rel="stylesheet" href="../../css/bootstrap.min.css"> 
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="../../css/ui.jqgrid-bootstrap.css" />
	<script>
		$.jgrid.defaults.width = 780;
	</script>
	<script src="../../js/bootstrap.min.js"></script>
    <title>jqGrid Loading Data - Million Rows from a REST service</title>
</head>
<body>
<div style="margin-left:20px">
    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
</div>
    <script type="text/javascript"> 
    
        $(document).ready(function () {
      
            $("#jqGrid").jqGrid({
            	 jsonReader: {
        			 root: "items",
        			 page: "page",
        		     total: "totalPages",
        		     records: "totalCount",
        		     id: "id"
        		 },
                url: '../../oneController/find',
                mtype: "GET",
				styleUI : 'Bootstrap',
                datatype: "JSON",
                colModel: [
                    { label: '订单ID', name: 'level', key: true, width: 100 },
                    { label: '客户ID', name: 'name', width: 150 },
                    { label: '订单日期', name: 'del_status', width: 150 },
                    { label: '什么鬼', name: 'parent_id', width: 150 }
                    
                ],
                viewrecords: true,
       		 autowidth: true,
                height: 'auto',
                rowNum: 10,
                sortorder: "desc", //倒序
               /*  pager: "#grid-pager", */
                multiselect: true,
                pager: "#jqGridPager"
            });
        });
 
   </script>

    
</body>
</html>