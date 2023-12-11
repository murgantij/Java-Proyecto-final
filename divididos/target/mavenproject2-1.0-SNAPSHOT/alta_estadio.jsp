<%@page import="java.util.List"%>
<%@page import="com.divididos.dto.Estadio"%>
<%@page import="com.divididos.dto.Provincia"%>
<%@page import="com.divididos.daos.ProvinciaDAO"%>
<html>
    <head>
            <%@include file="head.jsp" %>
             <title>
          Crear Estadio
        </title>
    </head>

    <body>
        <main>
            <!-- ACA VA EL NAVBAR  -->
            <%@include file="cabecera.jsp" %>
            <div class="container">
                <section class="bg-secondary-subtle border rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center"><section>
                        <h2 class="my-4">Nuevo Estadio</h2><br><br>
                    <!--  JSP -->
                   
                     <form method="POST" id="form_alta" action="" destinoOK="<%=request.getContextPath()%>/api/CrearEstadioController" destinoER="">
                   
                    
                              
                        <div class="my-3 mx-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input value="" name="nombre" type="text" class="form-control" id="nombre" placeholder="Ingrese el Nombre" maxlength="50">
                            </div>
                        <div class="my-3 mx-3">
                                <label for="calle" class="form-label">Calle</label>
                                <input value="" name="calle" type="text" class="form-control" id="calle" placeholder="Ingrese la Calle" maxlength="50">
                        </div>
                        
                        <div class="my-3 mx-3">
                                <label for="numero" class="form-label">Numero</label>
                                <input value="" name="numero" type="text" class="form-control" id="numero" placeholder="Ingrese el Numero" maxlength="50">
                        </div>
                        
                        <div class="mb-3">
                            <label for="provincia" class="form-label">Provincia</label>
                            <select name="provincia" class="form-select form-control" id="provincia" placeholder="Provincia" maxlength="50">
                            <%
                             
                            ProvinciaDAO provinciaDao = new ProvinciaDAO();
                            List<Provincia> listaProvincias = provinciaDao.listarProvincias();
                        
                            String selected = "";
                             for( Provincia  unProvincia : listaProvincias) {
                             
                            %>
                            
                            <option value="<%=unProvincia.getIdProvincia()%>"><%=unProvincia.getNombre()%></option>
                            <%
                               }
                            %>
                            </select>
                       </div>
                            
                            <button class="btn btn-primary" onclick="validarEstadio();">
                               Grabar
                            </button>
                            |
                            <a class="btn btn-danger" href="<%=request.getContextPath()%>/api/EstadiosController">Cancelar</a>
                    </form>
                </section>
            </div>
        </main>
       <%@include file="footer.jsp" %>
    </body>	
</html>