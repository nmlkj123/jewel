<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
/* $(document).ready(function(){
	$(document).on("click",'#item_m', function(e){
		$("a[class='nav-link active']").each(function() {
			  $(this).attr('class','nav-link');
			
			});
		
		$(this).attr('class','nav-link active');
	});
	$(document).on("click",'#member_m', function(e){
		$("a[class='nav-link active']").each(function() {
			  $(this).attr('class','nav-link');
			
			});
		
		$(this).attr('class','nav-link active');
		 $('.content').children().remove();  
		  $('.content').load('/common/adminMemberList');
	});
	$(document).on("click",'#sale_m', function(e){
		$("a[class='nav-link active']").each(function() {
			  $(this).attr('class','nav-link');
			
			});
		
		$(this).attr('class','nav-link active');
		 $('.content').children().remove();  
		  $('.content').load('/common/openAdminItemDaySaleList');
	});
});
 */
 
 var isAdmin="${MEM_ADMIN}";
 if(isAdmin!="A"){
	 alert("권한이 없습니다");
	 location.href="/common/main/main";
 }
</script>
<a href="openAdminMain" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Admin Page</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="openAdminMain" class="d-block">Admin</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <li class="nav-header">MENUS</li>
          <li class="nav-item has-treeview">
            <a href="#" id="item_m" class="nav-link">
             <i class="nav-icon far fa-image"></i>
              <p>
                	상품관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="adminItemList" id="item_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="openAdminItemWrite" id="item_write" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 등록</p>
                </a>
              </li>
             
            </ul>
          </li>
          <li class="nav-item">
            <a href="adminMemberList" id="member_m" class="nav-link">
              <i class="nav-icon fas fa-book"></i>
              <p>
               	회원관리
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="openAdminItemDaySaleList" id="sale_m" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
               	매출 관리
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="openDeliveryList" id="deli_m"class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               	배송관리
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="adminIgnoreList" id="ignore_m" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
               	차단목록 관리
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" id="list_m" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                게시판 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              
             
              <li class="nav-item has-treeview">
                <a href="#" id="notice_m" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    공지사항 관리
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="adminNoticeList" id="notice_list" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>공지사항 리스트</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="openAdminNoticeWrite" id="notice_write" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>공지사항 등록</p>
                    </a>
                  </li>
                  
                </ul>
              </li>
                   <li class="nav-item has-treeview">
                <a href="#" id="event_m" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    이벤트 관리
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="adminEventList" id="notice_list" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>이벤트 리스트</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="openAdminEventWrite" id="notice_write" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>이벤트 등록</p>
                    </a>
                  </li>
                  
                </ul>
              </li>
                   <li class="nav-item has-treeview">
                <a href="#" id="faq_m" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    FAQ 관리
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="adminFaqList" id="faq_list" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>FAQ 리스트</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="openAdminFaqWrite" id="faq_write" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>FAQ 등록</p>
                    </a>
                  </li>
                  
                </ul>
              </li>
              
              <li class="nav-item">
                <a href="adminQnAList" id="qna_m" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>QnA 관리</p>
                </a>
              </li>
            </ul>
          </li>
          
          
          
          
          
          
          
          
          
       
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>