package project.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import project.model.Dao.genericDao;
import project.model.Login.LoginMasterModel;
import project.model.location.CountryModel;
import project.model.location.StateModel;
import project.model.privillege.PcomponentModel;
import project.model.privillege.PrivilegeModel;
import project.model.role.RoleModel;
import project.model.role.UserModel;

@Controller
public class FileContoller {
	@Autowired
	genericDao dao;
	
	@Autowired
	ServletContext cx;
	
	public File  getpath() {
		String path = cx.getRealPath("upload/");
		return  new File(path);
	}
	
	
	@RequestMapping(value = "invoice.py" , method = RequestMethod.GET)
	public String invoice(HttpSession ses , Principal p) {
		LoginMasterModel mm =(LoginMasterModel)dao.View("LoginMasterModel", "username ='"+p.getName()+"'").get(0);
		ses.setAttribute("name", mm.getUsername());
		ses.setAttribute("id", mm.getLid());
		ses.setAttribute("image",mm.getImage());
		ses.setAttribute("role", mm.getRole_name());
		return "invoice";
	}
	@RequestMapping(value = "login.py" , method = RequestMethod.GET)
	public String Login(HttpSession s) {
		s.removeAttribute("name");
		s.removeAttribute("id");
		s.removeAttribute("image");
		s.removeAttribute("role");
		s.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "loginError.py" , method = RequestMethod.GET)
	public String error() {
		return "error";
	}
	
	@RequestMapping(value = "error404.py" , method = RequestMethod.GET)
	public String error404() {
		return "error404";
	}
	
	
	@RequestMapping(value = "userdata.py" , method = RequestMethod.GET)
	public String userdata() {
		return "userdata";
	}
	
	@RequestMapping(value = "email.py" , method = RequestMethod.GET)
	public String email() {
		return "email";
	}
	@RequestMapping(value = "mail.py" , method = RequestMethod.POST, headers="Accept=*/*",  produces="application/json")
	public @ResponseBody HashMap<String,Boolean> mail(@RequestParam("email_address") String email_address,@RequestParam("subject") String subject ,@RequestParam("msg") String msg ) {
		HashMap<String,Boolean> hk = new HashMap<String,Boolean>();
		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
		MailMail mm = (MailMail) context.getBean("mailMail");
		mm.sendMail("hr.thita.organization@gmail.com",email_address,subject,msg);
		hk.put("status", true);
		return hk;
	}
	
	
	
	

	@RequestMapping(value = "userdata.py" , method = RequestMethod.POST, headers="Accept=*/*",  produces="application/json")
	public @ResponseBody HashMap<String,Boolean> userdata(@RequestParam("hid") int hid,@RequestParam("Name") String uname ,@RequestParam("email") String email , @RequestParam("image") MultipartFile f) {
		HashMap<String,Boolean> hk = new HashMap<String,Boolean>();
		try {
			f.transferTo(new File(getpath(), f.getOriginalFilename()));
			UserModel um = null; 
			if (hid == 0) {
				um = new UserModel(uname, email,f.getOriginalFilename());			
				dao.insert(um);
			}else {
				um = new UserModel(hid, uname, email,f.getOriginalFilename());			
				dao.insert(um);
			}
			if (um != null) {
				hk.put("status", true);
			}else {
				hk.put("status", false);
			}
		
		} catch (IllegalStateException | IOException e) {
			hk.put("status", false);
		}
		return hk;
	}

	@RequestMapping(value = "welcome.py" , method = RequestMethod.GET)
	public String name(HttpSession ses , Principal p) {
		LoginMasterModel mm =(LoginMasterModel)dao.View("LoginMasterModel", "username ='"+p.getName()+"'").get(0);
		ses.setAttribute("name", mm.getUsername());
		ses.setAttribute("id", mm.getLid());
		ses.setAttribute("image",mm.getImage());
		ses.setAttribute("role", mm.getRole_name());
		return "index";
	}
	
	@RequestMapping(value="delete.py", method=RequestMethod.POST , headers="Accept=*/*",  produces="application/json")
	public @ResponseBody HashMap<String,Boolean>  delete(@RequestParam("model") String E,@RequestParam("id") long id) {
        
		int i = dao.delete(E,id);
        HashMap<String,Boolean> map = new HashMap<String,Boolean>();
		
        if(i>0)
		{
			map.put("status",true);
		}
		else{
			map.put("status",false);
		}
        
		return  map;
	}
	
	@RequestMapping(value="getdropdown.py", method=RequestMethod.POST , headers="Accept=*/*",  produces="application/json")
	public @ResponseBody List getdropdown(@RequestParam("model") String E) {   
        List ls=dao.display(E);
		return ls;
	}
	
	
	@RequestMapping(value="get_data.py", method=RequestMethod.GET , headers="Accept=*/*",  produces="application/json")
	public @ResponseBody  HashMap<String ,List >  get_data(@RequestParam("model") String E) {

		HashMap<String, List> map = new HashMap<String, List>();
		List l=dao.display(E);
		map.put("data", l);
		return map;
	}
	
	
	@RequestMapping(value = "role.py" , method = RequestMethod.GET)
	public String role() {
		return "role";
	}
	
	@RequestMapping(value = "role.py" , method = RequestMethod.POST, headers="Accept=*/*",  produces="application/json")
	public @ResponseBody HashMap<String,Boolean> roleadd(@RequestParam("hid") int hid,@RequestParam("rname") String rname ,@RequestParam("rdesc") String rdesc ) {
		HashMap<String,Boolean> hk = new HashMap<String,Boolean>();
		RoleModel rm = null; 
		if (hid == 0) {
			rm = new RoleModel(rname, rdesc);
			dao.insert(rm);
		}else {
			rm = new RoleModel(hid,rname, rdesc);
			dao.insert(rm);
		}
		
		
		if (rm != null) {
			hk.put("status", true);
		}else {
			hk.put("status", false);
		}
		return hk;
	}
	
	
	@RequestMapping(value = "privilege.py" , method = RequestMethod.GET)
	public String privilege() {
		return "privilege";
	}
	
	@RequestMapping(value = "privilege.py" , method = RequestMethod.POST,headers ="Accept=*/*",produces = "application/json")
	public @ResponseBody HashMap<String, Boolean> privilegeadd(@RequestParam("hid") int hid,@RequestParam("privilege_name") String  pname,@RequestParam("pcode") String pcode ) {
		HashMap<String, Boolean> hk = new HashMap<String, Boolean>();
		PrivilegeModel pm = null;
		if (hid == 0) {
			pm=new PrivilegeModel(pname, pcode);
			dao.insert(pm);
		}else {
			pm=new PrivilegeModel(hid,pname, pcode);
			dao.insert(pm);
		}
		if (pm != null) {
			hk.put("cheak", true);
		}else {
			hk.put("cheak", false);
		}
		return hk;
	}
	
	
	
	@RequestMapping(value = "pcomponent.py" , method = RequestMethod.GET)
	public String pcomponent() {
		return "pcomponent";
	}
	@RequestMapping(value = "pcomponent.py" , method = RequestMethod.POST,headers ="Accept=*/*",produces = "application/json")
	public @ResponseBody HashMap<String, Boolean> pcomponentadd(@RequestParam("id") int  id,@RequestParam("Componentname") String Componentname ,@RequestParam("Componentlink") String Componentlink ) {
		HashMap<String, Boolean> hk = new HashMap<String, Boolean>();
		PrivilegeModel pm = new PrivilegeModel(id);
		PcomponentModel pcm = new PcomponentModel(Componentname, Componentlink, pm);
		dao.insert(pcm);
		if (pcm != null) {
			hk.put("cheak", true);
		}else {
			hk.put("cheak", false);
		}
		return hk;
	}
	
	@RequestMapping(value = "country.py" , method = RequestMethod.GET)
	public String country() {
		return "country";
	}
	@RequestMapping(value = "country.py" , method = RequestMethod.POST , headers = "Accept=*/*" , produces = "application/json"  )
	public @ResponseBody HashMap<String, Boolean> countryadd(@RequestParam("hid") int hid,@RequestParam("cname") String cname , @RequestParam("code") String code) {
		HashMap<String, Boolean> hk = new HashMap<String, Boolean>();
		CountryModel cm =null;
		if (hid == 0) {
			cm =  new CountryModel(cname, code);
			dao.insert(cm);
		}else {
			cm =  new CountryModel(hid,cname, code);
			dao.insert(cm);
		}
		
		if (cm != null) {
			hk.put("input", true);
		}else {
			hk.put("input", false);
		}
		return hk;
	}
	
	@RequestMapping(value = "state.py" , method = RequestMethod.GET)
	public String state() {
		return "state";
	}
	
	@RequestMapping(value = "state.py" , method = RequestMethod.POST , headers = "Accept=*/*" , produces = "application/json"  )
	public @ResponseBody HashMap<String, Boolean> stateadd(@RequestParam("hid") int hid,@RequestParam("country") int  country,@RequestParam("statename") String statename ,@RequestParam("statelink") String statelink) {
		HashMap<String, Boolean> hk = new HashMap<String, Boolean>(); 
		CountryModel cm =  new CountryModel(country);
		StateModel st =null;
		if (hid == 0) {
			st = new StateModel(statename, statelink, cm);
			dao.insert(st);
		}else {
			st = new StateModel(hid,statename, statelink, cm);
			dao.insert(st);
		}
		if (st != null) {
			hk.put("input", true);
		}else {
			hk.put("input", false);
		}
		return hk;
	}
	
	
}
