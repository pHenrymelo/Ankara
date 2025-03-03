extends Area2D

var sprite
var has_opened = false

func _ready():
	add_to_group("bau")
	connect("body_entered", _on_body_entered)
	
	sprite = get_parent().get_node("AnimatedSprite2D")
	
	if not sprite:
		var potential_sprite = get_node("../AnimatedSprite2D")
		if potential_sprite:
			sprite = potential_sprite

func _on_body_entered(body):
	if body.is_in_group("player") and not has_opened:
		has_opened = true
		if sprite:
			sprite.play("open")
			await sprite.animation_finished
			sprite.play("opened")
