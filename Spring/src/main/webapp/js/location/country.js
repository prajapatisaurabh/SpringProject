var table = '';
window.onload=function()
{
	table =$('#sample_2').DataTable({
		  dom: 'Bfrtip',
		  buttons: [
		    'copy', 'csv', 'excel', 'pdf', 'print'
		  ], ajax : "get_data.py?model=CountryModel",
            	columns : [ {
            		"data" : "id"
            	},{
            		"data" : "cname"
            	},{
            		"data" : "code"
            	},  {
            		"data" : " "
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="Country_update" data-toggle="modal" data-target="#addCountry" >Edit</a> <a class="dropdown-item" id="Country_delete">Delete</a> </div>'}, {
            				"targets" : [0],
            				"visible" : false,
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],


            });
	
	/* $('#sample_2 tbody').on('click','#Country_update',function(){
	      	var data=table.row($(this).parents('tr')).data();
	      	$('[name="hid"]').val(data["id"]);
	      	$('[name="rname"]').val(data["rname"]);
	      	$('[name="rdesc"]').val(data["rdese"]);
	      	
	      });*/
	
	$('#sample_2 tbody').on( 'click', '#Country_update', function () { 
		var  data = table.row($(this).parents('tr')).data();
		$('[name = "hid"]').val(data["id"]);
		$('[name = "cname"]').val(data["cname"]);
		$('[name = "code"]').val(data["code"]);
	
	});
	
	$('#sample_2 tbody').on( 'click', '#Country_delete', function () { 
		  var  data = table.row($(this).parents('tr')).data();

		  swal({
	            title: 'Are you sure?',
	            text: 'You won\'t be able to revert this!',
	            type: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#00c0ef',
	            cancelButtonColor: '#ff8080',
	            confirmButtonText: 'Yes, delete it!'
	        }).then(function () {
	        	$.ajax({
	            		type:"POST",
	            		  url: "delete.py",
	            		  data:{'id':data["id"],'model':'CountryModel'},
	            		  dataType : "JSON",
	            		  success:function reload(data){
	            			  if (data.status) {
	            					table.ajax.reload();
	            					swal("Good", "Success Fully", "success");
	            					$('#addCountry').modal('hide');
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

function insertcountry(){
	$.ajax({
		url : 'country.py',
		method : 'POST',
		data : $('#country_form').serialize(),
		success : function(ret){
			if (ret.input) {
				table.ajax.reload();
				swal("Good", "Success Fully", "success");
				$('#addCountry').modal('hide');
			}else{
				swal("sorry!", "successfully not inserted data!!", "error");
				$('#addCountry').modal('hide');
			}
		}
	});
}