<%@page import="java.security.Principal"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authorize access="isAuthenticated()" >
<security:authentication property="principal.username" var="cd"/>
</security:authorize>
<c:if test="${cd eq null }">
	<c:redirect url="login.py"></c:redirect>
</c:if> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title><tiles:insertAttribute name="title"/></title>
  
  <!-- General CSS Files -->
  <link rel="stylesheet" href="css/app.min.css">
  <link rel="stylesheet" href="bundles/jqvmap/dist/jqvmap.min.css">
  <link rel="stylesheet" href="bundles/weather-icon/css/weather-icons.min.css">
  <link rel="stylesheet" href="bundles/weather-icon/css/weather-icons-wind.min.css">
  <link rel="stylesheet" href="bundles/summernote/summernote-bs4.css">
  
  <!-- Template CSS -->
  <link rel="stylesheet" href="bundles/datatables/datatables.min.css">
  <link rel="stylesheet" href="bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/components.css">
   <!-- General CSS Files -->
  <link rel="stylesheet" href="css/app.min.css">
  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  <script src="js/jquery-3.4.1.min.js"></script>
  
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="css/custom.css">
  <link rel='shortcut icon' type='image/x-icon' href='img/favicon.ico' />
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <div class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
									collapse-btn"> <i data-feather="align-justify"></i></a></li>
            <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                <i data-feather="maximize"></i>
              </a></li>
            <li>
              <form class="form-inline mr-auto">
                <div class="search-element">
                  <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="200">
                  <button class="btn" type="submit">
                    <i class="fas fa-search"></i>
                  </button>
                </div>
              </form>
            </li>
          </ul>
        </div>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
              class="nav-link nav-link-lg message-toggle"><i data-feather="mail"></i>
              <span class="badge headerBadge1">
                6 </span> </a>
          </li>
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
              class="nav-link notification-toggle nav-link-lg"><i data-feather="bell"></i>
              <span class="badge headerBadge2">
                3 </span> </a>
            
          </li>
          <li class="dropdown"><a href="#" data-toggle="dropdown"
              class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="img/user.png"
                class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
            <div class="dropdown-menu dropdown-menu-right pullDown">
              <div class="dropdown-title">Hello ${sessionScope.name}</div>
              <a href="profile.html" class="dropdown-item has-icon"> <i class="far
										fa-user"></i> Profile
              </a> <a href="timeline.html" class="dropdown-item has-icon"> <i class="fas fa-bolt"></i>
                Activities
              </a> <a href="#" class="dropdown-item has-icon"> <i class="fas fa-cog"></i>
                Settings
              </a>
              <div class="dropdown-divider"></div>
              <a href="<c:url value="/logout" />" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="index.html"> <img alt="image" src="img/logo.png" class="header-logo" /> <span
                class="logo-name"> ${sessionScope.role}</span>
            </a>
          </div>
          <div class="sidebar-user">
            <div class="sidebar-user-picture">
              <img alt="image" src="img/userbig.png">
            </div>
            <div class="sidebar-user-details">
              <div class="user-name"> ${sessionScope.name}</div>
              <div class="user-role">${sessionScope.role}</div>
            </div>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Main</li>
            <li class="dropdown active">
              <a href="welcome.erp" class="nav-link has-dropdown"><i data-feather="monitor"></i><span>Dashboard</span></a>
            	<ul class="dropdown-menu">
                <li><a class="nav-link" href="welcome.py">Dashboard</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i data-feather="briefcase"></i><span>ACM</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="role.py">Role</a></li>
                <li><a class="nav-link" href="privilege.py">privilege</a></li>
                <li><a class="nav-link" href="pcomponent.py">pcomponent</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i data-feather="user-check"></i><span>Employee</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="userdata.py">User Data</a></li>
                <li><a class="nav-link" href="error404.py">New</a></li>
             </ul>
            </li>
            
             <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i data-feather="map-pin"></i><span>LOCATION</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="country.py">country</a></li>
                <li><a class="nav-link" href="state.py">state</a></li>
               </ul>
            </li>
            <li class="dropdown"><a href="#" class="nav-link has-dropdown">
            	<i data-feather="mail"></i><span>Email</span></a>
						<ul class="dropdown-menu">
						<li><a class="nav-link" href="error404.py">Inbox</a></li>
						<li><a class="nav-link" href="email.py">Compose</a></li>
						<li><a class="nav-link" href="error404.py">read</a></li>
					</ul>
				</li>
            
          </ul>
        </aside>
      </div>
      <!-- Main Content -->
      <div class="main-content">
      		<tiles:insertAttribute name="content"/>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2019 <div class="bullet"></div> Design By <a href="#">THITA</a>
        </div>
        <div class="footer-right">
        </div>
      </footer>
    </div>
  </div>
		<!-- JS Libraies -->
  		<script src="bundles/sweetalert/sweetalert.min.js"></script>
  		<!-- Page Specific JS File -->
  		<script src="js/page/sweetalert.js"></script>  
  	  <!-- General JS Scripts -->
	  <script src="js/app.min.js"></script>
	    <!-- Page Specific JS File -->
  		<script src="bundles/ckeditor/ckeditor.js"></script>
  		<script src="js/page/ckeditor.js"></script>
	  
	
	  <!-- Page Specific JS File -->
	  <script src="bundles/datatables/datatables.min.js"></script>
	  <script src="bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
	  <script src="bundles/datatables/export-tables/dataTables.buttons.min.js"></script>
	  <script src="bundles/datatables/export-tables/buttons.flash.min.js"></script>
	  <script src="bundles/datatables/export-tables/jszip.min.js"></script>
	  <script src="bundles/datatables/export-tables/pdfmake.min.js"></script>
	  <script src="bundles/datatables/export-tables/vfs_fonts.js"></script>
	  <script src="bundles/datatables/export-tables/buttons.print.min.js"></script>
		<!-- Columan visibility JS File -->
	  <script src="js/buttons.colVis.min.js"></script>	 
	 
	  <!-- Template JS File -->
	  <script src="js/scripts.js"></script>
	    <!-- JS Libraies -->
  		<script src="bundles/izitoast/js/iziToast.min.js"></script>
  		<!-- Page Specific JS File -->
  		<script src="js/page/toastr.js"></script>
	 
	  <!-- Custom JS File -->
	  <script src="js/custom.js"></script>
	  <!-- Page Specific JS File -->
	  <script src="js/page/index.js"></script>
	 
	  <script src="bundles/sweetalert/sweetalert.min.js"></script>
	  <!-- Page Specific JS File -->
	  <script src="js/page/sweetalert.js"></script>
	  
	 
</body>
</html>