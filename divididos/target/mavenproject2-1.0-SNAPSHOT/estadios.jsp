<%@page import="java.util.List"%>
<%@page import="com.divididos.dto.Estadio"%>
<!DOCTYPE html>
<html lang="es-ar" data-bs-theme="light">
    <head>
        <%@include file="head.jsp" %>
        <title>
          Estadios
        </title>	
    </head>
	
    <body>
        <!-- ACA VA EL NAVBAR  -->
        <main>
            <div class="container">
                <%@include file="cabecera.jsp" %> 
                <section class="bg-secondary-subtle border rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center">
      <h2 class="my-4">Estadios</h2>
      <table class="table table-sm table-striped table-hover border border-success">
                      <thead>
                        <tr>
                          <th scope="col">ID</th>
                          <th scope="col">NOMBRE</th>
                          <th scope="col">DIRECCION</th>
                          <th scope="col">PROVINCIA</th>
                          <th scope="col"><a class="btn btn-success" href="<%=request.getContextPath()%>/alta_estadio.jsp" role="button">Nuevo Estadio</a></th>
                        </tr>
                      </thead>
          <% 
                //codigo java
                //obtener el listado desde el request
                //se guardo bajo el nombre de "listado"
            List<Estadio> listado = (List<Estadio>)request.getAttribute("estadio");
          %>
        <tbody>
            <%
                 for( Estadio  unEstadio : listado) {
            %>

             <tr>
                <th scope="row"> <%=unEstadio.getIdEstadio()%> </th>
                <td><%=unEstadio.getNombre() %></td>
                <td><%=unEstadio.getDireccion()%></td>
                <td><%=unEstadio.getProvincia().getNombre()%></td>
                <td>
                 <button onclick="borrarRegistro('<%=request.getContextPath()%>/api/EliminarEstadioController?id=<%=unEstadio.getIdEstadio()%>');" class="btn btn-danger" type="button" id="borrarRegistro" >Eliminar</button> |
                 <a class="btn btn-secondary" href="<%=request.getContextPath()%>/api/EditarEstadioController?id=<%=unEstadio.getIdEstadio()%>" role="button">Editar</a>
                </td>
              </tr>
             <%
                  }
             %>

        </tbody>
      </table>
    </section>
                      
            </div>
        </main>
      
   <%@include file="footer.jsp" %>
    </body>	
</html>