<%-- 
    Document   : index
    Created on : 1/06/2020, 01:40:35 AM
    Author     : roberto
--%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con;
            Conexion cn = new Conexion();
            PreparedStatement ps;
            ResultSet rs;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="container"> 
                    <nav class="navbar navbar-light bg-dark"> 
                        <a class="navbar-brand" style="color: yellow">Clientes y productos</a> 
                        <form class="form-inline" action="logout.jsp"> 
                            <a href="datosUsuario.jsp" type="submit" style="color: lightskyblue"><i class="fa fa-user-circle" aria-hidden="true" style="color: lightskyblue"></i> <%= sesion.getAttribute("user")%></a> 
                            <button class="btn btn-outline-danger my-2 my-sm-0 ml-2">Log out</button> 
                        </form> 
                    </nav> 
                    <div class="row mt-2"> 

                        <div class="col-sm">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col" colspan="6" class="text-center"><h3>Usuarios</h3></th>
                                <th scope="col" >
                                    <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>

                                </tr>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Appat</th>
                                    <th scope="col">Direccion</th>
                                    <th scope="col">Correo</th>
                                    <th scope="col">Usuario</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <%
                                        try {
                                            con = cn.getConnection();
                                            ps = con.prepareStatement("SELECT * FROM `cliente`;");
                                            rs = ps.executeQuery();
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <th scope="row"><%= rs.getString(1)%></th>
                                        <td><%= rs.getString(2)%></td>
                                        <td><%= rs.getString(3)%></td>
                                        <td><%= rs.getString(4)%></td>
                                        <td><%= rs.getString(5)%></td>
                                        <td><%= rs.getString(6)%></td>
                                        <td>
                                            <a href="editar.jsp?id_cli=<%= rs.getString(1)%>&nombre_cli=<%= rs.getString(2)%>&id direc_e=<%= rs.getString(3)%>&usuario=<%= rs.getString(4)%>&correo_cli=<%= rs.getString(5)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                            <a href="borrar.jsp?id_cli=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>                                    
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.print("error mysql " + e);
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                </body>
                </html>
