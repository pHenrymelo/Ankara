extends CharacterBody2D

@export var speed: float = 120.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	add_to_group("player")

func _process(_delta):
	var direction = Vector2.ZERO 

	if Input.is_action_pressed("run_up"):
		direction.y = -1
	elif Input.is_action_pressed("run_down"):
		direction.y = 1

	if Input.is_action_pressed("run_right"):
		direction.x = 1
	elif Input.is_action_pressed("run_left"):
		direction.x = -1

	direction = direction.normalized()
	
	velocity = direction * speed
	move_and_slide()

	update_animation(direction)

	check_coin_collision()

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

func check_coin_collision():
	if is_on_floor():
		var space_state = get_world_2d().direct_space_state
		var mask = 1
		var overlap = space_state.intersect_shape($CollisionShape2D.shape, mask)
		for result in overlap:
			if result.collider.is_in_group("moeda"):
				print("Moeda coletada!")
				result.collider.queue_free()
			elif result.collider.is_in_group("passagem"):
				get_tree().change_scene_to_file("res://scenes/space.tscn")
