$(document).ready(function(){
	//resize to fit page size
	
	
	
	
	jQuery("#pointActualize").click(function(){
		
		 var ids;
		    ids = jQuery("#grid-table").jqGrid('getGridParam', 'selarrrow');
		    var w = ids.length;
		    if(w==0){
		    	alert("请选择");
		    }else{
		    	
		  
		
		$("#myModal-alertNoPlus333").modal("show");	
		$.ajax({//显示实施顾问
			   type: "POST",
			   url: '../actualize/selectActualizes.json',
			   success: function(msg){
			     var selObj = $("#actualizeUser").empty();;
 			     for(var i = 0; i<msg.length;i++){
			    	 selObj.append("<option value='"+msg[i].id+"'>"+msg[i].name+"</option>");
	 
			     }	  
			     
			   }
			});	
		
		
		$("#close_window").click(function(){
			$("#myModal-alertNoPlus333").modal("hide");	
		});
		
		$("#edit_submit").click(function(){//点击提交按钮
			  var ids;
			    ids = jQuery("#grid-table").jqGrid('getGridParam', 'selarrrow');
			    var actualizeId = jQuery("#actualizeUser").val();
			 
			    /***********************显示实施顾问********************************/
			    $.ajax({
			    	   data: {ids:ids.toString(), actualizeId:actualizeId},
		               dataType: "json",
					   type: "POST",
					   url: '../actualize/updateActualizeUser.json',
					   success: function(msg){
						   var seller_nick = jQuery.trim(jQuery("#seller_nick").val());
							  var mobile = jQuery.trim(jQuery("#mobile").val());
							  $("#grid-table").jqGrid('setGridParam', {//刷新界面
							    url: '../actualize/actualizes.json',
							    mtype: "POST",
						        datatype: "json",
							    postData:{'seller_nick':seller_nick,'mobile':mobile}, //发送数据 
							    pager: "#grid-pager"
							  }).trigger("reloadGrid"); 
						    
								$("#myModal-alertNoPlus333").modal("hide");	
					     
					   }
					});	
			    /***********************显示实施顾问结束********************************/
			  
			
		});
		    }
		
	});
		
	
	
	
	
	
	
	jQuery("#sub_button").click(function(){
		
		 var  ids = jQuery("#grid-table").jqGrid('getGridParam', 'selarrrow');
		 var k = 0;
		 var w = ids.length;
		 if(w==0){
			 alert("请选择"); 
		 }else{
		 for(var i = 0; i < w; i++){
				var ar = ids[i];
				//获取选中的code_id的值
				var actualize_name = jQuery("#grid-table").jqGrid('getCell',ar,'actualize_name');
				if(actualize_name==null||actualize_name==''){
					k++;
				}
			}
		 if(k>=1){
			alert("实施顾问不能为空"); 
		 }else{
			 $.ajax({
		    	   data: {ids:ids.toString()},
	              dataType: "json",
				   type: "POST",
				   url: '../actualize/updateActualizeSatus.json',
				   success: function(msg){
					   //var seller_nick = jQuery("#seller_nick").val();
						//  var mobile = jQuery("#mobile").val();
						  $("#grid-table").jqGrid('setGridParam', {//刷新界面
						    url: '../actualize/actualizes.json',
						    mtype: "POST",
					        datatype: "json",
						    //postData:{'seller_nick':seller_nick,'mobile':mobile}, //发送数据 
					        pager: "#grid-pager"
						  }).trigger("reloadGrid"); 
					    
							$("#myModal-alertNoPlus333").modal("hide");	
				     
				   }
				});	
		 }
		 }
		
		
	});
	
	
	
	
	
	
	
	
	
	
	$(window).on('resize.jqGrid', function () {
		$('#grid-table').jqGrid( 'setGridWidth', $(".page-content").width() );
    })
	
	$.createQueryForm($('#query-form'), {
    	action: '',
    	method: 'post',
    	number:'2', 	//text select每行的个数
    	isTab: false,
    	x:3, 	//label 宽度
    	y:6,	//input 宽度 (text select)
    	z:4,	//radio 宽度  checkbox宽度=12-z
    	fieldModel: [
    	     { label: '活动名称', name: 'activity_name', type: 'text', id:'activity_name'},
    	     { label: '卖家旺旺', name: 'seller_nick', type: 'text', id:'seller_nick'},
    	     { label: '手机号', name: 'mobile', type: 'text',id:'mobile'},
    	     { label: '代付开始时间', name: 'startTime', type: 'text',id:'startTime'},
    	     { label: '代付结束时间', name: 'endTime', type: 'text',id:'endTime'},
    	     { label: '创建开始时间', name: 'cstartTime', type: 'text',id:'cstartTime'},
    	     { label: '创建结束时间', name: 'cendTime', type: 'text',id:'cendTime'}
    	],
		buttons :[ 
	    		{id:'search', value:'查询', type:'primary'},
	    		{id:'reset', value:'重置', type:'reset'}
	    	]
    });
	
	
	//时间选择框
	$.fn.datepicker.defaults.format = "yyyy-mm-dd";

	$('#startTime').datepicker({
		todayBtn: true,
		autoclose:true,
		todayHighlight: true,
		language: 'cn'
	});

	$('#endTime').datepicker({
		todayBtn: true,
		autoclose:true,
		todayHighlight: true,
		language: 'cn'
	}); 
	$('#cstartTime').datepicker({
		todayBtn: true,
		autoclose:true,
		todayHighlight: true,
		language: 'cn'
	});

	$('#cendTime').datepicker({
		todayBtn: true,
		autoclose:true,
		todayHighlight: true,
		language: 'cn'
	});
    
	// 绑定查询
	 $("#search").on("click",function(){
		  var activity_name = jQuery.trim(jQuery("#activity_name").val());
		  var seller_nick = jQuery.trim(jQuery("#seller_nick").val());
		  var mobile = jQuery.trim(jQuery("#mobile").val());
		  var startTime=jQuery.trim(jQuery("#startTime").val());
		  if(startTime!=""){
			  startTime+=" 00:00:00";
		  }
		  var endTime=jQuery.trim(jQuery("#endTime").val());
		  if(endTime!=""){
			  endTime+= " 23:59:59";
		  }
		  var cstartTime=jQuery.trim(jQuery("#cstartTime").val());
		  if(cstartTime!=""){
			  cstartTime+=  " 00:00:00";
		  }
		  var cendTime=jQuery.trim(jQuery("#cendTime").val());
		  if(cendTime!=""){
			  cendTime+=  " 23:59:59";
		  }
		  $("#grid-table").jqGrid('setGridParam', {
		    url: '../actualize/actualizes.json',
		    mtype: "POST",
	        datatype: "json",
		    postData:{'seller_nick':seller_nick,'mobile':mobile,"activity_name":activity_name,"startTime":startTime,"endTime":endTime,"cstartTime":cstartTime,"cendTime":cendTime}, //发送数据 
		    page: 1
		  }).trigger("reloadGrid");  
	 })
	  $("#reset").click(function(){
		 jQuery("#activity_name").val('');
		 jQuery("#seller_nick").val('');
		 jQuery("#mobile").val('');
		 jQuery("#startTime").val('');
		 jQuery("#endTime").val('');
		 jQuery("#cstartTime").val('');
		 jQuery("#cendTime").val('');
	 });
	 
	$('#grid-table').jqGrid({
		 jsonReader: {
			 root: "items",
			 page: "page",
		     total: "totalPages",
		     records: "totalCount",
		     id: "id"
		 },
		 url: '../actualize/actualizes.json',
         mtype: "POST",
         datatype: "json",
         colModel: [
                    { label: 'I D', name: 'id', hidden:true, width: 200 },
                    { label: '活动名称', name: 'activity_name', width: 220 },
                    { label: '卖家旺旺号', name: 'seller_nick', width: 200 },
                    { label: '支付宝姓名', name: 'name',width: 200  },
                    { label: '手机号', name: 'mobile',width: 200 },
                    { label: '代付时间', name: 'pay_time',width: 200 },
                    { label: '创建时间', name: 'create_time',width: 200 },
                    { label:'实施顾问', name: 'actualize_name', width: 200, sorttype:"date"}
         ],
		 viewrecords: true,
		 autowidth: true,
         height: 'auto',
         rowNum: 15,
         sortorder: "desc", //倒序
         pager: "#grid-pager",
         multiselect: true,
         loadComplete : function() {
  			var table = this;
  			var ids = jQuery("#grid-table").jqGrid('getDataIDs');
			
			$(".no-tableMsg").each(function(){
		    	$(this).remove();
		    });
			
			if(ids.length==0){
				$("#grid-table").find(".no-tableMsg").remove();
		    	$("#grid-table").parent().append('<div class="no-tableMsg"><img src="'+getNoMsgImage()+'" />没有符合条件的交易</div>');
				
			}
			setTimeout(function(){
				updatePagerIcons(table);
			}, 0);
			
  		},
	});
	
	function updatePagerIcons(table) {
		var replacement = 
		{
			'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
			'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
			'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
			'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
		};
		$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
	}
	
	function eidtable(cellValue, options, rowObject) {
		
		//return '<a href=./' + cellValue + '/get.html>'+cellValue+'</a>';
		
		return '<a href="javascript:void(0)" onclick="eidtableWin();">'+cellValue+'</a>';
	}
	
});
function eidtableWin() {
	var gr = jQuery("#grid-table").jqGrid('getGridParam','selrow');
	if( gr != null ) {
		jQuery("#grid-table").jqGrid('editGridRow',gr
				,{editCaption: '编辑员工信息', height:'auto',reloadAfterSubmit:true,closeAfterEdit:true, url: '../users/update.html'});
	}else {
		alert("请选择一条记录！");
	}
}


