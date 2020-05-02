<section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="card">
                  <div class="body">
                    <div id="mail-nav">
                      <button type="button" class="btn btn-danger waves-effect btn-compose m-b-15">COMPOSE</button>
                      <ul class="" id="mail-folders">
                        <li>
                          <a href="mail-inbox.html" title="Inbox">Inbox (10)
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;" title="Sent">Sent</a>
                        </li>
                        <li>
                          <a href="javascript:;" title="Draft">Draft</a>
                        </li>
                        <li>
                          <a href="javascript:;" title="Bin">Bin</a>
                        </li>
                        <li>
                          <a href="javascript:;" title="Important">Important</a>
                        </li>
                        <li>
                          <a href="javascript:;" title="Starred">Starred</a>
                        </li>
                      </ul>
                
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                <div class="card">
                  <div class="boxs mail_listing">
                    <div class="row">
                      <div class="col-lg-12">
                        <form class="composeForm" id="composeFor">
                          <div class="form-group">
                            <div class="form-line">
                              <input type="text"  name="email_address" id="email_address" class="form-control" placeholder="TO">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="form-line">
                              <input type="text" name="subject" id="subject" class="form-control" placeholder="Subject">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="form-line">
                              <input type="text" name="msg" id="msg" class="form-control" placeholder="Message">
                            </div>
                          </div>
                         <!--   <div class="compose-editor m-t-20">
                            <div id="summernote"></div>
                            <input type="file" name="file" id="file" class="default" multiple>
                          </div> -->
                        </form>
                      </div>
                      <div class="col-lg-12">
                        <div class="m-l-25 m-b-20">
                          <button type="button" onclick="send()" class="btn btn-info btn-border-radius waves-effect">Send</button>
                          <button type="button" class="btn btn-danger btn-border-radius waves-effect">Discard</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!--  -->
        
<script type="text/javascript"> 
function send(){
	$.ajax({
		url : 'mail.py',
		method : 'POST',
		data : $('#composeFor').serialize(),
		dataType : 'JSON',
		success : function(res) {
			
			$('#composeFor')[0].reset();
			
			}
		}
	});
	iziToast.success({
	    title: 'Hello, Sir!',
	    message: 'Your E-mail send Successfully , Thank you,
	    position: 'topRight'
	  });	  
}
</script>	