<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="sample_5" style="width:100%;">
                         <thead>
                          <tr>
                            <th></th>
                            <th>Country Name</th>
                            <th>Country Link</th>
                            <th>State Name</th>
                            <th>State Link</th>
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
 
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addstate" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="addstate" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">PRIVILEGE COMPONENT</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form class="needs-validation" id="state_form" autocomplete="off" method="post">
               
               <input type="hidden" value="0" name="hid" />
               <div class="form-group">
                 <label>Select a Country</label> 
                 <select  name="country" class="form-control papa" id="state_name" required>
                 </select>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>State name</label> 
                 <input type="text" name="statename" class="form-control" id="component_name" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>state Link</label> 
                 <input type="text" name="statelink" class="form-control" id="state_link" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
             <div>
             <input class="btn btn-success" type="button" onclick="insertState()" value="ADD" />
               <button class="btn btn-danger  float:right" data-dismiss="modal">Cancel</button>
             	
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
 <script src="<c:url value='js/location/state.js' />"></script>