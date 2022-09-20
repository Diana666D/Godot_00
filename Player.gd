extends Area2D
# aqui puedes crear tus variables 
export (int) var Velocidad
#la variable movimiento nos va a servir para posicionar a nuestro personaje en la pantalla

var Movimiento = Vector2()
var Limite



#_ready es el evento a crear
func _ready():
	#vierport es el tamaño de la pantalla de nuestro juego
	Limite = get_viewport_rect().size
	
#process es lo que se va a procesar cada segundo en el juego	
func _process(delta):
	Movimiento = Vector2() #reiniciar el valor
	
	
	if Input.is_action_pressed("ui_right"):
		#en la variable movimiento en la posicion x se va a sumar un valor que va a ser 1
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		#Aqui le restamos valor a la posicion x cuando precionemos la tecla de la izquierda.
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	#normaliza los valores para que el personaje no vaya mas rapido de manera diagonal
	if Movimiento.length() > 0: #si el tamaño de la variable es mayor que 0
		#verificar si se esta moviento para normalizar la velocidad
		Movimiento = Movimiento.normalized() * Velocidad 
	# multiplicado por delta es para que el juego sea consistente y lleve el mismo tiempo
	# en cada computadora que uno juege
	# delta es velicidad que el juego trata de levar en tiempo real
	position += Movimiento * delta # actualizar los movimientos, las posiciones x y y del nodo del player 
	#a la posicion x la vamos a clavar en la posicion 0 de la pantalla hasta el limite.x
	position.x = clamp(position.x,0, Limite.x)
	position.y = clamp(position.y,0, Limite.y)
	
	
