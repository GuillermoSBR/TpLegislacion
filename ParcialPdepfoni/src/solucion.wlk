class Linea {

	var numeroTelefonico
	var plan
	var packs = []

}

class Plan {

	var ofertas = []

}

class Pack inherits Plan {

	var fechaVencimiento

	method estaVencido() {
		var hoy = new Date()
		return hoy >= fechaVencimiento
	}

}

class OfertaCredito {

	var cantCredito

	method satisfaceConsumoMB(cantidad) {
		return empresaTelefonia.costoDeMegas(cantidad) <= cantCredito
	}

	method satisfaceConsumoLlamada(cantidad) {
		return empresaTelefonia.costoPorLlamada(cantidad) <= cantCredito
	}

}

class OfertaMegas {

	var cantMegas
	
	method satisfaceConsumoMB(cantidad){
		return cantidad <= cantMegas
		
	}
	method satisfaceConsumoLlamada(cantidad) = false

}

class OfertaLlamadasGratis {
	
	method satisfaceConsumoMB(cantidad) =false
	method satisfaceConsumoLlamada(cantidad) = true
	

}

class OfertaInternetLosFindes {
	
	method esFinDeSemanada(){
		var hoy = new Date().dayOfWeek()
		return hoy == sunday or hoy == saturday
	}
	
	method satisfaceConsumoMB(cantidad) =false
	method satisfaceConsumoLlamada(cantidad) = false
	

}

object empresaTelefonia {

	var costoFijoLlamada
	var costoPorMegas
	var costoVariableLlamada

	method costoDeMegas(cantidad) {
		return cantidad * costoPorMegas
	}

	method costoPorLlamada(duracion) {
		return costoFijoLlamada + 0.max((duracion - 30) * costoVariableLlamada)
	}

}

