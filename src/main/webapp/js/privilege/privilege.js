var table = '';
window.onload=function()
{
	table =$('#sample_1').DataTable({
		  dom: 'Bfrtip',
		  buttons: [
		    'copy', 'csv', 'excel', 'pdf', 'print'
		  ], ajax : "get_data.py?model=PrivilegeModel",
            	columns : [ {
            		"data" : "id"
            	},{
            		"data" : "pname"
            	},{
            		"data" : "pcode"
            	},  {
            		"data" : " "
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="privilege_update" data-toggle="modal" data-target="#addprivilege" >Edit</a> <a class="dropdown-item" id="privilige_delete">Delete</a> </div>'}, {
            				"targets" : [0],
            				"visible" : false,
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],


            });
	
	 $('#sample_1 tbody').on('click','#privilege_update',function(){
	      	var data=table.row($(this).parents('tr')).data();
	      	$('[name="hid"]').val(data["id"]);
	      	$('[name="privilege_name"]').val(data["pname"]);
	      	$('[name="pcode"]').val(data["pcode"]);
	      	
	      });
	
	$('#sample_1 tbody').on( 'click', '#privilige_delete', function () { 
		  var  data = table.row($(this).parents('tr')).data();

		  swal({
	            title: 'Are you sure?',
	            text: 'You won\'t be able to revert this!',
	            icon: 'warning',
	            buttons: true,
	            dangerMode: true,
	        }).then(function () {
	        	$.ajax({
	            		type:"POST",
	            		  url: "delete.py",
	            		  data:{'id':data["id"],'model':'PrivilegeModel'},
	            		  dataType : "JSON",
	            		  success:function reload(data){
	            			  if (data.status) {
	            					table.ajax.reload();
	            					swal("Good", "Success Fully", "success");
	            					$('#addprivilege').modal('hide');
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


function insertprivilege(){
	$.ajax({
		url : 'privilege.py', 
		method : 'POST',
		data : $('#privilege_form').serialize(),
		success : function(ret){
			if (ret.cheak) {
				table.ajax.reload();
				swal("Good", "Success Fully", "success");
				$('#addprivilege').modal('hide');
			}else{
				swal("sorry!", "successfully not inserted data!!", "error");
				$('#addprivilege').modal('hide');
			}
		}
	});

}