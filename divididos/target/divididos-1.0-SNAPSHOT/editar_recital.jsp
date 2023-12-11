<%@page import="java.util.List"%>
<%@page import="com.divididos.dto.Recital"%>
<%@page import="com.divididos.dto.Estadio"%>
<html>
    <head>
            <%@include file="head.jsp" %>
             <title>
          Editar Recital
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
                 <% 
                        Recital recital = (Recital)request.getAttribute("recital");
                    %>
                    
                    <h2 class="my-4">Editar Recital</h2><br><br>
                    <!--  JSP -->
                 
                    <form method="POST" id="form_alta" action="" destinoOK="<%=request.getContextPath()%>/api/EditarRecitalController" destinoER="<%=request.getContextPath()%>/api/EditarRecitalController?id=<%=recital.getIdRecital()%>">
                    
                        
                       <% 
                            List<Estadio> listaEstadios = (List<Estadio>)request.getAttribute("estadios");
                        %>
                        
                         <div class="my-3 mx-3">
                                <table>
                                <tr>
                                    <td>
                                        <label for="idRecital" class="form-label">Id</label>
                                    </td>
                                    <td>
                                        <input value="<%=recital.getIdRecital()%>" name="idRecital" type="text" class="form-control" id="idRecital" placeholder="idRecital" maxlength="50">
                                     </td>
                                </tr>
                            </table> </div>
                        <div class="mb-3">
                            <table>
                                <tr>
                                    <td><label for="estadio" class="form-label">Estadio</label>
                            </td>
                                    <td><select name="estadio" class="form-select form-control" id="estadio" placeholder="Estadio" maxlength="50">
                           <%
                            String selected = "";
                             for( Estadio  unEstadio : listaEstadios) {
                                if (unEstadio.getIdEstadio() == recital.getEstadio().getIdEstadio()){
                                    selected = "selected";
                                }
                                else
                                {
                                    selected = "";
                                }
                            %>
                            <option value="<%=unEstadio.getIdEstadio()%>" <%=selected%>><%=unEstadio.getNombre()%></option>
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
                                            Integer yyyy;
                                            for( int i=2023  ; i <= 2050; i++){
                                            yyyy = i;
                                            
                                            if (recital.getFecha().toString().substring(0,4).equals(yyyy.toString())) {
                                                    selected = "selected";
                                                }
                                                else
                                                {
                                                    selected = "";
                                                }
                                        %>
                                            <option value="<%=i%>"  <%=selected%>><%=i%></option>
                                        <%
                                            }
                                        %>
                                        </select>
                                    </td><td>&nbsp;</td>
                                    <td>
                                        <select name="mm" class="form-select form-control" id="mm" placeholder="mm">
                                        <%
                                            Integer mm;
                                            for( int i=1  ; i <= 9; i++){
                                            mm =i;
                                            if (recital.getFecha().toString().substring(5,7).equals("0"+mm.toString())) {
                                                 selected = "selected";
                                            }
                                            else
                                            {
                                                selected = "";
                                            }
                                        %>
                                            <option value="0<%=i%>" <%=selected%>>0<%=i%></option>
                                        <%
                                            }
                                            for( int i=10  ; i <= 12; i++){
                                            mm =i;
                                            if (recital.getFecha().toString().substring(5,7).equals(mm.toString())) {
                                                 selected = "selected";
                                            }
                                            else
                                            {
                                                selected = "";
                                            }
                                        %>
                                            <option value="<%=i%>" <%=selected%>><%=i%></option>
                                        <%
                                            }
                                        %>
                                        </select>
                                    </td><!-- comment -->
                                    <td>
                                        <select name="dd" class="form-select form-control" id="dd" placeholder="dd">
                                        <%
                                         Integer dd;
                                         for(int i=1 ; i<=9; i++){
                                            dd = i;
                                            if (recital.getFecha().toString().substring(8,10).equals("0"+dd.toString())) {
                                                selected = "selected";
                                            }
                                            else
                                            {
                                                selected = "";
                                            }
                                        %>
                                            <option value="0<%=i%>" <%=selected%>>0<%=i%></option>
                                        <%
                                            }
                                        for(int i=10 ; i<=31; i++){
                                            dd = i;
                                            if (recital.getFecha().toString().substring(8,10).equals(dd.toString())) {
                                           
                                                selected = "selected";
                                            }
                                            else
                                            {
                                                selected = "";
                                            }
                                        %>
                                            <option value="<%=i%>" <%=selected%>><%=i%></option>
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
                                        Integer hh;    
                                        String entera ="";
                                        String media ="";
                                        for(int i=23 ; i>=10; i--){
                                            hh=i;
                                            entera = "";
                                            media  = "";
                                            if (recital.getFecha().toString().substring(11,16).equals(hh.toString()+":00")) {
                                                entera = "selected";
                                                media  = "";
                                            }
                                            if (recital.getFecha().toString().substring(11,16).equals(hh.toString()+":30")) {
                                                entera = "";
                                                media  = "selected";
                                            }
                                            %>
                                            <option value="<%=i%>:30" <%=media%>><%=i%>:30</option>
                                            <option value="<%=i%>:00" <%=entera%>><%=i%>:00</option>
                                        <%
                                         }
                                         for(int i=9 ; i>=0; i--){
                                            hh=i;
                                            entera = "";
                                            media  = "";
                                            if (recital.getFecha().toString().substring(11,16).equals("0"+hh.toString()+":00")) {
                                                entera = "selected";
                                                media  = "";
                                            }
                                            if (recital.getFecha().toString().substring(11,16).equals("0"+hh.toString()+":30")) {
                                                entera = "";
                                                media  = "selected";
                                            }
                                        %>
                                            <option value="0<%=i%>:30" <%=media%>>0<%=i%>:30</option>
                                            <option value="0<%=i%>:00" <%=entera%>>0<%=i%>:00</option>
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
                                        <input value="<%=recital.getPrecio()%>" name="precio" type="text" class="form-control" id="precio" placeholder="Precio" maxlength="50">
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