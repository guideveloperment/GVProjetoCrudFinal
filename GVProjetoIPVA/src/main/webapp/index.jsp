<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>


    <nav class="navbar navbar-dark bg-success" aria-label="First navbar example">
        <div class="container-fluid">
        	<div class="col-4 col-md-4 col-xl-4">
        
            <a class="navbar-brand" href="./index.jsp">Carros</a>
        	</div>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01"
                aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample01">
                <ul class="navbar-nav me-auto mb-2">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Disabled</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown"
                            aria-expanded="false">Dropdown</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form>
                    <input class="form-control" type="text" placeholder="Search" aria-label="Search">
                </form>
            </div>
        </div>
    </nav>
  
   
    <div class="col-10 col-md-10 col-lg-10 container mt-3">
        <h3 class="card-title text-center">LISTA DE VEICULOS</h3>
        <hr>
        

            <div class="d-grid gap-2 d-md-block p-2">
                <form action="ServletIPVA" method="post">
                    <button class="btn btn-success mb-3" type="submit" name="option" value="inserirFormulario">ADICIONAR VEICULO</button>
                </form>
            </div>


			<table class="table table-bordered" >
			<thead>
				<tr>
					<th>ID</th>
					<th>MODELO</th>
					<th>ANO</th>
					<th>ACOES</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="veiculo" items="${listarCarros}">
					<tr>
						<form action="ServletIPVA" method="post">
						
							<td>
								<c:out value="${veiculo.id_veiculo}"/>
								<input type="hidden" name="id_veiculo" value="${veiculo.id_veiculo}"/>
							</td>
							
							<td>
								<c:out value="${veiculo.modelo}"/>
							</td>
							
							<td>
								<c:out value="${veiculo.ano_veiculo}"/>
							</td>
							
							<td>
								<button class="btn btn-primary" type="submit" name="option" value="deletar">Deletar</button>
								<button class="btn btn-primary" type="submit" name="option" value="atualizarFomulario">Atualizar</button>
							</td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			

</body>
</html>