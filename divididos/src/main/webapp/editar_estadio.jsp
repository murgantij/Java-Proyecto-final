<%@page import="com.divididos.dto.Provincia"%>
<%@page import="java.util.List"%>
<%@page import="com.divididos.dto.Estadio"%>
<html>
    <head>
            <%@include file="head.jsp" %>
             <title>
          Editar Estadio
        </title>
    </head>

    <body>
        <main>
            <!-- ACA VA EL NAVBAR  -->
            <%@include file="cabecera.jsp" %>
            <div class="container">
                <section>
                    <% 
                        Estadio estadio = (Estadio)request.getAttribute("estadio");
                    %>
                     <section class="bg-secondary-subtle border rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center"><section>
                        <h2 class="my-4">Editar Estadio</h2><br><br>
                    <!--  JSP -->
                     <form method="POST" id="form_alta" action="" destinoOK="<%=request.getContextPath()%>/api/EditarEstadioController" destinoER="<%=request.getContextPath()%>/api/EditarEstadioController?id=<%=estadio.getIdEstadio()%>">
                   
                    
                                        
                        
                        <% 
                            List<Provincia> listaProvincias = (List<Provincia>)request.getAttribute("provincias");
                        %>
                              
                        <div class="mb-3">
                          <label for="idEstadio" class="form-label">Id</label>
                              <input name="idEstadio"
                                    readonly="readonly"
                                        value="<%=estadio.getIdEstadio()%>" 
                                    type="hidden" class="form-control" id="idEstadio" maxlength="7">
                        </div>
                                   
                        <div class="my-3 mx-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input value="<%=estadio.getNombre()%>" name="nombre" type="text" class="form-control" id="nombre" placeholder="Nombre" maxlength="50">
                        </div>            
                     
                                    
                        <div class="my-3 mx-3">
                            <label for="calle" class="form-label">Calle</label>
                            <input value="<%=estadio.getCalle()%>" name="calle" type="text" class="form-control" id="calle" placeholder="Calle" maxlength="50">
                        </div>            
                        
                        
                        <div class="my-3 mx-3">
                            <label for="numero" class="form-label">Numero</label>
                            <input value="<%=estadio.getNumero()%>" name="numero" type="text" class="form-control" id="numero" placeholder="Numero" maxlength="50">
                        </div>            
                       
                        <div class="my-3 mx-3">
                                              
                        <label for="provincia" class="form-label">Provincia</label>
                            <select name="provincia" class="form-select form-control" id="provincia" placeholder="Provincia" maxlength="50">
                            <%
                            String selected = "";
                             for( Provincia  unaProvincia : listaProvincias) {
                             if (unaProvincia.getIdProvincia() == estadio.getProvincia().getIdProvincia()){
                                selected = "selected";
                             }else
                                selected = "";
                            %>
                            
                            <option value="<%=unaProvincia.getIdProvincia()%>" <%=selected%>><%=unaProvincia.getNombre()%></option>
                            <%
                               }
                            %>
                            </select>
                           </div>
                        
                            
                            <button class="btn btn-primary" onclick="validarEstadio();">
                            
                                Grabar
                            </button>
                            <button class="btn btn-danger" href="<%=request.getContextPath()%>/api/EstadiosController">
                                Cancelar
                            </button>
                    </form>
                </section>
            </div>
        </main>
                                <%@include file="footer.jsp" %>
    </body>	
</html>