<%@page import="java.util.List"%>
<%@page import="com.divididos.dto.Recital"%>
<!DOCTYPE html>
<html lang="es-ar" data-bs-theme="light">
    <head>
        <%@include file="head.jsp" %>
        <title>
          Recitales
        </title>	
    </head>
	
    <body>
        <!-- ACA VA EL NAVBAR  -->
        <main>
            <div class="container">
                <%@include file="cabecera.jsp" %> 
                <section class="bg-secondary-subtle border rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center">
      <h2 class="my-4">Recitales</h2>
      <table class="table table-sm table-striped table-hover border border-success">
                      <thead>
                        <tr>
                          <th scope="col">ID</th>
                          <th scope="col">LUGAR</th>
                          <th scope="col">FECHA</th>
                          <th scope="col">PRECIO</th>
                          <th scope="col">DIRECCION</th>
                          <th scope="col">PROVINCIA</th>
                          <th scope="col"><a class="btn btn-success" href="<%=request.getContextPath()%>/alta_recital.jsp" role="button">Nuevo Recital</a></th>
                        </tr>
                      </thead>
          <% 
                //codigo java
                //obtener el listado desde el request
                //se guardo bajo el nombre de "listado"
            List<Recital> listado = (List<Recital>)request.getAttribute("recital");
          %>
        <tbody>
            <%
                 for( Recital  unRecital : listado) {
            %>

             <tr>
                <th scope="row"> <%=unRecital.getIdRecital()%> </th>
                <td><%=unRecital.getEstadio().getNombre() %></td>
                <td><%=unRecital.getFecha() %></td>
                <td><%=unRecital.getPrecio() %></td>
                <td><%=unRecital.getEstadio().getDireccion()%></td>
                <td><%=unRecital.getEstadio().getProvincia().getNombre()%></td>
                <td>
                    <button onclick="borrarRegistro('<%=request.getContextPath()%>/api/EliminarRecitalController?id=<%=unRecital.getIdRecital()%>');" class="btn btn-danger" type="button" id="borrarRegistro" >Eliminar</button> |
                    
                  <a class="btn btn-secondary" href="<%=request.getContextPath()%>/api/EditarRecitalController?id=<%=unRecital.getIdRecital()%>" role="button">Editar</a>
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