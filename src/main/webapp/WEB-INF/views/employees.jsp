<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="./common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
		<a class="navbar-brand" href="/mvcapp/">Home</a>
			<a class="navbar-brand">Employees</a>  
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

		</div>
	</nav>

	<div class="container mt-3">

		<div class="row">

			<h3 class="text-center mb-3" style="color: red;">Spring MVC CRUD</h3>
           
			<table class="table mt-4">
				<thead class="table-light">
					<tr>
						<th scope="col">Employee Id</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Department</th>
						<th scope="col">Salary</th>
						<th scope="col">Address</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>

					</tr>
				</thead>
				<tbody class="table-group-divider">

					<c:forEach items="${employees}" var="str">
						<tr>
							<th scope="row">${str.empid}</th>
							<td>${str.firstName}</td>
							<td>${str.lastName}</td>
							<td>${str.department}</td>
							<td>${str.salary}</td>
							<td>${str.address}</td>
							<td><a href="update/${str.empid}"><i class="fas fa-edit"></i></a></td>
							<td><a href="delete/${str.empid}"><i
									class="fas fa-trash-alt text-danger"></i></a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<div class="container text-center">
				<a href="add-employee" class="btn btn-success">Add Employee</a>
			</div>

		</div>
	</div>

</body>
</html>