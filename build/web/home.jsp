
<%@page import="Clases.ConexionBaseDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
          <head>
              
               <title>App Web</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/script.js"></script>
              
          </head>
          
          
          <body>
              
              
              <header>
         

   

<div class="user-wrapper">
    <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" width="60px" height="60px" alt="">
<div><h4>Josue Arango</h4>
<small>Admin</small></div>
</div>            
                  
                  <div>
                      <a href="Logout" class="btn btn-danger">Cerrar sesion</a>
                  </div>
                  
    </header>
              
              
              
                   
                    <%
                              ConexionBaseDeDatos conn = new ConexionBaseDeDatos();
                              Statement smt;
                              ResultSet rs;
                              smt = conn.conectar().createStatement();
                              rs = smt.executeQuery("SELECT * FROM universidad.alumno");
                    %>
                    
                    
                    
                    <div  id="modal">
   <form class="form-register"   method="POST"  id="form" name="form" action="NewServlet2" >
               <h1>Añadir nuevo alumno aqui</h1>
            <div class="form-group">
                <label for="exampleInputName">Codigo</label>
                <input class="form-control" type="text"  name="codigo" id="codigo" >
                <input type="hidden" name="control" value="GUARDAR">
            </div>
            <div class="form-group">
                <label for="exampleInputName">Nombre del alumno</label>
                <input class="form-control" type="text" name="nombre" id="nombre" >
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control"  aria-describedby="emailHelp" name="correo" id="correo"  >
         
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Direccion</label>
              <input type="text" class="form-control"  name="direccion" id="direccion"  >
            </div>
               
                <div class="form-group">
              <label for="exampleInputPassword1">Telefono</label>
              <input type="text" class="form-control"  name="telefono" id="direccion"  >
            </div>
            
            <select class="form-control" name="opcion">
                <option value="1">Opción 1</option>
                <option value="2">Opción 2</option>
            </select><br>
            <input type="button" value="Enviar Formulario" onclick="enviarFormularioOpcion2();" class="btn btn-info" id="btn3">
            <button class="btn btn-danger" id="btn-cerrar-modal">Cerrar ventana</button>
                
                
            
        </form>   
        </div>
                    
                     
                    
                    
                     <div class="container mx-auto">
                              <div class="container my-5">
                                        <center><h1 class="">Formulario de alumnos</h1></center>
                              </div>
                              <div class="d-flex justify-content-between mx-5 my-4">
                                        <form class="d-flex" role="search">
                                       <input  class="btn btn-success" type="submit" value="Mostrar todos los alumnos">
                                        </form>
                                       
                                       <form class="d-flex" role="search">
                                                  <input class="form-control me-2" type="text" name="txtSearch">
                                                  <input class="btn btn-warning" type="submit" value="Buscar">

                                        </form>
                                        <%
                                                  String nameSearch = request.getParameter("txtSearch");
                                                  if (nameSearch != null) {
                                                            smt = conn.conectar().createStatement();
                                                            rs = smt.executeQuery("SELECT * FROM universidad.alumno WHERE nombre LIKE" + " '%" + nameSearch + "%' ");
                                                  } else {
                                                            System.err.print("Error");
                                                  }
                                        %>
                              </div>
                              
                              <script>
                                            
                                            
                                           const btnAbrirModal =
                                                   document.querySelector("#btn-abrir-modal");
                                           const btnCerrarModal =
                                                   document.querySelector("#btn-cerrar-modal");
                                           const modal =
                                                   document.querySelector("#modal");
                                           
                                           btnAbrirModal.addEventListener("click",()=>{
                                           modal.showModal();
                                           });
                                           
                                           btnCerrarModal.addEventListener("click",()=>{
                                           modal.close();
                                           });
                                            
                                        </script>
                                        
                              <c:if test="${error ==1}">
                                        <div class="alert alert-danger" id="error">${message}</div>
                              </c:if>
                              <div class="table-responsive mx-4 my-4">
                                        <table class="table table-hover table-dark">
                                            <thead>
                                                  <tr>
                                                            <th scope="col">Carne</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Correo</th>
                                                            <th scope="col">Telefono</th>
                                                            <th scope="col">Direccion</th>
                                                            <th scope="col">Tipo</th>
                                                            <th scope="col">Acciones</th>
                                                  </tr>
                                                  <%
                                                            while (rs.next()) {
                                                  %>
                                                  <tr>
                                                            <td><%= rs.getString("numero_carne")%></td>
                                                            <td><%= rs.getString("nombre")%></td>
                                                            <td><%= rs.getString("correo")%></td>
                                                            <td><%= rs.getString("telefono")%></td>
                                                            <td><%= rs.getString("direccion")%></td>
                                                            <td><%= rs.getString("genero_idgenero")%></td>
                                                            <td>
                                                                      <a href="edit.jsp?id=<%= rs.getInt("numero_carne")%>" class="btn btn-outline-light">Editar</a>
                                                                      <a href="delete.jsp?id=<%= rs.getInt("numero_carne")%>" class="btn btn-danger">Eliminar</a>
                                                                      
                                                                   
                                                                      
                                                                      
                                                            </td>
                                            <a href="delete.jsp"></a>
                                                  </tr>
                                                  <%}%>
                                            </thead>
                                                  <tbody id="bodyTable">

                    </tbody>  
                                        </table>
                              </div>
                    </div>
                                        
                                       
          </body>
</html>