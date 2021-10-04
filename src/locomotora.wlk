class Locomotora {
	const property peso
	const property pesoQueArrastra
	const property velocidadMaxima
	
	method tipo(){return "locomotora"}
	method esEficiente(){return pesoQueArrastra >= peso*5}
	
}
	
