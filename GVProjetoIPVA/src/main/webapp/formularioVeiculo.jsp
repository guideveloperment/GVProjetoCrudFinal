<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar Veiculo</title>

<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<nav class="navbar navbar-dark bg-success mb-5"
		aria-label="First navbar example">
		<div class="container-fluid">
			<div class="col-4 col-md-4 col-xl-4">
				<a class="navbar-brand" href="./index.jsp">Carro</a>
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample01"
				aria-controls="navbarsExample01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample01">
				<ul class="navbar-nav me-auto mb-2">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
				<form>
					<input class="form-control" type="text" placeholder="Search"
						aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
	
	<div class="container col-12 col-md-4 col-lg-4 col-xl-4 shadow p-3">
		<h3 class="card-title text-center">Inserir Carro</h3>
	
		<form action="ServletIPVA" method="post">
				<c:choose>
					<c:when test="${ veiculo == null }">
					
						<div class=mb-3>
							<label class="form-label">MODELO</label>
							<input type="text" class="form-control" name="modelo" required/>
						</div>
					
						<div class=mb-3>
							<label class="form-label">ANO</label>
							<input type="text" class="form-control" name="ano_veiculo" required/>
						</div>
						
						
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="submit" name="option" class="btn btn-primary flex-start" value="inserir">Salvar</button>
						</div>
						
					</c:when>
				
					<c:otherwise>
					
						<div class="mb-3">
							<input type="hidden" name="id_veiculo" value="${veiculo.id_veiculo}"/>
						</div>
						
						<div class=mb-3>
							<label class="form-label">MODELO</label>
							<input type="text" class="form-control" name="modelo" value="${veiculo.modelo}"/>
						</div>
						
						<div class="mb-3">
							<label class="form-label">ANO</label>
							<input type="number" class="form-control" name="ano_veiculo" value="${veiculo.ano_veiculo}"/>
						</div>
						
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="submit" name="option" class="btn btn-primary flex-start" value="atualizar">Atualizar</button>
						</div>
						
					</c:otherwise>
				
				</c:choose>
		</form>
	</div>


</body>
</html>