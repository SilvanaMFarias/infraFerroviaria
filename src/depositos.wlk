class Deposito{
	var formaciones=[]
	var locomotoras=[]
	
	
}

/* 
## Etapa 3 - depósitos
Agregar al modelo los **depósitos ferroviarios**. 
* En cada depósito hay: formaciones ya armadas, y locomotoras sueltas.

Se pide resolver lo siguiente:
- Dado un depósito, obtener el conjunto formado por el vagón más pesado de cada formación; 
* se espera un conjunto de vagones. 
- Saber si un depósito _necesita un conductor experimentado_.  
  Un depósito necesita un conductor experimentado si alguna de sus formaciones es compleja.
  Una formación es compleja si: tiene más de 8 unidades (sumando locomotoras y vagones),
  *  o el peso máximo es de más de 80000 kg.
- Que un depósito pueda agregar una locomotora a una formación determinada, 
* de forma tal que la formación pueda moverse.   
  - Si la formación ya puede moverse, entonces no se hace nada.  
  - Si no, se le agrega una locomotora suelta del depósito cuyo arrastre sea
  *  mayor o igual a los kilos de empuje que le faltan a la formación. 
  * Si no hay ninguna locomotora suelta que cumpla esta condición, no se hace nada.



*/