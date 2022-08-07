<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classes.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.ws.rs.client.Client, javax.ws.rs.client.ClientBuilder, javax.ws.rs.core.GenericType,
 	javax.ws.rs.client.Invocation, javax.ws.rs.client.WebTarget, javax.ws.rs.core.Response, javax.ws.rs.core.MediaType" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Checkout</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<link href="../css/fontawesome-all.min.css" rel="stylesheet">
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
</head>
<body>
<%
	String userId = (String) session.getAttribute("sessUserID");
	
	if (userId == null || userId.equals("")){
		response.sendRedirect("./error/401.html");
		return;
	}
	
	Client client = ClientBuilder.newClient();
	String restUrl = "http://localhost:8080/Assignment2_Server/UserService";
	WebTarget target = client
			.target(restUrl)
			.path("getUser")
			.queryParam("userid", userId);
	Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
	Response resp = invocationBuilder.get();
	
	if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
		System.out.println("success");
		
		User user = resp.readEntity(User.class);
		request.setAttribute("user", user);
		
		if (user == null) {			
			request.setAttribute("error", "UserNotFound");
			response.sendRedirect("./error/401.html");
			return;
		}
	} else {
		request.setAttribute("error", "NotFound");
		response.sendRedirect("./error/401.html");
		return;
	}
%>

<% 
	List<Tour> cart = (List<Tour>) session.getAttribute("cart");
	List<Integer> slotsArr = (List<Integer>) session.getAttribute("slotsArr");
	
	if (cart == null || slotsArr == null) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	User user = (User) request.getAttribute("user");
	
	double total = 0;
%>
<div class="wrapper">
	<%@ include file="./components/header.jsp" %>
		
	<section class="page-header"
		style="background-image: url(../images/backgrounds/category-0.jpg);">
		<div class="container">
			<h2>Checkout Form</h2>
			<ul class="thm-breadcrumb list-unstyled">
				<li><a href="cart.jsp">Cart</a></li>
				<li><span>Checkout</span></li>
			</ul><!-- /.thm-breadcrumb -->
		</div><!-- /.container -->
	</section><!-- /.tour-details__header -->
	
	<section style="padding-bottom:0px" class="tour-one tour-grid">
		<div class="container">
		  <div class="row">
		    <div class="col-md-4 order-md-2 mb-4">
		      <h4 class="d-flex justify-content-between align-items-center mb-3">
		        <span class="text-muted">Your cart</span>
		        <span class="badge badge-secondary badge-pill"><%=cart.size()%></span>
		      </h4>
		      <ul class="list-group mb-3">
		      <% for (int i = 0; i < cart.size(); i++) { %>
		      	<% 
		      		double bookingPrice = cart.get(i).getPrice() * slotsArr.get(i); 
		      		total += bookingPrice;
		      	%>
		      	
		      	<li class="list-group-item d-flex justify-content-between lh-condensed">
		          <div>
		            <h6 class="my-0"><%=cart.get(i).getName()%></h6>
		            <small class="text-muted">$<%=cart.get(i).getPrice()%></small>
		          </div>
		          <span class="text-muted"><%=slotsArr.get(i)%></span>
		          <span class="text-muted">$<%=bookingPrice%></span>
		        </li>
		      <% } %>
		      
		        <li class="list-group-item d-flex justify-content-between">
		          <span>Total (SGD)</span>
		          <strong>$<%=total%></strong>
		        </li>
		      </ul>
		    </div>
		    
		    <div class="col-md-8 order-md-1">
		      <h4 class="mb-3">Billing address</h4>
		      <form action="../CheckoutServlet" method="post" class="needs-validation">
		        <div class="row">
		          <div class="col-md-6 mb-3">
		            <label for="firstName">First name</label>
		            <input type="text" class="form-control" name="firstName" placeholder="" value="" required>
		            <div class="invalid-feedback">
		              Valid first name is required.
		            </div>
		          </div>
		          <div class="col-md-6 mb-3">
		            <label for="lastName">Last name</label>
		            <input type="text" class="form-control" name="lastName" placeholder="" value="" required>
		            <div class="invalid-feedback">
		              Valid last name is required.
		            </div>
		          </div>
		        </div>
		
		        <div class="mb-3">
		          <label for="username">Username</label>
		          <div class="input-group">
		            <div class="input-group-prepend">
		              <span class="input-group-text">@</span>
		            </div>
		            <input type="text" class="form-control" id="username" 
		            	value="<%=user.getUsername()%>" placeholder="Username" disabled>
		          </div>
		        </div>
		
		        <div class="mb-3">
		          <label for="email">Email <span class="text-muted"></span></label>
		          <input type="email" class="form-control" id="email" 
		          	value="<%=user.getEmail()%>" placeholder="you@example.com" disabled>
		        </div>
		
		        <div class="mb-3">
		          <label for="address2">Phone Number <span class="text-muted"></span></label>
		          <input type="text" class="form-control" name="phoneNumber" placeholder="Personal Phone Number" required>
		        </div>
		        
		        <div class="mb-3">
		          <label for="address">Address</label>
		          <input type="text" class="form-control" name="address" placeholder="1234 Main St" required>
		          <div class="invalid-feedback">
		            Please enter your shipping address.
		          </div>
		        </div>
		
		        <div class="row">
		          <div class="col-md-3 mb-3">
		            <label for="zip">Zip</label>
		            <input type="text" class="form-control" name="zip" placeholder="" required>
		            <div class="invalid-feedback">
		              Zip code required.
		            </div>
		          </div>
		        </div>
		        <hr class="mb-4">
		
		        <h4 class="mb-3">Payment</h4>
		        <div class="row">
		          <div class="col-md-6 mb-3">
		            <label for="cc-name">Name on card</label>
		            <input type="text" class="form-control" id="cc-name" placeholder="" required>
		            <small class="text-muted">Full name as displayed on card</small>
		            <div class="invalid-feedback">
		              Name on card is required
		            </div>
		          </div>
		          <div class="col-md-6 mb-3">
		            <label for="cc-number">Credit card number</label>
		            <input type="text" class="form-control" id="cc-number" placeholder="" required>
		            <div class="invalid-feedback">
		              Credit card number is required
		            </div>
		          </div>
		        </div>
		        <div class="row">
		          <div class="col-md-3 mb-3">
		            <label for="cc-expiration">Expiration</label>
		            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
		            <div class="invalid-feedback">
		              Expiration date required
		            </div>
		          </div>
		          <div class="col-md-3 mb-3">
		            <label for="cc-cvv">CVV</label>
		            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
		            <div class="invalid-feedback">
		              Security code required
		            </div>
		          </div>
		        </div>
		        <hr class="mb-4">
		        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
		      </form>
			</div>
		  </div>
		</div>
	</section>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2021 - 2045 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>
	
</body>
</html>