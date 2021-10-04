import vagones.*
import locomotora.*


class Formacion {
	const formacion = []
	
	method agregarALaFormacion(algo){
		formacion.add(algo)
	}
	
	method vagones(){
		return formacion.filter{f=>f.tipo()=="vagón"}	
	}
	
	method pasajerosQuePuedeLlevar(){
		return self.vagones().sum({f=>f.cantMaxPasajeros()})
	}
	
	method cantVagonesPopulares(){
		return self.vagones().count({f=>f.cantMaxPasajeros()>50})
	}
	
	method esFormacionCarguera(){
		return self.vagones().all({f=>f.cantMaxCarga()>1000})
	}
	
	method vagonPesoMaximo(){
		return self.vagones().max{f=>f.pesoMaximo()}
	}
	
	method vagonPesoMinimo(){
		return self.vagones().min{f=>f.pesoMaximo()}
	}
	method dispersionDePesos(){
		return self.vagonPesoMaximo().pesoMaximo() - self.vagonPesoMinimo().pesoMaximo() 
	}
	
	method cantBanios(){
		return self.vagones().filter({f=>f.tieneBanio()}).size()
	}
	
	method hacerMantenimientoAVagones(){
		self.vagones().forEach({f=>f.hacerMantenimiento()})
	}
	
	method locomotoras(){
		return formacion.filter({f=>f.tipo()=="locomotora"})
	}
	
	method velocidadMaxima(){
		return self.locomotoras().min({f=>f.velocidadMaxima()})
	}
	
	method esEficiente(){
		return self.locomotoras().all({f=>f.esEficiente()})
	}
	
	method puedeMoverse(){
		return self.locomotoras().sum({f=>f.pesoQueArrastra()})
		>= (self.locomotoras().sum({f=>f.peso()})+
			self.vagones().sum({f=>f.pesoMaximo()})
		)
	}
	
	method kilosFaltantesParaMoverse(){
		var kilosFaltantes=0
		if (not self.puedeMoverse()){
			kilosFaltantes= self.locomotoras().sum({f=>f.peso()})+
			self.vagones().sum({f=>f.pesoMaximo()}) - self.locomotoras().sum({f=>f.pesoQueArrastra()})
		}
		return kilosFaltantes
	//- Cuántos _kilos de empuje le faltan_ para poder moverse, 
	//que es: 0 si ya se puede mover, y si no, 
	//el resultado de: peso máximo - suma de arrastre de cada locomotora.
	//P.ej. si una formación tiene una locomotora que pesa 1000 kilos y arrastra hasta 30000, y cuatro vagones, 
	//de 6000 kilos de peso máximo cada uno, entonces sí puede moverse, porque su peso máximo es 25000.  
	//Si agregamos dos vagones más de 6000 kilos, llevamos el peso máximo a 37000. Ahora la formación no puede moverse y le faltan 7000 kilos de empuje.
		
	}
}

