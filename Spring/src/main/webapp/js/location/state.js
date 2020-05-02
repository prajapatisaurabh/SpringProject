getprivilege();
function getprivilege() {
		
	$.ajax({
		url:'getdropdown.py',
		method:'POST',
		data: {'model':'CountryModel'} ,
		
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
				option.attr('value',data[i].id).text(data[i].cname);
				$('.papa').append(option);
			}
		}		
		
	});
	
}

var table = '';
window.onload=function()
{
	table =$('#sample_5').DataTable({
		  dom: 'Bfrtip',
		  buttons: [
		    'copy', 'csv', 'excel', 'pdf', 'print'
		  ], ajax : "get_data.py?model=StateModel",
            	columns : [ {
            		"data" : "sid"
            	},{
            		"data" : "statename"
            	},{
            		"data" : "statelink"
            	},{
            		"data" : "cm.cname"
            	},{
            		"data" : "cm.code"
            	},  {
            		"data" : " "
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="state_update" data-toggle="modal" data-target="#addstate" >Edit</a> <a class="dropdown-item" id="state_delete">Delete</a> </div>'}, {
            				"targets" : [0],
            				"visible" : false,
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],

            });

	$('#sample_5 tbody').on( 'click', '#state_update', function () { 
		  var  data = table.row($(this).parents('tr')).data();
	      	$('[name="hid"]').val(data["sid"]);
	      	$('[name="statename"]').val(data["statename"]);
	      	$('[name="statelink"]').val(data["statelink"]);
	      	
	      });
	
	
	$('#sample_5 tbody').on( 'click', '#state_delete', function () { 
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
	            		  data:{'id':data["sid"],'model':'StateModel'},
	            		  dataType : "JSON",
	            		  success:function reload(data){
	            			  if (data.status) {
	            					table.ajax.reload();
	            					swal("Good", "Success Fully", "success");
	            					$('#addstate').modal('hide');
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



function insertState(){
	$.ajax({
		url : 'state.py', 
		method : 'POST',
		data : $('#state_form').serialize(),
		success : function(ret){
			if (ret.input) {
				table.ajax.reload();
				swal("Good", "Success Fully", "success");
				$('#addstate').modal('hide');
			}else{
				swal("sorry!", "successfully not inserted data!!", "error");
				$('#addstate').modal('hide');
			}
		}
	});

}