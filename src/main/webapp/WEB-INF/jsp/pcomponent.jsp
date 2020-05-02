<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.4.1.min.js"></script>
<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="sample_4" style="width:100%;">
                         <thead>
                          <tr>
                            <th></th>
                            <th>Component Name</th>
                            <th>Component Link</th>
                             <th>Privilege Name</th>
                            <th>Privilege Link</th>
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
        </section>
 
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addpcom" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="addpcom" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">PRIVILEGE COMPONENT</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form class="needs-validation" id="privilegecom_form" autocomplete="off" method="post">
               <input type="hidden" value="0"  name="hid" />
               <div class="form-group">
                 <label>Select a Privilege</label> 
                 <select  name="id" class="form-control papa" id="p_name" required>
                 </select>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>Component name</label> 
                 <input type="text" name="Componentname" class="form-control" id="component_name" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>Component Link</label> 
                 <input type="text" name="Componentlink" class="form-control" id="component_link" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
             <div>
             <input class="btn btn-success" type="button" onclick="insertprivilegecomponent()" value="ADD" />
               <button class="btn btn-danger  float:right" data-dismiss="modal">Cancel</button>
             	
             </div>
           </form>
           
       </div>
     </div>
   </div>
 </div>
 <script src="<c:url value='js/privilege/pcomponent.js' />"></script>