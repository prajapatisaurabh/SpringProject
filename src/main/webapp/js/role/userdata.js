var table = '';
window.onload=function()
{
	table =$('#sample-6').DataTable({
		  dom: 'Bfrtip',
		  buttons: [
		    'copy', 'csv', 'excel', 'pdf', 'print'
		  ], ajax : "get_data.py?model=UserModel",
            	columns : [ {
            		"data" : "uid"
            	},{
            		"data" : "uname"
            	},{
            		"data" : "email"
            	},{
            		"render": function (data, type, JsonResultRow, meta) {
                        return '<img style = "height:100px;width:100px" src="upload/'+JsonResultRow.filename+'">';
                    }
            	},  {
            		"data" : " "
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="role_update" data-toggle="modal" data-target="#useradd" >Edit</a> <a class="dropdown-item" id="role_delete">Delete</a> <a class="dropdown-item" id="invoice">Invoice</a> </div>'}, {
            				"targets" : [0],
            				"visible" : false,
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],
		});
	
	 $('#sample-6 tbody').on('click','#invoice',function(){
	      	window.location.href = "invoice.py"     	
	  });
	
	 $('#sample-6 tbody').on('click','#role_update',function(){
	      	var data=table.row($(this).parents('tr')).data();
	      	$('[name="hid"]').val(data["uid"]);
	      	$('[name="Name"]').val(data["uname"]);
	      	$('[name="customFile"]').val(data["filename"]);
	      	$('[name="email"]').val(data["email"]);
	      	
	      });
	
	$('#sample-6 tbody').on( 'click', '#role_delete', function () { 
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
	            		  data:{'id':data["uid"],'model':'UserModel'},
	            		  dataType : "JSON",
	            		  success:function reload(data){
	            			  if (data.status) {
	            					table.ajax.reload();
	            					swal("Good", "Success Fully", "success");
	            					$('#useradd').modal('hide');
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

function insertuserdata(){
	
	
	var form_data = new FormData();
	
	var file_data = $('#customFile').prop('files')[0];
	var other_data = $('#user_form').serializeArray();
	$.each(other_data , function(key ,input) {
		form_data.append(input.name , input.value);
	});
	
	form_data.append('image',file_data);
	
	$.ajax({
		url : 'userdata.py',
		method : 'POST',
		cache : false,
		contentType : false,
		processData : false,
		data : form_data,/*
		dataType : "JSON",*/ 
		success : function(res) {
			if (res.status) {
				table.ajax.reload();
				swal("Good", "Success Fully", "success");
				$('#useradd').modal('hide'); 
			}else{
				swal("sorry!", "successfully not inserted data!!", "error");
				$('#useradd').modal('hide');
			}
		}
	});
}
