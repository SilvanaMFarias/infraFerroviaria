class VagonDePasajeros {
	var property largo
	var property ancho
	var property tieneBanio
	var property estaOrdenado
	
		
	method tieneBanio(){return tieneBanio}
	method cantMaxPasajeros(){
		var capacidad =0
		if (ancho <=3)
			capacidad = largo * 8
		else
			capacidad = largo * 10
		
		if (not estaOrdenado)
			capacidad = 0.max(capacidad-15)
		
		return capacidad

		}
		
	method cantMaxCarga() = if (tieneBanio) {300} else {800}
	
	method pesoMaximo(){
		return 2000 + (80 * self.cantMaxPasajeros()+self.cantMaxCarga())
	}
		
	method tipo(){return "vagón"}
	method hacerMantenimiento(){estaOrdenado = true}	
}
class VagonDeCarga {
	var property cargaMaximaIdeal
	var property cantMaderasSueltas
	const tieneBanio = false


	method tieneBanio(){return tieneBanio}
	method cantMaxPasajeros(){return 0}
	method cantMaxCarga(){
		return 0.max(cargaMaximaIdeal - (400*cantMaderasSueltas))
	}
	method pesoMaximo(){
		return 1500 + self.cantMaxCarga()
	}
	
	method tipo(){return "vagón"}
	method hacerMantenimiento(){cantMaderasSueltas = 0.max(cantMaderasSueltas-2)
		
	}
}

class VagonDormitorio {
	var property cantCompartimientos
	var property cantCamasPorCompartimiento
	const tieneBanio = true
	
	method tieneBanio(){return tieneBanio}
	method cantMaxPasajeros(){
		return cantCompartimientos * cantCamasPorCompartimiento
	}
	method cantMaxCarga(){return 1200}
	method pesoMaximo(){
		return 4000 + (80 * self.cantMaxPasajeros()) + self.cantMaxCarga()
	}
	
	method tipo(){return "vagón"}
	method hacerMantenimiento(){}
	
}