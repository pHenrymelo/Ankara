extends CharacterBody2D

# Variáveis para movimento
@export var speed : float = 200
@export var gravity : float = 0 # Gravidade personalizada (defina como 0 para desabilitar)

# Função de _physics_process() para movimentação e gravidade
func _physics_process(delta):
	# Definir a gravidade manualmente (caso queira aplicar uma gravidade específica)
	if gravity != 0:
		velocity.y += gravity * delta
	
	# Movimentação com base em entradas
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	# Normaliza a direção para manter a velocidade constante
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	# Define a velocidade para o personagem com base na direção
	velocity = direction * speed
	
	# Move o personagem
	move_and_slide()
