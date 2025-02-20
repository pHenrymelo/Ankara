extends CharacterBody2D

@export var speed: float = 300.0  # velocidade do personagem
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D 

func _process(delta):
	var direction = Vector2.ZERO 

	# captura entrada do jogador
	if Input.is_action_pressed("run_up"):
		direction.y = -1
	elif Input.is_action_pressed("run_down"):
		direction.y = 1

	if Input.is_action_pressed("run_right"):
		direction.x = 1
	elif Input.is_action_pressed("run_left"):
		direction.x = -1

	# normaliza a direção para evitar velocidade maior na diagonal
	direction = direction.normalized()
	
	# define a velocidade do personagem
	velocity = direction * speed
	move_and_slide()

	# atualiza a animação
	update_animation(direction)

func update_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		sprite.stop()
		return

	if direction.x > 0:
		sprite.play("run_right")
		sprite.flip_h = false  
	elif direction.x < 0:
		sprite.play("run_right")
		sprite.flip_h = true 
	elif direction.y > 0:
		sprite.play("run_down")
	elif direction.y < 0:
		sprite.play("run_top") 
