<!DOCTYPE html>
<html lang="es-ar" data-bs-theme="light">
	<head>
            <%@include file="head.jsp" %>
            <title>Inicio</title>
	</head>
	
	<body>
            <!-- ACA VA EL NAVBAR  -->
            		
            <main class="border border-primary rounded-4 text-center">
               <main>
            <div class="container">
               <%@include file="cabecera.jsp" %> 
            </div>
            
            <div class="container-fluid text-center">

                <div class="row">
                    <h2 id="Integrantes">Integrantes</h2>
                </div>
                <div class="card-group">
                    <div class="card">
                        <img src="assets/img/integrantes/mollo.jpg" class="card-img-top" alt="Ricardo Mollo">
                        <div class="card-body">
                            <h5 class="card-title">Ricardo Mollo</h5>
                            <p class="card-text">Voz y guitarra (1988 - presente)</p>
                            <p class="card-text"><small class="text-body-secondary">considerado uno de los mejores músicos y compositores del rock argentino. Se destaca también por sus virtuosismo con la guitarra</small></p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="assets/img/integrantes/arnedo.jpg" class="card-img-top" alt="Diego Arnedo">
                        <div class="card-body">
                            <h5 class="card-title">Diego Arnedo</h5>
                            <p class="card-text">Bajo (1988 - presente)</p>
                            <p class="card-text"><small class="text-body-secondary">En el año 2006, fue declarado mejor bajista nacional de los últimos veinte años por la edición de los Rock & Pop Awards.</small></p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="assets/img/integrantes/catriel.jpg" class="card-img-top" alt="Catriel Ciavarella">
                        <div class="card-body">
                            <h5 class="card-title">Catriel Ciavarella</h5>
                            <p class="card-text">Bateria (2004 - presente)</p>
                            <p class="card-text"><small class="text-body-secondary">Desde el 2004 se convirtió en el baterista de Divididos, aunque cuando tenía tan sólo 14 años, Ricardo Mollo intentó sumarlo , sin éxito.</small></p>
                        </div>
                    </div>
                </div>
            </div>  
            <br>
            <div class="separador"></div>
            <br>    
            <div class="container text-center">
                <div class="row">
                    <h2 id="Discos">Discos</h2>
                </div>
                <div class="row">
                    <div class="offset-md-3 col-6">
                        <div id="carouselDiscos" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="assets/img/carrousel/40_dibujos.jpg" class="d-block w-100" alt="40 Dibujos">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/acariciando_lo_aspero.jpg" class="d-block  w-100" alt="Acariciando lo aspero">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/la_era_de_la_boludez.jpg" class="d-block  w-100" alt="La era de la boludez">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/otro_le_travaladna.jpg" class="d-block  w-100" alt="Otro le travaladna">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/gol_de_mujer.jpg" class="d-block  w-100" alt="Gol de mujer">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/narigon_del_siglo.jpg" class="d-block  w-100" alt="Narigon del siglo">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/vengo_del_placard_de_otro.jpg" class="d-block  w-100" alt="Vengo del placard de otro">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/amapola_del_66.jpg" class="d-block  w-100" alt="Amapola del 66">
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/img/carrousel/haciendo_cosas_raras.jpg" class="d-block  w-100" alt="Haciendo cosas raras">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselDiscos" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselDiscos" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="separador"></div>
            <br>  
           
            <div class="container text-center">
                <div class="row mb-5">
                    <h2 id="Historia">Historia</h2>
                </div>
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="assets/img/sumo.jpg" class="img-fluid rounded-start" alt="Sumo">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">SUMO</h5>
                                <p class="card-text"><small class="text-body-secondary">Tras la disolución de Sumo debido a la muerte de su líder Luca Prodan, el 22 de diciembre de 1987, el resto de sus integrantes Ricardo Mollo, Diego Arnedo, Roberto Pettinato, Alberto "Superman" Troglio y Germán Daffunchio deciden reflexionar acerca del futuro de la banda. Daffunchio y Timmy Mackern (productor de Sumo y amigo de Luca) vuelven a las sierras cordobesas y el resto de la banda se queda ensayando en una sala de El Palomar. El 5 de marzo de 1988, Sumo se presenta en el Chateau Rock, con Daffunchio, Mollo, Pettinato, Arnedo y Troglio</small></p>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="separador"></div>
                <br>
           
       </main>
            <%@include file="footer.jsp" %>
	</body>	
</html>