<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="./common.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/mvcapp/">Home</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	  </div>
	</nav>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3">Enter Employee Detail</h1>
				<form action="submit-employee" method="post">
					  <div class="mb-3">
					    <label class="form-label">First Name</label>
					    <input type="text" name="firstName" class="form-control" placeholder="type first name">
					  </div>
					  <div class="mb-3">
					    <label class="form-label">Last Name</label>
					    <input type="text" name="lastName" class="form-control" placeholder="type last name">
					  </div>
					  <div class="mb-3">
					    <label class="form-label">Department</label>
					    <input type="text" name="department" class="form-control" placeholder="type department name">
					  </div>
					  <div class="mb-3">
					    <label class="form-label">Salary</label>
					    <input type="number" name="salary" class="form-control" placeholder="type salary">
					  </div>
					  <div class="mb-3">
					    <label class="form-label">Address</label>
					    <input type="text" name="address" class="form-control" placeholder="type address">
					  </div>
					<!--   <div class="mb-3">
					    <label class="form-label">Hire Date</label>
					    <input type="date" name="hireDate" class="form-control" placeholder="type hireDate">
					  </div> -->
					  <!-- <div class="mb-3">
					    <label class="form-label">Company Id</label>
					    <input type="number" name="company_id" class="form-control" placeholder="type company id">
					  </div> -->
					  
					  <div class="container text-center">
						  <button type="submit" class="btn btn-primary">Create</button>
						  <a href="${pageContext.request.contextPath}/" class="btn btn-outline-danger">Back</a>
					  </div>
				</form>
			</div>	
		</div>
	</div>
</body>
</html>