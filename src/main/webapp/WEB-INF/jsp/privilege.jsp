<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.4.1.min.js"></script>
<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="sample_1" style="width:100%;">
                         <thead>
                          <tr>
                            <th>SR no:</th>
                            <th>Privilege Name</th>
                            <th>Privilege Code</th>
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
 
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addprivilege" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="addprivilege" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">PRIVILEGE</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form class="needs-validation" id="privilege_form" autocomplete="off" method="post">
               <input type="hidden" name="hid" value="0" />
               <div class="form-group">
                 <label>Enter Privilege</label> 
                 <input type="text" name="privilege_name" class="form-control" id="privilege_name" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>Privilege Code</label> 
                 <input type="text" name="pcode" class="form-control" id="font-code" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
             <div>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             	<input class="btn btn-success float:left" type="button" onclick="insertprivilege()" value="ADD" />
             </div>
           </form>
           
       </div>
     </div>
   </div>
 </div>
 <script src="<c:url value='js/privilege/privilege.js' />"></script>