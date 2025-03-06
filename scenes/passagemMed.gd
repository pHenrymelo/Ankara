extends Area2D

@export var next_scene: String = "res://scenes/grecia.tscn"

func _ready():
	add_to_group("passagem")
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	print("Colisão com:", body.name)  
	if body.is_in_group("player"):
		print("Mudando de cena...")
		get_tree().change_scene_to_file(next_scene)
