<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>빌딩숲</title>
<%@ include file="/WEB-INF/views/admininclude/adminasset.jsp"%>
<head>
<style>
</style>
</head>
<!-- template.jsp > index.jsp -->
<%@ include file="/WEB-INF/views/admininclude/header.jsp"%>

<div class="container-fluid">
	<h3>서비스 이용 관리</h3>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="https://laravel.pixelstrap.com/viho/dashboard">빌딩이름</a></li>
	</ol>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-header">
						<h5>서비스 관리</h5>
						<span>내용</span>
					</div>
					<div class="table-responsive">
						<table class="table table-xl">
							<thead>
								<tr>
									<th>#</th>
									<th>유저</th>
									<th>Last Name</th>
									<th>Username</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Larry</td>
									<td>the Bird</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/admininclude/footer.jsp"%>
<script>
	
</script>
</body>
</html>