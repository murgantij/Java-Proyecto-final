<%@page import="java.util.List"%>
<%@page import="com.divididos.dto.Recital"%>
<%@page import="com.divididos.dto.Estadio"%>
<%@page import="com.divididos.daos.EstadioDAO"%>
<html>
    <head>
            <%@include file="head.jsp" %>	
             <title>
          Crear Recital
        </title>
    </head>

    <body>
        <main>
            <!-- ACA VA EL NAVBAR  -->
            <%@include file="cabecera.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col"></div> 
                    <div class="col-5">
                <section class="bg-secondary-subtle border rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center"><section>
                        <h2 class="my-4">Nuevo Recital</h2><br><br>
                    <!--  JSP -->
                 
                    <form method="POST" id="form_alta" action="" destinoOK="<%=request.getContextPath()%>/api/CrearRecitalController" destinoER="">
                    
                        
                        <% 
                            EstadioDAO estadioDao = new EstadioDAO();
                            List<Estadio> listaEstadios = estadioDao.listarEstadios();
                        %>
                              
                        <div class="mb-3">
                            <table>
                                <tr>
                                    <td><label for="estadio" class="form-label">Estadio</label>
                            </td>
                                    <td><select name="estadio" class="form-select form-control" id="estadio" placeholder="Estadio" maxlength="50">
                            <%
                            String selected = "";
                             for( Estadio  unEstadio : listaEstadios) {
                             
                            %>
                            
                            <option value="<%=unEstadio.getIdEstadio()%>"><%=unEstadio.getNombre()%></option>
                            <%
                               }
                            %>
                            </select>
                            </td>
                                </tr>
                            </table>
                           </div>
                        
                            <div class="mb-3">
                            <table>
                                <tr>
                                    <td>
                                        <label for="estadio" class="form-label">Fecha</label>
                                    </td>
                                    <td>
                                        <select name="yyyy" class="form-select form-control" id="yyyy" placeholder="yyyy">
                                        <%
                                            for( int i=2023  ; i <= 2050; i++){
                                        %>
                                            <option value="<%=i%>"><%=i%></option>
                                        <%
                                            }
                                        %>
                                        </select>
                                    </td><td>&nbsp;</td>
                                    <td>
                                        <select name="mm" class="form-select form-control" id="mm" placeholder="mm">
                                        <%
                                            for( int i=1  ; i <= 9; i++){
                                        %>
                                            <option value="0<%=i%>">0<%=i%></option>
                                        <%
                                            }
                                            for( int i=10  ; i <= 12; i++){
                                        %>
                                            <option value="<%=i%>"><%=i%></option>
                                        <%
                                            }
                                        %>
                                        </select>
                                    </td><!-- comment -->
                                    <td>
                                        <select name="dd" class="form-select form-control" id="dd" placeholder="dd">
                                        <%
                                        for(int i=1 ; i<=9; i++){
                                        %>
                                            <option value="0<%=i%>">0<%=i%></option>
                                        <%
                                            }
                                        for(int i=10 ; i<=31; i++){
                                        %>
                                            <option value="<%=i%>"><%=i%></option>
                                        <%
                                            }
                                        %>
                                        </select>
                                    </td>
                                      <td>
                                        <label for="estadio" class="form-label">Hora</label>
                                    </td>
                                    <td>
                                         <select name="dd" class="form-select form-control" id="hh" placeholder="hh">
                                        <%
                                        for(int i=23 ; i>=10; i--){
                                        %>
                                            <option value="<%=i%>:30"><%=i%>:30</option>
                                            <option value="<%=i%>:00"><%=i%>:00</option>
                                        <%
                                            }
                                        for(int i=9 ; i>=0; i--){
                                        %>
                                            <option value="0<%=i%>:30">0<%=i%>:30</option>
                                            <option value="0<%=i%>:00">0<%=i%>:00</option>
                                        <%
                                            }
                                        %>            
                                        
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            </div>
                            
                            
                            <div class="mb-3">
                              <input name="fecha"
                                    value="" 
                                    type="hidden" class="form-control" id="fecha">
                            </div>
                            <div class="my-3 mx-3">
                                <table>
                                <tr>
                                    <td>
                                        <label for="precio" class="form-label">Precio</label>
                                    </td>
                                    <td>
                                        <input value="0.00" name="precio" type="text" class="form-control" id="precio" placeholder="Precio" maxlength="50">
                                     </td>
                                </tr>
                            </table> </div>
                            
                            <button class="btn btn-primary" onclick="validarRecital();">
                                Grabar
                            </button> |
                            <a class="btn btn-danger" href="<%=request.getContextPath()%>/api/RecitalesController">Cancelar</a>
                  
                    </form>
                                </section>
                    </div><!-- comment -->
                     <div class="col"></div>
                </div><!-- comment -->
                
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>	
</html>