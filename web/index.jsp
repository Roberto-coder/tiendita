
<%@page import="controlador.Controlador"%>
<%@page import="config.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<!DOCTYPE html>


<html>
    <head>
        <title>Doomshop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
                            <ul class="submenu">
                                <li><a href="categoria1.jsp">Boss</a></li>
                                <li><a href="categoria1.jsp">Humano</a></li>
                                <li><a href="categoria1.jsp">Demonio</a></li>
                                <li><a href="categoria1.jsp">Secreto</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav> 
                <div>
                    <form id="sesion" action="registrarse.jsp">
                        <a href="login.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i> Inicia Sesion</a>
                        <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Registrate</button>
                    </form>
                </div>
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
                        <a class="nav-link" href="Controlador?accion=Carrito" style="color: ghostwhite"><i class="fas fa-shopping-cart">(<label style="color: lavenderblush">${contador}</label>)</i>Carrito</a>
                    </th>
                    <th>
                        
                    </th>
                </tr>

            </table>  

            <section id="slide">
                <img src="img/oferta.png" width="900" height="250">
            </section> 
            
            <section id = "categorias">
                <section class="uno">
                    <h2>Boss</h2>
                    <p>
                        descipcion
                    </p>
                    <a href="Categ_1.jsp" class="leer-mas">Ver mas</a><br>
                </section>

                <section class="uno dos">
                    <h2>Armas</h2>
                    <p>
                        descipcion
                    </p>
                    <a href="" class="leer-mas">Ver mas</a><br>
                </section>

                <section class="uno">
                    <h2>Mounstros</h2>
                    <p>
                        descipcion
                    </p>
                    <a href="" class="leer-mas">Ver mas</a><br>
                </section><!--/categorias-->
            </section>
            
            <div class="container mt-2">
                <div class="row">
                    <c:forEach var="p" items="${productos}">
                        <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header">
                                    <label>${p.getNombres()}</label>
                                </div>
                                <div class="card-body">
                                    <i>$.${p.getPrecio()}</i>
                                    <img src="${p.getFoto()}" width="200" height="100">
                                </div>
                                <div class="card-footer text-center">
                                    <label>${p.getDescripcion()}</label>
                                    <div>
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
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class=" btn btn-outline-info">Agregar al carrito</a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" name="agregar" class=" btn btn-danger">Adquirir</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </body>
</html>
