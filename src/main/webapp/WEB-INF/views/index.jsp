<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="./common.jsp"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
			<h3 class="text-center mb-3" style="color:red;">Spring MVC CRUD</h3>
			
			<table class="table mt-4">
			  <thead class="table-light">
			    <tr>
			      <th scope="col">Id</th>
			      <th scope="col">Company Name</th>
			      <th scope="col">Headquarter</th>
			      <th scope="col">Edit</th>
			      <th scope="col">Delete</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  	<c:forEach items="${companies}" var="str">
				    <tr>
				      <th scope="row">${str.id}</th>
				      <td><a href="employees/${str.id}">${str.name}</a></td>
				      <td>${str.headquarter}</td>
				      <td><a href="update/${str.id}"><i class="fas fa-edit"></i></a></td>
				      <td><a href="delete/${str.id}"><i class="fas fa-trash-alt text-danger"></i></a></td>
				    </tr>
			    </c:forEach>
			    
			  </tbody>
			</table>
			
			<div class="container text-center">
				<a href="add-company" class="btn btn-success">Add Company</a>
			</div>
			
		</div>
	</div>
	
  </body>
</html>