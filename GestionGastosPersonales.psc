Algoritmo GestionGastosPersonales
	Dimensionar gastos(25,3)
	Definir presupuestoInicial, montoGasto, totalGastos Como Real
	Definir nombreGasto Como Cadena
	Definir opcionMenu Como Entero
	presupuestoInicial <- 0
	Repetir
		Escribir ''
		Escribir '- Elige una opcion'
		Escribir '1. Definir presupuesto del mes'
		Escribir '2. Registrar gasto'
		Escribir '3. Ver informacion'
		Escribir '4. Salir'
		Leer menuPrincipal
		Escribir ''
		// Definir presupuesto-------------------------------------------------------------------------------------------------------------------
		Si menuPrincipal=1 Entonces
			presupuestoInicial <- cargarPresupuesto(presupuestoInicial,Falso)
			Repetir
				Escribir 'El presupuesto es: '+ConvertirATexto(presupuestoInicial)+', desea modificarlo? (1: Sí / 0: No)'
				Leer modificar
				Si modificar=1 Entonces
					presupuestoInicial <- cargarPresupuesto(presupuestoInicial,Verdadero)
				FinSi
			Hasta Que modificar=0
		FinSi
		// Registrar gastos-------------------------------------------------------------------------------------------------------------------
		Si menuPrincipal=2 Entonces
			Si presupuestoInicial>0 Entonces
				Repetir
					Escribir '*	Seleccione una opcion:'
					Escribir '1. Entretenimiento y salidas: cine, teatro, salidas en familia, salidas a comer afuera, etc.'
					Escribir '2. Servicios: Luz, gas, agua, cable, teléfono'
					Escribir '3. Vivienda: Alquiler, expensas, crédito hipotecario, etc'
					Escribir '4. Viáticos: nafta, sube, uber, taxi, cabify, transporte, etc.'
					Escribir '5. Salud: medicamentos, atención médico, psicólogo, obra social, etc.'
					Escribir '6. Limpieza: Limpieza del hogar, lavandería, productos de limpieza, etc'
					Escribir '7. Impuestos: Monotributo, Ingresos Brutos, Tasas Municipales, etc.'
					Escribir '8. Alimentación: supermercado, almacén, despensas, supermercados chinos, verdulerías, carnicería, etc.'
					Escribir '9. Indumentaria: ropa, calzado, accesorios, etc.'
					Escribir '10. Cuidado Personal: cremas, maquillaje, belleza, tratamientos, peluquería, etc.'
					Escribir '11. Extras: Café, kiosco, golosinas, revistas, diarios, etc.'
					Leer nombreGasto
					Escribir 'Escriba el monto destinado:'
					Leer montoGasto
					Mientras sumaGastos(gastos,totalGastos)+montoGasto>presupuestoInicial Y montoGasto<=0 Hacer
						Escribir 'Presupuesto inicial superado! Ingrese un Monto inferior o igual a '+ConvertirATexto(presupuestoInicial-sumaGastos(gastos,totalGastos))+' y mayor que 0'
						Leer montoGasto
					FinMientras
					Para i<-1 Hasta 25 Hacer
						Si tareaGuardada=Falso Entonces
							Si gastos[i,1]='' Entonces
								gastos[i,1]<-ConvertirATexto(i)
								gastos[i,2]<-nombreGasto
								gastos[i,3]<-ConvertirATexto(montoGasto)
								tareaGuardada <- Verdadero
							FinSi
						FinSi
					FinPara
					tareaGuardada <- Falso
					Escribir '¿Desea registrar otro gasto? (1: Sí / 0: No)'
					Leer opcionMenu
				Hasta Que opcionMenu=0
			SiNo
				Escribir 'No tiene dinero.'
				presupuestoInicial <- cargarPresupuesto(presupuestoInicial,Falso)
			FinSi
		FinSi
		// Ver informacion-------------------------------------------------------------------------------------------------------------------
		Si menuPrincipal=3 Entonces
			Repetir
				Escribir '-Presupuesto: $'+ConvertirATexto(presupuestoInicial)
				Escribir '-Dinero Disponible: $'+ConvertirATexto(presupuestoInicial-sumaGastos(gastos,totalGastos))
				Escribir '-Total gastado: $'+ConvertirATexto(sumaGastos(gastos,totalGastos))
				Escribir 'Lista de gastos: '
				mostrarGastos(gastos,presupuestoInicial)
				Escribir '¿Volver al menu? (1: Sí / 0: No)'
				Leer opcionMenu
			Hasta Que opcionMenu=1
		FinSi
	Hasta Que menuPrincipal=4
FinAlgoritmo

Función totalGastos <- sumaGastos(gastos,totalGastos)
	Para i<-1 Hasta 25 Hacer
		Si gastos[i,1]<>'' Entonces
			totalGastos <- totalGastos+ConvertirANumero(gastos[i,3])
		FinSi
	FinPara
FinFunción

Función mostrarGastos(gastos,presupuestoInicial)
	Para i<-1 Hasta 25 Hacer
		Si gastos[i,1]<>'' Entonces
			cadena <- ConvertirATexto((ConvertirANumero(gastos[i,3])/presupuestoInicial)*100)
			Escribir gastos[i,1]+'. '+buscarNombreGasto(gastos[i,2])+': $', gastos[i,3]+'  %'+SubCadena(cadena,0,4)
		FinSi
	FinPara
FinFunción

Función presupuestoInicial <- cargarPresupuesto(presupuestoInicial,modificar)
	Si modificar=Falso Entonces
		Mientras presupuestoInicial<=0 Hacer
			Escribir 'Por favor, ingrese un monto mayor a 0 para el presupuesto inicial.'
			Leer presupuestoInicial
		FinMientras
	SiNo
		Repetir
			Escribir 'Por favor, ingrese el monto mayor a 0'
			Leer presupuestoInicial
		Hasta Que presupuestoInicial>0
	FinSi
FinFunción

Función nombre <- buscarNombreGasto(idGasto)
	Según idGasto Hacer
		'1':
			nombre <- 'Entretenimiento y salidas'
		'2':
			nombre <- 'Servicios'
		'3':
			nombre <- 'Vivienda'
		'4':
			nombre <- 'Viáticos'
		'5':
			nombre <- 'Salud'
		'6':
			nombre <- 'Limpieza'
		'7':
			nombre <- 'Impuestos'
		'8':
			nombre <- 'Alimentación'
		'9':
			nombre <- 'Indumentaria'
		'10':
			nombre <- 'Cuidado Personal'
		'11':
			nombre <- 'Extras'
		De Otro Modo:
			Escribir 'Error'
	FinSegún
FinFunción
