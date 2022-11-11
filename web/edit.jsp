<%-- 
    Document   : edit
    Created on : Nov 11, 2022, 12:26:43 PM
    Author     : jdara
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Alumno</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        
        
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                min-height: 100vh;
                background-image: url("img/fondo2.jpg");
                background-size: 100%;
                background-position: center center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
        
        
        
        
    </head>
    <body>
        
         <%
            //conectando a base de datos
            Connection conexion=null;
            String url="jdbc:mysql://localhost:3306/universidad";//url de MySQL
            String usuario="root";// usuario de mysql local
            String clave="12345"; 
           
            
             Class.forName("com.mysql.jdbc.Driver");
             conexion=DriverManager.getConnection( url, usuario,clave);
             
             //listado de la tabla pero de la fila seleccionada
             
             PreparedStatement ps;
             ResultSet rs;
             
             int id=Integer.parseInt(request.getParameter("id")); 
             
             ps=conexion.prepareStatement("select * from alumno where numero_carne="+id);
             rs=ps.executeQuery();
             
             
             while(rs.next()){
          
            %>
        
     <div class="container-sm ">              
            <div class="shadow-lg p-3 bg-white rounded">
        <form method="POST" id="form" name="form" action="" >
             <div class="for m-group">                       
                        <img src="https://cdn-icons-png.flaticon.com/512/3077/3077421.png" class="rounded mx-auto d-block" width="100" alt="...">
                        <h2 class="display-8 text-center my-4"> MODIFICAR REGISTRO ALUMNO</h2>
                       
            
        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="codigo">Código</label>
                                    <input class="form-control" type="text" readonly="" value="<%= rs.getInt("numero_carne")%>"> 
                                    <input type="hidden" name="control" value="GUARDAR"> 
                                </div>
                                
                                
        </div>
                        
        <div class="form-group">
                            
                                <div class="col">
                                    <label for="nombre">Nombre</label>
                                    <input class="form-control" type="text" placeholder="Ingrese nombre" name="nombre"  value="<%= rs.getString("nombre")%>">
                                </div>
                                
                         
        </div>
                        
        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="correo">Correo</label>
                                    <input class="form-control" type="text" placeholder="Ingrese correo" name="correo"  value="<%= rs.getString("correo")%>">
                                </div>
                                 <div class="col">
                                    <label for="telefono">Telefono</label>
                                    <input class="form-control" type="text" placeholder="Ingrese telefono" name="telefono"  value="<%= rs.getInt("telefono")%>">
                                </div>
                            </div>
        </div>
           
                      
                         <select class="form-control" name="opcion" value="<%= rs.getInt("genero_idgenero")%>">
                <option value="1">Opción 1</option>
                <option value="2">Opción 2</option>
            </select>
                        
                       
                        
                                       
                        
                        
            <br>
            
            <input type="submit" value="Guardar" class="btn btn-primary "/>             
             <a class="btn btn-warning" href="home.jsp" style="float: right;">Atras</a>
            
             
        </div>
        </form>   
                <% } %>
        </div>
        
    
    
    </div>
            
            
            
        
    </body>
</html>
<%
        String nombre, correo, direccion, telefono, tipo;
        
       
        nombre=request.getParameter("nombre");
       
        correo=request.getParameter("correo");
        direccion=request.getParameter("direccion");      
        telefono=request.getParameter("telefono");
        tipo=request.getParameter("opcion");
        if(nombre!=null)
        {
        ps=conexion.prepareStatement("update alumno set nombre='"+nombre+"',correo='"+correo+"',direccion='"+direccion+"',telefono='"+telefono+"',genero_idgenero='"+tipo+"' where numero_carne="+id);
        
        ps.executeUpdate();
        response.sendRedirect("home.jsp");
        
        }
%>
