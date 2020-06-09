
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/v5.8.2/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/funciones.js" type="text/javascript"></script>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            HttpSession sesion = request.getSession();
             if(sesion.getAttribute("logueado")==null ||  sesion.getAttribute("logueado").equals("0")){
            response.sendRedirect("login.jsp");
            }
            Connection con;
            Conexion cn=new Conexion();
            PreparedStatement ps;
            ResultSet rs;
        %>
        <div id="principal">
            <header>
                <div id="logo">
                    <img src="doom.jpg">
                </div>

                <nav id="navegacion">
                    <ul class="menu">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="#">Nosotros</a></li>
                        <li><a href="Controlador?accion=home">Productos</a>
                            <%--<ul class="submenu">
                                <li><a href="categoria1.jsp">Boss</a></li>
                                <li><a href="categoria1.jsp">Humano</a></li>
                                <li><a href="categoria1.jsp">Demonio</a></li>
                                <li><a href="categoria1.jsp">Secreto</a></li>
                            </ul>--%>
                        </li>
                    </ul>
                </nav> 
                <form class="form-inline" action="logout.jsp"> 
                            <a href="datosUsuario.jsp" type="submit" style="color: lightskyblue"><i class="fa fa-user-circle" aria-hidden="true" style="color: lightskyblue"></i> <%= sesion.getAttribute("user")%></a> 
                            <button class="btn btn-outline-danger my-2 my-sm-0 ml-2">Log out</button> 
                </form>
            </header>
            <table>   
                <tr>
                    <th scope="col" class="text-center">
                        <input type="text" name="nombre" class="form-control" placeholder="Buscar por nombre"/>
                    </th>
                    <th scope="col" class="text-center">
                        <input type="submit" value="Buscar" name="buscar" class="form-control btn btn-primary" />
                    </th>
                    <th>

                    </th>
                    <th>
                        <a class="nav-link" href="Controlador?accion=home">(<label style="color: lavenderblush">${contador}</label>)<i class="bi bi-cart"></i>Seguir comprando</a>
                    </th>
                    <th>

                    </th>
                </tr>
            </table>  
                    <div class="container mt-4">
                        <h3>Carrito</h3>
                        <br>
                        <div class="row">
                            <div class="col-sm-8">
                                <table class="table table-hover" style="color: oldlace">
                                    <thead>
                                        <tr>
                                            <th>ITEM</th>
                                            <th>NOMBRES</th>
                                            <th>DESCRIPCION</th>
                                            <th>PRECIO</th>
                                            <th>CANTIDAD</th>
                                            <th>SUBTOTAL</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="car" items="${carrito}">
                                        <tr>
                                            <td>${car.getItem()}</td>
                                            <td>${car.getNombres()}</td>
                                            <td>${car.getDescripcion()}
                                                <img src="${car.getFoto()}" width="100" height="100">
                                            </td>
                                            <td>${car.getPrecioCompra()}</td>
                                            <td>
                                                <input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1">
                                            </td>
                                            
                                            <td>${car.getSubTotal()}</td>
                                            <td>
                                                <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                                <a href="Controlador?accion=Delete&idp=${car.getIdProducto()} " id="btnDelete">eliminar</a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Generar Compra</h3>
                                    </div>
                                    <div class="card-body">
                                        <label>Subtotal:</label>
                                        <input type="text" value="$.${totalPagar}0" readonly="" class="form-control">
                                        <label>Descuento:</label>
                                        <input type="text" value="$0.00" readonly="" class="form-control">
                                        <label>Total:</label>
                                        <input type="text" value="${totalPagar}" readonly="" class="form-control">
                                    </div>
                                    <div class="card-footer">
                                        <a href="#" class="btn btn-info btn btn-block">Pagar</a>
                                        <a href="Controlador?accion=GenerarCompra" class="btn btn-danger btn btn-block">Generar Compra</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script> 
        </body>
</html>
