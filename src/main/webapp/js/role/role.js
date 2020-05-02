var table = '';
window.onload=function()
{
	table =$('#sample').DataTable({
		  dom: 'Bfrtip',
		  buttons: [
		    'copy', 'csv', 'excel', 'pdf', 'print'
		  ], ajax : "get_data.py?model=RoleModel",
            	columns : [ {
            		"data" : "id"
            	},{
            		"data" : "rname"
            	},{
            		"data" : "rdese"
            	},  {
            		"data" : " "
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="role_update" data-toggle="modal" data-target="#addRole" >Edit</a> <a class="dropdown-item" id="role_delete">Delete</a> </div>'}, {
            				"targets" : [0],
            				"visible" : false,
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],
		});
	
	
	 $('#sample tbody').on('click','#role_update',function(){
	      	var data=table.row($(this).parents('tr')).data();
	      	$('[name="hid"]').val(data["id"]);
	      	$('[name="rname"]').val(data["rname"]);
	      	$('[name="rdesc"]').val(data["rdese"]);
	      	
	      });
	
	$('#sample tbody').on( 'click', '#role_delete', function () { 
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
	            		  data:{'id':data["id"],'model':'RoleModel'},
	            		  dataType : "JSON",
	            		  success:function reload(data){
	            			  if (data.status) {
	            					table.ajax.reload();
	            					swal("Good", "Success Fully", "success");
	            					$('#addRole').modal('hide');
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

function insertrole(){
	$.ajax({
		url : 'role.py',
		method : 'POST',
		data : $('#role_form').serialize(),
		success : function(res) {
			if (res.status) {
				table.ajax.reload();
				swal("Good", "Success Fully", "success");
				$('#addRole').modal('hide'); 
			}else{
				swal("sorry!", "successfully not inserted data!!", "error");
				$('#addRole').modal('hide');
			}
		}
	});
}
