<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <script src="js/jquery-3.4.1.min.js"></script>
<style type="text/css">
  .d{
    margin-bottom: 30px !important;
  }
</style>
<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="sample-6" style="width:100%;">
                         <thead>
                          <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>image</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                       </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div id="sweet_success"></div>
		<div id="sweet_error"></div>
        </section>
 
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#useradd" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="useradd" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Role</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form enctype="multipart/formdata" class="needs-validation" id="user_form" autocomplete="off" method="post">
              <input type="hidden" name="hid" value="0" />
               <div class="form-group">
                 <label>Enter Name *</label> 
                 <input type="text" name="Name" class="form-control" id="Name" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
                  <div class="custom-file d">
                      <input accept="image/*" type="file" class="custom-file-input" name="customFile" id="customFile">
                      <label class="custom-file-label" for="customFile">Choose file</label>
                  </div>

                <div class="form-group">
                 <label>Enter Email *</label> 
                 <input type="email" name="email" class="form-control" id="email" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
             <div>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             	<input class="btn btn-success float:left" type="button" onclick="insertuserdata()" value="ADD" />
             </div>
           </form>
           
       </div>
     </div>
   </div>
 </div>
 <script src="<c:url value='js/role/userdata.js' />"></script>