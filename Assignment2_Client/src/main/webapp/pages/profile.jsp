<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
	<link href="../css/login-style.css" rel="stylesheet" />
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="./components/header.jsp" %>
		<section class="py-3 my-3">
	      <div class="container">
	        <div class="bg-white shadow rounded-lg d-block d-sm-flex">
	          <div class="profile-tab-nav border-right">
	            <div class="p-4">
	              <div class="img-circle text-center mb-3">
	                <img src="../images/profile-image.png" alt="Image" class="shadow" />
	              </div>
	              <h4 class="text-center">User</h4>
	            </div>
	            <div
	              class="nav flex-column nav-pills"
	              id="v-pills-tab"
	              role="tablist"
	            >
	              <a
	                class="nav-link active"
	                id="account-tab"
	                data-toggle="pill"
	                href="#account"
	                role="tab"
	              >
	                <i class="text-center mr-1"></i>
	                Account
	              </a>
	              <a
	                class="nav-link"
	                id="userinfo-tab"
	                data-toggle="pill"
	                href="#userinfo"
	                role="tab"
	              >
	                <i class="text-center mr-1"></i>
	                User Information
	              </a> 
	              <a
	                class="nav-link"
	                id="booked-tours"
	                data-toggle="pill"
	                href="#booked"
	                role="tab"
	              >
	                <i class="text-center mr-1"></i>
	                Booked Tours
	              </a>
	              <a
	                class="nav-link"
	                id="past-tours"
	                data-toggle="pill"
	                href="#past"
	                role="tab"
	              >
	                <i class="text-center mr-1"></i>
	                Past Tours
	              </a>
	                  
	              <%
	              	out.println("<a " +
	    	                "class=\"nav-link\"" +
	    	                "id=\"manage-tours\"" +
	    	                "data-toggle=\"pill\"" +
	    	                "href=\"#manage\"" +
	    	                "role=\"tab\"" +
	    	              ">" +
	    	                "<i class=\"text-center mr-1\"></i>" +
	    	                "Manage Tours" +
	    	              "</a>");
	              %>
	            </div>
	          </div>
	          <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
	            <div class="tab-pane fade show active" id="account" role="tabpanel">
	              <h3 class="mb-4">Account Settings</h3>
	              <div class="row">
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>Username</label>
	                    <input type="text" class="form-control" value="Kiran" />
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>Email</label>
	                    <input type="text" class="form-control" value="Acharya" />
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>Old Password</label>
	                    <input
	                      type="password"
	                      class="form-control"
	                      placeholder="Old Password"
	                    />
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>New Password</label>
	                    <input
	                      type="password"
	                      class="form-control"
	                      placeholder="New Password"
	                    />
	                  </div>
	                </div>
	              </div>
	              <div>
	                <button class="btn btn-primary">Update</button>
	                <button class="btn btn-light">Cancel</button>
	              </div>
	            </div>
	            <div class="tab-pane fade" id="userinfo" role="tabpanel">
	              <h3 class="mb-4">User Information</h3>
	              <div class="row">
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>FullName</label>
	                    <input type="text" class="form-control" value="Kiran" />
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>Phone</label>
	                    <input type="text" class="form-control" value="83569865" />
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>Residential Address</label>
	                    <input
	                      type="text"
	                      class="form-control"
	                      value="Jurong East"
	                    />
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <label>ZIP Code</label>
	                    <input
	                      type="text"
	                      class="form-control"
	                      value="602285"
	                    />
	                  </div>
	                </div>
	              </div>
	              <div>
	                <button class="btn btn-primary">Update</button>
	                <button class="btn btn-light">Cancel</button>
	              </div>
	            </div>
	            <div class="tab-pane fade" id="booked" role="tabpanel">
	              <h3 class="mb-4">Feature Not Available</h3>
	            </div>
	            <div class="tab-pane fade" id="past" role="tabpanel">
	              <h3 class="mb-4">Feature not Available</h3>
	            </div>
	            <div class="tab-pane fade" id="manage" role="tabpanel">
	              <h3 class="mb-4">Manage Tours</h3>
	              <div class="row">
	                <div class="col-md-6">
	                  <div class="form-group">
	                    <div class="form-check">
	                      <input
	                        class="form-check-input"
	                        type="checkbox"
	                        value=""
	                        id="app-check"
	                      />
	                      <label class="form-check-label" for="app-check">
	                        App check
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input
	                        class="form-check-input"
	                        type="checkbox"
	                        value=""
	                        id="defaultCheck2"
	                      />
	                      <label class="form-check-label" for="defaultCheck2">
	                        Lorem ipsum dolor sit.
	                      </label>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <div>
	                <button class="btn btn-primary">Update</button>
	                <button class="btn btn-light">Cancel</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
    </div>
    <script src="../script/jquery.min.js"></script>
    <script src="../script/bootstrap.bundle.min.js"></script>
</body>
</html>