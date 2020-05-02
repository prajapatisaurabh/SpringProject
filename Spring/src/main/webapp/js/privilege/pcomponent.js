getprivilege();
function getprivilege() {
		
	$.ajax({
		url:'getdropdown.py',
		method:'POST',
		data: {'model':'PrivilegeModel'} ,
		
		/*beforeSend : function() 
		{
			$('.papa').html('');
			$('.papa').html('<option value="">select privilege</option>');
			$('.papa').find("option.eq(0)").html("please Wait..");
		},*/
		success:function(data)
		{
			$('.papa').html('');
			
			var optionf = $('<option/>');
						optionf.attr('value',0).text("select privilege");
						$('.papa').append(optionf);
						 
			for (var i = 0; i < data.length; i++) {
				var option = $('<option/>');
				option.attr('value',data[i].id).text(data[i].pname);
				$('.papa').append(option);
			}
		}		
		
	});
	
}

var table = '';
window.onload=function()
{
	table =$('#sample_4').DataTable({
		  dom: 'Bfrtip',
		  buttons: [
		    'copy', 'csv', 'excel', 'pdf', 'print'
		  ], ajax : "get_data.py?model=PcomponentModel",
            	columns : [ {
            		"data" : "pid"
            	},{
            		"data" : "componentname"
            	},{
            		"data" : "componentlink"
            	},{
            		"data" : "pm.pname"
            	},{
            		"data" : "pm.pcode"
            	},  {
            		"data" : " "
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="pcomponent_update" data-toggle="modal" data-target="#addpcom" >Edit</a> <a class="dropdown-item" id="pcomponent_delete">Delete</a> </div>'}, {
            				"targets" : [0],
            				"visible" : false,
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],


            });
	
	$('#sample_4 tbody').on( 'click', '#pcomponent_update', function () { 
		  var  data = table.row($(this).parents('tr')).data();
		 $('[name = "hid"]').val(data['pid']);
		 $('[name="Componentname"]').val(data["componentname"]);
		 $('[name="Componentlink"]').val(data["componentlink"]);
	
	});
	
	
	$('#sample_4 tbody').on( 'click', '#pcomponent_delete', function () { 
		  var  data = table.row($(this).parents('tr')).data();

		  swal({
	            title: 'Are you sure?',
	            text: 'You won\'t be able to revert this!',
	            icon: 'warning',
	            buttons: true,
	            dangerMode: true,
	            
	            /*type: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#00c0ef',
	            cancelButtonColor: '#ff8080',
	            confirmButtonText: 'Yes, delete it!'*/
	        }).then(function () {
	        	$.ajax({
	            		type:"POST",
	            		  url: "delete.py",
	            		  data:{'id':data["pid"],'model':'PcomponentModel'},
	            		  dataType : "JSON",
	            		  success:function reload(data){
	            			  if (data.status) {
	            					table.ajax.reload();
	            					swal("Good", "Success Fully", "success");
	            					$('#addpcom').modal('hide');
	            				} else {
	            					swal("sorry!", "successfully not inserted data!!", "error");

	            				} 
	            		  },
	            		  error: function(){      
	            		   alert('Error while request..');
	            		  }
	            		 });    			   

	        });
	        return false;
		  
		  
		
		} );
    
	       
    
      var tableWrapper = $('#sample_1_wrapper'); // datatable creates the table wrapper by adding with id {your_table_id}_wrapper
      tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown
  
}



function insertprivilegecomponent(){
	$.ajax({
		url : 'pcomponent.py', 
		method : 'POST',
		data : $('#privilegecom_form').serialize(),
		success : function(ret){
			if (ret.cheak) {
				table.ajax.reload();
				swal("Good", "Success Fully", "success");
				$('#addpcom').modal('hide');
			}else{
				swal("sorry!", "successfully not inserted data!!", "error");
				$('#addpcom').modal('hide');
			}
		}
	});

}