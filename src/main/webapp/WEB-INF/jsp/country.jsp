<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="sample_2" style="width:100%;">
                         <thead>
                          <tr>
                            <th></th>
                            <th>Country Name</th>
                            <th>Country Code</th>
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
 
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addCountry" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="addCountry" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Role</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form class="needs-validation" id="country_form" autocomplete="off" method="post">
             <input type="hidden" value="0" name="hid"/>
               <div class="form-group">
                 <label>Enter Country name*</label> 
                 <input type="text" name="cname" class="form-control" id="role_name" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
                <div class="form-group">
                 <label>Enter Country Code*</label> 
                 <input type="text" name="code" class="form-control" id="role_disc" required>
                 <div class="invalid-feedback">
                 </div>
               </div>
             <div>
               <button class="btn btn-danger float:right" data-dismiss="modal">Cancel</button>
             	<input class="btn btn-success " type="button" onclick="insertcountry()" value="ADD" />
             </div>
           </form>
           
       </div>
     </div>
   </div>
 </div>
 <script src="<c:url value='js/location/country.js'/>"></script>