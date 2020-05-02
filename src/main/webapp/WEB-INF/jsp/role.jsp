<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="sample" style="width:100%;">
                         <thead>
                          <tr>
                            <th>No</th>
                            <th>name</th>
                            <th>Position</th>
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
 
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addRole" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="addRole" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Role</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form class="needs-validation" id="role_form" autocomplete="off" method="post">
              <input type="hidden" name="hid" value="0" />
               <div class="form-group">
                 <label>Enter Role</label> 
                 <input type="text" name="rname" class="form-control" id="role_name" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>Enter Disc</label> 
                 <input type="text" name="rdesc" class="form-control" id="role_disc" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
             <div>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             	<input class="btn btn-success float:left" type="button" onclick="insertrole()" value="ADD" />
             </div>
           </form>
           
       </div>
     </div>
   </div>
 </div>
 <script src="<c:url value='js/role/role.js' />"></script>