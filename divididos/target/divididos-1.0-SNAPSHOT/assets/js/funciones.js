function borrarRegistro(destino){
    if (confirm('Desea eliminar este registro?') === true) {
        window.location.href = destino ;
    }
}

function validarRecital(){
    const form_alta = document.getElementById("form_alta");
    let destinoOK = form_alta.getAttribute("destinoOK");
    let destinoER = form_alta.getAttribute("destinoER");
    let hayError = false;
    hayError = validarFecha();
    hayError = validarPrecio();    
    if (hayError){
        form_alta.setAttribute("action",destinoER);
    }
    else{
        form_alta.setAttribute("action",destinoOK);
    }
}

function validarFecha(){
    let hayError = false;
    const yyyy = document.getElementById("yyyy");
    const mm = document.getElementById("mm");
    const dd = document.getElementById("dd");
    const hh = document.getElementById("hh");
    const fecha = document.getElementById("fecha");
    let bisiesto = ( yyyy.value%4 === 0);
    let treinta =  (mm.value === 2 || mm.value === 4 || mm.value === 6 || mm.value === 9 || mm.value === 11);
    if (mm.value === '02'){
        if (dd.value > 28){
            if (bisiesto){
                if (dd.value > 29){
                    alert('Febrero debe tener hasta 29 d&iacute;as');
                    hayError = true;
                }
            } 
            else {
                    alert('Febrero debe tener hasta 28 d&iacute;as');
                    hayError = true;
            }
        }
            
    }
    if (!treinta && dd.value>30){
        alert('El mes debe tener hasta 30 d&iacute;as ');
        hayError = true;
    }
    fecha.value = yyyy.value + '-' + mm.value + '-' + dd.value + ' ' + hh.value + ':00';
    return hayError;
  }

function validarPrecio(){
    let hayError = false;
    const precio = parseFloat(document.getElementById("precio").value);
    if(precio>0){    
    }
    else{
        alert('El precio debe ser mayor a cero');
        hayError = true;
    }
    return hayError;
}



function validarEstadio(){
    
    let hayError = false;
    const form_alta = document.getElementById("form_alta");
    let destinoOK = form_alta.getAttribute("destinoOK");
    let destinoER = form_alta.getAttribute("destinoER");
    hayError = validarNombre();
    hayError = validarCalle();    
    hayError = validarNumero();
    if (hayError){
        form_alta.setAttribute("action",destinoER);
    }
    else{
        form_alta.setAttribute("action",destinoOK);
    }
}


function validarNombre(){
    let hayError = false;
    const nombre = document.getElementById("nombre");
    if(nombre.value === ""){
         alert('El estadio debe contener un nombre');
        hayError = true;
    }
    return hayError;
}

function validarCalle(){
    let hayError = false;
    const calle = document.getElementById("calle");
    if(calle.value === ""){
         alert('La calle no puede estar vac&iacute;o');
        hayError = true;
    }
    return hayError;
}

function validarNumero(){
    let hayError = false;
    const numero = document.getElementById("numero");
    if (isNaN(numero.value)){
        alert('El numero debe contener un valur num&eacute;rico');
        hayError = true;
    }
    return hayError;
}
