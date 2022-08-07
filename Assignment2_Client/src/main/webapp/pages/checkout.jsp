<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Checkout</title>
	<link href="../css/fontawesome-all.min.css" rel="stylesheet">
	<link href="../css/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/animate.min.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
</head>
<body>
<div class="wrapper">
	<%@ include file="./components/header.jsp" %>
		
	<section class="page-header"
		style="background-image: url(../images/backgrounds/category-0.jpg);">
		<div class="container">
			<h2>Checkout form</h2>
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
		        <span class="badge badge-secondary badge-pill">3</span>
		      </h4>
		      <ul class="list-group mb-3">
		        <li class="list-group-item d-flex justify-content-between lh-condensed">
		          <div>
		            <h6 class="my-0">Product name</h6>
		            <small class="text-muted">Brief description</small>
		          </div>
		          <span class="text-muted">$12</span>
		        </li>
		        <li class="list-group-item d-flex justify-content-between">
		          <span>Total (USD)</span>
		          <strong>$20</strong>
		        </li>
		      </ul>
		    </div>
		    
		    <div class="col-md-8 order-md-1">
		      <h4 class="mb-3">Billing address</h4>
		      <form class="needs-validation" novalidate>
		        <div class="row">
		          <div class="col-md-6 mb-3">
		            <label for="firstName">First name</label>
		            <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
		            <div class="invalid-feedback">
		              Valid first name is required.
		            </div>
		          </div>
		          <div class="col-md-6 mb-3">
		            <label for="lastName">Last name</label>
		            <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
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
		            <input type="text" class="form-control" id="username" placeholder="Username" disabled>
		          </div>
		        </div>
		
		        <div class="mb-3">
		          <label for="email">Email <span class="text-muted">(Optional)</span></label>
		          <input type="email" class="form-control" id="email" placeholder="you@example.com" disabled>
		        </div>
		
		        <div class="mb-3">
		          <label for="address2">Phone Number <span class="text-muted"></span></label>
		          <input type="text" class="form-control" id="phoneNumber" placeholder="Personal Phone Number">
		        </div>
		        
		        <div class="mb-3">
		          <label for="address">Address</label>
		          <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
		          <div class="invalid-feedback">
		            Please enter your shipping address.
		          </div>
		        </div>
		
		        <div class="row">
		          <div class="col-md-3 mb-3">
		            <label for="zip">Zip</label>
		            <input type="text" class="form-control" id="zip" placeholder="" required>
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